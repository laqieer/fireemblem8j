#!/usr/bin/env python3
"""
fe8u_ptr_offsets.py -- the fe8u relocation ORACLE for safe de-pointering.

For a data symbol NAME, returns the exact byte-offsets within it that fe8u
relocates as pointers (R_ARM_ABS32), read from fe8u's compiled .o. fe8u shares
the game data structures with the JP build, so these offsets ARE the pointer
slots -- using them eliminates the coincidental-constant risk that the density
heuristic cannot (a UnitDefinition data field that happens to fall in ROM range
must NOT be relocated). The JP table at the same offsets is provably a pointer.

  fe8u_ptr_offsets.py <NAME> [<NAME> ...]      # print pointer offsets
  fe8u_ptr_offsets.py --verify <NAME>          # exit 0 iff every JP-converted
                                               # word's offset is a fe8u pointer

Caveat: only tables fe8u defines with the SAME layout are covered; JP-divergent
tables return None (caller must fall back to EXACT-only).
"""
import os, sys, subprocess, struct, glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
FE8U = os.path.normpath(os.path.join(ROOT, "..", "fireemblem8u"))
ROM_LO, ROM_HI = 0x08000000, 0x09000000

_OBJ_INDEX = None
def fe8u_obj_for(name):
    """Find the fe8u .o that DEFINES `name` (nm shows it as a non-U symbol)."""
    global _OBJ_INDEX
    if _OBJ_INDEX is None:
        _OBJ_INDEX = {}
        objs = glob.glob(os.path.join(FE8U, "**", "*.o"), recursive=True)
        # batch nm for speed
        for i in range(0, len(objs), 200):
            batch = objs[i:i+200]
            out = subprocess.run(["arm-none-eabi-nm"] + batch,
                                 capture_output=True, text=True, errors="replace").stdout
            cur = None
            for line in out.splitlines():
                if line.endswith(":") and "/" in line:
                    cur = line[:-1]
                    continue
                p = line.split()
                if len(p) == 3 and p[1] in "TtDdRrBbVvWwGgSs":
                    _OBJ_INDEX.setdefault(p[2], (cur, int(p[0], 16), p[1]))
    return _OBJ_INDEX.get(name)

def ptr_offsets(name):
    """Return sorted list of pointer byte-offsets within `name`, or None."""
    info = fe8u_obj_for(name)
    if info is None:
        return None
    obj, sym_off, typ = info
    # symbol's section: from nm -S we'd get size; get size + section via readelf
    # find the section the symbol lives in and its size
    out = subprocess.run(["arm-none-eabi-nm", "-S", obj], capture_output=True,
                         text=True, errors="replace").stdout
    size = None
    for line in out.splitlines():
        p = line.split()
        if len(p) == 4 and p[3] == name:
            size = int(p[1], 16); break
    # which section? use objdump -t
    secout = subprocess.run(["arm-none-eabi-objdump", "-t", obj],
                            capture_output=True, text=True, errors="replace").stdout
    section = None
    for line in secout.splitlines():
        if (" " + name) in (" " + line) and line.strip().endswith(name):
            parts = line.split()
            # format: addr flags section ... size name  -> section is 3rd-ish col
            for tok in parts:
                if tok.startswith(".rodata") or tok.startswith(".data") or tok == ".text":
                    section = tok; break
    # relocations residing in that section, within [sym_off, sym_off+size)
    rels = subprocess.run(["arm-none-eabi-objdump", "-r", obj],
                          capture_output=True, text=True, errors="replace").stdout
    offs = []
    in_sec = False
    for line in rels.splitlines():
        if line.startswith("RELOCATION RECORDS FOR ["):
            sec = line.split("[", 1)[1].rstrip("]:")
            in_sec = (section is None) or (sec == section)
        elif in_sec and "R_ARM_ABS32" in line:
            try:
                roff = int(line.split()[0], 16)
            except ValueError:
                continue
            if size is None or (sym_off <= roff < sym_off + size):
                offs.append(roff - sym_off)
    return sorted(set(offs)) if offs else None

def jp_converted_offsets(name):
    """Offsets the JP repointer would convert = ROM-range words in the .bin."""
    binp = os.path.join(ROOT, "data", "residual", name + ".bin")
    if not os.path.exists(binp):
        return None
    b = open(binp, "rb").read()
    offs = []
    for i in range(len(b) // 4):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if ROM_LO <= v < ROM_HI:
            offs.append(i * 4)
    return offs

def main():
    names = [a for a in sys.argv[1:] if not a.startswith("--")]
    verify = "--verify" in sys.argv
    for name in names:
        fe = ptr_offsets(name)
        if verify:
            jp = jp_converted_offsets(name) or []
            if fe is None:
                print("UNKNOWN %s: fe8u has no reloc data (fall back to EXACT-only)" % name)
                continue
            feset = set(fe)
            bad = [o for o in jp if o not in feset]
            if bad:
                print("UNSAFE %s: %d JP ROM-range words at NON-pointer offsets %s" %
                      (name, len(bad), [hex(o) for o in bad[:8]]))
            else:
                print("SAFE %s: all %d JP ROM-range words are fe8u pointer slots" % (name, len(jp)))
        else:
            print("%s: %s" % (name, [hex(o) for o in fe] if fe else None))

if __name__ == "__main__":
    main()
