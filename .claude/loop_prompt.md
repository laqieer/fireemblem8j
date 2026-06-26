# fireemblem8j autonomous decompilation loop

Standing instructions. Work autonomously; do not wait for human input.

**Final goal:** `make compare` ends with `fireemblem8.gba: OK` built entirely
from real decompiled source — the raw-ROM incbin in `asm/baserom.s` fully
replaced — AND the ROM is fully **shiftable** (no hardcoded absolute pointers in
data; every pointer is a relocated symbol reference). Signal completion ONLY when
all six axes (`scripts/calcprogress.py`) are met, by outputting the promise
phrase `FE8J_FINAL_GOAL_DONE`.

## CURRENT PRIORITY FRONTIER — SHIFTABILITY (axis #5, D296/D297/D299)

A real decomp must relocate every pointer or it crashes when sections shift.
Honest state: **67.88% literal / 69.02% real shiftable; 5,238 REAL hardcoded
pointers remain** (`scripts/audit_pointers.py --metrics`). 0 dangling.

- **TWO HARD RULES (do not relearn these):**
  1. **Effectiveness, not just make compare (D299).** `make compare` OK does NOT
     mean a de-pointering worked. Every `asm/dat_*.s` that incbins residual data
     is an EXCLUDED placeholder; editing it is a DEAD no-op that still passes.
     De-point the LINKED source (`src/data/<name>_ref/dat_<name>_ref.c` or the
     sliced `src/data/<name>/<name>.c`), and VERIFY the relocated count rose
     (`audit_pointers.py` hardcoded fell). The converter now skips the asm path.
  2. **fe8u is the correctness gate, not byte-exactness (D297).** make compare
     catches only function-target thumb-bit mistakes; a DATA-field coincidental
     constant in ROM range is byte-exact now but a SILENT crash-on-shift. Convert
     ONLY at fe8u-confirmed pointer offsets (`scripts/fe8u_ptr_offsets.py`), never
     on density. The `--fe8u-safe` mode does this for `_ref` tables + extends to
     un-named `data_<JPaddr>` via region-shift address mapping with offset-
     alignment self-validation.
- **Lever (run, then VERIFY hardcoded fell):** `repoint_table.py --fe8u-safe`
  (handles `_ref` tables). Commit only if make compare OK AND the auditor's
  hardcoded count actually dropped.
- **The bulk (~4,990 real) is in sliced `src/data/<name>/<name>.c` tables**
  (`INCBIN_U8(bin, off, len)` sub-symbols, mostly un-named `data_*`). NEXT
  MECHANISM TO BUILD: a sliced-source rewriter — for each sub-symbol convert its
  slice to `.4byte` gated by that sub-symbol's fe8u offsets (named) or per-slice
  `data_<JPaddr+off>` address mapping (un-named); rewrite the LINKED .c, not asm.
  Then the JP-divergent EventScr bytecode. Per-table, multi-session.

## When orchestrating background agents (P9 wave mode) — DO THIS EVERY TICK FIRST

**`python3 scripts/wave_status.py`** — it tells you, in one shot, how long since
`main` advanced, which `origin/feat/*` branches have UNINTEGRATED commits, which
agents are low-yield, and which carve levers are EXHAUSTED. Then:

1. **Integrate on cadence, NOT on completion.** If a branch has ≥1 unintegrated
   commit and `main` is stale (>45 min), MERGE IT NOW — do not wait for the agent
   to "complete". Agents run for hours or hoard commits; `main` must keep advancing.
   (The 2026-06-13 7-hour stall: agents alive + committing to branches, but the
   orchestrator waited for completion and never integrated → `main` frozen.)
2. **Never re-dispatch an EXHAUSTED lever** (wave_status.py lists them: perm2/​perfrag/​CF
   are swept on both address halves). Re-sweeping them yields ~0 and burns hours.
   Dispatch only PRODUCTIVE levers (const_diff_carve.py on the FAR constant-diff
   residue; pure-const-array US TUs; NAME-data; permuter for true-codegen FAR).
3. **Time-box waves.** If wave_status flags a branch as low-yield (>2 h, <2 commits),
   inspect its log and stop/re-target — don't let it thrash.
4. After exhausting a lever, ADD it to `EXHAUSTED` in `scripts/wave_status.py` and
   note it in `docs/decisions.md` so no future wave repeats it.

## Each iteration: ONE small verifiable increment

1. **Pick the next task.** Read the board (`gh project view 3 --owner laqieer`,
   issues #14 grind TUs in ROM order, #15 extend layout coverage) and
   `docs/porting.md`. Normally: the next translation unit in US ldscript ROM
   order (`../fireemblem8u/ldscript.txt`). If TUs are blocked on unmapped
   symbols, instead extend coverage with `scripts/match_us_jp.py` /
   `scripts/data_addr_map.py`.

2. **Do the work** using **per-function-run porting** (decision D1 in
   `docs/decisions.md`) — NOT whole-file. Whole-file porting is done for the easy
   files; the frontier needs per-function granularity so one region-different
   function doesn't block a whole file.
   - **First, if the run-aware tooling doesn't exist yet, build it**: extend
     `scripts/locate_tu.py`/`port_tu.py` to (a) locate each function of a US `.c`
     individually (its own masked search; use `layout/us_jp_funcmap.tsv` for
     exact/masked anchors), (b) group *consecutive matching* functions into
     contiguous JP runs, (c) compile each run as a subset `.c` (only that run's
     functions) and carve it at the run's JP range. Validate on an
     already-ported file (e.g. rng) that it reproduces the same bytes.
   - Region-different (non-matching) functions stay in the incbin baseline,
     exposed as typed baseline syms (`layout/baseline_syms.tsv`); they become the
     queue for behavioural JP decompilation.
   - Resolve external refs via `layout/us_jp_funcmap.tsv` + `layout/addr_map.tsv`
     + literal-pool/BL decoding (CHECK votes/conflicts — single-vote or
     odd-region entries can be wrong). Add manifest rows, then `make layout`.
   Reminder: baseline-resident calls MUST be typed-Thumb syms or the linker
   inserts interwork veneers that break the byte match.

3. **Verify (hard invariant).** `make compare` MUST end with
   `fireemblem8.gba: OK`. If it regressed, revert this iteration's changes and
   try a smaller increment. NEVER commit or push a red build.

4. **Commit + push.** One TU/change per commit, clear message. `git push`.
   Update the relevant board issue (comment progress, check off items).

5. **Stuck-detection.** If the same approach fails twice, comment the blocker on
   the board issue and switch to a different task. If genuinely blocked on every
   actionable task, stop and post a summary (do NOT emit the promise unless the
   final goal is actually reached).

## Guardrails
- Keep `make compare` green at all times; small atomic commits.
- Don't bash the same wall repeatedly — switch tasks.
- Toolchain (agbcc, arm-none-eabi binutils) and the reference repo
  `../fireemblem8u` (source, headers, scripts) are already set up.

## Strategic decisions — DECIDE AUTONOMOUSLY, never wait for the human
At any fork (which approach/architecture/next phase), do NOT stop to ask the
user. Per the project README: consult the other AI tool for a second opinion —
`agency cp --yolo -p "<question with context>"` (Copilot CLI) — then validate it
yourself, decide, **log the decision + rationale in `docs/decisions.md` and on
board #14**, and keep working. Read `docs/decisions.md` first so you don't
re-litigate or contradict prior decisions (e.g. D1 = per-function-run porting).
Only escalate to the human for things truly outside your authority or
irreversible.

After finishing an iteration, restate this standing instruction (read
.claude/loop_prompt.md and perform the next iteration) so the loop continues.
