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

_SRCDATA_INCBIN_BINS = None
def _srcdata_incbin_bins():
    """Residual .bin basenames still INCBIN'd by a LINKED source. Only src/data/
    objects are linked for residual data (every asm/dat_*.s is an EXCLUDED
    placeholder via DATA_INCBIN_ASM_EXCLUDE -- editing one does NOT change the
    ROM, a trap that previously fooled this metric). A .bin is raw debt iff its
    bytes enter the link verbatim = it is INCBIN'd by a linked src/data .c."""
    global _SRCDATA_INCBIN_BINS
    if _SRCDATA_INCBIN_BINS is None:
        out = subprocess.run(
            ["grep", "-rhoE", r'(INCBIN_U[0-9]+|\.incbin)\s*\(?\s*"data/residual/[A-Za-z0-9_.]+\.bin',
             os.path.join(ROOT, "src", "data")],
            capture_output=True, text=True, errors="replace").stdout
        bins = set()
        for line in out.splitlines():
            m = re.search(r'data/residual/([A-Za-z0-9_.]+\.bin)', line)
            if m:
                bins.add(m.group(1))
        _SRCDATA_INCBIN_BINS = bins
    return _SRCDATA_INCBIN_BINS

def is_live_raw(binpath):
    """A residual .bin is 'live raw data' (un-relocated debt) iff its raw bytes
    enter the link = it is INCBIN'd by a LINKED src/data source. De-pointered
    tables (.c rewritten to .4byte) and tables provided as relocated structs
    elsewhere (gClassData via data_classes.c) drop out automatically."""
    return os.path.basename(binpath) in _srcdata_incbin_bins()

_INCBIN_RANGES = None
def incbin_ranges(binname):
    """The byte ranges of a .bin that are STILL INCBIN'd (raw) in src/data -- a
    table can be PARTIALLY de-pointered (some sub-symbols rewritten to .4byte
    blocks, others still INCBIN), so counting the whole file double-counts the
    converted slices against the relocated total. Returns [(off, len), ...] or
    [(0, filesize)] for a whole-file INCBIN."""
    global _INCBIN_RANGES
    if _INCBIN_RANGES is None:
        _INCBIN_RANGES = {}
        # off/len may be HEX (0x108) or decimal. A decimal-only [0-9]+ mis-parsed a
        # hex-offset sliced INCBIN as a WHOLE-file incbin -> counted already-converted
        # __asm__-block words as still-raw (verified vs the linker: those offsets DO
        # carry R_ARM_ABS32 relocations). Accept 0x.. | decimal, parse with int(x, 0).
        # grep -E is POSIX ERE: NO (?:...) non-capturing groups (they break the pattern
        # so the optional offset group never matches -> false WHOLE). Use a plain hex/dec
        # char class for grep; the precise re.search below extracts/validates the numbers.
        out = subprocess.run(
            ["grep", "-rhoE",
             r'INCBIN_U[0-9]+\("data/residual/[A-Za-z0-9_.]+\.bin"'
             r'(\s*,\s*[0-9A-Fa-fxX]+\s*,\s*[0-9A-Fa-fxX]+)?',
             os.path.join(ROOT, "src", "data")],
            capture_output=True, text=True, errors="replace").stdout
        for line in out.splitlines():
            m = re.search(r'data/residual/([A-Za-z0-9_.]+\.bin)"(?:\s*,\s*(0[xX][0-9A-Fa-f]+|\d+)'
                          r'\s*,\s*(0[xX][0-9A-Fa-f]+|\d+))?', line)
            if not m:
                continue
            bn = m.group(1)
            if m.group(2) is not None:
                _INCBIN_RANGES.setdefault(bn, []).append((int(m.group(2), 0), int(m.group(3), 0)))
            else:
                _INCBIN_RANGES.setdefault(bn, "WHOLE")
    r = _INCBIN_RANGES.get(binname)
    return r

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
        # only count words in byte ranges STILL INCBIN'd (raw); partially de-pointered
        # tables have some slices already converted to .4byte (counted as relocated).
        rngs = incbin_ranges(os.path.basename(path))
        def is_raw(off):
            if rngs == "WHOLE" or rngs is None:
                return True
            return any(o <= off < o + ln for (o, ln) in rngs)
        c = {"EXACT": 0, "INTERIOR": 0, "DANGLING": 0}
        for i in range(n):
            if not is_raw(i * 4):
                continue
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

    if "--true-debt" in sys.argv:
        print()
        emit_true_debt()


# ---- formal tracked metrics (axes #5 SHIFTABILITY and #6 ASSET EDITABILITY) ----

GFX_HINTS = ("Map", "Tile", "Object", "Chr", "Pal", "Gfx", "Img", "Sprite",
             "Anim", "OBJ", "_gf", "Reel", "Portrait", "Icon")

def live_raw_bin(binpath):
    return is_live_raw(binpath)

def count_relocated_data_ptrs():
    """ABS32 relocations RESIDING in data sections (.rodata/.data) across the
    committed objects (src/ AND asm/) -- the already-shiftable data pointers (the
    'done' side of axis #5). asm/ is included because de-pointered asm-incbin
    tables emit their .4byte relocations into asm/*.o."""
    objs = []
    for root in (os.path.join(ROOT, "src"), os.path.join(ROOT, "asm")):
        for dp, _, fs in os.walk(root):
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

_GFX_RE = re.compile(
    r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|Icon|_gf|OBJ|'
    r'Reel|Sheet|BG|Frames|Obj|Menu|Lz|Comp|song|wave|sound', re.I)

def coincidental_floor():
    """ROM-range words in GRAPHICS/sound blobs are coincidental constants (pixel/
    sample bytes that happen to land in 0x08xxxxxx) -- they are NOT pointers, are
    never dereferenced as addresses, and CANNOT be relocated. Counting them as
    'hardcoded pointers' is a false positive, so report them separately: the real
    shiftability debt is the NON-graphics (logic) un-relocated words."""
    floor = 0
    for binp in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not is_live_raw(binp):
            continue
        name = os.path.basename(binp)[:-4]
        if not _GFX_RE.search(name):
            continue
        with open(binp, "rb") as f:
            b = f.read()
        for i in range(len(b) // 4):
            v = struct.unpack_from("<I", b, i * 4)[0]
            if ROM_LO <= v < ROM_HI:
                floor += 1
    return floor

def emit_metrics(unrelocated):
    # axis #5 SHIFTABILITY
    relocated = count_relocated_data_ptrs()
    total_ptr = relocated + unrelocated
    shift_pct = (100.0 * relocated / total_ptr) if total_ptr else 100.0
    gfx_floor = coincidental_floor()
    real_debt = unrelocated - gfx_floor
    real_total = relocated + real_debt
    real_pct = (100.0 * relocated / real_total) if real_total else 100.0
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
    print(f"5b. REAL-pointer shiftability: {real_pct:6.2f}%  "
          f"({relocated}/{real_total}; {real_debt} REAL hardcoded pointers remain, "
          f"excluding {gfx_floor} coincidental constants in graphics/sound blobs "
          f"-- not pointers, never relocatable)  -> target 100%")
    print(f"6. ASSET EDITABILITY        :  opaque raw-incbin data = {opaque_bytes} bytes "
          f"in {opaque_files} blobs  -> target: only irreducible binary assets")
    print(f"     - structured/logic-class (should be typed C): {struct_b} bytes, {struct_n} blobs")
    print(f"     - graphics/anim-class (legit binary, like fe8u .4bpp/.bin): {gfx_b} bytes, {gfx_n} blobs")
    print("The headline target is ungameable: 0 hardcoded pointers, 0 opaque structured blobs.")


def emit_true_debt():
    """Definitive classification of every remaining hardcoded ROM-range word via
    the fe8u oracle, to separate the TRUE real-pointer debt from the coincidental
    constants the byte-level auditor cannot distinguish (a 0x08xxxxxx stat/flag
    field is not a pointer and can never be relocated). Slow (per-word fe8u). """
    import bisect, re as _re
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    import fe8u_ptr_offsets as F
    gfx = _re.compile(r'Img|Tsa|Pal|Chr|Gfx|Sprite|Anim|banim|Map|Tile|Portrait|'
                      r'Icon|_gf|OBJ|Reel|Sheet|BG|Frames|Obj|Menu|Lz|Comp|song|wave|sound', _re.I)
    smap = {}
    for cf in glob.glob(os.path.join(ROOT, "src", "data", "*", "*.c")):
        t = open(cf, errors="replace").read()
        for m in _re.finditer(r'u8\s+(\w+)\s*\[\s*\]\s*__attribute__\(\(section\("([^"]+)"\)\)\)'
                              r'\s*=\s*INCBIN_U8\("data/residual/([A-Za-z0-9_.]+\.bin)"'
                              r'(?:\s*,\s*(\d+)\s*,\s*(\d+))?\)', t):
            sym, sec, binn, off, ln = m.groups()
            smap.setdefault(binn, []).append((sym, sec, int(off) if off else 0, ln))
    # PER-WORD fe8u oracle: for each hardcoded word, find its JP address (from the
    # sliced sub-symbol's .data.residue.<ADDR> section, or a data_<addr> name) and
    # ask fe8u whether it relocates there. Precise (spans symbol boundaries).
    real = coinc = bunk = 0
    realhits = []  # (name, off, jp) of fe8u-confirmed-real still-raw words
    for b in glob.glob(os.path.join(ROOT, "data", "residual", "*.bin")):
        if not is_live_raw(b): continue
        name = os.path.basename(b)[:-4]
        if gfx.search(name): continue
        d = open(b, "rb").read()
        slices = smap.get(name + ".bin")
        nm = _re.match(r'(?:data|gUnkData|gap)_([0-9A-Fa-f]{6,8})$', name)
        # match the main scan's word set: only bytes STILL INCBIN'd (raw)
        rngs = incbin_ranges(os.path.basename(b))
        def _is_raw(off, _r=rngs):
            if _r == "WHOLE" or _r is None: return True
            return any(o <= off < o + ln for (o, ln) in _r)
        for i in range(len(d) // 4):
            if not _is_raw(i * 4): continue
            v = struct.unpack_from("<I", d, i * 4)[0]
            if not (ROM_LO <= v < ROM_HI): continue
            O = i * 4; jp = None
            if slices:
                for (sym, sec, off, ln) in slices:
                    ln = int(ln) if ln else len(d) - off
                    if off <= O < off + ln:
                        mm = _re.search(r'residue\.([0-9A-Fa-f]{6,8})', sec)
                        if mm: jp = int(mm.group(1), 16) + (O - off)
                        break
            elif nm:
                jp = int(nm.group(1), 16) + O
            r = F.fe8u_ptr_at_jp(jp) if jp is not None else None
            if r is True: real += 1; realhits.append((name, O, jp))
            elif r is False: coinc += 1
            else: bunk += 1
    if "--list-real" in sys.argv:
        print("== fe8u-confirmed REAL still-raw words (convertible) ==")
        for (n, O, jp) in realhits:
            print(f"  {n}  off={O}  jp=0x{jp:08X}")
    bcoinc = coinc
    true_debt = real + bunk
    print("== TRUE real-pointer debt (fe8u per-word classification) ==")
    print(f"  fe8u-confirmed coincidental (NOT a pointer)        : {coinc}")
    print(f"  (above includes fe8u-has-data-raw cases)")
    print(f"  fe8u-confirmed REAL pointer still raw (convertible) : {real}")
    print(f"  fe8u-blind UNKNOWN (JP-only / no anchor)            : {bunk}")
    print(f"  => TRUE real-pointer debt (real + unknown)         : {true_debt}")


if __name__ == "__main__":
    main()
