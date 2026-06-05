# fireemblem8j autonomous decompilation loop

Standing instructions. Work autonomously; do not wait for human input.

**Final goal:** `make compare` ends with `fireemblem8.gba: OK` built entirely
from real decompiled source — the raw-ROM incbin in `asm/baserom.s` fully
replaced. Signal completion ONLY when that is achieved by outputting the
promise phrase `FE8J_FINAL_GOAL_DONE`.

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
