# FE8J decomp — session handoff / autonomous-loop state

**Read this first.** Living state for the autonomous drive toward the final goal
(every byte of `asm/baserom.s` incbin replaced by real source; `make compare` →
`fireemblem8.gba: OK` from real source). Keep it current; `scripts/auto_drive.sh`
+ cron and any continuing session use it.

## Verified state (update each working stretch)

- **Functions decompiled: 963 / 8,528 = 11.3%** (`python3 scripts/calcprogress.py`).
- **Carved objects: 237.** `make compare` → OK. Build is always byte-perfect
  (`port_run` verifies every carve and reverts non-matches).
- ~81 uncarved candidate TUs remain (`.text` 0x40..0x8000); the automated frontier
  has **converged** — what's left is region-different.

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
2. **Phase 2 — region-different DATA:** TUs that masked-verify but fail `make
   compare`. Two sub-classes (profiled): (a) **link errors** (a referenced data
   global's JP address isn't resolved — read it from the JP literal pool, like the
   fontgrp example, add to `layout/baseline_syms.tsv`); (b) **near-misses** — a
   region-different RAM layout, where placing a `.bss`/IWRAM section as one block
   lands one symbol wrong.
   - **RESOLVED (port_run addend bug) — `animedrv` (was 1-byte miss @ 0x5231):**
     the run did `&gOam[0x100]` → a `.word gOam` literal with an **addend of 0x400**.
     port_run's named-undef R_ARM_ABS32 path read the *final* JP literal
     (`0x030034e0`) and stored it as gOam's symbol value WITHOUT subtracting the
     addend, so the linker re-added 0x400 → wrote `0x030038e0`. Fix: subtract the
     in-section addend (`otext[off:off+4]`) just like the section-symbol paths
     already do → gOam value = `0x030030e0`, linker re-adds 0x400 = `0x030034e0` ✓.
     This generalizes to **every extern referenced at a non-zero offset** (indexed
     RAM globals). `animedrv` carved (run 0x08004F48). The remaining `animedrv` run
     (0x08004D48, AnimUpdateAll…) still fails on a region-different `ewram_data`
     block — a genuine class (b) near-miss for the loop to take next.
3. **Phase 3 — region-different CODE** (`no verified runs`): hand-decompile the
   functions in `ida`/`ghidra` (decompile by JP address), write `src/` C matching
   the JP behaviour, byte-match with the permuter, then carve + `make compare`.

## Rules

- `make compare` must stay `OK` — never commit a carve that isn't byte-perfect.
- Decompiler/permuter output is a hypothesis, never committed as-is.
- Don't leave a broken build or stray `src/*.c` (the harvester cleans up on exit).
- Update this file + the TaskList before ending any session.
