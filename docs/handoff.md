# FE8J decomp — session handoff / autonomous-loop state

**Read this first.** Living state for the autonomous drive toward the final goal
(every byte of `asm/baserom.s` incbin replaced by real source; `make compare` →
`fireemblem8.gba: OK` from real source). Keep it current; any continuing/driven session uses it. (The `auto_drive.sh`
cron was DISABLED 2026-06-08 — see decisions.md D8; the launched agent kept
getting SIGTERM-killed mid-task and the frontier is now region-different.)

## Verified state (update each working stretch)

- **Functions decompiled: 1234 / 8,528 = 14.5%** (`python3 scripts/calcprogress.py`).
- **Carved objects: 293.** `make compare` → OK. Build is always byte-perfect
  (`port_run` verifies every carve and reverts non-matches).
- **NEW PATH — `scripts/carve_mapped.py` (find_runs blind spot):** find_runs only
  proposes a run it can UNIQUELY locate by masked search, so it SKIPS small/
  pointer-heavy functions even though `match_us_jp.py` already located them in JP
  (funcmap). carve_mapped groups a TU's funcmap-mapped funcs into JP-consecutive
  runs and feeds them to `port_run.port(..., runs=...)` directly (verify-or-revert
  still guards). Carved +7 (bmarch, bmio, bmmap, bmsave-multiarena, classchg-event,
  cp_decide, unitlistscreen). **Re-run it each session; ~21 mapped funcs still
  uncarved (scene 15, chapterdata 4, spinning_arrow, worldmap_text) fail because the
  ISOLATED subset compile doesn't reproduce the in-context JP bytes — next lead.**
  (Earlier "no path remains / region-different exhausted" was WRONG — this class
  was the gap; keep mining funcmap-mapped functions before declaring exhaustion.)
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
       all first @ 0x373c: catastrophic misplacement. ROOT LEAD (2026-06-08):
       port_run computes romdata `.rodata` base = **0x080E20FA — MISALIGNED** (the
       `.data` base 0x085FFB88 is fine). A misaligned `.rodata` carved_rom entry
       cascades through gen_layout's sorted-gap/incbin computation → everything from
       0x373c shifts. The `.rodata` base = `jp[base+off] - ss[1]` is likely wrong
       because the referenced `.rodata` symbol is region-different (JP offset ≠ US
       `ss[1]`). BUT these are graphics-heavy region-different banim effects (many
       Img_*/Pal_*/AnimScr_* pointers) — a correct base likely still leaves
       region-different content diffs. Lower priority than Phase-3 no-runs.
     - **no-runs ×15 — Phase 3 (hand-decompile) is now the ONLY remaining class with a path.** compile-fail class CLEARED (worldmap_path: forward-ref prototype; bmbattle: incremental-trim fallback). Every generalizing-fixable class is resolved; the rest (15 no-runs region-different code, ~9 compound romdata near-misses, 3 huge-diff banim) needs per-function hand-decompilation via ida/ghidra+permuter — sessions per carve, not turns.
3. **Phase 3 — region-different CODE** (`no verified runs`): hand-decompile the
   functions in `ida`/`ghidra` (decompile by JP address), write `src/` C matching
   the JP behaviour, byte-match with the permuter, then carve + `make compare`.
   - **CONFIRMED region-different (2026-06-08):** `match_us_jp.py` runs BOTH exact AND
     masked (pointer-word-wildcarded) matching → 7739/8528 mapped. The ~789 unmapped
     functions (the 15 no-run TUs) failed BOTH tiers — their non-pointer instruction
     bytes genuinely differ JP-vs-US. No generalizing fix remains; each needs real RE.
   - **REQUIRES an interactive, MCP-connected session.** The `ida`/`ghidra` MCP
     servers are configured (~/.claude.json) but are NOT reachable in a headless run
     (ToolSearch returns no RE tools) — so Phase-3 carves cannot be done headless/in
     the cron; they need a normal interactive session with the MCP servers live.
     `fireemblem8.elf` (JP, AArch32) + `../fireemblem8u/fireemblem8.elf` are on disk
     for `make ida-db` / `make ghidra-db`.
   - **Nature of the differences (probed 2026-06-08, MCP-free):** the no-run funcs
     differ by (a) different INSTRUCTIONS (0 masked hits in JP for the smallest one)
     and (b) hardcoded region-different IMMEDIATE constants baked into code, e.g.
     bmarch `GetBallistaItem` is `movs r0,#19` (a JP-different item ID — NOT a reloc,
     NOT an addr_map address). A lenient pointer-only mask gives FALSE 1-hit matches;
     find_runs' reloc-accurate mask correctly gives 0 bases. So no automated
     mask/remap path exists — each needs the JP value read from the disassembly (RE).

## Rules

- `make compare` must stay `OK` — never commit a carve that isn't byte-perfect.
- Decompiler/permuter output is a hypothesis, never committed as-is.
- Don't leave a broken build or stray `src/*.c` (the harvester cleans up on exit).
- Update this file + the TaskList before ending any session.
