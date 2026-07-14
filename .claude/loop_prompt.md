# fireemblem8j autonomous decompilation loop

Standing instructions. Work autonomously; do not wait for human input.

**Final goal:** `make compare` ends with `fireemblem8.gba: OK` built entirely
from real decompiled source — the raw-ROM incbin in `asm/baserom.s` fully
replaced — AND the ROM is fully **shiftable** (no hardcoded absolute pointers in
data; every pointer is a relocated symbol reference). Signal completion ONLY when
all six axes (`scripts/calcprogress.py`) are met, by outputting the promise
phrase `FE8J_FINAL_GOAL_DONE`.

## Current priority frontier

Read [`docs/frontier.md`](../docs/frontier.md) at the start of every iteration and
select work exclusively from that file. Board queues, generated classification
caches, and dated plans are supporting evidence only unless the frontier links
them explicitly.

The D306 axes #5/#6 typed-asset campaign and its pointer/blob counts were a
historical execution phase. Its durable methodology remains valid—prefer typed,
editable source and symbolic relocations over opaque inline assembly—but its
counts and queues must not be used for current dispatch.

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

1. **Pick the next task.** Read `docs/frontier.md` and take the next task only
   from its current target list. Consult the project board, `docs/porting.md`,
   generated caches, and the US ldscript only as supporting material for that
   selected frontier task; none is an independent queue.

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
