# Evaluation: decomp-permuter-agbcc fork vs upstream

Research-only evaluation of
[`WhenGryphonsFly/decomp-permuter-agbcc`](https://github.com/WhenGryphonsFly/decomp-permuter-agbcc)
against the upstream
[`simonlindholm/decomp-permuter`](https://github.com/simonlindholm/decomp-permuter)
that FE8J already uses (`tools/decomp-permuter`, gitignored; configured by
`permuter_settings.toml` + `scripts/permuter/`).

**TL;DR — RECOMMENDATION: keep upstream.** Cherry-pick nothing; our existing
`scripts/permuter/compile.sh` already implements the fork's one substantive
agbcc bugfix (and does it more robustly). The fork would *regress* us on ~10
months of upstream randomizer/scorer work and would break our `.s`-based import
workflow. No change to active config.

---

## 1. What the fork is

A hard fork of decomp-permuter retargeted at **agbcc / ARMv4T (GBA Thumb)**. Its
README replaces "supports MIPS/PowerPC/ARM32" with:

> This tool supports ARMv4T assembly compiled by agbcc. For MIPS, PowerPC, and
> other AArch32 assembly support; please see the upstream project.
> — `README.md` (fork)

It is maintained by one author, branched from upstream and not kept current. The
fork's last commit is `1f7ef87 "Update import.py"` (2025-06-27); upstream `main`
has advanced to `efc5c5e "Strip all dependency generation flags (#200)"`
(2026-04-03).

## 2. Concrete deltas vs upstream (verified, not the naive HEAD diff)

A naive `diff -ruq` of the two checked-out trees reports **24 differing files**
(see PR body). That is misleading: a `git merge-base` shows the fork branched
from upstream commit **`082a8d9` "Detect asm-processor build.py" (2024-08-10)**
and has only **9 fork-only commits** on top. The other 22 differing files are
**upstream drift** — improvements upstream made *after* the fork point that the
fork simply lacks (e.g. `src/randomizer.py`, `src/scorer.py`, `src/permuter.py`,
`src/objdump.py`, `pyproject.toml`).

The **actual fork-authored delta** (`git diff 082a8d9..HEAD`) touches only two
files:

```
 README.md | 195 +++++++++++++++++++++++++++++++++++++++++++++-----
 import.py |  74 +++++-----------------
 2 files changed, 195 insertions(+), 74 deletions(-)
```

### `import.py` — pipeline rewrite (the only code change)

The fork changes `import.py`'s contract and a few agbcc preprocessor defaults:

1. **Takes a prebuilt `.o`, not a `.s`** (`ca82c21`, `1f7ef87`). Upstream:
   `./import.py file.c file.s` — it prepends `asm_prelude_file` to the `.s` and
   *assembles* it to `target.o` (upstream `import.py` `write_asm`/`compile_asm`,
   `target.s` path). Fork: `./import.py file.c file.o func_name` — it
   `shutil.copy`s your prebuilt `target.o` and **deletes** the `parse_asm` /
   `write_asm` / `target.s` path and the `--decompme` upload feature entirely.
2. **Bakes agbcc include flags into import's preprocessor** (`a8aac31`),
   replacing the IDO/MIPS `-D_MIPS_SZINT=32 -D_MIPS_SZLONG=32` with
   `-I tools/agbcc/include -I tools/agbcc -iquote include -nostdinc -undef`.
3. **`set -o pipefail` in the generated `compile.sh`** (`641d6ee`, "Fix bug
   causing invalid zero scores"):

   > Fixes a bug where the compiler could encounter an internal compiler error
   > after emitting a function header to the assembler. The assembler would then
   > accept the header as valid and produce a score of 0.

   Because the fork's generated script pipes `agbcc ... | as ...` directly, a
   non-zero agbcc exit was masked by `as` succeeding on the partial output —
   yielding a false 0 score. `set -o pipefail` propagates the agbcc failure.
4. Minor: matches `.globl\t` (tab) in addition to `glabel`/`.globl ` when
   sniffing the function label (`1f7ef87`).

### `README.md` — workflow rewrite

A long, GBA-specific setup procedure: csplit a project `.s` into one function
per file, `make` to produce expected `.o` files into an `expected_objs/` dir,
then `import.py` against those `.o`s; plus optional `objdiff.json` support and an
"invalid offset, value too big" troubleshooting section (split a too-large
function that agbcc compiled with `bl` instead of `bx`). It contains a usable
agbcc settings template (quoted in §4).

**No randomizer, scorer, or PERM_\* macro changes.** `src/randomizer.py`,
`src/scorer.py`, `src/perm/*`, `prelude.inc`, and `default_weights.toml` are
**untouched by the fork** (`git diff 082a8d9..HEAD --name-only` lists only
`README.md` and `import.py`). The fork's `compiler_type = "gcc"` weighting is the
same choice we already use.

## 3. Does our existing setup already provide agbcc support? — Yes

Our setup already covers every substantive thing the fork adds, and is purpose-fit
for FE8J's descriptive-`.s`-per-function model:

| Fork capability | Our equivalent | Status |
| --- | --- | --- |
| agbcc compile pipeline | `scripts/permuter/compile.sh` (iconv→agbcc→`as`), `compiler_command` in `permuter_settings.toml` | Covered, byte-validated |
| agbcc include flags (`-I tools/agbcc/include -iquote include -nostdinc -undef`) | Same flags baked into our `compiler_command` | Covered (`permuter_settings.toml`) |
| `set -o pipefail` zero-score guard | `scripts/permuter/compile.sh` uses **`set -euo pipefail`** *and* splits agbcc and `as` into separate steps via a temp `.s` (with `.ALIGN`), so a partial/failed agbcc output is caught by `set -e` before `as` ever runs | Covered — strictly more robust than the fork's single-pipe `set -o pipefail` |
| `compiler_type = "gcc"` weights | Same in our `permuter_settings.toml` | Covered |
| Thumb prelude / `glabel` | `scripts/permuter/prelude.inc` | Covered |

The one thing the fork does **differently** (not better) is its `.o`-based
import. Our `permute.sh import <src/foo.c> <func.s>` relies on the upstream
`.s` → assemble path (`asm_prelude_file = scripts/permuter/prelude.inc` +
`assembler_command`). FE8J already produces descriptive per-function `.s` during
carving, so the `.s` workflow is the natural fit; the fork's csplit-to-`.o`
procedure would be strictly more work for us with no matching benefit.

## 4. Recommendation: KEEP UPSTREAM

**Rationale:**

1. **No unique agbcc code value.** The fork's only real bugfix
   (`set -o pipefail`, "invalid zero scores") is already neutralized in our
   `compile.sh` — which uses `set -euo pipefail` and a two-step (not single-pipe)
   agbcc→`as` flow, so a crashing agbcc can't masquerade as a 0 score. The agbcc
   include flags are already in our `compiler_command`.
2. **Switching would regress us ~10 months.** The fork is pinned near upstream
   `082a8d9` (Aug 2024) and is missing every upstream improvement since, across
   `randomizer.py`, `scorer.py`, `permuter.py`, `objdump.py`, packaging, etc. The
   permuter's value *is* its randomizer/scorer; freezing them to gain nothing is
   a bad trade.
3. **Switching would break our wrapper.** The fork removes the `.s`→assemble
   import path our `permute.sh import` and `prelude.inc` depend on and replaces
   it with a prebuilt-`.o` workflow.
4. **Nothing to cherry-pick.** The fork's two changes are (a) the pipefail fix we
   already exceed, and (b) a workflow swap we don't want. There are no randomizer
   or PERM-macro improvements to lift.

If the FE8J `.s`-based import ever proves awkward and we want the fork's
prebuilt-`.o` ergonomics, the cheap path is to add an optional `.o`-import mode
to our own `permute.sh` (copy a prebuilt `target.o`) rather than adopt the stale
fork — but this is not currently needed.

### Reference: agbcc `permuter_settings.toml` template from the fork's README

For comparison only — ours is already equivalent and additionally handles the
JP CP932 `iconv` step and FE8J flags. The fork's README quotes pokepinballrs:

```toml
compiler_type = "gcc"
compiler_command = "tools/agbcc/bin/agbcc -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -fprologue-bugfix -o /dev/stdout | arm-none-eabi-as -mcpu=arm7tdmi"
assembler_command = "arm-none-eabi-as -mcpu=arm7tdmi"
```

Note this template pipes `agbcc | as` directly (hence the fork needing
`set -o pipefail`) and omits the UTF-8→CP932 `iconv` step that FE8J requires; do
**not** copy it over our verified config.

---

*Method: cloned both repos to `/tmp/decomp-permuter-agbcc` and
`/tmp/decomp-permuter-upstream`, unshallowed, computed `git merge-base`
(`082a8d9`), and read `git diff 082a8d9..HEAD` (the true fork delta) plus each
fork-only commit. All claims above are verified against those clones and against
the tracked files in `scripts/permuter/` and `permuter_settings.toml`.*
