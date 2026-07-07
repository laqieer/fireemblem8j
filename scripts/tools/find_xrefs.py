#!/usr/bin/env python3
"""Find xrefs (callers / pointer references) to a function address in the FE8J ROM.

Scans fireemblem8.gba for:
  * Thumb BL/BLX instruction pairs whose computed target == the queried address
    (direct calls), and
  * 4-byte little-endian words equal to addr (ARM/data pointer) or addr|1 (Thumb
    function pointer, e.g. ProcScr / event-handler / jump tables) — data references.

Each hit's ROM offset is mapped to VMA (0x08000000+offset) and to the nearest
preceding symbol from a sorted `nm -n` table, so you can tell WHICH function or
data object references the target.

Usage:
  scripts/tools/find_xrefs.py <hexaddr> [<hexaddr> ...]
    [--rom fireemblem8.gba] [--syms /tmp/sym_sorted.txt]

The symbol table is produced with:
  arm-none-eabi-nm -n fireemblem8.elf | grep -E '^[0-9a-f]{8} [tTwWdDbBrR] ' > syms.txt
(only T/t entries are needed for call-site attribution, but data syms help attribute
pointer tables.)
"""
import sys
import bisect

ROM_BASE = 0x08000000


def load_syms(path):
    addrs = []
    names = []
    kinds = []
    with open(path) as f:
        for line in f:
            parts = line.split()
            if len(parts) < 3:
                continue
            try:
                a = int(parts[0], 16)
            except ValueError:
                continue
            addrs.append(a)
            kinds.append(parts[1])
            names.append(parts[2])
    order = sorted(range(len(addrs)), key=lambda i: addrs[i])
    return ([addrs[i] for i in order],
            [names[i] for i in order],
            [kinds[i] for i in order])


def sym_for(vma, saddrs, snames):
    i = bisect.bisect_right(saddrs, vma) - 1
    if i < 0:
        return "(below first sym)", 0
    return snames[i], vma - saddrs[i]


def sign_extend(val, bits):
    if val & (1 << (bits - 1)):
        return val - (1 << bits)
    return val


def find_bl_callers(rom, target):
    """Scan for Thumb BL/BLX pairs whose target == `target`."""
    hits = []
    n = len(rom)
    for i in range(0, n - 3, 2):
        hw1 = rom[i] | (rom[i + 1] << 8)
        if (hw1 & 0xF800) != 0xF000:  # first half of BL/BLX: 11110xxxxxxxxxxx
            continue
        hw2 = rom[i + 2] | (rom[i + 3] << 8)
        top2 = hw2 & 0xF800
        if top2 == 0xF800:
            blx = False           # BL (target Thumb)
        elif top2 == 0xE800:
            blx = True            # BLX (target ARM, low bit cleared)
        else:
            continue
        off = sign_extend(((hw1 & 0x7FF) << 12) | ((hw2 & 0x7FF) << 1), 23)
        pc = ROM_BASE + i + 4
        callee = pc + off
        if blx:
            callee &= ~3
        if callee == target:
            hits.append(i)
    return hits


def find_arm_bl_callers(rom, target):
    """Scan for ARM `bl`/`blx` (cond 1011 imm24) whose target == `target`.

    FE8 is almost entirely Thumb, but a few ARM stubs exist; this rules out
    ARM callers for a 'no caller' verdict.
    """
    hits = []
    n = len(rom)
    for i in range(0, n - 3, 4):
        w = rom[i] | (rom[i + 1] << 8) | (rom[i + 2] << 16) | (rom[i + 3] << 24)
        cond = (w >> 28) & 0xF
        op = (w >> 24) & 0xF
        # ARM BL: cond != 0xF, op == 0xB (1011).  ARM BLX(imm): cond == 0xF, op in {0xA,0xB}
        is_bl = (cond != 0xF and op == 0xB)
        is_blx = (cond == 0xF and (op & 0xE) == 0xA)
        if not (is_bl or is_blx):
            continue
        imm24 = w & 0xFFFFFF
        off = sign_extend(imm24, 24) << 2
        if is_blx:
            off |= ((w >> 24) & 1) << 1
        pc = ROM_BASE + i + 8
        callee = pc + off
        if is_bl:
            callee_thumb = callee | 1
        else:
            callee_thumb = callee | 1
        if callee == target or callee == (target & ~1) or callee_thumb == (target | 1):
            hits.append(i)
    return hits


def find_word_refs(rom, value):
    """Scan for 4-byte LE words == value (data / pointer references)."""
    hits = []
    n = len(rom)
    b0 = value & 0xFF
    b1 = (value >> 8) & 0xFF
    b2 = (value >> 16) & 0xFF
    b3 = (value >> 24) & 0xFF
    start = 0
    target = bytes((b0, b1, b2, b3))
    while True:
        j = rom.find(target, start)
        if j < 0:
            break
        if j % 4 == 0:            # word-aligned pointers only (drop noise)
            hits.append(j)
        start = j + 1
    return hits


def main():
    args = sys.argv[1:]
    rom_path = "fireemblem8.gba"
    sym_path = "/tmp/sym_sorted.txt"
    targets = []
    i = 0
    while i < len(args):
        a = args[i]
        if a == "--rom":
            rom_path = args[i + 1]; i += 2; continue
        if a == "--syms":
            sym_path = args[i + 1]; i += 2; continue
        targets.append(int(a, 16)); i += 1

    with open(rom_path, "rb") as f:
        rom = f.read()
    saddrs, snames, skinds = load_syms(sym_path)

    for t in targets:
        tname, _ = sym_for(t, saddrs, snames)
        print("=" * 70)
        print(f"TARGET 0x{t:08X}  {tname}")
        print("-" * 70)
        bl = find_bl_callers(rom, t)
        print(f"[BL/BLX direct calls] {len(bl)} site(s):")
        seen = {}
        for off in bl:
            vma = ROM_BASE + off
            name, delta = sym_for(vma, saddrs, snames)
            seen.setdefault(name, []).append(vma)
        for name in sorted(seen, key=lambda k: seen[k][0]):
            sites = seen[name]
            print(f"    {name:40s} x{len(sites)}  @ " +
                  ", ".join(f"0x{v:08X}" for v in sites[:6]) +
                  (" ..." if len(sites) > 6 else ""))
        arm = find_arm_bl_callers(rom, t)
        if arm:
            print(f"[ARM bl/blx direct calls] {len(arm)} site(s):")
            seen = {}
            for off in arm:
                vma = ROM_BASE + off
                name, delta = sym_for(vma, saddrs, snames)
                seen.setdefault(name, []).append(vma)
            for name in sorted(seen, key=lambda k: seen[k][0]):
                sites = seen[name]
                print(f"    {name:40s} x{len(sites)}  @ " +
                      ", ".join(f"0x{v:08X}" for v in sites[:6]) +
                      (" ..." if len(sites) > 6 else ""))
        for val, label in ((t | 1, "Thumb ptr addr|1"), (t, "raw addr")):
            refs = find_word_refs(rom, val)
            print(f"[data word == 0x{val:08X} ({label})] {len(refs)} ref(s):")
            seen = {}
            for off in refs:
                vma = ROM_BASE + off
                name, delta = sym_for(vma, saddrs, snames)
                seen.setdefault(name, []).append((vma, delta))
            for name in sorted(seen, key=lambda k: seen[k][0][0]):
                sites = seen[name]
                shown = ", ".join(f"0x{v:08X}(+0x{d:X})" for v, d in sites[:6])
                print(f"    {name:40s} x{len(sites)}  @ {shown}" +
                      (" ..." if len(sites) > 6 else ""))
        print()


if __name__ == "__main__":
    main()
