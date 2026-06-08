# FE8J decomp — session handoff / autonomous-loop state

**Read this first.** Living state for the autonomous drive toward the final goal
(every byte of `asm/baserom.s` incbin replaced by real source; `make compare` →
`fireemblem8.gba: OK` from real source). Keep it current; `scripts/auto_drive.sh`
+ cron and any continuing session use it.

## Verified state (update each working stretch)

- **Functions decompiled: 1153 / 8,528 = 13.5%** (`python3 scripts/calcprogress.py`).
- **Carved objects: 278.** `make compare` → OK. Build is always byte-perfect
  (`port_run` verifies every carve and reverts non-matches).
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
     - **"no diff parsed", +ram+romdata — `.bss` overlap. PARTLY FIXED.**
       - **DONE:** COMMON IWRAM globals are now resolved as INDIVIDUAL absolute
         symbols (port_run, `*COM*` → `new_syms`), since the linker's weak common
         yields to the absolute def → no NOLOAD block, no overlap. Plus `.bss`/`*COM*`
         added to the trimmer for unreferenced statics. **Carved `agb_sram` (277→278).**
       - **STILL BLOCKED (`bm`, `bmarena`, `bmmap`, `bmmind`, `bmsave-multiarena`,
         `cp_decide`, `sio_core`):** the deeper cause — the ldscript's FIRST
         `(COMMON)`-collecting block (`rng.o(COMMON)` in `.bss_0` @ 0x03000000)
         absorbs ALL orphan COMMON from every object. The map shows **m4a.o
         contributes 0x1250 bytes of COMMON there** (sound work-RAM), making `.bss_0`
         span [0x03000000,0x0300126f]. When a new carve shifts COMMON allocation it
         collides with `soundwrapper`/`agb_sram` globals that sit INSIDE m4a's region
         (shared sound RAM). **Next fix:** route orphan COMMON to correct JP addresses
         (resolve m4a's work-RAM common as an absolute sym at its real JP addr) OR add
         a dedicated non-overlapping `(COMMON)` sink in `ldscript.template.txt` placed
         before `.bss_0`. Verify m4a's work-RAM JP address first (is 0x03000020 real
         or bogus-but-NOLOAD-harmless?). Gated by `make compare`.
       - **KEY NUANCE (verified 2026-06-08):** the EXACT same overlap (`.bss_20`
         soundwrapper @0x03000038, 8B ⊂ `.bss_0` [0x03000000,0x0300126f]) is present
         AND TOLERATED in the green 278-obj build — soundwrapper's sMusicProc1/2 live
         *inside* m4a's sound work-RAM region (shared RAM, legitimately co-located).
         The error fires only when a NEW carve is added, even with COMMON-absolute on.
         So it's an ld overlap-detection trigger, not just the addresses. Likely real
         fix: make soundwrapper/agb_sram-style **defined `.bss` globals that sit inside
         another object's region resolve as ABSOLUTE syms** (the defined-.bss-global →
         absolute extension, one step beyond the COMMON-absolute fix already shipped),
         so no separate `.bss_N` block is emitted to collide. Needs fresh focused work.
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
