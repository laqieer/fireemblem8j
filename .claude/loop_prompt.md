# fireemblem8j autonomous decompilation loop

Standing instructions. Work autonomously; do not wait for human input.

**Final goal:** `make compare` ends with `fireemblem8.gba: OK` built entirely
from real decompiled source — the raw-ROM incbin in `asm/baserom.s` fully
replaced — AND the ROM is fully **shiftable** (no hardcoded absolute pointers in
data; every pointer is a relocated symbol reference). Signal completion ONLY when
all six axes (`scripts/calcprogress.py`) are met, by outputting the promise
phrase `FE8J_FINAL_GOAL_DONE`.

## CURRENT PRIORITY FRONTIER — SHIFTABILITY (axis #5, D296)

The largest remaining frontier is NOT the 31 asm functions — it is the **11,149
hardcoded absolute ROM pointers** still baked into raw-incbin data (`make compare`
is byte-perfect but the ROM is only ~44% shiftable; a real decomp must relocate
every pointer or it crashes when sections shift). Track + drive this every tick:

- **Audit:** `python3 scripts/audit_pointers.py [--metrics]` (axes #5/#6). 0 dangling.
- **Safe auto-levers (run first each tick, both EXHAUSTED now):**
  `repoint_table.py --auto-safe` (every ROM-range word resolves EXACT) and
  `--auto-dense --frac=0.5` (pointer-dense tables). Both emit a pure `__asm__`
  block of `.4byte sym` (no C decl -> no header conflict). Commit if make compare OK.
- **The CORRECTNESS gate is fe8u, NOT byte-exactness** (D297). `make compare` only
  catches function-target mistakes (thumb bit -> +1 byte); a DATA-field coincidental
  constant (a `struct UnitDefinition` AI/flag word that happens to be 0x08xxxxxx) is
  byte-exact now but a SILENT crash-on-shift. So:
  - SAFE to bulk-convert: EXACT words; pure pointer arrays; fe8u `Type *NAME[]`
    array-of-pointers (every slot is a pointer; JP filling a US-NULL slot is benign).
  - NOT safe on density alone: struct arrays (`struct UnitDefinition[]`,
    `struct ClassData[]`) -> convert ONLY fe8u-confirmed pointer offsets via
    `scripts/fe8u_ptr_offsets.py <NAME>` (reads fe8u .o relocations = the pointer
    slots). The converter already refuses INTERIOR-into-function (off>1).
- **Track B (the bulk — ~9,681 left, struct-array + generic blobs):** for each
  table, get fe8u's pointer offsets (`fe8u_ptr_offsets.py`), handle the struct
  STRIDE + JP divergence, convert only those slots, `make compare`. OR full
  fe8u-structured port (also retires axis #6 editability + naming). Per-table,
  multi-session. NEVER bulk-convert a struct array on density (D297).

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
