# fireemblem8j autonomous decompilation loop

Standing instructions. Work autonomously; do not wait for human input.

**Final goal:** `make compare` ends with `fireemblem8.gba: OK` built entirely
from real decompiled source — the raw-ROM incbin in `asm/baserom.s` fully
replaced — AND the ROM is fully **shiftable** (no hardcoded absolute pointers in
data; every pointer is a relocated symbol reference). Signal completion ONLY when
all six axes (`scripts/calcprogress.py`) are met, by outputting the promise
phrase `FE8J_FINAL_GOAL_DONE`.

## CURRENT PRIORITY FRONTIER — fe8u-STYLE TYPED ASSET EXTRACTION (axes #5+#6 together, D306)

**Axis #5 is NOT complete (D305 "gate=0" RETRACTED by D306).** The inline-asm
`__asm__ { .4byte sym }` de-pointering (relocated 7,639 → 14,383) was a byte-exact
*interim patch*, not the real goal, and it left blind spots: (a) **364 real pointers
stuck in `.4byte 0x08xxxxxx` literals** in __asm__ blocks (`audit_pointers.py
--true-debt --gate` now counts them), and (b) **pointers inside COMPRESSED data**
(Huffman text, LZ77 banim/gfx) that no `0x08`-word scan can see and no `.4byte` can fix.

**The correct approach (user-directed): extract each region to its proper fe8u asset
type, NOT inline-asm.** Pointers then become symbolic by construction (shiftable) AND
the data is editable AND compressed assets work (re-compressed from source). Most assets
are SHARED with fe8u → reuse/re-point; the main JP-specific delta is **text** (text-id
offset + UI localization). Per type:
- **Text**: fe8u message-text system (JP Huffman `CompressedText_MSG` + `gMsgHuffmanTable`).
- **Graphics**: `.4bpp`/`.gbagfx` (LZ77 at build), reuse fe8u.
- **Battle-anim scripts**: fe8u `banim/` (`animscr_*.s`, `banim_*_modes.bin`, `*_motion`).
  JP has 224 raw `AnimScr_*`/`AnimSpr_*` blobs to extract this way.
- **Maps / music / SFX**: fe8u map data / m4a song data.

Method: for each region, identify its TYPE + fe8u counterpart (check `../fireemblem8u`),
extract/re-point to the fe8u asset (decompress compressed ones), keep `make compare` OK.
The two HARD RULES still hold (D299: edit LINKED source, verify via the LINKER; D297:
fe8u is the correctness gate). Also retire the 364 stuck-literal real pointers as their
tables get properly typed. See `docs/frontier.md` + the `data-extractor` agent.

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
