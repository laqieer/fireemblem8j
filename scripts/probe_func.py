#!/usr/bin/env python3
"""Fast per-function byte-diff probe for the asm->matching-C grind (D38 diagnostic).

Compile a candidate src/<fn>.c function-only via the Makefile recipe, objcopy its
.text, and byte-diff against the JP ROM range from baserom.gba. This is the
fast inner loop (no full `make compare`) for deciding whether a ported function:
  * byte-MATCHES  (graduate it),
  * NEAR-matches with diffs only in the literal pool / bl operand (unresolved
    reference -> D38 unblock), or
  * FAR body diff  (genuinely region-different codegen -> permuter/leave asm).

Usage:
  scripts/probe_func.py <fn> [<jp_start_hex> <jp_end_hex>]

If the range is omitted it is read from layout/carved_rom.d/gbadisasm_<fn>.tsv.
The candidate C must already exist at src/<fn>.c (this tool does NOT write it).
It compiles to a TEMP object, never touches the build, never links.
"""
import os, re, sys, subprocess, glob

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)


def sh(c, **kw):
    return subprocess.run(c, shell=True, capture_output=True, text=True, **kw)


def jp_range(fn):
    f = f"layout/carved_rom.d/gbadisasm_{fn}.tsv"
    if os.path.exists(f):
        p = open(f).readline().strip().split("\t")
        return int(p[0], 16), int(p[1], 16)
    # try any fragment naming the symbol
    for g in glob.glob("layout/carved_rom.d/*.tsv"):
        for ln in open(g):
            if f"({fn})" in ln or f".text.{fn})" in ln or f"\t{fn} " in ln:
                p = ln.split("\t")
                return int(p[0], 16), int(p[1], 16)
    return None, None


def compile_text(cpath):
    """Compile src/<fn>.c function-only to a temp .o, return its .text bytes."""
    base = cpath[:-2]
    obj = base + ".probe.o"
    asm = base + ".probe.s"
    binf = base + ".probe.bin"
    # Mirror the Makefile C pipeline (see scripts/m2c_firstpass compile_check).
    # CPP: prefer arm-none-eabi-cpp, else host cpp (the Makefile default).
    import shutil
    cpp = shutil.which("arm-none-eabi-cpp") or shutil.which("cpp") or "cpp"
    agbcc = "tools/agbcc/bin/agbcc"
    p1 = sh(f"{cpp} -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef {cpath}")
    if p1.returncode != 0:
        return None, "cpp: " + p1.stderr[:800]
    p2 = subprocess.run(["iconv", "-f", "UTF-8", "-t", "CP932"],
                        input=p1.stdout, capture_output=True, text=True)
    p3 = subprocess.run(
        [agbcc, "-mthumb-interwork", "-Wimplicit", "-Wparentheses", "-Werror",
         "-O2", "-fhex-asm", "-o", asm],
        input=p2.stdout, capture_output=True, text=True)
    if p3.returncode != 0:
        return None, "agbcc: " + (p3.stdout + p3.stderr)[:1200]
    # Match the Makefile C rule exactly: append `.text` + `.align 2, 0` (zero fill)
    # so the trailing pad is `00 00`, not GAS's `46c0` Thumb nop.
    with open(asm, "a") as f:
        f.write("\t.text\n\t.align 2, 0\n")
    p4 = sh(f"arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . {asm} -o {obj}")
    if p4.returncode != 0:
        return None, "as: " + p4.stderr[:800]
    sh(f"arm-none-eabi-objcopy -O binary -j .text {obj} {binf}")
    data = open(binf, "rb").read()
    for p in (obj, asm, binf):
        if os.path.exists(p):
            os.unlink(p)
    return data, None


def main():
    fn = sys.argv[1]
    if len(sys.argv) >= 4:
        s, e = int(sys.argv[2], 16) & 0xFFFFFF, int(sys.argv[3], 16) & 0xFFFFFF
    else:
        s, e = jp_range(fn)
    if s is None:
        print(f"no JP range for {fn} (give it explicitly)")
        return 2
    cpath = f"src/{fn}.c"
    if not os.path.exists(cpath):
        print(f"no {cpath}")
        return 2
    rom = open("baserom.gba", "rb").read()
    target = rom[s:e]
    got, err = compile_text(cpath)
    if got is None:
        print(f"[COMPILE-FAIL] {fn}\n{err}")
        return 1
    # compare over the funcmap/fragment length (target); trim/pad got to len(target)
    n = len(target)
    g = got[:n]
    print(f"{fn}: JP {s:06X}..{e:06X} ({n} bytes); compiled .text {len(got)} bytes")
    if g == target and len(got) == n:
        print(f"[MATCH] {fn} byte-exact over {n} bytes")
        return 0
    if g == target:
        print(f"[MATCH-PREFIX] first {n} bytes match; compiled is {len(got)} long "
              f"(tail padding/extra)")
        return 0
    diffs = [i for i in range(min(len(g), n)) if g[i] != target[i]]
    print(f"[DIFF] {len(diffs)} byte(s) differ"
          + (f"; length mismatch got {len(got)} vs {n}" if len(got) != n else ""))
    # show first few diffs in context
    for i in diffs[:12]:
        print(f"  @+{i:04X}: got {g[i]:02X} want {target[i]:02X}")
    if len(diffs) > 12:
        print(f"  ... and {len(diffs)-12} more")
    return 1


if __name__ == "__main__":
    sys.exit(main())
