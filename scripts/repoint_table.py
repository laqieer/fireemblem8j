#!/usr/bin/env python3
"""
repoint_table.py -- de-pointer a residual data blob into a shiftable C table.

Turns a raw `INCBIN_U8("data/residual/<name>.bin")` wrapper (which bakes in
absolute 0x08xxxxxx pointers -> NOT shiftable) into a `const u32 <name>[]`
array of *symbol references*:

    pointer word  ->  (u32)&SymbolAtThatAddress           (+ 0xOFF if interior)
    data word     ->  0xNNNNNNNN literal

agbcc lowers `(u32)&sym` to `.word sym` (a relocation), so the result is
BYTE-IDENTICAL to the original ROM (the symbol's address == the original bytes)
yet fully relocated by the linker when sections shift. `make compare` is the
oracle: if it stays OK, the transform was byte-exact.

Only the .c *content* changes -- the ldscript entry, object path, section, and
symbol name are untouched, so no build wiring moves.

Usage:
    repoint_table.py <name> [<name> ...]      # rewrite each src/data/<name>_ref/dat_<name>_ref.c
    repoint_table.py --check <name>           # dry-run: print what it would emit
    repoint_table.py --safe-only <name>...    # skip any word whose target is a Thumb function
                                              # (avoids the thumb-bit relocation hazard)
"""
import os, sys, struct, bisect, subprocess, re, glob

ROM_LO, ROM_HI = 0x08000000, 0x09000000
IDENT = re.compile(r"^[A-Za-z_][A-Za-z0-9_]*$")  # valid C identifier (skip .gcc2_compiled., $t, ...)
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ELF = os.path.join(ROOT, "fireemblem8.elf")
RESID = os.path.join(ROOT, "data", "residual")

def load_syms():
    """addr-sorted symbols from the linked ELF, with size and 'is-function'."""
    out = subprocess.check_output(
        ["arm-none-eabi-nm", "-S", "--defined-only", ELF],
        text=True, errors="replace")
    by_addr = {}   # addr -> (name, size, is_func)
    for line in out.splitlines():
        p = line.split()
        if len(p) == 4:
            a_s, sz_s, typ, name = p
            try: size = int(sz_s, 16)
            except ValueError: size = 0
        elif len(p) == 3:
            a_s, typ, name = p; size = 0
        else:
            continue
        try: addr = int(a_s, 16)
        except ValueError: continue
        if not (ROM_LO <= addr < ROM_HI): continue
        if (not typ.isupper()) or typ in ("U", "A", "N"): continue  # globals only (linkable extern)
        if not IDENT.match(name): continue   # skip .gcc2_compiled., $t, $d mapping syms
        is_func = typ == "T"
        cur = by_addr.get(addr)
        if cur is None or _rank(name) < _rank(cur[0]):
            by_addr[addr] = (name, max(size, cur[1] if cur else 0), is_func or (cur[2] if cur else False))
        elif cur:
            by_addr[addr] = (cur[0], max(cur[1], size), cur[2] or is_func)
    addrs = sorted(by_addr)
    return addrs, by_addr

def _rank(n):
    return 2 if n.startswith(("data_", "gap_", "sub_", "byte_", "off_", "unk_", "j_", "nullsub")) else 0

def resolve(ptr, addrs, by_addr):
    """Return (symname, offset, is_func) for the symbol covering ptr, or None."""
    i = bisect.bisect_right(addrs, ptr) - 1
    if i < 0: return None
    base = addrs[i]
    name, size, is_func = by_addr[base]
    off = ptr - base
    if off == 0:
        return (name, 0, is_func)
    if size and off < size:
        return (name, off, is_func)
    if i + 1 < len(addrs) and ptr < addrs[i + 1]:
        return (name, off, is_func)
    return None  # dangling

_HDR_ARRAYS = None
def header_array_symbols():
    """Identifiers declared as arrays (`name[`) anywhere in include/*.h. Emitting
    our own `extern const u8 name[];` for one of these conflicts with the header's
    typed array decl (e.g. `struct Glyph *TextGlyphs_System[]`). Since global.h
    already pulls those headers in, we simply skip our extern and let the header's
    declaration satisfy `(u32)&name` (valid for any array element type)."""
    global _HDR_ARRAYS
    if _HDR_ARRAYS is not None:
        return _HDR_ARRAYS
    syms = set()
    # only an `extern ... NAME[` global array declaration conflicts -- NOT struct
    # fields, local arrays, or `arr[i]` usage. Require `extern` on the line.
    rx = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\s*\[")
    for dp, _, fs in os.walk(os.path.join(ROOT, "include")):
        for f in fs:
            if not f.endswith(".h"):
                continue
            try:
                with open(os.path.join(dp, f), "r", errors="replace") as fh:
                    for line in fh:
                        if "extern" not in line:
                            continue
                        # last identifier before a '[' on the extern line = the array name
                        for m in rx.finditer(line):
                            syms.add(m.group(1))
            except OSError:
                pass
    _HDR_ARRAYS = syms
    return syms

def find_wrapper(name):
    """Locate the residual .c wrapper + .bin + section for <name>."""
    cdir = os.path.join(ROOT, "src", "data", name + "_ref")
    cpath = os.path.join(cdir, "dat_%s_ref.c" % name)
    binp = os.path.join(RESID, name + ".bin")
    section = ".rodata.dat_%s_ref" % name
    if not os.path.exists(cpath):
        # fall back: search for any .c that INCBINs this bin
        cpath = None
    return cpath, binp, section

def emit_c(name, binp, section, addrs, by_addr, safe_only=False):
    """Emit the table as a top-level __asm__ block: `.4byte sym (+off)` for each
    pointer word, `.4byte 0xNNN` for data words. Pure asm needs NO C declaration
    of any referenced symbol, so it NEVER conflicts with a typed header decl and
    never hits an undeclared-symbol error regardless of what global.h pulls in --
    GAS emits an undefined reference the linker resolves (with the Thumb bit for
    STT_FUNC syms, matching FE8's odd-stored function pointers). Byte-identical to
    baserom by construction (each .4byte sym relocates to sym's address == the
    original bytes); `make compare` is the oracle."""
    with open(binp, "rb") as f:
        b = f.read()
    if len(b) % 4 != 0:
        return None, "size not 4-aligned (%d)" % len(b)
    nwords = len(b) // 4
    lines = []
    nptr = ndata = nskip = 0
    for i in range(nwords):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if ROM_LO <= v < ROM_HI:
            r = resolve(v, addrs, by_addr)
            if r is None:
                lines.append('"\\t.4byte 0x%08X\\n"' % v); ndata += 1; continue
            sym, off, is_func = r
            # SAFETY: a word resolving INTERIOR into a function's code (off>1) is
            # never a real pointer -- it's a coincidental constant whose value
            # happens to fall in ROM range (e.g. a UnitDefinition AI/flag field).
            # Converting it would (a) be semantically wrong and (b) flip the thumb
            # bit -> +1 byte diff. Leave it raw. Legit fn pointers hit the function
            # start (off=0) or carry the thumb bit (off=1).
            if is_func and off > 1:
                lines.append('"\\t.4byte 0x%08X\\n"  /* coincidental const into fn: raw */' % v)
                nskip += 1; continue
            if safe_only and is_func:
                lines.append('"\\t.4byte 0x%08X\\n"  /* fn-ptr: left raw */' % v)
                nskip += 1; continue
            if off:
                lines.append('"\\t.4byte %s + 0x%X\\n"' % (sym, off))
            else:
                lines.append('"\\t.4byte %s\\n"' % sym)
            nptr += 1
        else:
            lines.append('"\\t.4byte 0x%08X\\n"' % v); ndata += 1
    c = []
    c.append("#include \"global.h\"")
    c.append("")
    c.append("/* De-pointered from data/residual/%s.bin by scripts/repoint_table.py." % name)
    c.append(" * Pointer words are relocatable symbol references (.4byte sym) so the ROM is")
    c.append(" * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a")
    c.append(" * pure asm block so no typed header decl of the referenced symbols can conflict. */")
    c.append("")
    c.append("__asm__(")
    c.append('"\\t.section %s, \\"a\\", %%progbits\\n"' % section)
    c.append('"\\t.global %s\\n"' % name)
    c.append('"%s:\\n"' % name)
    c.extend(lines)
    c.append(");")
    c.append("")
    stats = "ptr=%d data=%d skip=%d" % (nptr, ndata, nskip)
    return "\n".join(c), stats

def table_is_safe(binp, addrs, by_addr):
    """A residual table is SAFE to auto-repoint iff every in-ROM-range word
    resolves EXACT (to a symbol boundary, offset 0). EXACT-resolving words are
    high-confidence pointers (a non-pointer constant essentially never equals a
    symbol's exact start address); non-ROM words stay literal data. Any INTERIOR
    word (mid-object) is ambiguous -> route to fe8u-structured porting, not auto.
    Returns (safe, nptr) ; safe=False if 0 pointers or any interior/dangling."""
    try:
        with open(binp, "rb") as f:
            b = f.read()
    except OSError:
        return (False, 0)
    if len(b) == 0 or len(b) % 4:
        return (False, 0)
    nptr = 0
    for i in range(len(b) // 4):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if v == 0:
            continue
        if ROM_LO <= v < ROM_HI:
            r = resolve(v, addrs, by_addr)
            if r is None or r[1] != 0:   # dangling or interior -> unsafe
                return (False, 0)
            nptr += 1
        # else: ordinary data word, fine
    return (nptr > 0, nptr)

def select_auto_safe(addrs, by_addr):
    names = []
    for binp in sorted(glob.glob(os.path.join(RESID, "*.bin"))):
        name = os.path.basename(binp)[:-4]
        cpath, _, _ = find_wrapper(name)
        if not (cpath and os.path.exists(cpath)):
            continue
        with open(cpath, "r", errors="replace") as f:
            if "INCBIN" not in f.read():
                continue  # already de-pointered
        safe, nptr = table_is_safe(binp, addrs, by_addr)
        if safe:
            names.append((nptr, name))
    names.sort(reverse=True)
    return names

def table_density(binp, addrs, by_addr):
    """Return (nptr, nwords, all_resolve). A pointer-DENSE table (high
    nptr/nwords) is definitionally a pointer table -- a non-pointer constant
    coincidentally in ROM-range is implausible when the majority of words
    already resolve as pointers. Used by --auto-dense (a safe bulk lever for
    the INTERIOR backlog beyond the EXACT-only --auto-safe)."""
    try:
        with open(binp, "rb") as f:
            b = f.read()
    except OSError:
        return (0, 0, False)
    if len(b) == 0 or len(b) % 4:
        return (0, 0, False)
    nwords = len(b) // 4
    nptr = 0
    all_resolve = True
    for i in range(nwords):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if v == 0:
            continue
        if ROM_LO <= v < ROM_HI:
            if resolve(v, addrs, by_addr) is None:
                all_resolve = False
            nptr += 1
    return (nptr, nwords, all_resolve)

def select_auto_dense(addrs, by_addr, frac=0.5):
    names = []
    for binp in sorted(glob.glob(os.path.join(RESID, "*.bin"))):
        name = os.path.basename(binp)[:-4]
        cpath, _, _ = find_wrapper(name)
        if not (cpath and os.path.exists(cpath)):
            continue
        with open(cpath, "r", errors="replace") as f:
            if "INCBIN" not in f.read():
                continue
        nptr, nwords, ok = table_density(binp, addrs, by_addr)
        if ok and nptr and nwords and (nptr / nwords) >= frac:
            names.append((nptr, name))
    names.sort(reverse=True)
    return names

def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check = "--check" in sys.argv
    safe_only = "--safe-only" in sys.argv
    addrs, by_addr = load_syms()
    if "--auto-safe" in sys.argv:
        sel = select_auto_safe(addrs, by_addr)
        print("auto-safe: %d tables, %d pointers" % (len(sel), sum(n for n, _ in sel)))
        args = [name for _, name in sel]
        if check:
            for n, name in sel:
                print("  %5d  %s" % (n, name))
            return
    if "--auto-dense" in sys.argv:
        frac = 0.5
        for a in sys.argv:
            if a.startswith("--frac="):
                frac = float(a.split("=", 1)[1])
        sel = select_auto_dense(addrs, by_addr, frac)
        print("auto-dense(frac>=%.2f): %d tables, %d pointers" % (frac, len(sel), sum(n for n, _ in sel)))
        args = [name for _, name in sel]
        if check:
            for n, name in sel:
                print("  %5d  %s" % (n, name))
            return
    if not args:
        sys.exit(__doc__)
    for name in args:
        cpath, binp, section = find_wrapper(name)
        if not os.path.exists(binp):
            print("SKIP %s: no .bin (%s)" % (name, binp)); continue
        if cpath is None:
            print("SKIP %s: no _ref .c wrapper found" % name); continue
        c, stats = emit_c(name, binp, section, addrs, by_addr, safe_only)
        if c is None:
            print("SKIP %s: %s" % (name, stats)); continue
        if check:
            print("=== %s (%s) ===" % (name, stats))
            print(c[:1500])
        else:
            with open(cpath, "w") as f:
                f.write(c)
            print("WROTE %s (%s) -> %s" % (name, stats, cpath))

if __name__ == "__main__":
    main()
