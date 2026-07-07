#!/usr/bin/env python3
"""Scan chapter event-list script pointers for stale shifted-ROM words.

FE chapter event groups point to several compact event-list tables (turn,
character, location, misc, tutorial, etc.). Most list entry kinds carry an
EventScr pointer in word 1 (or word 2 for command 0x0F). If those words are left
inside opaque incbins/raw asm, they assemble byte-identically in the vanilla ROM
but do not relocate in the +0x40000 shift proof.

This scanner walks the event-list tables reachable from every ChapterEventGroup
symbol (gChDAsset_* event assets), decodes entries using gEventListCmdInfoTable's
lengths, and optionally checks a shifted ROM to prove each script pointer became
base+SHIFT rather than remaining stale.
"""

import argparse
import bisect
import re
import struct
import subprocess
import sys
from pathlib import Path

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000
EVENT_GROUP_SIZE = 0x50
LIST_FIELDS = (0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C)
SCRIPT_FIELD = {
    0x01: 1, 0x02: 1, 0x03: 1, 0x04: 1,
    0x05: 1, 0x06: 1, 0x08: 1, 0x09: 1,
    0x0A: 1, 0x0B: 1, 0x0E: 1, 0x0F: 2,
}
LENGTHS = {
    0x00: 1, 0x01: 3, 0x02: 3, 0x03: 4, 0x04: 4,
    0x05: 3, 0x06: 3, 0x07: 3, 0x08: 3, 0x09: 3,
    0x0A: 3, 0x0B: 3, 0x0C: 3, 0x0D: 3, 0x0E: 3,
    0x0F: 4, 0x10: 4,
}


def read32(data, addr):
    off = addr - ROM_BASE
    if off < 0 or off + 4 > len(data):
        raise IndexError(hex(addr))
    return struct.unpack_from("<I", data, off)[0]


def load_nm(elf):
    out = subprocess.check_output(["arm-none-eabi-nm", "-n", elf], text=True)
    syms = []
    for line in out.splitlines():
        parts = line.split(maxsplit=2)
        if len(parts) < 3:
            continue
        try:
            addr = int(parts[0], 16)
        except ValueError:
            continue
        typ, name = parts[1], parts[2]
        if ROM_BASE <= addr < ROM_HI:
            syms.append((addr, typ, name))
    syms.sort()
    return syms


def sym_name(syms, addr):
    addrs = [s[0] for s in syms]
    i = bisect.bisect_right(addrs, addr) - 1
    if i < 0:
        return "?"
    base, _typ, name = syms[i]
    off = addr - base
    return name if off == 0 else f"{name}+0x{off:X}"


def event_group_symbols(syms):
    """Return symbols that are very likely ChapterEventGroup assets."""
    by_addr = {a: n for a, _t, n in syms}
    out = []
    for addr, _typ, name in syms:
        if not re.fullmatch(r"gChDAsset_\d+", name):
            continue
        # Event group assets have 0x50-byte structs and are generally described
        # by a neighbouring named *Events symbol, but keep this symbol as stable
        # output because it is what gChapterDataAssetTable references.
        out.append((addr, by_addr.get(addr, name)))
    return out


def looks_like_event_group(data, addr):
    try:
        words = [read32(data, addr + i) for i in range(0, EVENT_GROUP_SIZE, 4)]
    except IndexError:
        return False
    ptrish = 0
    for w in words:
        if w == 0 or ROM_BASE <= w < ROM_HI:
            ptrish += 1
    # Filter maps/graphics: real event groups are almost entirely pointer/NULL.
    return ptrish >= 16 and any(ROM_BASE <= words[i // 4] < ROM_HI for i in LIST_FIELDS)


def scan_list(data, syms, list_addr):
    addr = list_addr
    seen = set()
    while addr not in seen:
        seen.add(addr)
        word0 = read32(data, addr)
        cmd = word0 & 0xFFFF
        if cmd not in LENGTHS:
            break
        length = LENGTHS[cmd]
        script_idx = SCRIPT_FIELD.get(cmd)
        if script_idx is not None:
            ptr_addr = addr + script_idx * 4
            ptr = read32(data, ptr_addr)
            if ROM_BASE <= ptr < ROM_HI:
                yield (ptr_addr, cmd, ptr, sym_name(syms, ptr))
        if cmd == 0:
            break
        addr += length * 4


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default="fireemblem8.elf")
    ap.add_argument("--rom", default="fireemblem8.gba")
    ap.add_argument("--shifted-rom")
    ap.add_argument("--shift", default="0x40000")
    args = ap.parse_args()

    shift = int(args.shift, 0)
    rom = Path(args.rom).read_bytes()
    shifted = Path(args.shifted_rom).read_bytes() if args.shifted_rom else None
    syms = load_nm(args.elf)

    hits = []
    groups = 0
    lists = set()
    for group_addr, group_name in event_group_symbols(syms):
        if not looks_like_event_group(rom, group_addr):
            continue
        groups += 1
        for field in LIST_FIELDS:
            list_addr = read32(rom, group_addr + field)
            if not (ROM_BASE <= list_addr < ROM_HI):
                continue
            lists.add(list_addr)
            for ptr_addr, cmd, ptr, target in scan_list(rom, syms, list_addr):
                state = "unchecked"
                got = None
                if shifted is not None:
                    got = read32(shifted, ptr_addr + shift)
                    state = "ok" if got == ptr + shift else "STALE"
                hits.append((state, group_name, field, list_addr, ptr_addr, cmd, ptr, target, got))

    stale = [h for h in hits if h[0] == "STALE"]
    for h in hits:
        state, group, field, list_addr, ptr_addr, cmd, ptr, target, got = h
        if state != "STALE":
            continue
        print(f"{state}: {group}+0x{field:02X} list=0x{list_addr:08X} "
              f"entry=0x{ptr_addr:08X} cmd=0x{cmd:02X} "
              f"ptr=0x{ptr:08X}->{target} shifted_word=0x{got:08X}")
    print(f"RESULT: groups={groups} lists={len(lists)} script_ptrs={len(hits)} stale={len(stale)}")
    return 1 if stale else 0


if __name__ == "__main__":
    sys.exit(main())
