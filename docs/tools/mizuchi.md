# Mizuchi — matching-decomp pipeline orchestrator (pilot)

[macabeus/mizuchi](https://github.com/macabeus/mizuchi) is a TypeScript pipeline
runner for **matching decompilation**: it loops *generate C → compile → diff
against the target object*, driving Claude to converge on byte-for-byte assembly.
It bundles four things we care about:

1. a **plugin pipeline** (`m2c` → `decomp-permuter` → **Claude Runner** →
   **Compiler** → **Objdiff** → optional **Integrator**),
2. **objdiff-wasm** for in-process instruction/byte diffing and a match score,
3. a **codebase indexer** (`mizuchi-db.json`: functions, asm, call graph, and
   *vector embeddings* of each function), and
4. the **Decomp Atlas** web UI — a similarity "function cloud" plus a one-click
   rich-prompt builder.

This doc covers how it's set up for FE8J, how to run it, and an honest
recommendation relative to our existing IDA / Ghidra / decomp-permuter loop
(see [`docs/reverse-engineering.md`](../reverse-engineering.md)).

## What got set up (all local, gitignored)

| Piece | Location | Tracked? |
|-------|----------|----------|
| Setup script | `scripts/tools/mizuchi/setup.sh` | ✅ yes |
| FE8J config | `scripts/tools/mizuchi/mizuchi.yaml` | ✅ yes |
| This doc | `docs/tools/mizuchi.md` | ✅ yes |
| Vendored build (clone + `node_modules` + UIs + venvs, ~540 MB) | `tools/mizuchi/` | ❌ gitignored |

`setup.sh` is idempotent (`set -euo pipefail`). It:
- clones `macabeus/mizuchi` into `tools/mizuchi/` (skips if present);
- fetches the optional `vendor/m2c` and `vendor/decomp-permuter` submodules over
  **HTTPS** (mizuchi's `.gitmodules` pins SSH URLs, which fail keyless — the
  script rewrites them);
- runs `npm install`, `npm run build` (CLI → `dist/cli.js`), and `npm run
  build:ui` (the run-report + Decomp Atlas single-file webapps);
- sets up the optional m2c / decomp-permuter Python venvs, **preferring `uv`**
  (this host lacks `python3-venv`/ensurepip, so mizuchi's own `python3 -m venv`
  scripts fail; uv works and matches our `scripts/permuter/setup.sh` convention);
- prints the CLI entrypoint and usage.

Run it with:
```bash
bash scripts/tools/mizuchi/setup.sh
```

## Running it for FE8J

The CLI entrypoint is `node tools/mizuchi/dist/cli.js` (package bin: `mizuchi`).
Three subcommands: `index-codebase`, `atlas`, `run`.

**Config placement matters.** Mizuchi treats *the directory containing the
config* as the project root and resolves `mapFilePath`, `nonMatchingAsmFolders`,
etc. relative to it. Our tracked config at `scripts/tools/mizuchi/mizuchi.yaml`
is written for the **repo root**, so copy/symlink it there before running:

```bash
# from /home/laqieer/fireemblem8j
ln -sf scripts/tools/mizuchi/mizuchi.yaml ./mizuchi.yaml   # or: cp

node tools/mizuchi/dist/cli.js index-codebase --config mizuchi.yaml
node tools/mizuchi/dist/cli.js atlas         --config mizuchi.yaml   # http://localhost:3000
ANTHROPIC_API_KEY=sk-ant-... \
  node tools/mizuchi/dist/cli.js run         --config mizuchi.yaml
```

(Passing `--config scripts/tools/mizuchi/mizuchi.yaml` directly would make
`scripts/tools/mizuchi/` the project root, and `fireemblem8.map` etc. would
resolve to the wrong place. The config still *parses* either way — see below.)

Running from the repo root generates transient state there: the `./mizuchi.yaml`
copy/symlink, the codebase index `mizuchi-db.json`, the `prompts/` sets, and the
`outputDir` writes — timestamped files `run-report-<ts>.html` / `run-results-<ts>.json`
(and `partial-*` variants) plus the `claude-cache.json` cache. These are all
**already gitignored** (see `.gitignore`), so following the steps above will not
dirty the working tree or risk committing tool state. If you point `outputDir` /
`promptsDir` elsewhere, ignore those paths too.

### Required environment / prerequisites
- `ANTHROPIC_API_KEY` — needed **only** for `run` (the Claude Runner). `index-codebase`
  and `atlas` work without it. A cached Claude Code login is also honored. **Never
  hardcode the key**; the config documents it as an env var only.
- `tools/agbcc`, `baserom.gba`, `fireemblem8.map` present (same as `make compare`).
  The compiler script in the config mirrors the Makefile C rule:
  `cpp | iconv UTF-8→CP932 | agbcc … -O2 -fhex-asm | arm-none-eabi-as`,
  plus the trailing `.text` / `.align 2, 0`, then `scripts/apply_patches.py` on the
  produced `.o`. Three details:
  - **`-Werror` is intentionally dropped**, exactly as the sibling
    `scripts/permuter/compile.sh` does. `-Werror` is diagnostic-only (no codegen
    effect); in a generate-and-search loop we want a valid-but-warning candidate to
    still compile so it can be scored, not be killed mid-search. The real acceptance
    gate is unchanged — see the last bullet.
  - **The context script emits *resolved* C, not a bare `#include`.** Mizuchi runs its
    own `cpp -P` on `context + candidate` from a temp dir with no include flags, so a
    bare `#include "global.h"` would fail there before our compiler script ever runs.
    `getContextScript` therefore preprocesses `global.h` (from the repo root, with the
    agbcc include flags) and emits the expanded header text. It uses `cpp -dD` so the
    project's `#define`s survive in the context too — otherwise plain `cpp -P` strips
    every macro and a candidate using FE8J macros (`ARRAY_COUNT`, `TRUE`/`FALSE`,
    `TILEREF`, `UNIT_*`, …) would see them undefined when mizuchi reprocesses
    `context + candidate`, and fail to compile even though the real `src/` build resolves
    them via `#include "global.h"`.
  - **`apply_patches.py`** is re-run on the object, as the Makefile does — a no-op
    unless the `.o` basename matches a row in `layout/patches.tsv`. **Limitation:**
    mizuchi names the temp object `<functionName>.o` and never passes the real target
    object path to the script, so for the few **patched** TUs (the `banim-efxmagic-*`
    objects in `layout/patches.tsv`) this can't match and objdiff sees the *unpatched*
    form. Do **not** trust mizuchi's diff %/Integrator for those functions — verify
    them with `make compare` only.
  - **`make compare` remains the only oracle** — a green mizuchi diff (warnings, patched
    TUs, or otherwise) must still pass it before anything is committed.
- Embeddings (for the Atlas similarity cloud) want Python 3.10+ and download
  `torch`/`transformers` (~2–3 GB, jina-embeddings-v2). Skip with
  `index-codebase --skip-embeddings` if you only want the function list.

### Config notes (FE8J specifics)
- `target: gba` → objdiff `arm.archVersion: v4t` (ARM7TDMI), permuter
  `compilerType: gcc` (agbcc is GCC 2.x-era) — both consistent with our
  `permuter_settings.toml`.
- `mapFilePath: fireemblem8.map`, `nonMatchingAsmFolders: [asm]` (FE8J carves
  descriptive `.s` flat under `asm/`, baseline in `asm/baserom.s`).
- `getContextScript` preprocesses `global.h` (the FE8J convention) and emits the
  *expanded* C with `cpp -dD`, so mizuchi's pre-compile `cpp -P` (run with no include
  flags) has fully-resolved types *and* the project's `#define`s — see the
  prerequisites note above on why a bare `#include` doesn't work here and why the
  macros must be preserved.
- The **Integrator** plugin (auto-open worktree → drop C into `src/` → `make
  compare` → commit/PR) is left **disabled** on purpose: FE8J carving is
  currently script-gated and we want a human/loop to guard `make compare`
  regressions before automating commits.

## Smoke-test status (this worktree)

The worktree lacks `tools/agbcc` / `baserom.gba` / `fireemblem8.elf|map`
(gitignored & absent) and `ANTHROPIC_API_KEY`, so the **full pipeline was not
run** here. What was verified:

- `setup.sh` runs clean end-to-end: clone, HTTPS submodule fetch, `npm install`,
  `npm run build`, `npm run build:ui` (both webapps built), and the m2c +
  decomp-permuter venvs set up via uv (`graphviz`, `pycparser<3 / toml /
  Levenshtein` all import).
- CLI help works: `--help`, `index-codebase --help`, `run --help`, `atlas --help`.
- `mizuchi.yaml` parses against mizuchi's real zod `configFileSchema`
  (`loadConfig()` returns `target=gba`, resolved `mapFilePath`, all four plugin
  sections).

The `run` / `index-codebase` / `atlas` execution against the real ROM is for the
coordinator to run on a full checkout with the toolchain + API key present.

## Maturity assessment + recommendation

**Recommendation: PILOT-ONLY (Decomp Atlas as a triage/UX layer); DEFER the
`run` auto-pipeline.** It does not replace our IDA/Ghidra/permuter loop.

### What mizuchi uniquely adds over our current loop
- **Decomp Atlas UI + embeddings.** Our loop has no function browser. Atlas gives
  a searchable list, a similarity "cloud" (find functions that look like ones
  we've already matched — genuinely useful for batching region-*same* carves),
  per-function scoring to pick the next target, and a **one-click rich-prompt
  builder**. This is the most compelling, lowest-risk piece.
- **objdiff-wasm match %** in-process. We diff via `arm-none-eabi-objdump` +
  permuter scoring; objdiff gives a percentage and a structured mismatch list
  (INSERTION/REPLACEMENT/OPCODE/ARGUMENT) that's nice for a feedback loop and for
  the report UI.
- **A turnkey generate→compile→diff retry loop** with caching and an HTML report.
  We orchestrate this ad hoc via Claude Code + `make compare`.

### Where it overlaps (and why ours is currently stronger)
- **Claude-drives-decomp** is exactly what our headless loop already does — but
  ours is grounded by **IDA Hex-Rays + Ghidra pseudo-C of the actual JP ROM**
  (`docs/reverse-engineering.md`), which is decisive for the ~16 genuinely
  **region-different** functions that are all that's left of the *code*. Mizuchi's
  Claude Runner gets only the asm + a context header and a `compile_and_view_assembly`
  tool — no decompiler pseudo-C, no JP-vs-US diff. For region-different work that's
  a weaker starting point than what we already have.
- **decomp-permuter** — mizuchi wraps the same upstream permuter we already run
  standalone (`scripts/permuter/`). No new capability, just a different driver;
  and ours is already byte-validated against the agbcc pipeline.
- **m2c** is MIPS-oriented; on ARM/Thumb its output is weak. Enabled as a
  best-effort seed, not a matcher.
- **objdiff vs `make compare`.** objdiff's match% is advisory; **`make compare`
  (sha1 of the linked ROM) remains the only oracle.** A mizuchi "100% / 0 diffs"
  must still pass `make compare` before anything is committed.

### Risks / caveats
- **Bigger picture mismatch.** FE8J is ~94% *data* (by ROM volume); see
  `docs/frontier.md` for the current code-matching frontier (~389 unmatched functions
  at 95.44% matching-C). Mizuchi targets function matching, which is now a smaller
  but still real slice of remaining work.
- **Cost/throughput.** The `run` loop spends API tokens per function with up to 25
  retries; without IDA/Ghidra grounding it will burn more for less on the hard
  functions than our existing loop.

### Context / compaction discipline for a matching loop (pret/decomp.me consensus)

A transferable lesson regardless of whether we pilot mizuchi's `run`: **aggressive
context compaction HURTS reverse-engineering** — it lowers the resolution of the
problem space the model needs to keep in view. Empirically, long single-session runs
"go rogue" / forget the primary task around ~20 attempts in. Mitigations that the
field found work:

- **Move the goal into the SYSTEM prompt** (not just the running transcript) so it
  survives long loops.
- **Prefer fresh-session-per-function** (Ralph-style) with tight per-function context
  over one giant accumulating session.
- Mizuchi itself is built on the **Claude Agent SDK (not Claude Code) with NO
  auto-compact**, and reports cost ~linear in attempts and **no unrailing past 25
  attempts** — i.e. for this matching loop, NOT compacting is better than compacting.
- **Vendored weight.** ~540 MB (node_modules + 2 venvs + torch on first index).
  Gitignored, but non-trivial to keep around.
- **Host friction we already hit & worked around:** SSH submodule URLs (→ rewrote
  to HTTPS) and missing `python3-venv` (→ uv). Both handled in `setup.sh`.

### Suggested next step if we pilot
Run `index-codebase --skip-embeddings` + `atlas` on a full checkout and try the
**prompt builder** on one already-matched function to compare its generated prompt
against what our IDA/Ghidra flow produces. If Atlas's similarity cloud helps batch
region-*same* carves, keep it as a triage UI. Only consider the `run` pipeline if
we first feed it IDA/Ghidra pseudo-C in the prompt (custom `systemPrompt`/context),
so it isn't strictly weaker than our existing loop. Until then it stays a pilot,
and `make compare` stays the oracle.
