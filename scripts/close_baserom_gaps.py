#!/usr/bin/env python3
"""Close residual `baserom.gba` gaps by carving them into committed source.

gen_layout.py fills any ROM address range NOT covered by a carved object with
`.incbin "baserom.gba"` in the generated asm/baserom.s. The harvest/graduation
waves occasionally delete a gbadisasm fragment that covered a few bytes between
two graduated objects (alignment padding, a tiny region-different stub, or a
data table straddling two functions), re-opening such a gap -> a silent
self-containment regression (build no longer works with baserom.gba removed).

This is the standard post-integration repair (run alongside dedup_baseline_syms.py):
for every `.incbin "baserom.gba", <off>, <size>` gap in the freshly-generated
asm/baserom.s it commits the exact JP bytes to data/residual/gap_<off>.bin and
wires them into the layout (asm/gap_<off>.s + a carved_rom.d fragment), so
gen_layout covers the range from committed source. Byte-identical by construction
(the .bin is exactly the ROM bytes); `make compare` is the oracle. baserom.gba is
read ONCE here to extract the bytes; it is NOT a build input afterward.

Usage (repo root, baserom.gba present):  python3 scripts/close_baserom_gaps.py
Then: make layout && make check && make compare && make clean && make compare
"""
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
os.chdir(ROOT)
BASEROM = "baserom.gba"
GEN = "asm/baserom.s"
OUT_BIN = "data/residual"
GAP_RE = re.compile(r'\.incbin\s+"baserom\.gba",\s*0x([0-9A-Fa-f]+),\s*0x([0-9A-Fa-f]+)')


def main():
    if not os.path.exists(BASEROM):
        print("ERROR: baserom.gba absent (needed once to extract the committed bytes).")
        return 1
    # Regenerate the layout so asm/baserom.s reflects the current gaps.
    subprocess.run(["make", "layout"], capture_output=True)
    if not os.path.exists(GEN):
        print("ERROR: asm/baserom.s not generated.")
        return 1
    gaps = []
    for line in open(GEN):
        m = GAP_RE.search(line)
        if m:
            gaps.append((int(m.group(1), 16), int(m.group(2), 16)))
    if not gaps:
        print("close_baserom_gaps: 0 gaps — build is fully self-contained.")
        return 0
    os.makedirs(OUT_BIN, exist_ok=True)
    rom = open(BASEROM, "rb").read()
    rows = []
    for lo, size in gaps:
        name = f"gap_{lo:08X}"
        binrel = f"{OUT_BIN}/{name}.bin"
        with open(binrel, "wb") as w:
            w.write(rom[lo:lo + size])
        with open(f"asm/{name}.s", "w") as w:
            w.write(f'\t.section .rodata.{name}, "a", %progbits\n')
            w.write(f'@ {name}: residual gap [0x{lo:06X},0x{lo + size:06X}) carved to committed\n')
            w.write(f'@ source (was an auto `.incbin "baserom.gba"` gap; see scripts/close_baserom_gaps.py)\n')
            w.write(f'\t.global {name}\n{name}:\n')
            w.write(f'\t.incbin "{binrel}"\n')
        rows.append(f"{lo:X}\t{lo + size:X}\tasm/{name}.o(.rodata.{name})\t"
                    f"{name} residual gap, committed bytes (was baserom incbin)\n")
    os.makedirs("layout/carved_rom.d", exist_ok=True)
    with open("layout/carved_rom.d/residual_gaps.tsv", "a+") as w:
        w.seek(0)
        existing = set(l.split("\t")[0] for l in w if l.strip() and not l.startswith("#"))
        for r in rows:
            if r.split("\t")[0] not in existing:
                w.write(r)
    print(f"close_baserom_gaps: carved {len(gaps)} gap(s) to committed source:")
    for lo, size in gaps:
        print(f"  0x{lo:06X} +{size}B -> data/residual/gap_{lo:08X}.bin")
    return 0


if __name__ == "__main__":
    sys.exit(main())
