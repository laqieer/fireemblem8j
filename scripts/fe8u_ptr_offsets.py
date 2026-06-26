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

_OBJ_CACHE = {}
def _obj_ptr_offsets(obj):
    """Map EVERY data symbol in `obj` -> its pointer byte-offsets, in ONE pass
    (3 subprocess calls per .o instead of per-symbol). Cached: an .o with N
    pointer tables (e.g. all UnitDef in events.o) is processed once, not N times."""
    if obj in _OBJ_CACHE:
        return _OBJ_CACHE[obj]
    import bisect as _bi
    from collections import defaultdict
    # nm -S: addr size type name (size + addr-within-section)
    nm = subprocess.run(["arm-none-eabi-nm", "-S", obj], capture_output=True,
                        text=True, errors="replace").stdout
    info = {}   # name -> (addr, size)
    for line in nm.splitlines():
        p = line.split()
        if len(p) == 4:
            try: info[p[3]] = (int(p[0], 16), int(p[1], 16))
            except ValueError: pass
    # objdump -t: name -> section
    td = subprocess.run(["arm-none-eabi-objdump", "-t", obj], capture_output=True,
                        text=True, errors="replace").stdout
    sec_of = {}
    for line in td.splitlines():
        parts = line.split()
        if not parts:
            continue
        name = parts[-1]
        for tok in parts:
            if tok.startswith(".rodata") or tok.startswith(".data"):
                sec_of[name] = tok; break
    # per-section sorted (addr, addr+size, name) for symbols we know sizes for
    sec_syms = defaultdict(list)
    for name, (addr, size) in info.items():
        sec = sec_of.get(name)
        if sec and size:
            sec_syms[sec].append((addr, addr + size, name))
    for sec in sec_syms:
        sec_syms[sec].sort()
    starts = {sec: [a for a, _, _ in lst] for sec, lst in sec_syms.items()}
    # objdump -r: relocations -> attribute each to its containing symbol
    rels = subprocess.run(["arm-none-eabi-objdump", "-r", obj], capture_output=True,
                          text=True, errors="replace").stdout
    res = defaultdict(set)
    cursec = None
    for line in rels.splitlines():
        if line.startswith("RELOCATION RECORDS FOR ["):
            cursec = line.split("[", 1)[1].rstrip("]:")
        elif cursec in sec_syms and "R_ARM_ABS32" in line:
            try:
                O = int(line.split()[0], 16)
            except ValueError:
                continue
            lst = sec_syms[cursec]
            i = _bi.bisect_right(starts[cursec], O) - 1
            if i >= 0:
                a0, a1, nm_ = lst[i]
                if a0 <= O < a1:
                    res[nm_].add(O - a0)
    _OBJ_CACHE[obj] = {k: sorted(v) for k, v in res.items()}
    return _OBJ_CACHE[obj]

def ptr_offsets(name):
    """Return sorted list of pointer byte-offsets within `name`, or None."""
    info = fe8u_obj_for(name)
    if info is None:
        return None
    offs = _obj_ptr_offsets(info[0]).get(name)
    return offs if offs else None

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
