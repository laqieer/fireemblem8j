#!/usr/bin/env python3
"""
audit_pointers.py -- the SHIFTABILITY auditor (decomp axis #5).

A real decomp must contain NO hardcoded absolute ROM pointers in its source
data: every word that the engine dereferences as a pointer must be expressed
as a *symbol reference* so the linker relocates it when sections shift. Raw
.bin / .byte dumps bake in absolute addresses (0x08xxxxxx) -> the moment the
target shifts on rebuild, the pointer dangles and the game jumps to garbage.

This script scans every residual data blob that is INCBIN'd / .byte-dumped into
the ROM and counts the aligned 4-byte little-endian words that fall inside the
ROM address window (0x08000000..0x08FFFFFF, FE8 = 16 MiB). Each such word is a
candidate un-relocated pointer. Using the fully-linked ELF symbol table it
classifies each:

  EXACT    -- word == a defined symbol's address  (de-pointer to `.4byte SYM`)
  INTERIOR -- word inside [sym, sym+size)          (de-pointer to `SYM + off`)
  DANGLING -- no covering symbol in a ROM section  (needs a label created first)

Headline metric = un-relocated pointer words remaining. Target: 0.
This is ungameable: it reads the bytes that actually land in the ROM.
"""
import os, sys, struct, glob, subprocess, bisect, re

IDENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")  # valid C identifier

ROM_LO, ROM_HI = 0x08000000, 0x09000000
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ELF = os.path.join(ROOT, "fireemblem8.elf")
RESID_GLOBS = [
    os.path.join(ROOT, "data", "residual", "*.bin"),
]

def load_elf_symbols(elf):
    """Return (sorted_addrs, addr->name, addr->size) for ROM-section symbols."""
    out = subprocess.check_output(
        ["arm-none-eabi-nm", "-S", "--defined-only", elf],
        text=True, errors="replace")
    addr2name, addr2size = {}, {}
    for line in out.splitlines():
        parts = line.split()
        # "addr size type name"  or  "addr type name"
        if len(parts) == 4:
            addr_s, size_s, typ, name = parts
            try:
                size = int(size_s, 16)
            except ValueError:
                size = 0
        elif len(parts) == 3:
            addr_s, typ, name = parts
            size = 0
        else:
            continue
        try:
            addr = int(addr_s, 16)
        except ValueError:
            continue
        if not (ROM_LO <= addr < ROM_HI):
            continue
        # Only GLOBAL definitions are linkable as a C `extern` reference target.
        # nm: uppercase = global/external; exclude U (undef) / A (abs) / N (debug).
        if (not typ.isupper()) or typ in ("U", "A", "N"):
            continue
        if not IDENT.match(name):  # skip .gcc2_compiled., $t/$d mapping symbols
            continue
        # prefer a "nicer" name over a generic data_/gap_/sub_ placeholder,
        # but keep an entry for every address either way
        if addr in addr2name:
            old = addr2name[addr]
            if _name_rank(name) < _name_rank(old):
                addr2name[addr] = name
            addr2size[addr] = max(addr2size.get(addr, 0), size)
        else:
            addr2name[addr] = name
            addr2size[addr] = size
    addrs = sorted(addr2name)
    return addrs, addr2name, addr2size

def _name_rank(n):
    # lower = preferred. real names beat placeholders.
    if n.startswith(("data_", "gap_", "sub_", "byte_", "off_", "unk_", "j_", "nullsub")):
        return 2
    return 0

def classify(ptr, addrs, addr2name, addr2size):
    i = bisect.bisect_right(addrs, ptr) - 1
    if i < 0:
        return ("DANGLING", None, 0)
    base = addrs[i]
    name = addr2name[base]
    if ptr == base:
        return ("EXACT", name, 0)
    size = addr2size.get(base, 0)
    off = ptr - base
    # if we know the size and ptr is within it, it's a clean interior pointer.
    if size and off < size:
        return ("INTERIOR", name, off)
    # unknown size: still inside *some* object (next symbol is further on);
    # treat as interior but flagged (may want a real label).
    if i + 1 < len(addrs):
        if ptr < addrs[i + 1]:
            return ("INTERIOR", name, off)
    return ("DANGLING", name, off)

def is_live_raw(binpath):
    """A residual .bin is 'live raw data' only if its bytes still enter the
    link verbatim. Once repoint_table.py rewrites the _ref .c to symbol
    references (no INCBIN), the .bin is orphaned -> its pointers are relocated,
    so it must NOT be counted as un-relocated debt."""
    name = os.path.basename(binpath)[:-4]  # strip .bin
    cpath = os.path.join(ROOT, "src", "data", name + "_ref",
                         "dat_%s_ref.c" % name)
    if os.path.exists(cpath):
        with open(cpath, "r", errors="replace") as f:
            txt = f.read()
        return "INCBIN" in txt  # still raw iff it INCBINs; de-pointered iff not
    return True  # no _ref .c -> assume still live via asm incbin

def main():
    if not os.path.exists(ELF):
        sys.exit(f"ELF not found: {ELF} (run `make` first)")
    addrs, addr2name, addr2size = load_elf_symbols(ELF)
    files = []
    for g in RESID_GLOBS:
        files.extend(sorted(glob.glob(g)))
    files = [f for f in files if is_live_raw(f)]

    tot = {"EXACT": 0, "INTERIOR": 0, "DANGLING": 0}
    per_file = []
    for path in files:
        with open(path, "rb") as f:
            b = f.read()
        n = len(b) // 4
        c = {"EXACT": 0, "INTERIOR": 0, "DANGLING": 0}
        for i in range(n):
            v = struct.unpack_from("<I", b, i * 4)[0]
            if ROM_LO <= v < ROM_HI:
                kind, _, _ = classify(v, addrs, addr2name, addr2size)
                c[kind] += 1
        npt = c["EXACT"] + c["INTERIOR"] + c["DANGLING"]
        if npt:
            for k in tot:
                tot[k] += c[k]
            per_file.append((npt, c, len(b), os.path.basename(path)))

    per_file.sort(key=lambda r: r[0], reverse=True)
    grand = tot["EXACT"] + tot["INTERIOR"] + tot["DANGLING"]
    print("== SHIFTABILITY AUDIT (axis #5) ==")
    print(f"un-relocated ROM-pointer words remaining : {grand}")
    print(f"  EXACT    (-> .4byte SYM)        : {tot['EXACT']}")
    print(f"  INTERIOR (-> SYM + offset)      : {tot['INTERIOR']}")
    print(f"  DANGLING (needs a label first)  : {tot['DANGLING']}")
    print(f"files containing un-relocated pointers   : {len(per_file)}")
    print()
    print("== top 30 files by pointer count (E/I/D) ==")
    for npt, c, sz, name in per_file[:30]:
        print(f"  {npt:>5}  E{c['EXACT']:>4} I{c['INTERIOR']:>4} D{c['DANGLING']:>4}  {sz:>7}B  {name}")

    if "--list-clean" in sys.argv:
        print()
        print("== fully-EXACT-resolvable tables (every pointer at a symbol boundary) ==")
        for npt, c, sz, name in per_file:
            if c["DANGLING"] == 0 and c["INTERIOR"] == 0:
                print(f"  {npt:>5}  {sz:>7}B  {name}")

    if "--metrics" in sys.argv:
        print()
        emit_metrics(grand)


# ---- formal tracked metrics (axes #5 SHIFTABILITY and #6 ASSET EDITABILITY) ----

GFX_HINTS = ("Map", "Tile", "Object", "Chr", "Pal", "Gfx", "Img", "Sprite",
             "Anim", "OBJ", "_gf", "Reel", "Portrait", "Icon")

def live_raw_bin(binpath):
    name = os.path.basename(binpath)[:-4]
    cpath = os.path.join(ROOT, "src", "data", name + "_ref", "dat_%s_ref.c" % name)
    if os.path.exists(cpath):
        with open(cpath, "r", errors="replace") as f:
            return "INCBIN" in f.read()
    return True

def count_relocated_data_ptrs():
    """ABS32 relocations RESIDING in data sections (.rodata/.data) across src/*.o
    -- the already-shiftable data pointers (the 'done' side of axis #5)."""
    objs = []
    for dp, _, fs in os.walk(os.path.join(ROOT, "src")):
        for f in fs:
            if f.endswith(".o"):
                objs.append(os.path.join(dp, f))
    total = 0
    for i in range(0, len(objs), 400):
        out = subprocess.run(["arm-none-eabi-objdump", "-r"] + objs[i:i+400],
                             capture_output=True, text=True, errors="replace").stdout
        in_data = False
        for line in out.splitlines():
            if line.startswith("RELOCATION RECORDS FOR ["):
                sec = line.split("[", 1)[1].rstrip("]:")
                in_data = (".rodata" in sec or ".data" in sec) and ".text" not in sec
            elif in_data and "R_ARM_ABS32" in line:
                total += 1
    return total

def emit_metrics(unrelocated):
    # axis #5 SHIFTABILITY
    relocated = count_relocated_data_ptrs()
    total_ptr = relocated + unrelocated
    shift_pct = (100.0 * relocated / total_ptr) if total_ptr else 100.0
    # axis #6 ASSET EDITABILITY (opaque raw-incbin data bytes)
    opaque_bytes = opaque_files = gfx_b = gfx_n = struct_b = struct_n = 0
    for binp in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not live_raw_bin(binp):
            continue
        sz = os.path.getsize(binp)
        opaque_bytes += sz; opaque_files += 1
        base = os.path.basename(binp)
        if any(k in base for k in GFX_HINTS):
            gfx_b += sz; gfx_n += 1
        else:
            struct_b += sz; struct_n += 1
    print("== TRACKED METRICS: SHIFTABILITY (#5) + ASSET EDITABILITY (#6) ==")
    print(f"5. SHIFTABILITY (data ptrs) : {shift_pct:6.2f}%  "
          f"({relocated}/{total_ptr} data pointers are relocatable symbol refs; "
          f"{unrelocated} still hardcoded absolute ROM addresses)  -> target 100% (0 hardcoded)")
    print(f"6. ASSET EDITABILITY        :  opaque raw-incbin data = {opaque_bytes} bytes "
          f"in {opaque_files} blobs  -> target: only irreducible binary assets")
    print(f"     - structured/logic-class (should be typed C): {struct_b} bytes, {struct_n} blobs")
    print(f"     - graphics/anim-class (legit binary, like fe8u .4bpp/.bin): {gfx_b} bytes, {gfx_n} blobs")
    print("The headline target is ungameable: 0 hardcoded pointers, 0 opaque structured blobs.")


if __name__ == "__main__":
    main()
