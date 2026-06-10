#!/usr/bin/env python3
"""Build self-containment metric -- the #1 honest, ungameable number.

A "complete" decompilation reproduces the ROM byte-for-byte from COMMITTED SOURCE
alone: matching C, descriptive/data assembly, and extracted source assets. The
original ROM, baserom.gba, is ONLY the verification target of `make compare`
(a post-build sha1sum) -- it is NEVER a build input. Delete baserom.gba and the
build must still emit the byte-identical ROM. fireemblem8u and pokeemerald pass
this; FE8J does not yet.

This script measures exactly how far FE8J is from that bar by the ONLY number
that cannot be gamed by relabeling: how many ROM bytes still come straight out of
baserom.gba via `.incbin "baserom.gba"`. It scans every `.s`/`.c`/`.inc` under
asm/ and src/, finds each `.incbin "baserom.gba", <off>, <size>` directive, and
sums the sizes. Those bytes are baserom-DEPENDENT: they vanish from the build the
moment baserom.gba is removed. Everything else (16,777,216 - that sum) is the
part of the ROM the build can already produce from source -- the
self-containment %.

Unlike "asm/baserom.s has zero incbins" (cosmetic, already gamed by relocating
the incbins into 2,319 other committed .s files), this number does not care WHICH
file the incbin lives in -- only that the byte still resolves against baserom.gba.

Exit status is 0 (informational); the number is the message.
"""
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ROM_SIZE = 16777216  # 16 MiB -- the FE8 ROM is exactly this many bytes.

# `.incbin "baserom.gba", 0xOFF, 0xSIZE` -- capture the SIZE (3rd arg). Offsets and
# sizes in this repo are always hex; tolerate decimal too for robustness.
INCBIN_RE = re.compile(
    r'\.incbin\s+"baserom\.gba"\s*,\s*'
    r'(?:0x[0-9A-Fa-f]+|\d+)\s*,\s*'
    r'(0x[0-9A-Fa-f]+|\d+)'
)

SCAN_DIRS = ("asm", "src")
SCAN_EXTS = (".s", ".c", ".inc")


def parse_int(tok):
    return int(tok, 16) if tok.lower().startswith("0x") else int(tok)


def scan():
    total_bytes = 0
    directives = 0
    files = set()
    for d in SCAN_DIRS:
        base = os.path.join(ROOT, d)
        if not os.path.isdir(base):
            continue
        for dirpath, _dirnames, filenames in os.walk(base):
            for fn in filenames:
                if not fn.endswith(SCAN_EXTS):
                    continue
                path = os.path.join(dirpath, fn)
                try:
                    with open(path, "r", errors="replace") as f:
                        text = f.read()
                except OSError:
                    continue
                for m in INCBIN_RE.finditer(text):
                    total_bytes += parse_int(m.group(1))
                    directives += 1
                    files.add(os.path.relpath(path, ROOT))
    return total_bytes, directives, len(files)


def main():
    dep_bytes, directives, nfiles = scan()
    self_bytes = ROM_SIZE - dep_bytes
    dep_pct = 100.0 * dep_bytes / ROM_SIZE
    self_pct = 100.0 * self_bytes / ROM_SIZE

    print(f"baserom-dependent: {dep_bytes} / {ROM_SIZE} ({dep_pct:.2f}%)")
    print(f"  via {directives} `.incbin \"baserom.gba\"` directives across {nfiles} files")
    print(f"BUILD SELF-CONTAINMENT: {self_pct:.2f}%")
    print(f"  ({self_bytes} / {ROM_SIZE} bytes producible from committed source)")
    print()
    if dep_bytes > 0:
        print(f"self-contained build: NOT YET ({dep_bytes} bytes still need baserom.gba)")
        print("  acceptance test: `mv baserom.gba /tmp && make` MUST FAIL today (honest).")
    else:
        print("self-contained build: YES (0 baserom.gba incbins -- ROM builds from source alone)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
