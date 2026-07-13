#!/usr/bin/env python3
"""Structural relocation audit for source-declared `struct ProcCmd` script
arrays (issue #143, ProcCmd follow-up).

`struct ProcCmd { short opcode; short dataImm; const void* dataPtr; }` is an
8-byte record (`include/proc.h`); a script is a flat array of these terminated
by `PROC_END` (opcode 0). Several opcodes carry a real ROM pointer in
`dataPtr` -- a function/callback, a name string, or a sub-script -- and MUST
relocate under a ROM shift exactly like the glyph tables audited by
`audit_glyph_relocs.py`:

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
only because the byte-identical build sits at its original address. This is
schema-aware (only these two fields of this specific consumer are ever judged
a pointer), so it can never misclassify packed graphics/audio/OAM data.

Baseline mode (default): for every GLOBAL `struct ProcCmd NAME[] = { ... }`
DEFINITION found under `src/` (a source-text scan, paren-aware so a bare
`extern struct ProcCmd NAME[];` forward declaration is never mistaken for a
definition -- some symbols are `extern`-declared as `struct ProcCmd` in dozens
of consumer files while genuinely defined as a different type elsewhere, e.g.
`sCpProcData`, a `u32[]` used only as a PROC_NAME string target), resolve its
(address, size) from the reference ELF and require a real `R_ARM_ABS32`
relocation at every non-null pointer-bearing `dataPtr` field. Only GLOBAL
(non-`static`) definitions are audited: two independent `static` arrays in
different translation units may legitimately share a local symbol name, and
disambiguating those via `nm` alone is unreliable (this repo's byte-dedup
alias system can additionally fold identical `static` locals onto a shared
absolute alias) -- routing around that ambiguity entirely avoids false
"malformed" reports unrelated to shiftability. Exits nonzero on any missing
relocation or malformed record (unknown opcode, non-multiple-of-8 size,
out-of-ROM-range array/pointer, or a relocation on a field that is never a
pointer).

Shifted A/B mode (`--shifted-gba`): given a `+shift` ROM built by
`build_shifted_rom.sh`, additionally proves for every audited pointer-bearing
`dataPtr` field: the shifted word equals `baseline_target + shift` (or stays
NULL).

Usage:
  scripts/shiftcheck/audit_procscr_relocs.py
  scripts/shiftcheck/audit_procscr_relocs.py --shifted-gba /tmp/fireemblem8_shifted.gba --shift 0x40000
"""
import argparse
import glob
import re
import subprocess
import sys

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000
RECORD_SIZE = 8  # sizeof(struct ProcCmd): short opcode + short dataImm + const void* dataPtr

# Mirrors include/proc.h's PROC_* macro table (and scripts/depoint_procscr.py's
# OPCODES dict): every opcode whose macro's third field is a real operand
# rather than the literal `0`.
POINTER_OPCODES = frozenset({0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                             0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})
KNOWN_OPCODES = frozenset(range(0x00, 0x1A))  # 0x00..0x19, per include/proc.h

RELOC_SECTION_RE = re.compile(r"^RELOCATION RECORDS FOR \[(.+)\]:$")
ABS32_RELOC_RE = re.compile(r"\s*([0-9A-Fa-f]{8})\s+R_ARM_ABS32\s+(.+)$")
ROM_OUTPUT_SECTION = ".rom"

DECL_RE = re.compile(r"struct ProcCmd\s+(?:CONST_DATA\s+|const\s+)?([A-Za-z_]\w*)\s*\[\s*\]")


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


def iter_records(buf, array_addr, array_size, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                  record_size=RECORD_SIZE):
    """Yield one event per `struct ProcCmd` record in `array_addr[array_size]`.

    Events (as dicts):
      {"kind": "malformed", "reason": "bad-size"|"out-of-range"|"unknown-opcode"
                                       |"record-oob"|"ptr-out-of-range",
       "addr": ..., ["opcode": ..., "target": ...]}
      {"kind": "ptr-field", "source": dataptr_addr, "target": dataptr, "opcode": ...,
       "record": rec_addr, "pointer_bearing": bool}
        -- "target" is 0 for a null pointer-bearing field (still emitted so a
           relocation on a null field can be flagged); pointer_bearing is False
           for opcodes that must never carry a pointer (dataPtr always 0 there).
      {"kind": "opcode-field", "source": rec_addr}
        -- the opcode/dataImm halfword-pair word; never a pointer, emitted so a
           stray relocation there can be flagged.
    """
    if array_size <= 0 or array_size % record_size != 0:
        yield {"kind": "malformed", "reason": "bad-size", "addr": array_addr}
        return
    if not (rom_lo <= array_addr < rom_hi) or not (rom_lo <= array_addr + array_size <= rom_hi):
        yield {"kind": "malformed", "reason": "out-of-range", "addr": array_addr}
        return

    for i in range(array_size // record_size):
        rec_addr = array_addr + i * record_size
        opcode = read_u16(buf, rom_lo, rec_addr)
        if opcode is None:
            yield {"kind": "malformed", "reason": "record-oob", "addr": rec_addr}
            return

        yield {"kind": "opcode-field", "source": rec_addr}

        if opcode not in KNOWN_OPCODES:
            yield {"kind": "malformed", "reason": "unknown-opcode", "addr": rec_addr, "opcode": opcode}
            continue

        ptr_addr = rec_addr + 4
        dataptr = read_u32(buf, rom_lo, ptr_addr)
        if dataptr is None:
            yield {"kind": "malformed", "reason": "record-oob", "addr": ptr_addr}
            return

        pointer_bearing = opcode in POINTER_OPCODES
        if pointer_bearing and dataptr != 0 and not (rom_lo <= dataptr < rom_hi):
            yield {"kind": "malformed", "reason": "ptr-out-of-range", "addr": ptr_addr,
                   "opcode": opcode, "target": dataptr}
            continue

        yield {"kind": "ptr-field", "source": ptr_addr, "target": dataptr,
               "opcode": opcode, "record": rec_addr, "pointer_bearing": pointer_bearing}


def audit_array(buf, array_addr, array_size, relocs, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                record_size=RECORD_SIZE):
    """Require an R_ARM_ABS32 relocation (`relocs`: a set/container of ROM
    source addresses) at every non-null pointer-bearing `dataPtr` field, and
    flag any relocation found on a field that is never a pointer.

    Returns {"records": int, "slots": int, "relocated": int,
             "missing": [...], "malformed": [...]}.
    """
    records = 0
    slots = 0
    relocated = 0
    missing = []
    malformed = []

    for ev in iter_records(buf, array_addr, array_size, rom_lo, rom_hi, record_size):
        if ev["kind"] == "malformed":
            malformed.append(ev)
        elif ev["kind"] == "opcode-field":
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


# --------------------------------------------------------------------------
# Shifted A/B verification.
# --------------------------------------------------------------------------

def verify_shift(base_buf, shifted_buf, array_addr, array_size, shift,
                  rom_lo=ROM_BASE, rom_hi=ROM_HI, record_size=RECORD_SIZE):
    """For every pointer-bearing dataPtr field in the baseline array, prove the
    shifted ROM carries `base_target + shift` (or stays NULL).

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

    for ev in iter_records(base_buf, array_addr, array_size, rom_lo, rom_hi, record_size):
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
# I/O: source scan, reference ELF symbols, --emit-relocs ELF relocations.
# --------------------------------------------------------------------------

def _is_definition(text, start):
    """True if the `struct ProcCmd NAME[]` match ending at `start` is an actual
    DEFINITION (has a top-level `=` before the terminating `;`), not a bare
    `extern ... ;` forward declaration. Paren-depth aware so an intervening
    `__attribute__((section("...")))` never confuses the search."""
    depth = 0
    i = start
    n = len(text)
    while i < n:
        c = text[i]
        if c == "(":
            depth += 1
        elif c == ")":
            depth -= 1
        elif depth == 0:
            if c == "=":
                return True
            if c == ";":
                return False
        i += 1
    return False


def find_procscr_array_names(src_glob="src/**/*.c"):
    """Source-declared `struct ProcCmd NAME[]` DEFINITION names (a set)."""
    names = set()
    for path in glob.glob(src_glob, recursive=True):
        try:
            with open(path, errors="replace") as f:
                text = f.read()
        except OSError:
            continue
        for m in DECL_RE.finditer(text):
            if _is_definition(text, m.end()):
                names.add(m.group(1))
    return names


def load_global_symbols(elf, prefix="arm-none-eabi-"):
    """name -> (addr, size) for every GLOBAL (uppercase nm type) defined symbol.

    Only GLOBAL symbols are considered: two `static` arrays in different TUs
    may share a local name (see module docstring), which `nm` alone cannot
    disambiguate reliably; this repo's static ProcCmd tables are edge cases
    unrelated to shiftability, not part of this audit's scope.
    """
    out = subprocess.check_output([prefix + "nm", "-S", elf], text=True, errors="replace")
    sym = {}
    for line in out.splitlines():
        parts = line.split()
        if len(parts) < 4:
            continue
        try:
            addr = int(parts[0], 16)
            size = int(parts[1], 16)
        except ValueError:
            continue
        typ, name = parts[2], parts[3]
        if typ.isupper():
            sym[name] = (addr, size)
    return sym


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
    ap.add_argument("--src-glob", default="src/**/*.c")
    ap.add_argument("--shifted-gba", help="optional +shift ROM (build_shifted_rom.sh) for the A/B proof")
    ap.add_argument("--shift", default="0x40000")
    ap.add_argument("--limit", type=int, default=40)
    args = ap.parse_args()

    shift = int(args.shift, 0)

    with open(args.gba, "rb") as f:
        rom = f.read()

    names = find_procscr_array_names(args.src_glob)
    symbols = load_global_symbols(args.elf, args.prefix)
    resolved = {n: symbols[n] for n in names if n in symbols}
    relocs = load_rom_abs32_relocs(args.relocs_elf, args.prefix)

    print("=" * 78)
    print("Structural ProcCmd relocation audit (source-declared GLOBAL script arrays)")
    print("=" * 78)
    print(f"source-declared definitions: {len(names)}  resolved-in-ELF: {len(resolved)}")

    total_arrays = 0
    total_records = 0
    total_slots = 0
    total_relocated = 0
    all_missing = []
    all_malformed = []

    for name in sorted(resolved):
        addr, size = resolved[name]
        result = audit_array(rom, addr, size, relocs)
        if result["malformed"] and any(m.get("reason") in ("bad-size", "out-of-range") for m in result["malformed"]):
            all_malformed.extend({"array": name, **m} for m in result["malformed"])
            continue
        total_arrays += 1
        total_records += result["records"]
        total_slots += result["slots"]
        total_relocated += result["relocated"]
        all_missing.extend({"array": name, **m} for m in result["missing"])
        all_malformed.extend({"array": name, **m} for m in result["malformed"])

    print(f"\narrays={total_arrays} records={total_records} pointer_slots={total_slots} "
          f"relocated={total_relocated} missing={len(all_missing)} malformed={len(all_malformed)}")

    for m in all_missing[:args.limit]:
        print(f"  MISSING array={m['array']} source=0x{m['source']:08X} "
              f"target=0x{m['target']:08X} opcode=0x{m['opcode']:02X}")
    if len(all_missing) > args.limit:
        print(f"  ... +{len(all_missing) - args.limit} more")

    for m in all_malformed[:args.limit]:
        print(f"  MALFORMED array={m['array']} {m}")
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
        for name in sorted(resolved):
            addr, size = resolved[name]
            checked, mismatches = verify_shift(rom, shifted, addr, size, shift)
            total_checked += checked
            all_mismatches.extend({"array": name, **m} for m in mismatches)
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
