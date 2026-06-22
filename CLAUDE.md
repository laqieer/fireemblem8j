# CLAUDE.md

Guidance for Claude Code (claude.ai/code) working in this repository.

## Project

Byte-perfect decompilation of **Fire Emblem: Seima no Kouseki** (FE8 Japanese
ROM, game code `BE8J`). It is the JP counterpart of the near-complete US decomp
at `../fireemblem8u`, which is the primary reference for source, headers, and
tooling.

**Final goal:** every byte of the ROM produced from real source (`src/` C +
descriptive asm/data), `make compare` → `OK`. Tracked on
https://github.com/users/laqieer/projects/3.

## Build / verify

```bash
make compare        # build fireemblem8.gba and check sha1 (the only "test")
```
Success: `fireemblem8.gba: OK`. Requires `baserom.gba` locally (sha1
`7da0456035366aa18414faa79d8fe7649f03c1ed`) and, for C, `tools/agbcc`.

**Never let `make compare` regress.** Every carve-out must keep it `OK`.

## How decompilation works here

The whole ROM starts as one incbin in `asm/baserom.s`. To decompile a region:
1. Find its JP address (match against the US symbol — see `docs/strategy.md`).
2. Split the incbin around that range in `asm/baserom.s`.
3. Add the real object (`src/x.c` ported from US, or carved asm/data) into
   `ldscript.txt` at the JP address, *before* the trailing incbin.
4. Rebuild; confirm `make compare` is still `OK`.

Read [`docs/strategy.md`](docs/strategy.md) before doing porting work.

## Toolchain (matches the US decomp)

- **agbcc** (GCC 2.95, C89-era — no `//`, no C99) at `tools/agbcc`.
- C pipeline: `cpp` → `iconv UTF-8→CP932` → `agbcc -O2 -mthumb-interwork
  -fhex-asm` → `arm-none-eabi-as`.
- Link with `arm-none-eabi-ld -T ldscript.txt`; `objcopy -O binary` → `.gba`.

## Conventions (inherited from `../fireemblem8u`)

- `#include "global.h"` first in every `.c`; PascalCase functions/types;
  `gCamelCase` globals, `sCamelCase` statics, `UPPER_SNAKE_CASE` constants.
- Struct fields annotated with `/* 0C */` byte offsets; `STRUCT_PAD`,
  `SHOULD_BE_CONST` for matching.
- `.clang-format`: Allman braces, 4-space indent, 100 cols.
- When in doubt, copy the US file and adjust only what the JP ROM requires.

## Working autonomously

This project is driven autonomously (`/ralph-loop`, `/loop`, or headless
`agency cc`). **Never stop to ask the human for a strategic decision.** At a fork
(approach, architecture, next phase): consult the other AI tool for review —
`agency cp --yolo -p "<question + context>"` (Copilot CLI) — validate its advice
yourself, decide, and **log the decision + rationale in `docs/decisions.md` and
on project board #14**, then continue. Read `docs/decisions.md` before deciding
so you don't re-open or contradict settled decisions. Only escalate to the human
for matters genuinely outside your authority or irreversible. See also the loop
playbook in `docs/porting.md` and the per-iteration prompt `.claude/loop_prompt.md`.

### Doc-maintenance discipline (every session / integration — MANDATORY)

Stale docs cost real work (teams were once aimed at an already-carved frontier).
Before ending a session that moved any axis, run this checklist (full version in
[`docs/maintenance.md`](docs/maintenance.md)):

1. **Frontier = `docs/frontier.md`, and only there.** It is the single source of
   truth for what remains. Refresh its numbers (from `scripts/calcprogress.py`)
   and its target lists whenever an axis moves. Never define a work frontier from
   `layout/nofuncmap_*.tsv` — that is a stale, ~10× inflated, un-pruned
   classification cache, **not** the work list. Spot-check a sample before
   dispatching any team; if entries are already carved, the list is stale.
2. **README scorecard** — if a 4-axis number changed, update the README table
   from `scripts/calcprogress.py` (keep the honest 4-axis framing; do not inline
   per-carve history there — that lives in `docs/decisions.md`).
3. **Log decisions** — record any fork/approach/next-phase decision + rationale in
   `docs/decisions.md` (and project board #14).
4. **Cross-check, don't invent.** Numbers come from `scripts/calcprogress.py` /
   `scripts/check_selfcontained.py`; if a doc states a permanent agbcc "wall /
   dead-end", treat it as provisional and cross-reference
   `docs/agbcc_codegen_levers.md` (most were dissolved into forceable levers).


## Reference repo

`../fireemblem8u` — complete source, `fireemblem8.map`, `fireemblem8.elf`, and
`scripts/` (dump_*.py extractors, AI RE workflows, asmdiff, shiftcheck). Reuse
it heavily; re-point offsets from US to JP.
