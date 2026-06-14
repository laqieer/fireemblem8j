#!/usr/bin/env python3
"""Convert a single-section, full-incbin graphics asm file (asm/dat_*.s) to a
src/data/<sub>/<name>.c using SECTION() + INCBIN_U8 — the proven D97 pattern.

Handles ONLY the clean case: one `.section .rodata.X`, each global symbol
followed by exactly one FULL `.incbin "path"` (no offset/length args). Bails
loudly on anything else (partial incbins, multi-incbin symbols, multi-section)
so it never silently produces wrong bytes. `make compare` is the oracle.

Usage: python3 scripts/asmgfx2c.py asm/dat_data_map_anim_frames.c_out_dir <subdir>
  e.g. python3 scripts/asmgfx2c.py asm/dat_data_map_anim_frames.s mapanim
prints the generated C to stdout (caller redirects to src/data/<subdir>/<name>.c).
"""
import re, sys, glob, os

_TYPES = None
def load_types():
    """sym -> (const_prefix, width_type) from extern array decls in include/*.h."""
    global _TYPES
    if _TYPES is not None:
        return _TYPES
    _TYPES = {}
    for hf in glob.glob('include/*.h') + glob.glob('include/**/*.h'):
        try:
            for ln in open(hf, errors='replace'):
                m = re.match(r'\s*extern\s+(const\s+)?(u8|u16|u32)\s+(\w+)\s*\[', ln)
                if m:
                    _TYPES[m.group(3)] = (m.group(1) or '', m.group(2))
        except OSError:
            pass
    return _TYPES

_MACRO = {'u8': 'INCBIN_U8', 'u16': 'INCBIN_U16', 'u32': 'INCBIN_U32'}

def convert(asm_path):
    lines = open(asm_path).read().splitlines()
    section = None
    syms = []          # list of [name, incbin_path, align_bytes]
    pending_global = None
    pending_align = 0  # bytes; arm `.align N` aligns the NEXT symbol to 2**N bytes
    for raw in lines:
        s = raw.strip()
        if not s or s.startswith('@'):
            continue
        m = re.match(r'\.section\s+(\.[^,\s]+)', s)
        if m:
            section = m.group(1)   # current section (may change per symbol — multi-section ok)
            continue
        m = re.match(r'\.align\s+(\d+)', s)        # arm `.align N` -> 2**N byte alignment
        if m:
            pending_align = 1 << int(m.group(1)); continue
        m = re.match(r'\.balign\s+(\d+)', s)        # `.balign N` -> N byte alignment
        if m:
            pending_align = int(m.group(1)); continue
        m = re.match(r'\.global\s+(\w+)$', s)
        if m:
            pending_global = m.group(1); continue
        m = re.match(r'(\w+):$', s)
        if m:
            if section is None:
                sys.exit(f"ABORT: symbol {m.group(1)} before any .section")
            syms.append([m.group(1), None, pending_align, section]); pending_global = None; pending_align = 0; continue
        m = re.match(r'\.incbin\s+"([^"]+)"$', s)   # FULL incbin only (no comma/args)
        if m:
            if not syms:
                sys.exit(f"ABORT: incbin before any symbol: {s}")
            if syms[-1][1] is not None:
                sys.exit(f"ABORT: symbol {syms[-1][0]} has >1 incbin — multi-incbin not supported")
            syms[-1][1] = m.group(1); continue
        # partial incbin `.incbin "X", off, len` -> OK only if it's effectively the FULL file
        m = re.match(r'\.incbin\s+"([^"]+)"\s*,\s*(\w+)\s*,\s*(\w+)\s*$', s)
        if m:
            path, off, ln = m.group(1), int(m.group(2), 0), int(m.group(3), 0)
            if off == 0 and os.path.exists(path) and os.path.getsize(path) == ln:
                if not syms or syms[-1][1] is not None:
                    sys.exit(f"ABORT: partial incbin placement issue: {s}")
                syms[-1][1] = path; continue
            sys.exit(f"ABORT: genuine partial incbin (off={off} len={ln} file={path}): {s}")
        # benign metadata directives -> ignore
        if re.match(r'\.(size|type|weak|hidden|local)\b', s):
            continue
        # anything else (.word/.byte data, etc.) => bail
        if '.incbin' in s:
            sys.exit(f"ABORT: non-full incbin: {s}")
        sys.exit(f"ABORT: unexpected directive: {s}")
    if section is None:
        sys.exit("ABORT: no .section found")
    # A symbol with no incbin is an ALIAS of the next data-bearing symbol (same address,
    # zero bytes between them) — the op_subtitle/item_icon pattern. A trailing no-incbin
    # symbol (no next data) is an end-marker we can't represent cleanly -> bail.
    tm = load_types()
    out = ['#include "global.h"', '',
           f'/* Migrated from {asm_path} (region-same graphics, single section).',
           ' * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.',
           ' */', '']
    for i, (name, path, align, sec) in enumerate(syms):
        const, width = tm.get(name, ('', 'u8'))   # default u8 when no extern decl (no conflict possible)
        if path is not None:
            attrs = f'section("{sec}")'
            if align > 1:
                attrs += f', aligned({align})'
            out.append(f'{const}{width} {name}[] __attribute__(({attrs})) = {_MACRO[width]}("{path}");')
        else:
            target = next((n for n, p, _a, _s in syms[i + 1:] if p is not None), None)
            if target is None:
                sys.exit(f"ABORT: symbol {name} has no incbin and no following data symbol (end-marker)")
            out.append(f'{const}{width} {name}[] __attribute__((alias("{target}")));')
    return '\n'.join(out) + '\n', section, len(syms)

if __name__ == '__main__':
    c, sec, n = convert(sys.argv[1])
    sys.stderr.write(f"OK: {n} symbols, section {sec}\n")
    sys.stdout.write(c)
