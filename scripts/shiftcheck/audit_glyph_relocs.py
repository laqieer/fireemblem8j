#!/usr/bin/env python3
"""Structural relocation audit for the Shift-JIS glyph tables (issue #143).

`TextGlyphs_System` / `TextGlyphs_Talk` are `struct Glyph *[0xC0]` tables (see
`include/fontgrp.h`): each of the 0xC0 slots is the head of a linked list keyed
by the Shift-JIS TRAIL byte (`trail = slot_index + 0x40`); each list is walked
via `struct Glyph.sjisNext` (offset 0 of the 0x48-byte record), comparing
`sjisByte1` (the LEAD byte, offset 4) until a match is found.

The existing heuristics (`scan_relocs.py`'s coherent-table classifier,
`audit_pointer_classification.py`'s `.4byte`/inline-asm regex scan) both have a
blind spot for this exact class: they either require a MIXED object (a table
sharing an object with an already-relocated pointer) to rank a raw word as
HIGH-confidence, or they only look for literal `.4byte`/`.word` TEXT -- a plain
C `u32 arr[] = { 0x0857E644, ... };` numeric initializer is invisible to a
`.4byte`-token regex, and agbcc does not emit an `R_ARM_ABS32` relocation for a
plain integer initializer (only for `&symbol [+ off]` pointer expressions). Both
gaps let real, non-null `sjisNext` pointers sit as raw ROM literals -- correct
in the byte-identical build, silently wrong the moment the ROM is shifted.

This tool does not guess: it walks the ACTUAL linked lists in the built ROM
(deterministic bounds: 0xC0 heads/table, cycle-detected, ROM-range-checked) and
requires every non-null pointer WORD IT ACTUALLY READS (each table-head slot,
each `sjisNext` field) to carry a real `R_ARM_ABS32` relocation at that exact
source address in `fireemblem8_relocs.elf` (the `--emit-relocs` relink; see
`emit_relocs_link.sh`). It never classifies an arbitrary ROM-interior word as a
pointer -- only the two schema-known fields of this specific consumer (glyph
table heads and `struct Glyph.sjisNext`), so packed graphics/audio/OAM data can
never become a false positive here.

Baseline mode (default): audits relocation coverage against `fireemblem8.gba` +
`fireemblem8_relocs.elf`. Exits nonzero on any missing relocation or malformed
chain (cycle / out-of-range / truncated read).

Shifted A/B mode (`--shifted-gba`): given a `+shift` ROM built by
`build_shifted_rom.sh`, additionally proves for every glyph reachable in the
baseline traversal: the table-head pointer and every `sjisNext` link equal
`baseline_target + shift` (or stay NULL), AND the 0x44-byte glyph payload
(`sjisByte1`/`width`/`bitmap`, i.e. the record minus its own `sjisNext` field)
is byte-identical between baseline record+4 and shifted record+shift+4. This is
the class-wide visual/data proof: if every link shifts and every payload byte
survives, every glyph bitmap reachable in the baseline stays reachable and
byte-identical in the shifted ROM (no fallback-glyph regression).

Usage:
  scripts/shiftcheck/audit_glyph_relocs.py
  scripts/shiftcheck/audit_glyph_relocs.py --shifted-gba /tmp/fireemblem8_shifted.gba --shift 0x40000
"""
import argparse
import re
import subprocess
import sys

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000
GLYPH_SIZE = 0x48          # sizeof(struct Glyph): sjisNext(4) + sjisByte1/width/pad(4) + bitmap[16](64)
TABLE_HEADS = 0xC0         # one head per Shift-JIS trail byte (trail = slot_index + 0x40)
TABLES = ("TextGlyphs_System", "TextGlyphs_Talk")

RELOC_SECTION_RE = re.compile(r"^RELOCATION RECORDS FOR \[(.+)\]:$")
ABS32_RELOC_RE = re.compile(r"\s*([0-9A-Fa-f]{8})\s+R_ARM_ABS32\s+(.+)$")
ROM_OUTPUT_SECTION = ".rom"


# --------------------------------------------------------------------------
# Pure traversal (unit-testable without a toolchain/build; operates on a plain
# bytes-like buffer + base address, so synthetic fixtures are trivial).
# --------------------------------------------------------------------------

def read_u32(buf, base, addr):
    """Read a little-endian u32 at ROM address `addr` from `buf` (based at `base`).

    Returns None (not an exception) on an out-of-range read so callers can
    report it as a malformed chain instead of crashing the whole audit.
    """
    off = addr - base
    if off < 0 or off + 4 > len(buf):
        return None
    return int.from_bytes(buf[off:off + 4], "little")


def iter_table_links(buf, table_addr, rom_lo=ROM_BASE, rom_hi=ROM_HI, heads=TABLE_HEADS):
    """Yield one event per pointer word/glyph reached while walking a glyph
    table's 0xC0 head slots and their `sjisNext` linked lists.

    This is the SINGLE traversal every consumer below (relocation audit, the
    reachable-glyph set, the shifted A/B proof) shares, so they can never
    silently diverge on bounds/cycle handling.

    Events (as dicts):
      {"kind": "table-head", "source": slot_addr, "target": head_addr, "trail": t}
      {"kind": "glyph",      "addr": glyph_addr,                       "trail": t}
      {"kind": "sjisNext",   "source": glyph_addr, "target": next_addr, "trail": t}
      {"kind": "malformed",  "addr": addr, "reason": "...",             "trail": t}
    """
    for i in range(heads):
        trail = i + 0x40
        slot_addr = table_addr + i * 4
        head = read_u32(buf, rom_lo, slot_addr)
        if head is None:
            yield {"kind": "malformed", "addr": slot_addr, "reason": "table-slot-oob", "trail": trail}
            continue
        if head == 0:
            continue

        yield {"kind": "table-head", "source": slot_addr, "target": head, "trail": trail}

        cur = head
        seen = set()
        while cur:
            if cur in seen:
                yield {"kind": "malformed", "addr": cur, "reason": "cycle", "trail": trail}
                break
            seen.add(cur)
            if not (rom_lo <= cur < rom_hi):
                yield {"kind": "malformed", "addr": cur, "reason": "out-of-range", "trail": trail}
                break

            yield {"kind": "glyph", "addr": cur, "trail": trail}

            nxt = read_u32(buf, rom_lo, cur)
            if nxt is None:
                yield {"kind": "malformed", "addr": cur, "reason": "sjisNext-oob", "trail": trail}
                break
            if nxt != 0:
                yield {"kind": "sjisNext", "source": cur, "target": nxt, "trail": trail}
            cur = nxt


def audit_table(buf, table_addr, relocs, rom_lo=ROM_BASE, rom_hi=ROM_HI, heads=TABLE_HEADS):
    """Require an R_ARM_ABS32 relocation (`relocs`: a set/container of ROM
    source addresses) at every non-null table-head slot and `sjisNext` field.

    Returns {"unique": int, "slots": int, "relocated": int,
             "missing": [...], "malformed": [...]}.
    """
    unique = set()
    slots = 0
    relocated = 0
    missing = []
    malformed = []

    for ev in iter_table_links(buf, table_addr, rom_lo, rom_hi, heads):
        if ev["kind"] == "malformed":
            malformed.append(ev)
        elif ev["kind"] == "glyph":
            unique.add(ev["addr"])
        else:  # table-head / sjisNext: a non-null pointer WORD that must relocate.
            slots += 1
            source = ev["source"]
            if source in relocs:
                relocated += 1
            else:
                missing.append(ev)

    return {"unique": len(unique), "slots": slots, "relocated": relocated,
            "missing": missing, "malformed": malformed}


def reachable_glyphs(buf, table_addr, rom_lo=ROM_BASE, rom_hi=ROM_HI, heads=TABLE_HEADS):
    """Return the set of every glyph address reachable from a table's heads
    (same bounds/cycle handling as audit_table, via the shared traversal)."""
    return {ev["addr"] for ev in iter_table_links(buf, table_addr, rom_lo, rom_hi, heads)
            if ev["kind"] == "glyph"}


def lead_byte_of(buf, rom_lo, glyph_addr):
    """Best-effort decode of struct Glyph.sjisByte1 (the SJIS LEAD byte) for a
    reported glyph address, for readable diagnostics. Returns None if OOB."""
    w = read_u32(buf, rom_lo, glyph_addr + 4)
    return None if w is None else (w & 0xFF)


def format_char(buf, rom_lo, trail, target_addr):
    lead = lead_byte_of(buf, rom_lo, target_addr)
    lead_s = f"{lead:02X}" if lead is not None else "??"
    return f"{lead_s} {trail:02X}"


# --------------------------------------------------------------------------
# Shifted A/B verification (reuses iter_table_links, so it can never disagree
# with audit_table about which words/glyphs are in scope).
# --------------------------------------------------------------------------

def verify_shift(base_buf, shifted_buf, table_addr, shift,
                  rom_lo=ROM_BASE, rom_hi=ROM_HI, heads=TABLE_HEADS, glyph_size=GLYPH_SIZE):
    """For every reachable glyph in the baseline traversal, prove the shifted
    ROM carries the shifted link (or NULL) and a byte-identical payload.

    The shifted ROM (as produced by build_shifted_rom.sh) is a flat file where
    every ROM address A is stored at file offset (A - ROM_BASE) + shift (the
    ldscript's ". += shift" right after the header moves everything after it
    uniformly; verified empirically against build_shifted_rom.sh's own "crt0
    AgbMain" self-check).

    Returns (unique_count, mismatches).
    """
    payload_len = glyph_size - 4
    mismatches = []
    unique = set()

    def shifted_u32(addr):
        off = (addr - rom_lo) + shift
        if off < 0 or off + 4 > len(shifted_buf):
            return None
        return int.from_bytes(shifted_buf[off:off + 4], "little")

    def check_link(ev, base_target):
        source = ev.get("source", ev.get("addr"))
        expected = 0 if not base_target else base_target + shift
        got = shifted_u32(source)
        if got != expected:
            mismatches.append({"kind": ev["kind"], "source": source, "trail": ev["trail"],
                                "base_target": base_target, "expected": expected, "shifted": got})

    def check_payload(glyph_addr):
        base_off = glyph_addr - rom_lo + 4
        base_payload = base_buf[base_off: base_off + payload_len]
        shifted_off = (glyph_addr - rom_lo) + shift + 4
        shifted_payload = shifted_buf[shifted_off: shifted_off + payload_len]
        if base_payload != shifted_payload:
            mismatches.append({"kind": "payload", "source": glyph_addr,
                                "trail": None, "n_bytes": payload_len})

    for ev in iter_table_links(base_buf, table_addr, rom_lo, rom_hi, heads):
        if ev["kind"] == "table-head":
            check_link(ev, ev["target"])
        elif ev["kind"] == "glyph":
            unique.add(ev["addr"])
            check_payload(ev["addr"])
        elif ev["kind"] == "sjisNext":
            check_link(ev, ev["target"])
        # "malformed" entries are already reported by the baseline audit; the
        # A/B proof only judges links/payloads it could actually traverse to.

    return len(unique), mismatches


# --------------------------------------------------------------------------
# I/O: reference ELF symbols, --emit-relocs ELF relocations.
# --------------------------------------------------------------------------

def load_symbol(elf, name, prefix="arm-none-eabi-"):
    out = subprocess.check_output([prefix + "nm", elf], text=True, errors="replace")
    for line in out.splitlines():
        parts = line.split()
        if len(parts) == 3 and parts[2] == name:
            return int(parts[0], 16)
    return None


def load_rom_abs32_relocs(elf, prefix="arm-none-eabi-"):
    """ROM-address set of every R_ARM_ABS32 relocation SOURCE located in the
    linked `.rom` output section (section-scoped like scan_talk_table_relocs.py,
    so a `.debug_info` offset that numerically overlaps the ROM window is never
    mistaken for a real in-ROM relocation)."""
    out = subprocess.check_output(
        [prefix + "objdump", "-r", "--section=" + ROM_OUTPUT_SECTION, elf],
        text=True, errors="replace")
    locs = set()
    source_section = None
    for line in out.splitlines():
        m = RELOC_SECTION_RE.match(line)
        if m:
            source_section = m.group(1)
            continue
        if source_section != ROM_OUTPUT_SECTION:
            continue
        m = ABS32_RELOC_RE.match(line)
        if not m:
            continue
        loc = int(m.group(1), 16)
        if loc < ROM_BASE:
            loc += ROM_BASE
        locs.add(loc)
    return locs


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------

def main():
    ap = argparse.ArgumentParser(description=__doc__,
                                  formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--elf", default="fireemblem8.elf", help="reference (matching) ELF")
    ap.add_argument("--relocs-elf", default="fireemblem8_relocs.elf",
                    help="--emit-relocs relink (see emit_relocs_link.sh)")
    ap.add_argument("--gba", default="fireemblem8.gba", help="built baseline ROM")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--shifted-gba", help="optional +shift ROM (build_shifted_rom.sh) for the A/B proof")
    ap.add_argument("--shift", default="0x40000")
    ap.add_argument("--limit", type=int, default=40)
    args = ap.parse_args()

    shift = int(args.shift, 0)

    with open(args.gba, "rb") as f:
        rom = f.read()

    table_addrs = {}
    for name in TABLES:
        addr = load_symbol(args.elf, name, args.prefix)
        if addr is None:
            sys.stderr.write(f"could not locate symbol {name} in {args.elf}\n")
            return 2
        table_addrs[name] = addr

    relocs = load_rom_abs32_relocs(args.relocs_elf, args.prefix)

    overall_bad = False
    print("=" * 78)
    print("Structural glyph relocation audit (TextGlyphs_System / TextGlyphs_Talk)")
    print("=" * 78)
    for name in TABLES:
        result = audit_table(rom, table_addrs[name], relocs)
        n_missing = len(result["missing"])
        n_malformed = len(result["malformed"])
        print(f"\n{name} @ 0x{table_addrs[name]:08X}: "
              f"unique={result['unique']} slots={result['slots']} "
              f"relocated={result['relocated']} missing={n_missing} malformed={n_malformed}")
        for m in result["missing"][:args.limit]:
            char = format_char(rom, ROM_BASE, m["trail"], m["target"])
            print(f"  MISSING [{m['kind']}] source=0x{m['source']:08X} "
                  f"target=0x{m['target']:08X} trail=0x{m['trail']:02X} char~=CP932:{char}")
        if n_missing > args.limit:
            print(f"  ... +{n_missing - args.limit} more")
        for m in result["malformed"][:args.limit]:
            print(f"  MALFORMED addr=0x{m['addr']:08X} reason={m['reason']} trail=0x{m['trail']:02X}")
        if n_missing or n_malformed:
            overall_bad = True

    if args.shifted_gba:
        with open(args.shifted_gba, "rb") as f:
            shifted = f.read()
        print("\n" + "=" * 78)
        print(f"Shifted A/B proof (+0x{shift:X}) against {args.shifted_gba}")
        print("=" * 78)
        for name in TABLES:
            n_unique, mismatches = verify_shift(rom, shifted, table_addrs[name], shift)
            print(f"\n{name}: reachable_glyphs={n_unique} mismatches={len(mismatches)}")
            for m in mismatches[:args.limit]:
                print(f"  MISMATCH {m}")
            if len(mismatches) > args.limit:
                print(f"  ... +{len(mismatches) - args.limit} more")
            if mismatches:
                overall_bad = True

    print("\n" + "=" * 78)
    print(f"RESULT: {'FAIL' if overall_bad else 'OK'}")
    return 1 if overall_bad else 0


if __name__ == "__main__":
    sys.exit(main())
