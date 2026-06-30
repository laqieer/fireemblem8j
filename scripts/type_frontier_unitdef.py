#!/usr/bin/env python3
"""type_frontier_unitdef.py -- decode the raw `u8 frontier_df3_unitdef_b_NNN_*[]`
INCBIN slices in src/data/frontier_df3_unitdef_b/frontier_df3_unitdef_b.c into typed
`struct UnitDefinition[]` C initializers (axis #6 editability), keeping each slice's
section / position.

Each slice's leading run of 20-byte `struct UnitDefinition` records (include/bmunit.h)
is emitted typed; the `.redas` pointer becomes a RELOCATABLE symbol reference resolved
against the linker map (fireemblem8.map from a baseline build). To stay byte- AND
semantically-exact we only resolve a redas word that is 0 (NULL) or that points to the
EXACT start of an already-carved `REDAs_UnitDef_*` / `REDA_*` array symbol -- never a
`SYM + addend` guess (those would silently relocate to an unrelated array). The first
record whose redas word is neither NULL nor an exact symbol ends the typed run; the
remaining bytes (uncarved REDA arrays / padding) stay a byte-identical INCBIN tail.

Ground truth = baserom.gba bytes; `make compare` is the byte-exact oracle.

Usage:
  type_frontier_unitdef.py analyze   # report per-slice lead-record / residue split
  type_frontier_unitdef.py emit      # rewrite the .c in place
"""
import re, sys, struct, os

BASE = 0x08000000
ROM = "baserom.gba"
MAP = "fireemblem8.map"
CFILE = "src/data/frontier_df3_unitdef_b/frontier_df3_unitdef_b.c"
UDEF_SIZE = 20

def load_map():
    sym2addr, addr2syms = {}, {}
    with open(MAP) as f:
        for line in f:
            m = re.match(r"\s+0x([0-9a-fA-F]+)\s+(\S+)\s*$", line)
            if not m:
                continue
            addr = int(m.group(1), 16)
            if addr < BASE or addr >= BASE + 0x1000000:
                continue
            sym2addr[m.group(2)] = addr
            addr2syms.setdefault(addr, []).append(m.group(2))
    return sym2addr, addr2syms

def reda_starts(addr2syms):
    out = {}
    for a, ns in addr2syms.items():
        for n in ns:
            if n.startswith("REDAs_UnitDef_") or n.startswith("REDA_"):
                out[a] = n
                break
    return out

DECL_RE = re.compile(
    r'((?:static\s+)?(?:const\s+)?)u8\s+(\w+)\[\]\s+'
    r'__attribute__\(\(section\("([^"]+)"\)\)\)\s*=\s*'
    r'INCBIN_U8\("([^"]+)"(?:,\s*(\d+),\s*(\d+))?\);')

def lead_records(rom, addr, slen, redas):
    """Return list of (rec_bytes, redas_sym_or_None) for the leading run of records
    whose redas word is NULL or an exact REDA symbol; stop at the first that isn't."""
    o = addr - BASE
    recs = []
    k = 0
    while (k + 1) * UDEF_SIZE <= slen:
        rec = rom[o + k*UDEF_SIZE:o + (k+1)*UDEF_SIZE]
        word = struct.unpack("<I", rec[8:12])[0]
        if word == 0:
            sym = None
        elif word in redas:
            sym = redas[word]
        else:
            break
        recs.append((rec, sym))
        k += 1
    return recs

def fmt_record(rec, redas_sym):
    b3 = rec[3]
    w45 = rec[4] | (rec[5] << 8)
    f = []
    def add(k, v): f.append(f".{k}={v}")
    if rec[0]:                add("charIndex", f"0x{rec[0]:X}")
    if rec[1]:                add("classIndex", f"0x{rec[1]:X}")
    if rec[2]:                add("leaderCharIndex", f"0x{rec[2]:X}")
    if b3 & 1:                add("autolevel", f"0x{b3 & 1:X}")
    if (b3 >> 1) & 3:         add("allegiance", f"0x{(b3 >> 1) & 3:X}")
    if (b3 >> 3) & 0x1f:      add("level", f"0x{(b3 >> 3) & 0x1f:X}")
    if w45 & 0x3f:            add("xPosition", f"0x{w45 & 0x3f:X}")
    if (w45 >> 6) & 0x3f:     add("yPosition", f"0x{(w45 >> 6) & 0x3f:X}")
    if (w45 >> 12) & 1:       add("genMonster", f"0x{(w45 >> 12) & 1:X}")
    if (w45 >> 13) & 1:       add("itemDrop", f"0x{(w45 >> 13) & 1:X}")
    if (w45 >> 14) & 1:       add("sumFlag", f"0x{(w45 >> 14) & 1:X}")
    if (w45 >> 15) & 1:       add("unk_05_7", f"0x{(w45 >> 15) & 1:X}")
    if rec[6]:                add("extraData", f"0x{rec[6]:X}")
    if rec[7]:                add("redaCount", f"0x{rec[7]:X}")
    if redas_sym:             add("redas", redas_sym)
    items = rec[12:16]
    nz = [k for k, v in enumerate(items) if v]
    if nz:
        add("items", "{" + ", ".join(f"0x{items[k]:X}" for k in range(max(nz)+1)) + "}")
    ai = rec[16:20]
    nz = [k for k, v in enumerate(ai) if v]
    if nz:
        add("ai", "{" + ", ".join(f"0x{ai[k]:X}" for k in range(max(nz)+1)) + "}")
    return "    { " + ", ".join(f) + " }," if f else "    {0},"

def main():
    mode = sys.argv[1] if len(sys.argv) > 1 else "analyze"
    sym2addr, addr2syms = load_map()
    redas = reda_starts(addr2syms)
    rom = open(ROM, "rb").read()
    src = open(CFILE).read()

    plan = []   # (match, qual, name, sec, path, off, slen, recs)
    for m in DECL_RE.finditer(src):
        qual, name, sec, path, off, length = m.groups()
        addr = sym2addr.get(name)
        if addr is None:
            continue
        boff = int(off) if off is not None else 0
        slen = int(length) if length is not None else os.path.getsize(path)
        if slen < UDEF_SIZE:
            continue
        recs = lead_records(rom, addr, slen, redas)
        if not recs:
            continue
        plan.append((m, qual, name, sec, path, boff, slen, recs))

    if mode == "analyze":
        ntyp = 0
        for m, qual, name, sec, path, boff, slen, recs in plan:
            used = len(recs) * UDEF_SIZE
            residue = slen - used
            ntyp += len(recs)
            tag = "FULL" if residue == 0 else f"SPLIT(res={residue})"
            print(f"{name:48s} recs={len(recs):3d} {tag}")
        print(f"\n{len(plan)} slices typed, {ntyp} total UnitDefinition records.")
        return

    if mode == "emit":
        new_src = src
        nconv = 0
        referenced = set()
        for m, qual, name, sec, path, boff, slen, recs in reversed(plan):
            used = len(recs) * UDEF_SIZE
            residue = slen - used
            lines = [f'struct UnitDefinition {name}[] __attribute__((section("{sec}"))) =', "{"]
            for rec, rs in recs:
                if rs:
                    referenced.add(rs)
                lines.append(fmt_record(rec, rs))
            lines.append("};")
            if residue > 0:
                # keep the trailing uncarved REDA / padding bytes as a byte-identical INCBIN
                lines.append(
                    f'{qual}u8 {name}_residue[] __attribute__((section("{sec}"))) = '
                    f'INCBIN_U8("{path}", {boff + used}, {residue});')
            block = "\n".join(lines)
            new_src = new_src[:m.start(1)] + block + new_src[m.end():]
            nconv += 1
        # Inject forward extern declarations for every referenced REDA symbol so records
        # that reference an array defined later in the file (or in another TU) compile.
        # Symbols already defined non-extern later in this file are still legal to
        # pre-declare extern. Skip the cross-TU ones already prototyped in eventcall.h.
        local_defs = set(re.findall(r'struct REDA (\w+)\[\]', new_src))
        ext_syms = sorted(s for s in referenced if s.startswith("REDAs_UnitDef_"))
        decls = "".join(f"extern struct REDA {s}[];\n" for s in ext_syms)
        # add includes + extern block right after the existing include lines
        inc_anchor = '#include "muctrl.h"\n'
        add_inc = '#include "bmunit.h"\n#include "eventcall.h"\n'
        new_src = new_src.replace(inc_anchor, inc_anchor + add_inc, 1)
        # place extern decls after the file's leading comment block (after the includes)
        new_src = new_src.replace(inc_anchor + add_inc,
                                  inc_anchor + add_inc, 1)
        # insert extern decls just before the first symbol definition line
        first_def = re.search(r'^(?:static\s+|const\s+|u8 |struct (?:REDA|UnitDefinition) )', new_src, re.M)
        if first_def:
            pos = first_def.start()
            new_src = new_src[:pos] + decls + new_src[pos:]
        open(CFILE, "w").write(new_src)
        print(f"emitted {nconv} typed tables, {len(ext_syms)} forward externs into {CFILE}")
        return

if __name__ == "__main__":
    main()
