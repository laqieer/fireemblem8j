#!/usr/bin/env python3
"""Structural relocation audit for `struct ProcCmd` script data (issue #143,
ProcCmd follow-up + broadened rescan).

`struct ProcCmd { short opcode; short dataImm; const void* dataPtr; }` is an
8-byte record (`include/proc.h`); a script is a flat sequence of these
terminated by `PROC_END` (opcode 0, dataImm 0, dataPtr 0). Several opcodes
carry a real ROM pointer in `dataPtr` -- a function/callback, a name string,
or a sub-script -- and MUST relocate under a ROM shift exactly like the glyph
tables audited by `audit_glyph_relocs.py`:

    01 PROC_NAME              02 PROC_CALL              03 PROC_REPEAT
    04 PROC_SET_END_CB        05 PROC_START_CHILD       06 PROC_START_CHILD_BLOCKING
    07 PROC_START_MAIN_BUGGED 08 PROC_WHILE_EXISTS       09 PROC_END_EACH
    0A PROC_BREAK_EACH        0D PROC_JUMP               14 PROC_WHILE
    16 PROC_CALL_2            18 PROC_CALL_ARG

(mirrors `include/proc.h`'s macro table and `scripts/depoint_procscr.py`'s
`OPCODES` dict). The remaining opcodes (00, 0B, 0C, 0E, 0F, 10-13, 15, 17, 19)
never carry a pointer in `dataPtr` (it is always the literal `0` in every
`PROC_*` macro definition).

Just like the glyph-table blind spot: a `PROC_NAME((const void*)0x080E1D0C)`
raw-literal cast compiles to a word with NO `R_ARM_ABS32` relocation -- correct
only because the byte-identical build sits at its original address.

**Why this scans ALL ROM OBJECT symbols, not just source-declared
`struct ProcCmd NAME[]` arrays.** A first pass audited only symbols the C
source itself types as `struct ProcCmd` and found (and fixed) 3 unrelocated
`PROC_NAME` literals. A broader structural rescan -- decoding a STRICT
`struct ProcCmd` prefix from the start address of every ROM object symbol,
regardless of its DECLARED C type -- found 3 MORE: `data_08601748`,
`data_086019E0`, `data_086019F8` were genuine ProcCmd scripts (each is cast
`(const struct ProcCmd *)` and passed to `Proc_Start()` from a DIFFERENT
translation unit) but were declared as plain `u32[]` blobs in their defining
file, so the source-text scan for `struct ProcCmd` never saw them. This is
the exact same C-type-vs-actual-schema mismatch as the glyph-table
`u32[]`-hides-a-relocatable-pointer class, just recurring for a THIRD time
(after `sCpProcData`-style extern mistypes) in this consumer. Scanning every
symbol's raw bytes for a decodable `struct ProcCmd` shape sidesteps source
C-type declarations entirely and cannot be blind to this again.

**Deterministic strict-prefix decode.** For a candidate start address, decode
8-byte records until either (a) a valid `PROC_END` (opcode 0, dataImm 0,
dataPtr 0) is reached -- SUCCESS, this address is a genuine ProcCmd script
prefix -- or (b) any record fails a strict validity check -- REJECTED, this
address is not ProcCmd data (the overwhelming common case: encoding a random
16-bit value as a valid opcode has ~26/65536 odds, so a false-positive
multi-record decode chain is not realistically reachable). Validity per
record: `opcode <= 0x19`; a NON-pointer-bearing opcode's `dataPtr` MUST be
exactly `0`; a pointer-bearing opcode's NON-null `dataPtr` MUST fall in
`[ROM_LO, ROM_HI)`. Bounded by `MAX_RECORDS` so a decode can never run away
across unrelated ROM content (the longest genuine script found in-tree is
184 records; the cap is well above that with headroom).

Symbols are deduplicated by ADDRESS before decoding (many names -- aliases,
or two independent objects that happen to start at the same place -- can
share one underlying byte sequence; decoding it twice would be wasted work,
and reporting relocation status per-address rather than per-name avoids
double-counting). Every name mapped to an address that HAS a missing
relocation is still listed in the report, so an alias (e.g.
`frontier_df4_banim_a_010_5FF7C8 == ProcScr_efxFireOBJ`) is visible under
both names.

Baseline mode (default): requires a real `R_ARM_ABS32` relocation at every
non-null pointer-bearing `dataPtr` field of every decoded script prefix.
Exits nonzero on any missing relocation or an unexpected relocation on a
field that is never a pointer (the opcode/dataImm word, a null pointer-bearing
field, or a non-pointer-bearing opcode's `dataPtr`).

Shifted A/B mode (`--shifted-gba`): given a `+shift` ROM built by
`build_shifted_rom.sh`, additionally proves for every audited pointer-bearing
`dataPtr` field: the shifted word equals `baseline_target + shift` (or stays
NULL).

Usage:
  scripts/shiftcheck/audit_procscr_relocs.py
  scripts/shiftcheck/audit_procscr_relocs.py --shifted-gba /tmp/fireemblem8_shifted.gba --shift 0x40000
"""
import argparse
import re
import subprocess
import sys

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000
RECORD_SIZE = 8  # sizeof(struct ProcCmd): short opcode + short dataImm + const void* dataPtr
MAX_RECORDS = 512  # generous cap above the longest genuine in-tree script (184 records)

# Mirrors include/proc.h's PROC_* macro table (and scripts/depoint_procscr.py's
# OPCODES dict): every opcode whose macro's third field is a real operand
# rather than the literal `0`.
POINTER_OPCODES = frozenset({0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                             0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})
KNOWN_OPCODES = frozenset(range(0x00, 0x1A))  # 0x00..0x19, per include/proc.h

RELOC_SECTION_RE = re.compile(r"^RELOCATION RECORDS FOR \[(.+)\]:$")
ABS32_RELOC_RE = re.compile(r"\s*([0-9A-Fa-f]{8})\s+R_ARM_ABS32\s+(.+)$")
ROM_OUTPUT_SECTION = ".rom"


# --------------------------------------------------------------------------
# Pure decode (unit-testable without a toolchain/build; operates on a plain
# bytes-like buffer + base address, so synthetic fixtures are trivial).
# --------------------------------------------------------------------------

def read_u16(buf, base, addr):
    off = addr - base
    if off < 0 or off + 2 > len(buf):
        return None
    return int.from_bytes(buf[off:off + 2], "little")


def read_u32(buf, base, addr):
    off = addr - base
    if off < 0 or off + 4 > len(buf):
        return None
    return int.from_bytes(buf[off:off + 4], "little")


def decode_prefix(buf, addr, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                   record_size=RECORD_SIZE, max_records=MAX_RECORDS):
    """Try to decode a STRICT `struct ProcCmd` prefix starting at `addr`.

    Returns a list of record-events (see below) if `addr` decodes as a valid,
    PROC_END-terminated ProcCmd script within `max_records`; returns None if
    any record fails a strict validity check, an out-of-bounds read occurs, or
    the cap is exceeded without terminating (never a runaway decode).

    Each record yields two events (mirroring audit_glyph_relocs.py's
    dict-event style so misuse is caught the same structural way):
      {"kind": "opcode-field", "source": rec_addr}
      {"kind": "ptr-field", "source": ptr_addr, "target": dataptr, "opcode": ...,
       "pointer_bearing": bool}
    """
    events = []
    cur = addr
    for _ in range(max_records):
        opcode = read_u16(buf, rom_lo, cur)
        if opcode is None or opcode not in KNOWN_OPCODES:
            return None

        ptr_addr = cur + 4
        dataptr = read_u32(buf, rom_lo, ptr_addr)
        if dataptr is None:
            return None

        pointer_bearing = opcode in POINTER_OPCODES
        if pointer_bearing:
            if dataptr != 0 and not (rom_lo <= dataptr < rom_hi):
                return None
        else:
            if dataptr != 0:
                return None  # a non-pointer opcode's dataPtr is always 0 in real data

        events.append({"kind": "opcode-field", "source": cur})
        events.append({"kind": "ptr-field", "source": ptr_addr, "target": dataptr,
                        "opcode": opcode, "pointer_bearing": pointer_bearing})

        if opcode == 0x00:  # PROC_END: valid, zero-everything terminator
            dataimm = read_u16(buf, rom_lo, cur + 2)
            if dataimm != 0:
                return None
            return events

        cur += record_size
    return None  # exceeded the cap without terminating: not a bounded script


def audit_prefix(events, relocs):
    """Require an R_ARM_ABS32 relocation (`relocs`: a set/container of ROM
    source addresses) at every non-null pointer-bearing `dataPtr` field of an
    already-decoded prefix (see decode_prefix), and flag any relocation found
    on a field that is never a pointer.

    Returns {"records": int, "slots": int, "relocated": int,
             "missing": [...], "malformed": [...]}.
    """
    records = 0
    slots = 0
    relocated = 0
    missing = []
    malformed = []

    for ev in events:
        if ev["kind"] == "opcode-field":
            records += 1
            if ev["source"] in relocs:
                malformed.append({"reason": "unexpected-reloc-opcode-field", "addr": ev["source"]})
        else:  # ptr-field
            if ev["pointer_bearing"]:
                if ev["target"] != 0:
                    slots += 1
                    if ev["source"] in relocs:
                        relocated += 1
                    else:
                        missing.append(ev)
                elif ev["source"] in relocs:
                    malformed.append({"reason": "unexpected-reloc-null-ptr", "addr": ev["source"]})
            elif ev["source"] in relocs:
                malformed.append({"reason": "unexpected-reloc-non-ptr-opcode",
                                   "addr": ev["source"], "opcode": ev["opcode"]})

    return {"records": records, "slots": slots, "relocated": relocated,
            "missing": missing, "malformed": malformed}


def find_script_prefixes(buf, addrs, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                          record_size=RECORD_SIZE, max_records=MAX_RECORDS,
                          min_records=2):
    """Decode a strict ProcCmd prefix at every address in `addrs` (an iterable
    of unique candidate ROM addresses, e.g. every distinct ELF symbol value).

    `min_records` (default 2) filters out a bare lone `PROC_END` decode: any
    all-zero 8-byte word pair coincidentally satisfies decode_prefix (it is a
    trivially valid, zero-slot "script"), and all-zero padding/BSS-adjacent
    bytes are common throughout the ROM for reasons that have nothing to do
    with ProcCmd data. A genuine script always has at least one real command
    before its terminator, so requiring >=2 records keeps every real script
    while dropping that specific zero-content noise source; it never suppresses
    an actual missing-relocation finding (a bare PROC_END has zero pointer
    slots to audit either way).

    Returns {addr: events} for every address that decodes as a valid script
    meeting `min_records`.
    """
    out = {}
    for addr in addrs:
        events = decode_prefix(buf, addr, rom_lo, rom_hi, record_size, max_records)
        if events is not None and len(events) >= min_records * 2:
            out[addr] = events
    return out


# --------------------------------------------------------------------------
# Shifted A/B verification.
# --------------------------------------------------------------------------

def verify_shift(events, base_buf, shifted_buf, shift, rom_lo=ROM_BASE):
    """For every pointer-bearing dataPtr field in an already-decoded prefix,
    prove the shifted ROM carries `base_target + shift` (or stays NULL).

    The shifted ROM (as produced by build_shifted_rom.sh) is a flat file where
    every ROM address A is stored at file offset (A - ROM_BASE) + shift.

    Returns (n_fields_checked, mismatches).
    """
    mismatches = []
    checked = 0

    def shifted_u32(addr):
        off = (addr - rom_lo) + shift
        if off < 0 or off + 4 > len(shifted_buf):
            return None
        return int.from_bytes(shifted_buf[off:off + 4], "little")

    for ev in events:
        if ev["kind"] != "ptr-field" or not ev["pointer_bearing"]:
            continue
        checked += 1
        expected = 0 if not ev["target"] else ev["target"] + shift
        got = shifted_u32(ev["source"])
        if got != expected:
            mismatches.append({"source": ev["source"], "opcode": ev["opcode"],
                                "base_target": ev["target"], "expected": expected, "shifted": got})

    return checked, mismatches


# --------------------------------------------------------------------------
# I/O: reference ELF symbols, --emit-relocs ELF relocations.
# --------------------------------------------------------------------------

def load_rom_symbol_addrs(elf, prefix="arm-none-eabi-"):
    """addr -> sorted list of every symbol NAME at that address, for every
    defined ELF symbol in the ROM range. Deliberately UNFILTERED by nm type
    (global/local/absolute-alias): a static local, a global object, and an
    alias can all be legitimate ProcCmd script entry points, and duplicate
    addresses are naturally deduplicated by using address as the dict key
    (see module docstring) -- there is no ambiguity to route around here, in
    contrast to a NAME-keyed source-declaration scan.
    """
    out = subprocess.check_output([prefix + "nm", "-S", elf], text=True, errors="replace")
    by_addr = {}
    for line in out.splitlines():
        parts = line.split()
        if len(parts) < 4:
            continue
        try:
            addr = int(parts[0], 16)
        except ValueError:
            continue
        name = parts[3]
        if ROM_BASE <= addr < ROM_HI:
            by_addr.setdefault(addr, []).append(name)
    for addr in by_addr:
        by_addr[addr].sort()
    return by_addr


def load_rom_abs32_relocs(elf, prefix="arm-none-eabi-"):
    """ROM-address set of every R_ARM_ABS32 relocation SOURCE located in the
    linked `.rom` output section (section-scoped like scan_talk_table_relocs.py
    / audit_glyph_relocs.py, so a `.debug_info` offset that numerically
    overlaps the ROM window is never mistaken for a real in-ROM relocation)."""
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

    names_by_addr = load_rom_symbol_addrs(args.elf, args.prefix)
    relocs = load_rom_abs32_relocs(args.relocs_elf, args.prefix)
    prefixes = find_script_prefixes(rom, names_by_addr.keys())

    print("=" * 78)
    print("Structural ProcCmd relocation audit (strict-decoded script prefixes, all ROM symbols)")
    print("=" * 78)
    n_reports = sum(len(names_by_addr[a]) for a in prefixes)
    print(f"candidate symbol addresses: {len(names_by_addr)}  "
          f"script prefixes found: {len(prefixes)}  (symbol name reports: {n_reports})")

    total_records = 0
    total_slots = 0
    total_relocated = 0
    all_missing = []
    all_malformed = []

    for addr in sorted(prefixes):
        result = audit_prefix(prefixes[addr], relocs)
        names = names_by_addr[addr]
        total_records += result["records"]
        total_slots += result["slots"]
        total_relocated += result["relocated"]
        all_missing.extend({"addr": addr, "names": names, **m} for m in result["missing"])
        all_malformed.extend({"addr": addr, "names": names, **m} for m in result["malformed"])

    print(f"\nprefixes={len(prefixes)} records={total_records} pointer_slots={total_slots} "
          f"relocated={total_relocated} missing={len(all_missing)} malformed={len(all_malformed)}")

    for m in all_missing[:args.limit]:
        print(f"  MISSING addr=0x{m['addr']:08X} names={m['names']} "
              f"source=0x{m['source']:08X} target=0x{m['target']:08X} opcode=0x{m['opcode']:02X}")
    if len(all_missing) > args.limit:
        print(f"  ... +{len(all_missing) - args.limit} more")

    for m in all_malformed[:args.limit]:
        print(f"  MALFORMED addr=0x{m['addr']:08X} names={m['names']} {m}")
    if len(all_malformed) > args.limit:
        print(f"  ... +{len(all_malformed) - args.limit} more")

    overall_bad = bool(all_missing or all_malformed)

    if args.shifted_gba:
        with open(args.shifted_gba, "rb") as f:
            shifted = f.read()
        print("\n" + "=" * 78)
        print(f"Shifted A/B proof (+0x{shift:X}) against {args.shifted_gba}")
        print("=" * 78)
        total_checked = 0
        all_mismatches = []
        for addr in sorted(prefixes):
            checked, mismatches = verify_shift(prefixes[addr], rom, shifted, shift)
            total_checked += checked
            all_mismatches.extend({"addr": addr, "names": names_by_addr[addr], **m} for m in mismatches)
        print(f"\npointer_fields_checked={total_checked} mismatches={len(all_mismatches)}")
        for m in all_mismatches[:args.limit]:
            print(f"  MISMATCH {m}")
        if len(all_mismatches) > args.limit:
            print(f"  ... +{len(all_mismatches) - args.limit} more")
        if all_mismatches:
            overall_bad = True

    print("\n" + "=" * 78)
    print(f"RESULT: {'FAIL' if overall_bad else 'OK'}")
    return 1 if overall_bad else 0


if __name__ == "__main__":
    sys.exit(main())
