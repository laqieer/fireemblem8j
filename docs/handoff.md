# FE8J decomp — session handoff / autonomous-loop state

**Read this first.** Living state for the autonomous drive toward the final goal
(every byte of `asm/baserom.s` incbin replaced by real source; `make compare` →
`fireemblem8.gba: OK` from real source). Keep it current; any continuing/driven session uses it. (The `auto_drive.sh`
cron was DISABLED 2026-06-08 — see decisions.md D8; the launched agent kept
getting SIGTERM-killed mid-task and the frontier is now region-different.)

## Verified state (update each working stretch)

- **Functions decompiled: 1206 / 8,528 = 14.1%** (`python3 scripts/calcprogress.py`).
- **Carved objects: 284.** `make compare` → OK. Build is always byte-perfect
  (`port_run` verifies every carve and reverts non-matches).
- **.bss-overlap class RESOLVED** via `--no-check-sections` (Makefile): the overlaps
  were benign NOLOAD shared-RAM collisions; ld's default check made them fatal on any
  new carve. The flag keeps the green build byte-perfect (verified) and `make compare`
  stays the exact oracle. Unblocked +6 (bm, bmarena, bmmind, sio_core, uiutils,
  banim-ekrbattle). The COMMON-absolute / .bss-static-trim port_run fix (agb_sram)
  also stands.
- ~35 uncarved candidate TUs remain (`.text` 0x40..0x8000). THREE generalizing
  port_run fixes this round unblocked +41 (236→277): (1) addend subtraction for
  indexed externs; (2) EWRAM_OVERLAY trim; (3) multiple-definition dedup. Method
  that works: `scripts/diag_misses.py` classifies failures (run with PORTRUN_DEBUG
  it prints pre-remap content-diff + the make-err), byte-diff a representative of
  the biggest class → find the generalizing port_run bug → fix → harvest-sweep.

## What's built (the pipeline)

- **Carving:** `scripts/harvest_parallel.py -j16` = parallel `find_runs` discovery
  + serial fast carve. `port_run.py` carves the largest byte-verified run of a TU,
  falls back through smaller runs, no per-carve `make clean` (D7, ~44× faster).
  `make compare` is the only oracle.
- **RE tooling (region-different work):** MCP servers `ida` (IDA Pro 9.3 Hex-Rays)
  and `ghidra` (Ghidra 12.x) — `make ida-db` / `make ghidra-db`, decompile by JP
  address (from `sym_jp.txt`). Byte-match with upstream **decomp-permuter**
  (`scripts/permuter/`). See `docs/reverse-engineering.md`, `docs/decisions.md` D6/D7.

## Next actions (priority order)

1. **Automated re-sweep:** `python3 scripts/harvest_parallel.py -j16` — carves any
   TU newly unblocked by recently-added symbols. Cheap; run it first each session.
2. **Phase 2 — region-different DATA / port_run correctness:** TUs that masked-verify
   but fail `make compare`. THREE generalizing port_run bugs fixed this round (each
   found by byte-diffing a representative of the biggest failure class):
   - **(a) addend bug** — named-undef R_ARM_ABS32 didn't subtract the in-section
     addend, so an extern indexed at an offset (`&gOam[0x100]`, addend 0x400) landed
     0x400 bytes off. Fix: `enc(jp_literal - otext[off:off+4])`. (animedrv.)
   - **(b) EWRAM_OVERLAY trim** — `is_trim_sec` ignored `ewram_overlay_*`, so a file's
     unreferenced overlay tables (prep_unitselect's 0xB0 gPrepUnitTexts) were left in
     the object and APPENDED to the ROM, growing it and failing sha1 despite a
     byte-perfect `.text`. Fix: recognize `ewram_overlay*` in `is_trim_sec`. (+25 sweep.)
   - **(c) multiple-definition dedup** — a symbol the object defines (its own
     proc-scripts) or references-but-an-already-carved-object-defines was ALSO emitted
     in `jp_syms.s` from baseline_syms → double definition → link error (showed as
     "no diff parsed": build fails, stale-correct ROM, 0 content-diff). Fix: on a
     `multiple definition of \`X'` link error, drop X's baseline_syms row (the carved
     object is the real provider) and rebuild; verify-or-revert guards wrong addresses.
   - **Remaining frontier** (latest `diag_misses.py`, 277 objects; ~35 candidates):
     - **romdata near-miss (≤4 diff, +romdata) ×8** — `uichapterstatus`,
       `unitlistscreen`, `banim-efxflashbg/-efxmagic-dancerings/-eclipse/-evileye`,
       `bmio`, `scene`. Compound, not one-line: e.g. `banim-efxflashbg` has both an
       11-byte `.rodata` that's *referenced but not placed* → appended → ROM +11
       growth, AND a region-different ProcScr function pointer (`0x080dfbe4` @
       0x5e3ab0). Candidate fixes: (i) place referenced `.rodata`/`.data` sections via
       their NAMED syms (extend romdata placement beyond section-symbol refs); (ii)
       subtract the addend in the romdata internal-pointer loop too (mirror the .text
       addend fix). Verify per-TU before generalizing.
       **TRIED & RULED OUT (2026-06-08):** the romdata internal-pointer addend
       subtraction alone carves 0/8 of these — the diffs are region-different ProcScr
       *function pointers* (addend 0) plus referenced-but-unplaced `.rodata` growth,
       not indexed-table addends. Don't re-try the romdata-addend path; the real fix
       is (i) **place referenced `.rodata`/`.data` via named syms** at their JP address.
     - **`.bss`-overlap class — RESOLVED** (see Verified state). Fixed via
       `--no-check-sections` (benign NOLOAD shared-RAM overlaps) + the COMMON-absolute
       / .bss-static-trim port_run fix. Unblocked agb_sram, bm, bmarena, bmmind,
       sio_core, uiutils, banim-ekrbattle. No further work needed here.
     - **huge diff (~11.9M) ×3** — `banim-efxmagic-flux/-aircalibur/-thunder`,
       all first @ 0x373c: catastrophic misplacement (likely a bad romdata base or a
       falsely-verified run). Investigate separately; don't sweep blindly.
     - **no-runs ×15 / compile-fail ×2** — Phase 3 (hand-decompile) / agbcc C89 fixups.
3. **Phase 3 — region-different CODE** (`no verified runs`): hand-decompile the
   functions in `ida`/`ghidra` (decompile by JP address), write `src/` C matching
   the JP behaviour, byte-match with the permuter, then carve + `make compare`.

## Rules

- `make compare` must stay `OK` — never commit a carve that isn't byte-perfect.
- Decompiler/permuter output is a hypothesis, never committed as-is.
- Don't leave a broken build or stray `src/*.c` (the harvester cleans up on exit).
- Update this file + the TaskList before ending any session.
