#!/usr/bin/env python3
"""Audit pointer classification for shiftability (#143), BOTH directions.

Both failure modes break the +0x40000 shifted ROM:
  * FALSE NEGATIVE — a real pointer left as a raw `.4byte 0x08XXXXXX` literal in an
    opaque blob: carries no relocation, stays stale under the shift -> wrong target.
  * FALSE POSITIVE — a NON-pointer value (packed metadata, e.g. msg-id<<16|flag like
    0x08D70002) symbolized as `Sym + off`: the link wrongly adds +0x40000 -> data
    corruption (the prologue defeat-quote bug, commit 2cce0d83b).

This flags SUSPECTS using method (2): "does the value point to a meaningful object?"
The symbol table (start addresses of every linked object) is the boundary oracle:
  * raw literal whose value == a symbol START  -> likely a REAL pointer (false negative)
  * symbolized value whose target lands in a GAP (no owning object) or reconstructs a
    packed-field pattern -> likely a NON-pointer (false positive)
Confirm each SUSPECT with method (1) source/struct and method (3) fe8u before changing
anything. This script only REPORTS; it never edits. Byte-identical fixes are manual/gated.

Usage:
  scripts/shiftcheck/audit_pointer_classification.py [--elf fireemblem8.elf]
"""
import argparse
import bisect
import os
import re
import subprocess
import sys

ROM_LO = 0x08000000
ROM_HI = 0x0A000000
REPO = subprocess.check_output(["git", "rev-parse", "--show-toplevel"], text=True).strip()

# Message-id range typically packed into the high half of talk/quote metadata words.
MSG_HI_LO, MSG_HI_HI = 0x0800, 0x0FFF   # high16 in this range => could be a packed msg id
FLAG_LO_MAX = 0x1000                     # low16 below this => flag-like (not a pointer low half)


def load_symbols(elf):
    """Return (sorted_addrs, addr->name, set_of_starts, name->addr)."""
    out = subprocess.check_output(["arm-none-eabi-nm", "-n", elf], text=True, errors="replace")
    addr2name, name2addr, starts = {}, {}, set()
    addrs = []
    for line in out.splitlines():
        m = re.match(r"^([0-9A-Fa-f]{8})\s+[a-zA-Z]\s+(\S+)", line)
        if not m:
            continue
        a = int(m.group(1), 16)
        n = m.group(2)
        if ROM_LO <= a < ROM_HI:
            addr2name.setdefault(a, n)
            name2addr.setdefault(n, a)
            starts.add(a)
            addrs.append(a)
    # `nm` prints cleared Thumb-function addresses for many symbols, but ABS32
    # relocations use the ELF symbol value (LSB set for Thumb functions). Use
    # readelf to recover those expression values so `Sym+off` is evaluated the
    # same way the linker/assembler emits it.
    try:
        rout = subprocess.check_output(["arm-none-eabi-readelf", "-s", elf],
                                       text=True, errors="replace")
        for line in rout.splitlines():
            m = re.match(r"^\s*\d+:\s+([0-9A-Fa-f]{8})\s+\d+\s+FUNC\s+\S+\s+\S+\s+\S+\s+(\S+)$", line)
            if not m:
                continue
            raw = int(m.group(1), 16)
            n = m.group(2)
            if ROM_LO <= raw < ROM_HI:
                name2addr[n] = raw
                addr2name.setdefault(raw, n)
                starts.add(raw)
                addrs.append(raw)
    except (OSError, subprocess.CalledProcessError):
        pass
    addrs = sorted(set(addrs))
    return addrs, addr2name, starts, name2addr


def owning(addrs, addr2name, a):
    """Return (owner_start, owner_name, offset_into_owner) for address a, or None if a
    sits below the first symbol / above the last (a 'gap')."""
    i = bisect.bisect_right(addrs, a) - 1
    if i < 0:
        return None
    start = addrs[i]
    return start, addr2name[start], a - start


def iter_4byte_values():
    """Yield (path, lineno, kind, raw_text, sym, off, is_raw) for every .4byte we can
    read from src/data (both .s and the __asm__ strings inside .c)."""
    files = subprocess.check_output(
        ["git", "-C", REPO, "ls-files", "src/data"], text=True).splitlines()
    sym_off = re.compile(r"\.4byte\s+([A-Za-z_][A-Za-z0-9_]*)\s*(?:\+\s*(0x[0-9A-Fa-f]+|\d+))?")
    raw = re.compile(r"\.4byte\s+(0x0[89][0-9A-Fa-f]{6})\b")
    for rel in files:
        if not (rel.endswith(".s") or rel.endswith(".c")):
            continue
        p = os.path.join(REPO, rel)
        try:
            with open(p, errors="replace") as f:
                for ln, line in enumerate(f, 1):
                    text = line
                    if rel.endswith(".c"):
                        # unwrap a C string literal that carries an asm line
                        if ".4byte" not in text:
                            continue
                        text = text.replace('\\t', ' ').replace('\\n', ' ').replace('"', ' ')
                    mr = raw.search(text)
                    if mr:
                        yield rel, ln, "raw", mr.group(1), None, int(mr.group(1), 16), True
                        continue
                    ms = sym_off.search(text)
                    if ms and not text.lstrip().startswith("@"):
                        sym = ms.group(1)
                        off = int(ms.group(2), 0) if ms.group(2) else 0
                        yield rel, ln, "sym", ms.group(0), sym, off, False
        except (IsADirectoryError, PermissionError):
            continue


def looks_packed(value):
    hi, lo = (value >> 16) & 0xFFFF, value & 0xFFFF
    return MSG_HI_LO <= hi <= MSG_HI_HI and lo < FLAG_LO_MAX


def looks_packed_pair(value):
    """Strong OAM/frame-data tell: two adjacent u16 fields packed into one word."""
    hi, lo = (value >> 16) & 0xFFFF, value & 0xFFFF
    return (hi == lo + 1 and (hi & 0xFF00) == (lo & 0xFF00)
            and (hi >> 8) in {0x04, 0x08, 0x0C})


# Resource-type inference from a symbol name prefix — used for the cross-type signal
# (a talk entry pointing into "banim_drum" graphics is the false-positive tell).
TYPE_RULES = [
    ("event", re.compile(r"eventscr|EventListScr|EventScr|MapChanges|_event")),
    ("anim", re.compile(r"AnimSprite|banim|_anim|EfxDrv|frontier_.*banim")),
    ("sound", re.compile(r"DirectSoundData|voicegroup|song|_m4a|SoundRoom")),
    ("font", re.compile(r"fontgrp|font|glyph|sjis")),
    ("msg", re.compile(r"gMsgTable|MsgString|CompressedText|_MSG_")),
    ("unit", re.compile(r"UnitDef|_unitdef|gUnit")),
    ("gfx", re.compile(r"sheet|_gfx|_img|_pal|_tsa|_chr|TileConfig|ObjectType|Opinfo")),
]


def restype(name):
    for t, rx in TYPE_RULES:
        if rx.search(name):
            return t
    return "?"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--elf", default=os.path.join(REPO, "fireemblem8.elf"))
    ap.add_argument("--limit", type=int, default=60)
    ap.add_argument("--fail-on-suspects", action="store_true",
                    help="exit nonzero when any suspect remains")
    args = ap.parse_args()
    if not os.path.exists(args.elf):
        print(f"need {args.elf} (run `make` first)", file=sys.stderr)
        return 2

    addrs, addr2name, starts, name2addr = load_symbols(args.elf)

    # First pass: collect every reference so we can consistency-check each ROM address.
    refs = list(iter_4byte_values())
    unitdef_files = set()
    for rel, *_ in refs:
        if rel in unitdef_files:
            continue
        try:
            with open(os.path.join(REPO, rel), errors="replace") as f:
                if re.search(r"^UnitDef_", f.read(), re.M):
                    unitdef_files.add(rel)
        except OSError:
            pass
    raw_targets = {}     # addr -> [(rel,ln)]
    sym_targets = {}     # addr -> [(rel,ln,sym,off)]
    for rel, ln, kind, txt, sym, off, is_raw in refs:
        if is_raw:
            raw_targets.setdefault(off, []).append((rel, ln))
        else:
            base = name2addr.get(sym)
            if base is not None:
                sym_targets.setdefault(base + off, []).append((rel, ln, sym, off))

    fn_suspects, fp_suspects, inconsistent = [], [], []

    # CONSISTENCY: an address referenced BOTH as a raw literal AND as a symbol is a
    # strong tell — the raw one is a missed pointer (false negative) OR the symbolized
    # one is a false positive. Either way it must be reconciled.
    for a in sorted(set(raw_targets) & set(sym_targets)):
        if a in starts or (a & 1) == 0:   # even/aligned or a known object start
            rawloc = raw_targets[a][0]
            symloc = sym_targets[a][0]
            # A UnitDefinition's first packed word can coincidentally equal a real
            # Thumb callback pointer in an unrelated proc table. That is legal
            # mixed use, not an inconsistent classification of the same datum.
            if rawloc[0] in unitdef_files and not re.search(r"^(REDA|UnitDef_)", symloc[2]):
                continue
            inconsistent.append((f"0x{a:08X}", rawloc, symloc, addr2name.get(a, "?")))

    for rel, ln, kind, txt, sym, off, is_raw in refs:
        if is_raw:
            a = off
            if a in starts:
                own = owning(addrs, addr2name, a)
                fn_suspects.append((rel, ln, f"0x{a:08X}", f"== START {own[1]}", "HIGH"))
        else:
            base = name2addr.get(sym)
            if base is None:
                continue
            a = base + off
            own = owning(addrs, addr2name, a)
            # NOISE FILTER 1 — FORCESPRITE/anim embedded pointers: an anim instruction word
            # ORs opcode bits (>= 0x10000000) onto a real ROM pointer, so `Sym + 0x7000....`
            # computes an out-of-ROM value that still relocates the low pointer bits
            # correctly under the shift (see commit 7dd9a675d). NOT a false positive.
            if off >= 0x10000000 or a >= ROM_HI:
                continue
            in_gap = own is None or (a - own[0]) > 0x40000
            # CROSS-TYPE: containing file's resource type vs the pointer target's type.
            ftype = restype(rel)
            ttype = restype(sym)
            # NOISE FILTER 2 — chapter/event data legitimately references UnitDef tables.
            compatible = {ftype, ttype} <= {"event", "unit"}
            # Exact resource starts are strong real-pointer evidence (e.g. portrait/bg
            # palette tables); do not flag them solely because the numeric value also
            # resembles packed metadata.
            exact_start = off == 0 and a in starts
            pair = looks_packed_pair(a) and "banim" in rel
            unitdef_packed = (rel in unitdef_files and looks_packed(a)
                              and not re.search(r"^(REDA|UnitDef_)", sym))
            cross = (ftype != "?" and ttype != "?" and ftype != ttype
                     and not compatible and looks_packed(a) and not exact_start)
            if in_gap:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} lands in a GAP (no owning object)", "HIGH"))
            elif pair:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} packed adjacent-u16 pair in banim/OAM data", "HIGH"))
            elif unitdef_packed:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} packed UnitDefinition first word", "HIGH"))
            elif cross:
                fp_suspects.append((rel, ln, f"{sym}+0x{off:X}",
                                    f"=0x{a:08X} CROSS-TYPE {ftype}->{ttype}, packed-looking", "MED"))

    print("=" * 78)
    print(f"INCONSISTENT (same ROM address is BOTH raw literal AND symbolized): {len(inconsistent)}")
    print("=" * 78)
    for a, rl, sl, nm in inconsistent[:args.limit]:
        print(f"  {a} ({nm}): raw@{rl[0]}:{rl[1]}  vs  sym@{sl[0]}:{sl[1]} ({sl[2]}+0x{sl[3]:X})")

    print("\n" + "=" * 78)
    print(f"FALSE-NEGATIVE suspects (raw literal == symbol START => likely real pointer): {len(fn_suspects)}")
    print("=" * 78)
    for r in fn_suspects[:args.limit]:
        print(f"  [{r[4]}] {r[0]}:{r[1]}  .4byte {r[2]}  {r[3]}")

    print("\n" + "=" * 78)
    print(f"FALSE-POSITIVE suspects (symbolized non-pointer => wrongly relocated): {len(fp_suspects)}")
    print("=" * 78)
    for r in fp_suspects[:args.limit]:
        print(f"  [{r[4]}] {r[0]}:{r[1]}  .4byte {r[2]}  {r[3]}")
    if len(fp_suspects) > args.limit:
        print(f"  ... +{len(fp_suspects)-args.limit} more")

    print(f"\nSUMMARY: inconsistent={len(inconsistent)}, "
          f"false-negative(missed-ptr)={len(fn_suspects)}, "
          f"false-positive(mis-id)={len(fp_suspects)}")
    print("Confirm each with (1) source/struct, (2) target meaningfulness, (3) fe8u before editing.")
    if args.fail_on_suspects and (inconsistent or fn_suspects or fp_suspects):
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
