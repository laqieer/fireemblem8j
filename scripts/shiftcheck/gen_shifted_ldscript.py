#!/usr/bin/env python3
"""Layer 2 helper: emit a SHIFTED copy of ldscript.txt.

Inserts `. += <S>;` immediately after the first text object so every section laid
out after it (all remaining .text, all .rodata, all natural .data) moves forward
by S. A correctly-written (symbol-referenced) pointer is relocated by the linker to
track the move; a hardcoded address literal does not -- which is exactly what
diff_shift.py detects.

  fe8u anchor: `src/crt0.o(.text);`, with slack before the first absolute pin
               (`. = 0xC00000;` ...).
  fe8j anchor: `src/rom_header.o(.text);` (fe8j has no crt0). BUT NOTE: fe8j's
               generated ldscript packs the entire 16 MB ROM contiguously with
               NO slack and uses a tail of absolute NOLOAD overlay sections at
               fixed addresses, so a uniform shift would overflow the cart and
               desync those overlays. Layer 2 is therefore NOT APPLICABLE to fe8j
               as-is and is a non-gating target -- this helper still validates the
               anchor + slack and exits with a clear error rather than emitting a
               broken ldscript. See scripts/shiftcheck/README.md and D313.

NEVER overwrites ldscript.txt: writes to a separate --out path. Validates that S
keeps the shifted data below the first pin (else the link would overlap a pinned
block / ld would refuse to move `.` backwards).
"""

import argparse
import re
import sys

ROM_BASE = 0x08000000
# fe8j has no absolute-pinned-block-with-slack: the ROM is packed to the full 16 MB.
# PIN = ROM end so natural_data_end()/the slack check reflect "no slack" honestly.
PIN = 0x09000000
# fe8j's first text object is rom_header (no crt0). Overridable via --anchor.
CRT0_LINE = "src/rom_header.o(.text);"


def natural_data_end(map_path):
    rx = re.compile(r"^\s+\.(\w[\w.]*)\s+(0x[0-9a-fA-F]+)\s+(0x[0-9a-fA-F]+)\s+(\S+\.o)\b")
    end = ROM_BASE
    for ln in open(map_path, errors="replace"):
        m = rx.match(ln)
        if not m:
            continue
        a = int(m.group(2), 16)
        s = int(m.group(3), 16)
        if s and ROM_BASE <= a < PIN:
            end = max(end, a + s)
    return end


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--ldscript", default="ldscript.txt")
    ap.add_argument("--map", default="fireemblem8.map")
    ap.add_argument("--shift", required=True, help="shift amount, e.g. 0x40000")
    ap.add_argument("--out", required=True)
    ap.add_argument("--align", type=lambda x: int(x, 0), default=0x1000,
                    help="S must be a multiple of this so alignments are preserved")
    ap.add_argument("--anchor", default=CRT0_LINE,
                    help="ldscript line after which to inject the shift padding "
                         "(fe8j default: the first text object src/rom_header.o(.text))")
    args = ap.parse_args()
    anchor = args.anchor

    s = int(args.shift, 0)
    if s <= 0:
        sys.exit("shift must be positive")
    if s % args.align:
        sys.exit(f"shift {s:#x} must be a multiple of {args.align:#x} to keep "
                 f"section alignments identical (uniform shift)")

    end = natural_data_end(args.map)
    slack = PIN - end
    if s > slack:
        sys.exit(f"shift {s:#x} exceeds slack {slack:#x} (natural data ends at "
                 f"{end:#010x}, ROM/pin ceiling at {PIN:#010x}); would overflow the "
                 f"cart. NOTE: on fe8j the ROM is packed to the full 16 MB with no "
                 f"slack, so Layer-2 differential shift is not applicable (non-gating; "
                 f"see scripts/shiftcheck/README.md and D313).")

    lines = open(args.ldscript, encoding="utf-8").read().splitlines(keepends=True)
    out = []
    injected = False
    for line in lines:
        out.append(line)
        if not injected and anchor in line:
            indent = line[: len(line) - len(line.lstrip())]
            out.append(f"{indent}. += {s:#x}; /* shiftcheck: injected padding "
                       f"(NOT the matching build) */\n")
            injected = True
    if not injected:
        sys.exit(f"could not find injection anchor '{anchor}' in {args.ldscript}")

    with open(args.out, "w", encoding="utf-8") as fh:
        fh.writelines(out)
    print(f"wrote {args.out}: shift {s:#x} after anchor '{anchor.strip()}' "
          f"(data {end:#010x}->{end + s:#010x}, slack {slack:#x})")
    return 0


if __name__ == "__main__":
    sys.exit(main())
