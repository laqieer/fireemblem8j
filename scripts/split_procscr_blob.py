#!/usr/bin/env python3
"""split_procscr_blob.py -- #148 blob splitter (reusable, byte-neutral).

Companion to depoint_procscr.py. Given a `.c` file with an inline `__asm__`
`.section .data.<name>.gapN` blob of `.4byte`/`.short` words, and a list of
address HOLES (the byte ranges of proc-script tables being carved out into typed
`struct ProcCmd[]` ref sections), this rewrites the single blob `__asm__` block
into one `__asm__` block per surviving slice (head / mid / tail) and DELETES the
hole lines. The surviving `.4byte` lines are emitted VERBATIM, so the transform is
byte-neutral: the only new tokens are `.section`/`.global`/label directives, which
emit no bytes. Each slice is placed at its exact address by a carved_rom layout row
(printed at the end for you to paste). No `.align` is added (every slice/hole start
is 4-aligned and the data is 4-byte, so the layout placement needs no padding).

The FIRST surviving slice reuses the blob's ORIGINAL section+label (so any existing
`base + 0xNN` references that fall within the head still resolve); later slices get
`gapNb`, `gapNc`, ... with a fresh `frontier_..._NNx_<HEXADDR>` label.

Usage:
    scripts/split_procscr_blob.py <file.c> <0xBLOBBASE> <0xHOLE1S:0xHOLE1E> [...] \
        [--apply]   # without --apply: dry-run prints the new .c region + layout rows

The default is a dry run (prints to stdout). --apply rewrites <file.c> in place.
"""
import argparse
import re
import sys

SIZES = {"4byte": 4, "short": 2, "byte": 1}
ITEM_RE = re.compile(r'"\s*(?:\\t)?\.(4byte|short|byte|incbin)\s+(.*?)\\n"')
SEC_RE = re.compile(r'\.section\s+([.\w]+)')
GLOBAL_RE = re.compile(r'\.global\s+(\S+?)\\n')


def find_blob(lines, base):
    """Locate the __asm__ block whose label base == `base`.

    Returns (asm_open_idx, asm_close_idx, sec_line_idx, glob_line_idx,
    label_line_idx, first_item_idx, section_name, label_name).
    """
    for i, line in enumerate(lines):
        m = GLOBAL_RE.search(line)
        if not m:
            continue
        label = m.group(1)
        hexm = re.search(r'_([0-9A-Fa-f]+)$', label)
        if not hexm:
            continue
        try:
            v = int(hexm.group(1), 16)
        except ValueError:
            continue
        # labels encode the address either as a ROM offset (e.g. _5B9454) or a
        # full 0x08xxxxxx address (e.g. data_085B9BBC); normalise both.
        lbase = v if v >= 0x08000000 else 0x08000000 + v
        if lbase != base:
            continue
        # found the .global for this blob; scan out to the __asm__( and );
        glob_idx = i
        sec_idx = None
        for j in range(i, max(-1, i - 6), -1):
            if SEC_RE.search(lines[j]):
                sec_idx = j
                break
        asm_open = None
        for j in range(sec_idx if sec_idx is not None else i, -1, -1):
            if lines[j].strip().startswith("__asm__"):
                asm_open = j
                break
        # label line = first line after glob that ends with ':\n"
        label_idx = None
        for j in range(glob_idx + 1, glob_idx + 4):
            if re.search(r':\\n"', lines[j]):
                label_idx = j
                break
        first_item = label_idx + 1 if label_idx is not None else glob_idx + 1
        asm_close = None
        for j in range(first_item, len(lines)):
            if lines[j].strip() == ");":
                asm_close = j
                break
        secn = SEC_RE.search(lines[sec_idx]).group(1)
        return (asm_open, asm_close, sec_idx, glob_idx, label_idx, first_item,
                secn, label)
    return None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("cfile")
    ap.add_argument("base")
    ap.add_argument("holes", nargs="+", help="0xSTART:0xEND (carved table ranges)")
    ap.add_argument("--apply", action="store_true")
    ap.add_argument("--start-suffix", type=int, default=0,
                    help="offset into the a/b/c... suffix list for slice 0; use "
                         ">0 when this block is a SECONDARY block of a section "
                         "already using the base name (keeps names unique). The "
                         "block's own .global label is always preserved on slice 0.")
    args = ap.parse_args()
    base = int(args.base, 16)
    holes = []
    for h in args.holes:
        s, e = h.split(":")
        holes.append((int(s, 16), int(e, 16)))
    holes.sort()

    lines = open(args.cfile).read().split("\n")
    info = find_blob(lines, base)
    if not info:
        sys.exit("blob base 0x%X not found in %s" % (base, args.cfile))
    (asm_open, asm_close, sec_idx, glob_idx, label_idx, first_item,
     secn, label) = info

    # assign an address to each item line in [first_item, asm_close)
    items = []  # (addr, line_idx, size, raw_line)
    a = base
    for j in range(first_item, asm_close):
        m = ITEM_RE.search(lines[j])
        if not m:
            # tolerate stray blank/comment lines inside the block
            if lines[j].strip() in ("", ");"):
                continue
            sys.exit("unparsed item at line %d: %s" % (j + 1, lines[j]))
        kind = m.group(1)
        if kind == "incbin":
            sys.exit("blob contains .incbin at line %d; not supported" % (j + 1))
        sz = SIZES[kind]
        items.append((a, j, sz, lines[j]))
        a += sz
    blob_end = a

    # gap-suffix base, e.g. ".data.frontier_df4_uistuff.gap22" -> "gap22"
    gapname = secn.rsplit(".", 1)[-1]
    labelpfx = re.sub(r'_[0-9A-Fa-f]+$', '', label)  # frontier_df4_uistuff_022

    # compute surviving slices = [base,blob_end) minus holes
    slices = []
    cur = base
    for hs, he in holes:
        if hs > cur:
            slices.append((cur, hs))
        cur = max(cur, he)
    if cur < blob_end:
        slices.append((cur, blob_end))

    # emit new __asm__ blocks (one per slice) + collect layout rows
    suffixes = ["", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l"]
    out = []
    layout_rows = []
    for si, (ss, se) in enumerate(slices):
        sfx = suffixes[si + args.start_suffix]
        this_sec = secn if sfx == "" else "%s%s" % (secn, sfx)
        this_lbl = label if si == 0 else "%s%s_%X" % (labelpfx, sfx, ss - 0x08000000)
        out.append("__asm__(")
        out.append('    ".section %s, \\"aw\\", %%progbits\\n"' % this_sec)
        out.append('    ".global %s\\n"' % this_lbl)
        out.append('    "%s:\\n"' % this_lbl)
        for (ia, ij, isz, raw) in items:
            if ss <= ia < se:
                out.append(raw)
        out.append(");")
        layout_rows.append((ss, se, "%s(%s)" %
                            ("src/data/frontier_df4_uistuff/frontier_df4_uistuff.o",
                             this_sec), "df4_uistuff slice %s" % this_sec.rsplit(".", 1)[-1]))

    print("/* ==== new .c region (replaces lines %d..%d) ==== */"
          % (asm_open + 1, asm_close + 1))
    print("\n".join(out))
    print("/* ==== layout rows (slices only; add carved-table rows separately) ==== */")
    for ss, se, sec, desc in layout_rows:
        print("%X\t%X\t%s\t%s" % (ss - 0x08000000, se - 0x08000000, sec, desc))
    print("/* blob [0x%X,0x%X)  %d items  %d holes  %d slices */"
          % (base, blob_end, len(items), len(holes), len(slices)))

    if args.apply:
        if sec_idx > asm_open + 1:
            # base's .section is NOT the first in this __asm__ block: a preceding
            # section (e.g. an earlier gapN sharing the same __asm__(...)) lives in
            # lines[asm_open..sec_idx-1]. Preserve it verbatim and close its block
            # with `);` before our new slice blocks (byte-neutral: section/label
            # directives emit no bytes). Only the base section onward is rewritten.
            newlines = lines[:sec_idx] + [");"] + out + lines[asm_close + 1:]
            rewrote_from = sec_idx
        else:
            newlines = lines[:asm_open] + out + lines[asm_close + 1:]
            rewrote_from = asm_open
        open(args.cfile, "w").write("\n".join(newlines))
        sys.stderr.write("APPLIED: rewrote %s lines %d..%d\n"
                         % (args.cfile, rewrote_from + 1, asm_close + 1))


if __name__ == "__main__":
    main()
