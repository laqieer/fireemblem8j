# Decomp tooling investigation (2026-06-08)

Consolidated findings from investigating 10 external decompilation / reverse-engineering
projects for usefulness to this byte-perfect FE8 **Japanese** GBA decomp (agbcc, ARM/Thumb,
`make compare` SHA-1 oracle, US sibling `../fireemblem8u` as reference). Each project has a
detailed write-up under [`docs/tools/`](tools/); this file is the index, the verdicts, and the
**main-tree end-to-end results** (each set-up tool exercised against the real ROM/ELF).

Method: per-project research → set up the genuinely useful ones following repo conventions
(vendored clone/build in gitignored `tools/<name>/`, setup script in `scripts/tools/<name>/`,
per-tool doc in `docs/tools/`) → independent Copilot review on every PR → merge → integrated
e2e in the main tree.

## Verdicts

| Project | What it is | ARM/agbcc fit | Verdict | e2e against FE8J |
|---|---|---|---|---|
| simonlindholm/**asm-differ** | interactive `diff.py` asm differ | ARM32 ✓ | **set up** | ✓ raw-binary diff renders TARGET (baserom) vs CURRENT (build) — clean match |
| encounter/**objdiff** | per-symbol diff + match% report (Rust CLI) | ARM/GBA ✓ | **set up** | ✓ `objdiff-cli 3.7.2` runs; per-symbol `report` needs target objects carved from baserom (documented, partial) |
| matt-kempster/**m2c** | asm→C decompiler | `-t gba` `ArmGbaArch` ✓ | **set up** | ✓ produced seed C for the real Thumb function `AdvanceGetLCGRNValue` |
| ethteck/**coddog** | cross-binary function matcher (Rust) | GBA/Thumb ✓ (after patch) | **set up** | ✓ `compare2` found FE8J↔FE8U matches (AP_ExecFrame, AdvanceGetLCGRNValue, AnimSpr_* … 100%). **Fixed a real GBA-patch bug** (below). |
| macabeus/**mizuchi** | TS pipeline Claude→agbcc→objdiff-wasm + Atlas UI | GBA ✓ | **pilot / defer** | builds; full `run` needs `ANTHROPIC_API_KEY`; overlaps our IDA/Ghidra/permuter loop |
| WhenGryphonsFly/**decomp-permuter-agbcc** | decomp-permuter fork w/ agbcc defaults | native | **keep upstream** | fork is ~10 mo behind upstream; its one real fix (pipefail) is the single cherry-pick worth taking into our active `compiler_command` |
| JRickey/**frog-adv-temple** | sibling AI-driven agbcc GBA decomp | exact twin | **learn** | playbook captured in [frog-adv-temple-lessons.md](tools/frog-adv-temple-lessons.md); feeds the parallelization plan |
| macabeus/**kappa** | VS Code AI-decomp extension | via m2c/objdiff | **learn** | borrow ideas (AST-grep offset/`STRUCT_PAD` fixes, embeddings search); not a fit for our headless flow |
| decompme/**decomp.me** | collaborative scratch platform | hosted GBA+agbcc ✓ | **learn / hosted** | use hosted for hard functions; helper `scripts/tools/decompme/new_scratch.sh` (opt-in publish); no self-host (no docker) |
| neuromancer/**binary-comp** | MSVC 32-bit PE reconstruction verifier | x86 only ✗ | **skip** | n/a — no ARM/Thumb |

## Set up and in use

- **asm-differ** ([doc](tools/asm-differ.md)) — fills the gap between the all-or-nothing
  `make compare` and the permuter. Configured for ARM (`armel` + `-m arm -Mforce-thumb`
  scoped to raw-binary mode) to diff a function range in the built ROM against `baserom.gba`
  by file offset. e2e: `diff.py -m 0x<start> 0x<end>` rendered TARGET vs CURRENT identical.
- **objdiff** ([doc](tools/objdiff.md)) — per-symbol match% / progress reporting that
  `make compare` lacks. Prebuilt CLI (no cargo). `objdiff.json` covers representative carved
  `src/*.c` units; full `report` needs target objects produced from the baserom range. This
  is the per-symbol fast-iteration signal the parallelization plan relies on.
- **m2c** ([doc](tools/m2c.md)) — seed C for region-different functions. e2e:
  `objdump … | m2c.sh` produced compilable seed C for `AdvanceGetLCGRNValue`. Feed the seed
  to the AI/permuter loop; `make compare` remains the oracle.
- **coddog** ([doc](tools/coddog.md)) — FE8J↔FE8U cross-version triage (region-same → carve
  directly; region-different → hand-decompile). e2e: `compare2 … jp … us` found many 100%
  twins among the already-carved JP functions. **Coverage caveat** (documented): coddog only
  sees JP functions that already have real ELF sizes, so it confirms/triages carved code
  rather than enumerating the full remaining backlog.
  - **Bug fixed in this change:** the setup patch that teaches coddog's CLI `platform: gba`
    had a broken idempotency guard (`grep -q '"gba" => Some(Platform::Gba),'` matched the arm
    that already exists in `from_decompme_name`, so the patch to `from_name` — the function
    the CLI actually calls — was always skipped on a fresh clone, leaving `compare2`/`cluster`
    panicking `Invalid platform: gba`). Fixed to require **two** occurrences (one per
    function). Caught only by running `compare2` in the main tree (the worker smoke-test had
    used a manually-patched clone).

## Pilot / evaluate

- **mizuchi** ([doc](tools/mizuchi.md)) — set up and builds; recommended **pilot-only** (Atlas
  UI for triage), defer the auto `run` pipeline. It wraps the same upstream permuter and an
  m2c that is weak on Thumb; our IDA/Ghidra/permuter loop already grounds the model in real
  JP pseudo-C. Unique value is the similarity cloud + objdiff match%.
- **decomp-permuter-agbcc** ([doc](tools/decomp-permuter-agbcc.md)) — **keep upstream**. The
  fork trails upstream by ~10 months; the only worthwhile idea is adding `set -o pipefail` /
  routing through `compile.sh` in our active `permuter_settings.toml` `compiler_command` to
  avoid false-zero scores (deferred follow-up).

## Learn-only / skip

- **frog-adv-temple** ([lessons](tools/frog-adv-temple-lessons.md)) — the operational playbook
  for AI-driven agbcc GBA decomp (peel-first, brief-before-prompt, corpus-before-permuter,
  per-function progress, objdiff loop, worktree + serial integrator). Directly feeds the
  parallelization plan.
- **kappa** ([doc](tools/kappa.md)) — borrow ideas (AST-grep offset/`STRUCT_PAD` code-fixes,
  embeddings "find similar decompiled function", one-click decomp.me scratch); don't install
  (IDE-bound).
- **decomp.me** ([doc](tools/decomp-me.md)) — hosted GBA/agbcc scratches as an occasional aid;
  opt-in `new_scratch.sh` helper; no self-host.
- **binary-comp** ([doc](tools/binary-comp.md)) — **skip**; x86/MSVC-PE only, no ARM/Thumb,
  and it verifies an annotated reconstruction rather than matching two ROMs.

## How the set fits together

1. **Triage** which JP functions/data are region-same vs region-different — **coddog**
   (cross-version) + the existing `us_jp_funcmap.tsv`.
2. **Seed** region-different functions — **m2c** (`-t gba`) → C draft → AI/permuter refine.
3. **Iterate fast, per symbol** — **objdiff** match% / **asm-differ** instruction diff against
   the target bytes, without waiting on the whole-ROM oracle.
4. **Match the last bytes** — **decomp-permuter** (upstream, already integrated); **decomp.me**
   for stubborn one-offs.
5. **Oracle, always** — `make compare` → `fireemblem8.gba: OK`.

This tool set is also the substrate for the **conflict-free parallelization plan** (objdiff as
the per-symbol pre-gate, coddog for region triage, frog's worktree + serial-integrator
pattern). See `docs/decisions.md` D12 and the plan.

## Verification

All set-up tools were exercised in the main tree against the real `fireemblem8.elf` /
`baserom.gba` / `../fireemblem8u/fireemblem8.elf` (results above). `make compare` →
`fireemblem8.gba: OK` after the whole batch (the additions are gitignored tools + docs +
build-invariant manifest formatting, none touching build inputs).
