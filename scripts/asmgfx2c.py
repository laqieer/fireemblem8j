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
import re, sys, glob

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
    syms = []          # list of [name, incbin_path]
    pending_global = None
    for raw in lines:
        s = raw.strip()
        if not s or s.startswith('@'):
            continue
        m = re.match(r'\.section\s+(\.[^,\s]+)', s)
        if m:
            if section is not None and m.group(1) != section:
                sys.exit(f"ABORT: multiple sections ({section} vs {m.group(1)}) — not a clean single-section file")
            section = m.group(1)
            continue
        if re.match(r'\.align', s) or re.match(r'\.balign', s):
            continue
        m = re.match(r'\.global\s+(\w+)$', s)
        if m:
            pending_global = m.group(1); continue
        m = re.match(r'(\w+):$', s)
        if m:
            syms.append([m.group(1), None]); pending_global = None; continue
        m = re.match(r'\.incbin\s+"([^"]+)"$', s)   # FULL incbin only (no comma/args)
        if m:
            if not syms:
                sys.exit(f"ABORT: incbin before any symbol: {s}")
            if syms[-1][1] is not None:
                sys.exit(f"ABORT: symbol {syms[-1][0]} has >1 incbin — multi-incbin not supported")
            syms[-1][1] = m.group(1); continue
        # anything else (e.g. partial incbin with comma, .word, .byte) => bail
        if '.incbin' in s:
            sys.exit(f"ABORT: non-full incbin: {s}")
        sys.exit(f"ABORT: unexpected directive: {s}")
    if section is None:
        sys.exit("ABORT: no .section found")
    missing = [n for n, p in syms if p is None]
    if missing:
        sys.exit(f"ABORT: {len(missing)} symbols without an incbin (e.g. {missing[:3]}) — labels/aliases unsupported")
    out = ['#include "global.h"', '',
           f'/* Migrated from {asm_path} (region-same graphics, single section).',
           ' * Each symbol kept in the original section in order; byte-identical via INCBIN_U8.',
           ' */', '']
    tm = load_types()
    for name, path in syms:
        const, width = tm.get(name, ('', 'u8'))   # default u8 when no extern decl (no conflict possible)
        out.append(f'SECTION("{section}") {const}{width} {name}[] = {_MACRO[width]}("{path}");')
    return '\n'.join(out) + '\n', section, len(syms)

if __name__ == '__main__':
    c, sec, n = convert(sys.argv[1])
    sys.stderr.write(f"OK: {n} symbols, section {sec}\n")
    sys.stdout.write(c)
