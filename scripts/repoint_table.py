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
import os, sys, struct, bisect, subprocess, re

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
    with open(binp, "rb") as f:
        b = f.read()
    if len(b) % 4 != 0:
        return None, "size not 4-aligned (%d)" % len(b)
    nwords = len(b) // 4
    externs = {}   # symname -> True
    lines = []
    nptr = ndata = nskip = 0
    for i in range(nwords):
        v = struct.unpack_from("<I", b, i * 4)[0]
        if ROM_LO <= v < ROM_HI:
            r = resolve(v, addrs, by_addr)
            if r is None:
                lines.append("    0x%08X," % v); ndata += 1; continue
            sym, off, is_func = r
            if safe_only and is_func:
                lines.append("    0x%08X,  /* fn-ptr: left raw (thumb-bit) */" % v)
                nskip += 1; continue
            externs[sym] = is_func
            if off:
                lines.append("    (u32)&%s + 0x%X," % (sym, off))
            else:
                lines.append("    (u32)&%s," % sym)
            nptr += 1
        else:
            lines.append("    0x%08X," % v); ndata += 1
    ext_lines = []
    for sym in sorted(externs):
        ext_lines.append("extern const u8 %s[];" % sym)
    c = []
    c.append("#include \"global.h\"")
    c.append("")
    c.append("/* De-pointered from data/residual/%s.bin by scripts/repoint_table.py." % name)
    c.append(" * Pointer words are emitted as relocatable symbol references so the ROM")
    c.append(" * is SHIFTABLE; byte-identical to baserom (gated by `make compare`).")
    c.append(" *")
    c.append(" * Defined under a private name + published as a type-less assembler")
    c.append(" * alias so a typed header declaration (struct Foo NAME[];) does not")
    c.append(" * conflict -- the data bytes (.word relocations) are byte-identical. */")
    c.append("")
    c.extend(ext_lines)
    c.append("")
    c.append("SECTION(\"%s\") static const u32 %s__shift[] = {" % (section, name))
    c.extend(lines)
    c.append("};")
    c.append("__asm__(\".global %s\\n\\t.set %s, %s__shift\\n\");" % (name, name, name))
    c.append("")
    stats = "ptr=%d data=%d skip=%d" % (nptr, ndata, nskip)
    return "\n".join(c), stats

def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    check = "--check" in sys.argv
    safe_only = "--safe-only" in sys.argv
    if not args:
        sys.exit(__doc__)
    addrs, by_addr = load_syms()
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
