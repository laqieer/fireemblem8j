#!/usr/bin/env python3
"""Carve pure-0xFF ROM PADDING out of the raw incbin baseline as `.fill` directives.

Final-goal closer (D27). After the code/data fronts, the bulk of the remaining raw
`asm/baserom.s` incbin is **ROM padding**: large contiguous runs of 0xFF (inter-section
alignment / end-of-ROM fill). It is NOT authored data — objcopy's `--gap-fill=0xff`
already supplies it — so representing it as raw incbin keeps a meaningless ~1.9 MB
inside the final-goal metric "every incbin byte → real source".

This carver replaces each pure-0xFF span with the HONEST descriptive source for padding:

    .section .pad.<addr>, "a", %progbits
    .global pad_<addr>
pad_<addr>:
    .fill <size>, 1, 0xFF

`.fill N, 1, 0xFF` emits exactly N bytes of 0xFF — byte-identical to the incbin it
replaces — and carries NO `.align`/`.balign` (the only thing that could grow the ROM).
The span is placed by a per-task `carved_rom` fragment row at its exact JP address, so the
linker lays it where the incbin used to be and `make compare` stays the byte oracle.

This is NOT "carving padding as data" (which would dishonestly inflate the data %): a
`.fill` padding object is not authored data and is not counted as carved data. It only
advances the FINAL GOAL (raw-incbin → real source). See docs/decisions.md D27.

WHAT IT CARVES (each gated by `make compare` by the caller, verify-or-revert):
  * a baseline incbin chunk that is 100% 0xFF              -> one pad_<addr> object;
  * the pure-0xFF HEAD and/or TAIL of a chunk that brackets a real-data block
    (the real-data middle stays in the incbin baseline, untouched).
Only spans at/above the data boundary (default 0x080DC134) and >= --min bytes are taken.

Parallel-safe: outputs are isolated per-task fragments
(layout/carved_rom.d/pad_<addr>.tsv) + asm/pad_<addr>.s, never the shared monolith.

Usage:
  scripts/carve_padding.py            # carve all qualifying pure-FF spans
  scripts/carve_padding.py --list     # just report the spans, write nothing
  scripts/carve_padding.py --min N    # minimum pure-FF span size (default 4096)
Then:  make check && make compare     # revert asm/pad_*.s + the fragments on any miss.
"""
import glob
import os
import re
import sys

os.chdir(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

BASE = 0x08000000
ROM = "baserom.gba"
ROM_SIZE = os.path.getsize(ROM) if os.path.exists(ROM) else 0x1000000
# code+library section boundary (US arm_call.o end / src/rng.o .rodata start; JP identical).
# Padding below this would be in the CODE region (RE's src/ domain) — never touch it.
DATA_BOUNDARY = 0x080DC134
DEFAULT_MIN = 4096


def carved_ranges():
    """Every [start, end) already carved in carved_rom (monolith + every fragment),
    as absolute VMAs. A pure-FF span is only carved if it is currently in the raw
    incbin (i.e. NOT already covered by a carved row)."""
    out = []
    paths = []
    if os.path.exists("layout/carved_rom.tsv"):
        paths.append("layout/carved_rom.tsv")
    paths += sorted(glob.glob("layout/carved_rom.d/*.tsv"))
    for p in paths:
        for l in open(p):
            if l.startswith("#") or not l.strip():
                continue
            f = l.split("\t")
            try:
                out.append((int(f[0], 16) + BASE, int(f[1], 16) + BASE))
            except ValueError:
                pass
    return out


def incbin_gaps():
    """The raw-incbin gaps = [region_start, region_end) of the ROM NOT covered by any
    carved_rom row. These are exactly the chunks gen_layout would emit as `.incbin` in
    asm/baserom.s. Computed from the manifests so we don't depend on a built asm/baserom.s."""
    carved = sorted(carved_ranges())
    merged = []
    for s, e in carved:
        if merged and s <= merged[-1][1]:
            merged[-1] = (merged[-1][0], max(merged[-1][1], e))
        else:
            merged.append((s, e))
    gaps = []
    prev = BASE
    for s, e in merged:
        if s > prev:
            gaps.append((prev, s))
        prev = max(prev, e)
    if prev < BASE + ROM_SIZE:
        gaps.append((prev, BASE + ROM_SIZE))
    return gaps


def ff_spans_in(rom, lo, hi, min_size):
    """The pure-0xFF sub-spans of [lo, hi) (absolute VMAs) worth carving as `.fill`:
    the whole span if it is 100% FF, else EVERY maximal pure-FF run of >= min_size
    bytes (head, tail, OR interior). A large interior FF run is a single contiguous
    pad block bracketed by real data (e.g. the 108 KB pad at 0x08FE4000 between two
    0x1000-aligned data blocks) — carving it is one clean object, not "shattering"
    real data. The min_size floor is exactly what keeps the SMALL interior FF runs
    (the scattered 1-byte alignment bytes inside a real-data block) in the incbin: a
    real-data block riddled with sub-min FF gaps is left whole. Each returned span is
    a maximal pure-FF run >= min_size; the real data between/around them stays incbin."""
    seg = rom[lo - BASE:hi - BASE]
    n = len(seg)
    spans = []
    i = 0
    while i < n:
        if seg[i] == 0xFF:
            j = i
            while j < n and seg[j] == 0xFF:
                j += 1
            if (j - i) >= min_size:
                spans.append((lo + i, lo + j))
            i = j
        else:
            i += 1
    return spans


def main():
    args = sys.argv[1:]
    do_list = "--list" in args
    min_size = DEFAULT_MIN
    if "--min" in args:
        i = args.index("--min")
        min_size = int(args[i + 1])
        del args[i:i + 2]

    rom = open(ROM, "rb").read()
    gaps = incbin_gaps()

    spans = []  # (lo, hi) pure-FF, all >= min_size, at/above DATA_BOUNDARY
    for glo, ghi in gaps:
        lo = max(glo, DATA_BOUNDARY)
        if lo >= ghi:
            continue
        for s, e in ff_spans_in(rom, lo, ghi, min_size):
            # paranoia: re-verify the span is 100% 0xFF before emitting
            seg = rom[s - BASE:e - BASE]
            assert seg.count(0xFF) == len(seg), f"span {s:#x}..{e:#x} not pure FF"
            spans.append((s, e))
    spans.sort()

    if not spans:
        print("no qualifying pure-0xFF padding spans to carve")
        return

    tot = sum(e - s for s, e in spans)
    print(f"pure-0xFF padding spans (>= {min_size} B, >= {DATA_BOUNDARY:#x}): "
          f"{len(spans)}, total {tot} B = {tot / 1024:.1f} KB = {tot / 1024 / 1024:.3f} MB")
    for s, e in spans:
        print(f"  pad 0x{s:08X}..0x{e:08X}  {e - s:>9d} B = {(e - s) / 1024:8.1f} KB")
    if do_list:
        return

    os.makedirs("layout/carved_rom.d", exist_ok=True)
    for s, e in spans:
        size = e - s
        label = f"pad_{s & 0xFFFFFF:06X}"
        sec = f".pad.{s & 0xFFFFFF:06X}"
        asm = (
            f"@ {label}: {size} bytes of pure-0xFF ROM padding at JP 0x{s:08X}..0x{e:08X}\n"
            f"@ (inter-section / end-of-ROM alignment fill; NOT authored data). Emitted as an\n"
            f"@ explicit .fill so the final-goal metric counts it as real source instead of raw\n"
            f"@ incbin. .fill <n>,1,0xFF emits exactly <n> bytes of 0xFF -- byte-identical to the\n"
            f"@ incbin it replaces. NO .align (would grow the ROM); make compare is the oracle.\n"
            f"@ GENERATED by scripts/carve_padding.py (D27).\n\n"
            f'\t.section {sec}, "a", %progbits\n'
            f"\t.global {label}\n"
            f"{label}:\n"
            f"\t.fill 0x{size:X}, 1, 0xFF\n"
        )
        open(f"asm/{label}.s", "w").write(asm)
        frag = f"layout/carved_rom.d/{label}.tsv"
        with open(frag, "w") as f:
            f.write("# carve_padding.py pure-0xFF padding as .fill (parallel-safe fragment)\n")
            f.write(f"{s & 0xFFFFFF:06X}\t{e & 0xFFFFFF:06X}\tasm/{label}.o({sec})\t"
                    f"0xFF padding ({size} B, .fill)\n")

    print(f"\nwrote {len(spans)} pad_*.s + carved_rom.d/pad_*.tsv fragments "
          f"({tot} B = {tot / 1024 / 1024:.3f} MB).")
    print("Next: make layout && make check && make compare  (revert asm/pad_*.s + "
          "layout/carved_rom.d/pad_*.tsv on any miss).")


if __name__ == "__main__":
    main()
