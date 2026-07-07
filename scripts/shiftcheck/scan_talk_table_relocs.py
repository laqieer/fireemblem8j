#!/usr/bin/env python3
"""Reject false ROM relocations inside packed battle/defeat talk metadata.

`BattleTalkExtEnt` and `DefeatTalkEnt` pack u16 fields into 32-bit words. Some
perfectly ordinary metadata words look like GBA ROM addresses, for example
DefeatTalkEnt { flag=0x0002, msg=0x08D7 } is the little-endian word
0x08D70002. If such a word is "symbolized" as a pointer, the shifted ROM relink
incorrectly adds +0x40000 to the message id (0x08D7 -> 0x08DB), producing the
wrong quote/text. Only the event pointer field in these tables may relocate.
"""

import argparse
import re
import subprocess
import sys

ROM_BASE = 0x08000000


def load_symbols(elf):
    out = subprocess.check_output(["arm-none-eabi-nm", "-n", elf], text=True)
    syms = {}
    for line in out.splitlines():
        p = line.split(maxsplit=2)
        if len(p) == 3:
            try:
                syms[p[2]] = int(p[0], 16)
            except ValueError:
                pass
    return syms


def load_relocs(elf):
    out = subprocess.check_output(["arm-none-eabi-objdump", "-r", elf], text=True)
    relocs = []
    for line in out.splitlines():
        m = re.match(r"\s*([0-9A-Fa-f]{8})\s+R_ARM_ABS32\s+(.+)$", line)
        if not m:
            continue
        loc = int(m.group(1), 16)
        if loc < ROM_BASE:
            loc += ROM_BASE
        relocs.append((loc, m.group(2).strip()))
    return relocs


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default="fireemblem8_relocs.elf")
    ap.add_argument("--ref-elf", default="fireemblem8.elf")
    args = ap.parse_args()

    syms = load_symbols(args.ref_elf)
    required = ["gBattleTalkList", "gDefeatTalkList", "gSupportTalkList"]
    missing = [s for s in required if s not in syms]
    if missing:
        sys.stderr.write("missing symbols: %s\n" % ", ".join(missing))
        return 2

    ranges = [
        # (name, start, end, entry_size, only allowed relocation offset)
        ("gBattleTalkList", syms["gBattleTalkList"], syms["gDefeatTalkList"], 16, 12),
        ("gDefeatTalkList", syms["gDefeatTalkList"], syms["gSupportTalkList"], 12, 8),
    ]

    bad = []
    for loc, target in load_relocs(args.elf):
        for name, start, end, entsz, allowed in ranges:
            if start <= loc < end:
                rel = loc - start
                if rel % entsz != allowed:
                    bad.append((name, loc, rel // entsz, rel % entsz, target))
                break

    for name, loc, ent, off, target in bad:
        print(f"BAD {name}[{ent}]+0x{off:X} loc=0x{loc:08X} reloc={target}")
    print(f"RESULT: talk-table non-event-field relocations={len(bad)}")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
