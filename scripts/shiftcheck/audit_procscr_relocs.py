#!/usr/bin/env python3
"""Structural relocation audit for `struct ProcCmd` script data (issue #143,
ProcCmd follow-up + broadened rescan + object-extent correction).

`struct ProcCmd { short opcode; short dataImm; const void* dataPtr; }` is an
8-byte record (`include/proc.h`); a script is a flat sequence of these,
normally terminated by `PROC_END` (opcode 0, dataImm 0, dataPtr 0), OR ending
in a genuinely TERMINAL control-transfer opcode that never falls through to a
following record (see TERMINAL_OPCODES below). Several opcodes carry a real
ROM pointer in `dataPtr` -- a function/callback, a name string, or a
sub-script -- and MUST relocate under a ROM shift exactly like the glyph
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
file, so the source-text scan for `struct ProcCmd` never saw them.

**Object-extent correction (this revision).** The prior broadened decode
ignored each candidate's own declared `nm -S` size and simply kept decoding
until it found ANY byte pattern that looked like a valid terminator -- so a
script legitimately ending in a terminal opcode with NO following `PROC_END`
(see TERMINAL_OPCODES) was walked straight through into the NEXT object's
bytes. Demonstrated real overreads: `ProcScr_MapAnimPoisonDmg` and 8 sibling
`PROC_JUMP`-terminated arrays in `frontier_df4_banim_b.c` (each ends
`..., PROC_JUMP(ProcScr_MapAnimEnd)` with nothing after it) were merged by the
old decode into one bogus 138-record/1104-byte "prefix" that also consumed
`ProcScr_MapBattleInfoBox`'s trailing real `PROC_END` — while each object's
OWN correctly-bounded decode is independently valid and complete. Every
candidate decode is now bounded STRICTLY to `[addr, addr + size)` from
`nm -S` and NEVER reads a single byte belonging to a different symbol,
regardless of what that byte looks like.

**Terminal opcodes (object may legitimately end here, no PROC_END needed).**
Four opcodes are classified TERMINAL, each confirmed against the actual
handler code/disassembly (not merely "PROC_JUMP as an example" -- every
handler in `sProcessCmdTable` was inspected):

- `PROC_JUMP` (`0x0D`), `ProcCmd_JUMP()` in `src/proc_080031B8.c`:
  `Proc_GotoScript(proc, proc->proc_scrCur->dataPtr)` -- does NOT
  `proc_scrCur++`; unconditionally repoints script execution at a DIFFERENT
  `struct ProcCmd` array and never falls through.
- `PROC_GOTO` (`0x0C`), `ProcCmd_GOTO()`: `Proc_Goto(proc,
  proc->proc_scrCur->dataImm)` -- also does NOT `proc_scrCur++`.
  `Proc_Goto()` (`src/proc_08002E74.c`) linearly scans for a matching
  `PROC_LABEL` starting from `proc_script` (the CURRENT script's own start),
  so unlike `PROC_JUMP` it never leaves the object -- but it still never
  falls through past itself (finds the label and jumps there, or -- if no
  match -- leaves `proc_scrCur` unchanged, re-executing the same `PROC_GOTO`
  every subsequent frame). Demonstrated real in-tree cases:
  `ProcScr_MapAnimBattle`/`gProcScr_FortuneSubMenu`/
  `ProcScr_SioMenu_Init_5D3D50_0` all legitimately end in `PROC_GOTO(...)`
  with no following `PROC_END`.
- `PROC_BLOCK` (`0x10`): disassembly at its `sProcessCmdTable[0x10]` target
  (`gap_00003240`, not yet split into a named `ProcCmd_*.c` file) is exactly
  `movs r0, #0; bx lr` -- it unconditionally `return`s FALSE WITHOUT EVER
  reading `dataImm`/`dataPtr` or touching `proc_scrCur` at all. This is an
  unconditional permanent halt (re-executed forever, never advancing).
  Demonstrated real in-tree cases: `ProcScr_FadeToBlack`/`FadeFromBlack`/
  `FadeToWhite`, `gProcScr_SubtitleHelp`, `ProcScr_ManimLevelUpStatGainLabel`.
- `PROC_REPEAT` (`0x03`), `ProcCmd_LOOP_ROUTINE()`
  (`src/ProcCmd_LOOP_ROUTINE.c`): DOES `proc_scrCur++`, but also sets
  `proc->proc_idleCb = dataPtr` and returns FALSE. `RunProcessScript()`
  (`src/RunProcessScript.c`) checks `if (proc->proc_idleCb != NULL) return;`
  BEFORE ever dispatching another opcode -- so once installed, the script
  never resumes opcode dispatch on its own (only an external
  `Proc_GotoScript`-class call, which explicitly clears `proc_idleCb`, can
  ever reach whatever follows). Several genuine, unmodified, individually
  carved (`layout/carved_rom.d/*.tsv`, explicitly annotated `(N ProcCmd)`)
  in-tree arrays end here with no trailing `PROC_END`:
  `ProcScr_SpacialSeTest`, `ProcScr_ChapterIntro_RevealDecalSprite`,
  `ProcScr_DrawLinkArenaFogPlaceholders`, `ProcScr_Mu`.

Every OTHER pointer-bearing opcode's handler (`ProcCmd_CALL_ROUTINE`, `_2`,
`_ARG`, `_WHILE_EXISTS`, `_BREAK_ALL_LOOP`, `_END_ALL`, `_NEW_MAIN_BUGGED`,
`_SET_NAME`, `_WHILE_ROUTINE`, ...) explicitly advances `proc_scrCur` AND
does not install a dispatch-blocking side effect, so falling off the end of
a script that used one of those as its last recorded command WOULD execute
garbage -- those still require a following `PROC_END`. `PROC_LABEL` (`0x0B`)
and `PROC_CALL` (`0x02`) are confirmed NON-terminal by direct disassembly
(`PROC_LABEL`'s handler is the plain `ProcCmd_NOP` -- `proc_scrCur += 8;
return TRUE;`; `PROC_CALL`'s `ProcCmd_CALL_ROUTINE` advances then calls).

**Deterministic strict-prefix decode.** For a candidate `(addr, size)`,
decode 8-byte records, bounded to `[addr, addr+size)`, until one of:
  - a valid `PROC_END` (opcode 0, dataImm 0, dataPtr 0) -- SUCCESS immediately,
    wherever it occurs (even mid-object: a larger candidate may legitimately
    hold several concatenated scripts back-to-back, e.g. `data_08601748`);
  - a `TERMINAL_OPCODES` record that is ALSO the object's own LAST record
    (nothing more fits in `[addr, addr+size)` after it) -- SUCCESS, no
    `PROC_END` required. If instead more of the SAME object's declared bytes
    remain, decoding continues normally through it like any other record
    (these opcodes still advance/stay within the object -- only stop early
    here when there truly is nothing left to read in THIS object; the
    overwhelmingly common in-tree pattern is still `PROC_REPEAT(...),
    PROC_END,` and must keep consuming that trailing `PROC_END` normally);
  - any record fails a strict validity check (`opcode > 0x19`; a
    non-pointer-bearing opcode's `dataPtr != 0`; a pointer-bearing opcode's
    non-null `dataPtr` outside `[ROM_LO, ROM_HI)`) -- REJECTED, not a script;
  - the NEXT record would read past `addr + size` (i.e. the object's own
    declared bytes run out right after a NON-terminal, non-`PROC_END`,
    non-`TERMINAL_OPCODES` record) -- MALFORMED (a genuine truncation: this
    object plainly IS ProcCmd data, per its already-valid preceding records,
    but ends without a valid terminator -- reported, never silently accepted,
    and the decode never reads into whatever symbol happens to follow in
    ROM);
  - `MAX_RECORDS` exceeded without terminating -- REJECTED (bounded; not
    realistically reachable for real data, since an object's OWN declared
    size bounds the loop far sooner in practice).
A zero/negative-size symbol is never a decode candidate (skipped explicitly,
reported for visibility) -- it has no bytes of its own, so any "decode" would
necessarily read a different symbol's memory. A symbol placed in a `.bss_<N>`
NOLOAD "phantom placement" region (see `load_noload_ranges`) is NOT
automatically excluded -- its `nm` address is not PROVEN to correspond to
real bytes at `gba_file[addr - ROM_BASE]` (demonstrated:
`gProcScr_GameControl` decodes a false truncation there), but a NOLOAD
candidate that decodes CLEANLY is still trusted (demonstrated:
`ProcScr_efxThunderBG`, also NOLOAD, decodes its true content correctly).
Only a NOLOAD candidate whose decode does NOT cleanly terminate is treated
as unreliable and silently excluded (see `find_script_prefixes`).

Symbols are deduplicated by ADDRESS before decoding (many names -- aliases,
or two independent objects that happen to start at the same place -- can
share one underlying byte sequence; decoding it twice would be wasted work,
and reporting relocation status per-address rather than per-name avoids
double-counting). Every name mapped to an address that HAS a missing
relocation is still listed in the report, so an alias (e.g.
`frontier_df4_banim_a_010_5FF7C8 == ProcScr_efxFireOBJ`) is visible under
both names.

Baseline mode (default): requires a real `R_ARM_ABS32` relocation at every
non-null pointer-bearing `dataPtr` field of every successfully-decoded script
prefix. Exits nonzero on any missing relocation, any malformed (truncated)
object, or an unexpected relocation on a field that is never a pointer (the
opcode/dataImm word, a null pointer-bearing field, or a non-pointer-bearing
opcode's `dataPtr`).

Shifted A/B mode (`--shifted-gba`): given a `+shift` ROM built by
`build_shifted_rom.sh`, additionally proves for every audited pointer-bearing
`dataPtr` field: the shifted word equals `baseline_target + shift` (or stays
NULL).

Usage:
  scripts/shiftcheck/audit_procscr_relocs.py
  scripts/shiftcheck/audit_procscr_relocs.py --shifted-gba /tmp/fireemblem8_shifted.gba --shift 0x40000
"""
import argparse
import bisect
import re
import subprocess
import sys

ROM_BASE = 0x08000000
ROM_HI = 0x0A000000
RECORD_SIZE = 8  # sizeof(struct ProcCmd): short opcode + short dataImm + const void* dataPtr
MAX_RECORDS = 512  # a safety cap; real decodes are bounded far sooner by the object's own size

# Mirrors include/proc.h's PROC_* macro table (and scripts/depoint_procscr.py's
# OPCODES dict): every opcode whose macro's third field is a real operand
# rather than the literal `0`.
POINTER_OPCODES = frozenset({0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08,
                             0x09, 0x0A, 0x0D, 0x14, 0x16, 0x18})
KNOWN_OPCODES = frozenset(range(0x00, 0x1A))  # 0x00..0x19, per include/proc.h

# Opcodes whose handler is confirmed (source/disassembly; see module
# docstring "Terminal opcodes") to never meaningfully fall through to a
# following record under normal script advancement. An object may
# legitimately end immediately after one of these with no PROC_END.
TERMINAL_OPCODES = frozenset({0x03, 0x0C, 0x0D, 0x10})  # PROC_REPEAT, PROC_GOTO, PROC_JUMP, PROC_BLOCK

RELOC_SECTION_RE = re.compile(r"^RELOCATION RECORDS FOR \[(.+)\]:$")
ABS32_RELOC_RE = re.compile(r"\s*([0-9A-Fa-f]{8})\s+R_ARM_ABS32\s+(.+)$")
ROM_OUTPUT_SECTION = ".rom"
NOLOAD_SECTION_RE = re.compile(r"^\.bss_\d+\s+(0x[0-9A-Fa-f]+)\s+(0x[0-9A-Fa-f]+)$")


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


def decode_prefix(buf, addr, size, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                   record_size=RECORD_SIZE, max_records=MAX_RECORDS):
    """Try to decode a STRICT `struct ProcCmd` prefix starting at `addr`,
    bounded STRICTLY to the candidate's own declared extent `[addr, addr+size)`
    (`size` must be the object's OWN `nm -S` size; a decode NEVER reads a byte
    outside this range, regardless of content -- see module docstring).

    Returns {"events": [...], "terminated": bool, "truncated": bool}:
      - terminated=True: a valid PROC_END or a TERMINAL_OPCODES record ended
        the script within bounds. `events` holds the full decoded record list.
      - truncated=True: the object's own bytes ran out immediately after a
        NON-terminal, non-PROC_END record (a genuine malformed truncation --
        `events` holds whatever was validly decoded before the cutoff).
      - both False: outright rejected (an invalid record, an out-of-bounds
        read with nothing yet decoded, `size <= 0`, or the MAX_RECORDS cap) --
        this address is simply not ProcCmd data; `events` may be empty.

    Each record yields two events (mirroring audit_glyph_relocs.py's
    dict-event style so misuse is caught the same structural way):
      {"kind": "opcode-field", "source": rec_addr}
      {"kind": "ptr-field", "source": ptr_addr, "target": dataptr, "opcode": ...,
       "pointer_bearing": bool}
    """
    reject = {"events": [], "terminated": False, "truncated": False}
    if size <= 0:
        return reject
    obj_end = addr + size
    if not (rom_lo <= addr < rom_hi) or obj_end > rom_hi:
        return reject

    events = []
    cur = addr
    for _ in range(max_records):
        if cur + record_size > obj_end:
            # This object's own declared bytes ran out. If we already decoded
            # at least one valid (non-terminal) record, this is a genuine
            # truncation -- report it, and NEVER cross into whatever symbol
            # happens to follow in ROM to look for a terminator.
            return {"events": events, "terminated": False, "truncated": bool(events)}

        opcode = read_u16(buf, rom_lo, cur)
        if opcode is None or opcode not in KNOWN_OPCODES:
            return {"events": events, "terminated": False, "truncated": False}

        ptr_addr = cur + 4
        dataptr = read_u32(buf, rom_lo, ptr_addr)
        if dataptr is None:
            return {"events": events, "terminated": False, "truncated": False}

        pointer_bearing = opcode in POINTER_OPCODES
        if pointer_bearing:
            if dataptr != 0 and not (rom_lo <= dataptr < rom_hi):
                return {"events": events, "terminated": False, "truncated": False}
        else:
            if dataptr != 0:
                return {"events": events, "terminated": False, "truncated": False}

        if opcode == 0x00:
            dataimm = read_u16(buf, rom_lo, cur + 2)
            if dataimm != 0:
                return {"events": events, "terminated": False, "truncated": False}

        events.append({"kind": "opcode-field", "source": cur})
        events.append({"kind": "ptr-field", "source": ptr_addr, "target": dataptr,
                        "opcode": opcode, "pointer_bearing": pointer_bearing})

        if opcode == 0x00:
            # A valid PROC_END always ends the script immediately, wherever
            # it occurs -- even mid-object (a larger candidate may legitimately
            # hold several concatenated scripts; only the FIRST one is this
            # particular prefix, see the module docstring's "extra size beyond
            # terminator" case).
            return {"events": events, "terminated": True, "truncated": False}

        cur += record_size
        if opcode in TERMINAL_OPCODES and cur + record_size > obj_end:
            # A TERMINAL_OPCODES record (PROC_REPEAT/GOTO/JUMP/BLOCK) that is
            # ALSO the object's own last record: no PROC_END is required after
            # it (see "Terminal opcodes" in the module docstring). If instead
            # more of THIS object's own bytes remain, keep decoding normally --
            # these opcodes still advance proc_scrCur/stay within the object,
            # so a well-formed script may legitimately continue past one (the
            # overwhelmingly common in-tree pattern is `PROC_REPEAT(...),
            # PROC_END,`; only stop early here when there is truly nothing
            # left to read in this object).
            return {"events": events, "terminated": True, "truncated": False}

    return {"events": events, "terminated": False, "truncated": False}  # exceeded the cap


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


def find_script_prefixes(buf, addr_sizes, rom_lo=ROM_BASE, rom_hi=ROM_HI,
                          record_size=RECORD_SIZE, max_records=MAX_RECORDS,
                          min_records=2, noload_ranges=(), verify_split_continuations=True,
                          verify_zero_size_backstop=True):
    """Decode a strict, object-extent-bounded ProcCmd prefix at every
    `(addr, size)` in `addr_sizes` (size = that address's OWN `nm -S` size;
    every candidate is a distinct ELF symbol value, already deduplicated by
    the caller).

    `noload_ranges`: sorted `[(start, end), ...]` NOLOAD "phantom placement"
    regions (see `load_noload_ranges`). A NOLOAD address's bytes at
    `gba_file[addr - ROM_BASE]` are not proven reliable, so a decode that does
    NOT cleanly terminate there is untrustworthy either way and is silently
    dropped (never reported malformed, never promoted) -- but a decode that
    DOES cleanly terminate is trusted regardless of NOLOAD status: a
    coincidental multi-record valid-looking chain is not realistically
    reachable (see the opcode-validity-odds reasoning above), so clean
    termination IS this address's real content. Demonstrated both ways in
    the same project: `ProcScr_efxThunderBG` sits in a NOLOAD range yet
    decodes correctly (one of the 10 originally-fixed glyph-adjacent
    literals) and MUST stay a normal candidate; `gProcScr_GameControl` sits
    in a different NOLOAD range and decodes a non-terminal `PROC_LABEL` at
    its declared end that its OWN compiled assembly proves is wrong (the true
    content, per `gamecontrol_08009E68.s`, ends in a valid `PROC_END`) and
    MUST NOT be reported as a false "malformed truncation".

    `min_records` (default 2) filters out a bare lone `PROC_END`/single-record
    decode as noise: any all-zero 8-byte word pair coincidentally satisfies
    decode_prefix as a trivially valid, zero-slot "script", and all-zero
    padding/BSS-adjacent bytes are common throughout the ROM for reasons that
    have nothing to do with ProcCmd data. A genuine script always has at
    least one real command before its terminator, so requiring >=2 records
    keeps every real script/truncation while dropping that specific
    zero-content noise source; it never suppresses an actual
    missing-relocation finding (such a trivial "script" has zero pointer
    slots to audit either way).

    `verify_split_continuations` (default True): when a NONZERO-size
    candidate is genuinely truncated (see decode_prefix), retry the SAME
    decode with its size extended up to (never past) the END of up to 4
    contiguous following candidate addresses in `addr_sizes` -- i.e. the
    next physically-contiguous, independently linked/named object(s) in ROM
    order. If THAT extended decode terminates validly, the "truncation" is a
    source-level carving artifact (the true script was split across two
    adjacent C symbols in the SAME section, verified via THIS project's own
    reference ELF/ROM -- not assumed), not a real defect; it is promoted
    into `prefixes` using the extended events (so its pointer fields ARE
    still relocation-audited) and reported separately in
    `split_continuations` for transparency. It stays in `truncated` only if
    extending does not reach a valid terminator. Demonstrated real case:
    `gProcScr_CharacterEndings` (176 B, ends in a non-terminal `PROC_CALL`)
    is immediately followed, in the same `.data.frontier_df4_ending.gap1`
    section, by `frontier_df4_ending_gap1_r0` -- a plain `u32[]` whose first
    4 records are the script's genuine `PROC_GOTO(100)`/`PROC_LABEL(100)`/
    `PROC_CALL(Fin_End)`/`PROC_END` tail (matching the region-diff comment
    already in `src/data/frontier_df4_ending/frontier_df4_ending.c`); its one
    pointer (`Fin_End`) is already a real symbol reference, not a raw
    literal, so this extension finds zero missing relocations.

    `verify_zero_size_backstop` (default True): the SAME deterministic
    extension mechanism, generalized to a ZERO-size candidate (no declared
    extent at all -- e.g. a bare assembly label inside a still-untyped raw
    `.s` blob that is nonetheless a genuine `Proc_Start()` target). The
    candidate's decode is retried bounded up to the end of up to 4 following
    candidate addresses (never an unrelated inferred guess -- the SAME
    bounded-walk helper used for split continuations); only a FULLY validly
    terminated decode is promoted (into `prefixes`, reported separately in
    `zero_size_recovered`). A zero-size candidate whose extended decode does
    NOT terminate validly stays honestly reported in `zero_size` (a genuine,
    currently-unrecoverable blind spot -- never silently claimed as safe).
    This is NOT a guess: this project's ROM is one fully packed, contiguous
    16 MB image (`docs/parallel-carving.md`/shiftcheck README: no slack, no
    gaps), so "up to the next independently-addressed candidate" is a real,
    load-bearing upper bound on any object's true extent, not an assumption.

    Returns (prefixes, truncated, zero_size, noload_skipped, split_continuations,
             zero_size_recovered):
      prefixes: {addr: events} for every address whose decode TERMINATED
        validly with >= min_records (including verified split continuations,
        verified zero-size recoveries, AND any NOLOAD-range address that
        nonetheless decoded cleanly).
      truncated: {addr: events} for every NON-NOLOAD, NONZERO-size address
        that ran out of its own declared bytes after >= min_records
        non-terminal records AND whose extended-decode verification (if
        attempted) did not reach a valid terminator either -- a genuine
        malformed truncation, reported, never silently dropped or extended
        into an unverified neighboring symbol.
      zero_size: sorted list of every candidate address whose declared size
        was <= 0 AND whose extended-decode backstop (if attempted) did not
        reach a valid terminator either -- an honestly-reported, currently
        unrecoverable blind spot, never silently decoded unbounded.
      noload_skipped: sorted list of every candidate address inside a NOLOAD
        range whose decode did NOT cleanly terminate (and was not a verified
        split continuation) -- excluded because its bytes are not proven
        reliable there, not because it is malformed.
      split_continuations: sorted list of every NONZERO-size address promoted
        from `truncated` into `prefixes` via the extended-decode verification.
      zero_size_recovered: sorted list of every ZERO-size address promoted
        into `prefixes` via the same extended-decode verification.
    """
    size_by_addr = dict(addr_sizes)
    sorted_addrs = sorted(size_by_addr)
    prefixes = {}
    truncated = {}
    zero_size = []
    noload_skipped = []
    split_continuations = []
    zero_size_recovered = []

    def extended_bound(addr, size, max_hops=4):
        """Walk forward through immediately-adjacent candidates (no gap
        required -- the demonstrated case is perfectly contiguous, zero gap)
        to find a safe upper bound for a retry decode: the end of the
        Nth-next candidate object, capped at `max_hops` so this can never
        silently absorb an unbounded run of unrelated objects."""
        end = addr + size
        i = bisect.bisect_right(sorted_addrs, addr)
        bound = end
        for _ in range(max_hops):
            if i >= len(sorted_addrs):
                break
            nxt = sorted_addrs[i]
            if nxt < bound:
                i += 1
                continue
            bound = max(bound, nxt + size_by_addr[nxt])
            i += 1
        return bound if bound > end else None

    for addr, size in addr_sizes:
        if size <= 0:
            if verify_zero_size_backstop:
                bound = extended_bound(addr, 0)
                if bound is not None:
                    recovered = decode_prefix(buf, addr, bound - addr, rom_lo, rom_hi,
                                               record_size, max_records)
                    if recovered["terminated"] and len(recovered["events"]) >= min_records * 2:
                        prefixes[addr] = recovered["events"]
                        zero_size_recovered.append(addr)
                        continue
            zero_size.append(addr)
            continue

        result = decode_prefix(buf, addr, size, rom_lo, rom_hi, record_size, max_records)
        if len(result["events"]) < min_records * 2:
            continue

        if result["terminated"]:
            # A successful, validly-terminated decode is trusted regardless
            # of NOLOAD status: a coincidental multi-record valid-looking
            # chain is not realistically reachable (see module docstring), so
            # if the bytes read this cleanly they ARE this symbol's real
            # content. Demonstrated real case: `ProcScr_efxThunderBG` sits in
            # a `.bss_42 (NOLOAD)` "region-diff (incbin)" range exactly like
            # `gProcScr_GameControl`'s `.bss_205`, yet decodes its true,
            # PROC_END-terminated 3-record script correctly and was one of
            # the 10 originally-fixed glyph-adjacent literals -- NOLOAD alone
            # does not mean "unreadable"; only a FAILED decode in a NOLOAD
            # range is untrustworthy (see below).
            prefixes[addr] = result["events"]
            continue

        if not result["truncated"]:
            continue

        if verify_split_continuations:
            bound = extended_bound(addr, size)
            if bound is not None:
                extended = decode_prefix(buf, addr, bound - addr, rom_lo, rom_hi,
                                          record_size, max_records)
                if extended["terminated"] and len(extended["events"]) >= min_records * 2:
                    prefixes[addr] = extended["events"]
                    split_continuations.append(addr)
                    continue

        if in_noload_range(addr, noload_ranges):
            # A decode that does NOT cleanly terminate, on a candidate whose
            # bytes at `gba_file[addr - ROM_BASE]` are not proven reliable
            # (NOLOAD "phantom placement" -- see load_noload_ranges), cannot
            # be trusted as a genuine truncation either: demonstrated real
            # case `gProcScr_GameControl` (`.bss_205`) decodes a
            # non-terminal `PROC_LABEL` at its declared end when read this
            # way, but its OWN compiled assembly proves the true content ends
            # in a valid `PROC_END` -- the raw ROM read is simply wrong there,
            # not a real bug. Silently excluded (not reported as malformed),
            # never promoted into `prefixes` either.
            noload_skipped.append(addr)
            continue

        truncated[addr] = result["events"]

    zero_size.sort()
    noload_skipped.sort()
    split_continuations.sort()
    zero_size_recovered.sort()
    return (prefixes, truncated, zero_size, noload_skipped, split_continuations,
            zero_size_recovered)


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

def load_rom_symbols(elf, prefix="arm-none-eabi-"):
    """addr -> (sorted list of every symbol NAME at that address, size).

    `nm -S` emits TWO distinct line shapes, and both must be parsed:
      - a SIZED line: `ADDR SIZE TYPE NAME` (4 fields);
      - a ZERO-SIZE line: `ADDR TYPE NAME` (3 fields, no size column at all --
        NOT "size omitted as 0", the column is simply absent). An earlier
        version of this parser required `len(parts) >= 4`, silently DROPPING
        every 3-field line before it ever reached the zero-size bucket --
        262,885 of ~285,980 total `nm -S` lines in this ELF are 3-field, so
        `zero-size (skipped): 0` was reporting a false negative (11,473 ROM
        addresses exist ONLY as a 3-field line and were never even candidates
        at all, live or explicit-skip). Both shapes are now parsed explicitly
        by their OWN field count -- never inferred, never guessed -- and a
        3-field line is size=0, correctly routed to the explicit `zero_size`
        bucket in `find_script_prefixes` (never silently omitted, never given
        an inferred/borrowed extent from an unrelated neighboring symbol).

    If multiple nm lines share an address with different sizes (true
    aliases report identical sizes, as verified for
    `ProcScr_efxFireOBJ`/`frontier_df4_banim_a_010_5FF7C8`; a 3-field
    zero-size line and a 4-field sized line can ALSO share an address, e.g. a
    debug/local alias of an otherwise-sized global), the LARGEST reported
    size is kept, since decode_prefix's own per-record validity checks make a
    too-generous bound safe (it can only ever accept MORE candidate records,
    still individually validated and still terminated by the same
    PROC_END/TERMINAL_OPCODES rule) whereas a too-small bound could wrongly
    report a real script as truncated.

    Deliberately UNFILTERED by nm type (global/local/absolute-alias): a
    static local, a global object, and an alias can all be legitimate
    ProcCmd script entry points, and duplicate addresses are naturally
    deduplicated by using address as the dict key (see module docstring) --
    there is no ambiguity to route around here, in contrast to a NAME-keyed
    source-declaration scan.
    """
    out = subprocess.check_output([prefix + "nm", "-S", elf], text=True, errors="replace")
    return parse_nm_s_output(out)


def parse_nm_s_output(text, rom_lo=ROM_BASE, rom_hi=ROM_HI):
    """Pure parser: `nm -S` text -> {addr: (sorted names, size)}, ROM-ranged.

    Factored out of `load_rom_symbols` so the exact 3-field/4-field line-shape
    logic (see that function's docstring for the bug this fixes) is directly
    unit-testable against realistic `nm -S` text, not just already-parsed
    tuples."""
    by_addr = {}
    for line in text.splitlines():
        parts = line.split()
        if len(parts) == 4:
            addr_s, size_s, _typ, name = parts
        elif len(parts) == 3:
            addr_s, _typ, name = parts
            size_s = "0"
        else:
            continue  # unexpected shape (e.g. an undefined 2-field `U` entry
                      # in a non-final-linked object) -- skip defensively,
                      # never guess a field mapping.
        try:
            addr = int(addr_s, 16)
            size = int(size_s, 16)
        except ValueError:
            continue
        if rom_lo <= addr < rom_hi:
            names, cur_size = by_addr.get(addr, ([], 0))
            names.append(name)
            by_addr[addr] = (names, max(cur_size, size))
    for addr in by_addr:
        by_addr[addr][0].sort()
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


def load_noload_ranges(map_path, rom_lo=ROM_BASE, rom_hi=ROM_HI):
    """Sorted [(start, end), ...] ROM-range NOLOAD "phantom placement" regions
    from the `.map` file (every `.bss_<N>` output section in this project's
    generated `ldscript.txt` is declared `(NOLOAD)` -- verified 249/249 in the
    committed build -- so the `.bss_<N>` name alone is a reliable signal).

    A NOLOAD section reserves no space in the flat `.gba` file at its declared
    address for the general case: `region-diff (incbin)` symbols are a
    placeholder for content whose real backing may live at a different
    (often JP-equivalent) address. Reading `gba_file[addr - ROM_BASE]` for
    such a symbol is therefore NOT PROVEN reliable -- but it is not always
    wrong either, so this range list is used only to gate WHICH decode
    OUTCOMES are trusted (see `find_script_prefixes`), never to reject a
    candidate address outright:
      - `gProcScr_GameControl` (`.bss_205`) decodes a non-terminal `PROC_LABEL`
        at its declared end when read this way, but its OWN compiled
        assembly (`gamecontrol_08009E68.s`) proves the true content ends in a
        valid `PROC_END` 122-record script -- this raw read is simply WRONG,
        and reporting the mismatch as "malformed" would be a false positive.
      - `ProcScr_efxThunderBG` (`.bss_42`, ALSO `region-diff (incbin)`)
        decodes its true, correct, PROC_END-terminated 3-record script
        (one of the 10 originally-fixed glyph-adjacent literals) when read
        the exact same way -- NOLOAD alone does not mean "unreadable".
    """
    ranges = []
    with open(map_path, errors="replace") as f:
        for line in f:
            m = NOLOAD_SECTION_RE.match(line)
            if not m:
                continue
            start = int(m.group(1), 16)
            size = int(m.group(2), 16)
            if rom_lo <= start < rom_hi and size > 0:
                ranges.append((start, start + size))
    ranges.sort()
    return ranges


def in_noload_range(addr, noload_ranges):
    """True if `addr` falls inside any (start, end) NOLOAD range. Linear scan
    is fine here: ~249 ranges total, checked against ~23k candidates once."""
    for start, end in noload_ranges:
        if start <= addr < end:
            return True
        if addr < start:
            break  # ranges are sorted; no further range can contain addr
    return False


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
    ap.add_argument("--map", default="fireemblem8.map",
                    help="linker map (used to exclude NOLOAD phantom-placement addresses)")
    ap.add_argument("--prefix", default="arm-none-eabi-")
    ap.add_argument("--shifted-gba", help="optional +shift ROM (build_shifted_rom.sh) for the A/B proof")
    ap.add_argument("--shift", default="0x40000")
    ap.add_argument("--limit", type=int, default=40)
    args = ap.parse_args()

    shift = int(args.shift, 0)

    with open(args.gba, "rb") as f:
        rom = f.read()

    symbols = load_rom_symbols(args.elf, args.prefix)
    relocs = load_rom_abs32_relocs(args.relocs_elf, args.prefix)
    noload_ranges = load_noload_ranges(args.map)
    addr_sizes = [(addr, size) for addr, (_, size) in symbols.items()]
    (prefixes, truncated, zero_size, noload_skipped, split_continuations,
     zero_size_recovered) = find_script_prefixes(rom, addr_sizes, noload_ranges=noload_ranges)

    print("=" * 78)
    print("Structural ProcCmd relocation audit (strict-decoded script prefixes, all ROM symbols)")
    print("=" * 78)
    n_reports = sum(len(symbols[a][0]) for a in prefixes)
    print(f"candidate symbol addresses: {len(symbols)}  NOLOAD (skipped): {len(noload_skipped)}  "
          f"zero-size (skipped): {len(zero_size)}  zero-size (recovered): {len(zero_size_recovered)}  "
          f"script prefixes found: {len(prefixes)}  (symbol name reports: {n_reports})  "
          f"truncated (malformed): {len(truncated)}  "
          f"verified split-continuations: {len(split_continuations)}")
    for addr in split_continuations:
        print(f"  SPLIT-CONTINUATION addr=0x{addr:08X} names={symbols[addr][0]} "
              f"(genuine script split across adjacent same-section symbols; "
              f"verified terminated + relocation-audited as one)")
    for addr in zero_size_recovered[:args.limit]:
        print(f"  ZERO-SIZE-RECOVERED addr=0x{addr:08X} names={symbols[addr][0]} "
              f"(no declared nm size; extent recovered from the next known "
              f"candidate address(es) and fully relocation-audited)")
    if len(zero_size_recovered) > args.limit:
        print(f"  ... +{len(zero_size_recovered) - args.limit} more")

    # Honest blind-spot inventory: zero-size candidates whose name suggests a
    # ProcCmd/script table but which the zero-size backstop could NOT
    # terminate validly (so they are correctly excluded, not silently
    # dropped). This is a deterministic, reproducible list -- re-running this
    # script reproduces the same names/addresses every time.
    proc_like_unrecovered = sorted(
        addr for addr in zero_size
        if any("proc" in n.lower() for n in symbols[addr][0])
    )
    print(f"zero-size candidates with a Proc-like name that remain UNRECOVERED "
          f"(honest blind spot, not audited as scripts): {len(proc_like_unrecovered)}")
    for addr in proc_like_unrecovered:
        print(f"  ZERO-SIZE-UNRECOVERED addr=0x{addr:08X} names={symbols[addr][0]} "
              f"(no declared nm size; backstop decode did not terminate validly "
              f"within the available candidate extent; NOT claimed as an "
              f"audited ProcCmd script)")

    total_records = 0
    total_slots = 0
    total_relocated = 0
    all_missing = []
    all_malformed = []

    for addr in sorted(prefixes):
        result = audit_prefix(prefixes[addr], relocs)
        names = symbols[addr][0]
        total_records += result["records"]
        total_slots += result["slots"]
        total_relocated += result["relocated"]
        all_missing.extend({"addr": addr, "names": names, **m} for m in result["missing"])
        all_malformed.extend({"addr": addr, "names": names, **m} for m in result["malformed"])

    for addr in sorted(truncated):
        names = symbols[addr][0]
        result = audit_prefix(truncated[addr], relocs)
        all_missing.extend({"addr": addr, "names": names, **m} for m in result["missing"])
        all_malformed.extend({"addr": addr, "names": names, **m} for m in result["malformed"])
        all_malformed.append({"addr": addr, "names": names, "reason": "truncated-at-object-end",
                               "records_decoded": len(truncated[addr]) // 2})

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
            all_mismatches.extend({"addr": addr, "names": symbols[addr][0], **m} for m in mismatches)
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
