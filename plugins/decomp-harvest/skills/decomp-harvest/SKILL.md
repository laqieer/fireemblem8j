---
name: decomp-harvest
description: "FE8J decomp matching loop. Use when asked to check/harvest decomp.me for newly matched still-asm functions, integrate a matched decomp.me scratch/fork byte-exact into main, or apply a just-learned agbcc matching lever to the remaining unmatched functions. Triggers: 'check decomp.me', 'harvest matches', 'pull the matched function', 'integrate the match', 'apply the strategy to remaining functions', 'match more functions'. FE8J only (byte-perfect decomp of Fire Emblem 8 JP)."
license: MIT
---

# FE8J decomp-harvest — the match → integrate → learn → apply loop

A repeatable loop for advancing FE8J **axis-2 (matching-C)**. Run it in the
`fireemblem8j` repo. `make compare` (→ `fireemblem8.gba: OK`, sha1
`7da0456035366aa18414faa79d8fe7649f03c1ed`) is the ONLY oracle; `make shiftcheck`
(0 HIGH) is the second gate. Never regress either.

The still-asm frontier = `src/nonmatching/*.c` (each is a readable reconstruction
whose bytes still come from `asm/`). Their decomp.me scratches are tracked in
`scripts/tools/decompme/registry.tsv`.

Run the FIVE steps in order. **Step 1 is a sequencing gate: harvest every
registered decomp.me family before any local tweak, lever, permuter, or other
matching attempt.** This delays local matching only until the family harvest is
complete; a `NONE` result is not a stop condition — continue to the bounded
local matching attempts in **4**. Do **1** first (it may find free wins); always
do **3** and **4** after any new match — **4 is the one people skip: it means
actually ATTEMPTING to match other functions with the learned lever, not just
re-polling decomp.me.**

---

## 1. Harvest — check ALL posted still-asm functions on decomp.me

```sh
python3 scripts/tools/decompme/harvest.py --actionable
```
It polls every registry scratch's decomp.me *family* (Cloudflare needs the
browser UA + `Referer` — the script sets them) and classifies each still-asm fn:

- **MATCHED** — a family member scored **0** → integrate to main (step 2A).
- **IMPROVED** — a fork scores lower than our base (but > 0) → *candidate* to
  adopt as a better `src/nonmatching/<fn>.c` (step 2B), only if proven-equivalent.
- **STALE** — already carved but the scratch is still open → mark solved (step 5).
- **NONE** — no member beats base → after the whole family harvest confirms
  there is no match or integrable improvement, proceed to the bounded local
  matching in step 4 (apply a lever or the permuter); do not stop.

"still-asm" = `src/nonmatching/<fn>.c` exists (authoritative — not any cache).

## 2. Integrate

### 2A. MATCHED (score 0) → byte-exact into main
Follow **`docs/agbcc-matching-playbook.md §7`** (pull & integrate). Summary:
```sh
python3 scripts/tools/decompme/harvest.py --pull <matched_slug>   # -> /tmp/decompme_<slug>/
```
1. Create `src/<Name>.c` from `source.c`: **strip the decomp.me-only scaffolding**
   the author adds to fake a local match — `asm(".set SYM, 0x…")` blocks and any
   trailing `asm(".align 2, 0")` (usually flagged "REMOVE in real project"). Use
   the REAL project `#include`s (not the flattened decomp.me `context.h`). **Keep
   the `register … asm("rN")` pins.**
2. Add a carve row `layout/carved_rom.d/<addr>-<name>.tsv`
   (`START<TAB>END<TAB>src/<Name>.o(.text)<TAB>handdecomp: …`); `git rm` the
   `gbadisasm_<fn>.tsv` row, `asm/<fn>.s`, and `src/nonmatching/<fn>.c`. A
   pre-existing `layout/baseline_syms_drop.d/*<fn>*.tsv` stays valid — no baseline
   edit (the asm object already exported the name; the src object exports the same).
3. `make layout && make compare` → OK, then `make shiftcheck` → 0 HIGH.
4. **Immediately after both gates pass**, update the owned registry
   scratch/family with the score-0 solution, then remove its registry row:
   ```sh
   scripts/tools/decompme/mark_solved.sh <registry_slug> --from-scratch <matched_slug>
   # after that succeeds, remove <fn>'s row from scripts/tools/decompme/registry.tsv
   ```
   `<matched_slug>` may be the base scratch or any score-0 fork in its family;
   the same upstream update is mandatory in both cases. Pulling and integrating
   locally without this decomp.me update is **not complete**.

**⚠️ The symbol-mapping gotcha (WILL bite):** a score-0 scratch can match on
decomp.me via a symbol its *context* maps to the wrong address, so integrating it
verbatim FAILS `make compare` by a few bytes. Diagnose:
```sh
SIZE=$((0x<END>-0x<START>)); JP=0x08<START>
dd if=fireemblem8.gba of=/tmp/mine.bin bs=1 skip=$((JP-0x8000000)) count=$SIZE
dd if=baserom.gba      of=/tmp/tgt.bin  bs=1 skip=$((JP-0x8000000)) count=$SIZE
cmp -l /tmp/tgt.bin /tmp/mine.bin        # few bytes -> localize with objdump
```
(Compare the LINKED ROM, not the unlinked `.o`.) `objdump -D -b binary -m arm -M
force-thumb --adjust-vma=$JP` both at the diff offsets → a `bl 0xAAAA` vs
`0xBBBB`. `nm -n fireemblem8.elf` for what's really at each. The classic trap is
**two byte-identical `return *global` getters/setters** the `us_jp_funcmap.tsv`
"exact" tier can't tell apart (it wildcards the pool word) — disambiguate by the
RAM global each accessor touches (`SetX` writes G ↔ `GetX` reads G). Repoint the
call(s) to the correctly-named symbol; re-`make compare`; **also fix the
`us_jp_funcmap.tsv` row** so the misID doesn't bite the next carve.

### 2B. IMPROVED (better score, still > 0) → adopt as nonmatching, only if proven
```sh
python3 scripts/tools/decompme/harvest.py --pull <fork_slug>
```
First review and install the fork's body as the candidate
`src/nonmatching/<fn>.c` (real includes; keep provenance in the header). Wrap its
project include block so the same text uses real headers locally and the
flattened owned scratch context upstream:
```c
#ifndef FE8J_DECOMPME_CONTEXT
#include "global.h"
/* other project headers */
#endif
```
Then run every local gate on that exact file:
```sh
make nonmatching
python3 scripts/prove_nonmatching.py <fn>              # PROVEN-BOUNDED(n)
python3 scripts/differential_test.py <fn> --trials 60  # EQUIV
```
If all three local gates pass, synchronize that **exact adopted file** to the
owned registry scratch before committing:
```sh
LOCAL_FLAGS="<exact make-nonmatching compiler flags>"
scripts/tools/decompme/sync_improvement.py <registry_slug> \
  --source src/nonmatching/<fn>.c --compiler-settings-from <fork_slug> \
  --compiler-flags "$LOCAL_FLAGS" --local-flags "$LOCAL_FLAGS" \
  --local-score <local-score> --local-residual "<linked-residual>" \
  --proof-result "PROVEN-BOUNDED(n)" --equiv-result "EQUIV 60/60" --dry-run
scripts/tools/decompme/sync_improvement.py <registry_slug> \
  --source src/nonmatching/<fn>.c --compiler-settings-from <fork_slug> \
  --compiler-flags "$LOCAL_FLAGS" --local-flags "$LOCAL_FLAGS" \
  --local-score <local-score> --local-residual "<linked-residual>" \
  --proof-result "PROVEN-BOUNDED(n)" --equiv-result "EQUIV 60/60" \
  --expected-score <dry-run-score>
```
Use the exact local flags. A scratch carrying `-mjp-promote` must select
`agbcc-fe8j`; migrate an older stock-`agbcc` scratch rather than dropping the
flag (`verify_compile.py --fix` handles the known invalid-option migration).
The helper flattens trusted project headers (it never executes downloaded
source), PATCHes only after authenticating ownership, and verifies **normalized
source identity**, settings, score, and the recorded local score/residual plus
both toolchains' flags. It restores the original scratch if verification fails.

The decomp.me score may stay equal or become worse under its different compiler;
score monotonicity is neither source-sync proof nor a completion gate. Keep the
registry row active and do **not** mark a score>0 scratch solved. This does
**not** touch the oracle — `make nonmatching` only. Local adoption or commit
without successful upstream synchronization is **incomplete**. Revert if a
local proof/EQUIV gate fails. If `agbcc-fe8j` rejects `-mjp-promote`, treat that
as a compiler packaging/deployment regression and stop; never silently remove
the flag.

**J1ka1 (`sub_807D3BC`) profile:** synchronize the exact normalized source with
hosted `agbcc-fe8j` and the local `-mjp-promote` flags. Keep the registry row
while the raw score is nonzero; do not accept the historical stock-compiler
score as the final hosted state.

## 3. Learn — save the pattern to the cookbook (ALWAYS after a new match)
Diff the matched source against the old `src/nonmatching/<fn>.c` (from git):
```sh
git show <commit>^:src/nonmatching/<fn>.c > /tmp/old.c
# normalize (strip comments/includes/asm(".set")) and `diff -u` the bodies
```
The substantive diff (ignore added braces / `a=(b=c)` parens / whitespace) is the
lever. Record it in:
- **`docs/agbcc_codegen_levers.md`** — add a row to the community-fork lever table
  (fn, #pins, #barriers, #inline-asm, headline lever) + any new LESSON.
- **`docs/agbcc-matching-playbook.md`** — extend §6/§7 if it's a new workflow/gotcha.
Common levers (see the P1–P10 list in `agbcc_codegen_levers.md`): `register T x
asm("rN")` **pins** to the exact JP register; **§5a** widen `s16`→`int` (+explicit
`(s16)` casts); **inline** a helper the JP inlined; **decl-order** locals after
their target register; `=r`/`+m` inline-asm barriers.

## 4. APPLY the learned lever to same-pattern remaining functions  ← the real step
**This is NOT re-polling decomp.me. It is actively trying to byte-match OTHER
still-asm functions using the lever just learned.**

A `NONE` harvest still enters this step. If this run produced no new lever, use
the most applicable existing cookbook lever or a bounded permuter attempt.

1. **Find same-pattern candidates.** Read each `NONE` fn's `src/nonmatching/<fn>.c`
   header "BLOCKING DIFF / residual" note. Group by residual class; pick the ones
   whose class matches the lever you just learned. E.g. after a *register-pin* win
   (like `sub_8057F80`: `char_cnt`→r6, `banim_pos`→r4 + s16→int widen), target the
   fns whose headers say "clean reg-coloring NEAR / structure byte-exact / register
   permutation / spill swap" (e.g. `sub_80C05C8`, `sub_80A2E64`, `sub_80A3300`).
2. **Get the EXACT coloring the JP build wants** (blind pins make it WORSE — verified):
   ```sh
   make nonmatching                                   # builds src/nonmatching/<fn>.o
   $HOME/asm-differ-venv/bin/python tools/asm-differ/diff.py -mw 0x<START> 0x<END>
   # or objdump the .o vs baserom bytes (see §2A cmp/objdump recipe)
   ```
   Read off which local is in which register in the ROM vs your build (e.g. ROM
   keeps `count` in r7, yours spills it; ROM colors `xr`=r4/`col`=r5, yours swaps).
3. **Apply the lever precisely**, rebuild `src/nonmatching/<fn>.c`, and gate:
   ```sh
   register int count asm("r7");     /* pin to the ROM's register, not a guess */
   /* + widen s16->int where the ROM keeps an int; + inline the helper it inlined */
   make compare            # OK => it MATCHED; else asm-differ again / revert
   ```
4. **On `make compare` OK** → it's a byte match: promote to `src/<Name>.c`, flip the
   carve row, drop asm + nonmatching (step 2A tail), `make shiftcheck` 0 HIGH.
   **On no improvement after a couple of precise variants → STOP** (do not grind;
   the sandbox SIGTERMs long permuters). Record the attempt + the exact residual in
   the fn's nonmatching header and `docs/axis2-recipe-queue.md`, and leave it for
   the permuter / community. Matching is compute/luck-bound past this point
   (`docs/unmatched_functions_report.md` ROI note).

## 5. Complete the decomp.me lifecycle for every accepted result
- **MATCHED / STALE (score 0 or supported matched-elsewhere state):** update and
  mark the owned scratch solved, verify the family reports the match, then remove
  its registry row so community effort is not wasted.
- **IMPROVED (score > 0):** upload the exact adopted `src/nonmatching/<fn>.c`,
  verify normalized source identity, record local score/residual/flags plus the
  decomp.me score/compiler/flags, and keep its registry row active for further
  community work. Never mark a nonzero improvement solved.
```sh
# score 0: verify solved, then remove the row
scripts/tools/decompme/mark_solved.sh <registry_slug> --from-scratch <matched_slug>

# score > 0: verify synchronized, keep the row
scripts/tools/decompme/sync_improvement.py <registry_slug> \
  --source src/nonmatching/<fn>.c --compiler-settings-from <fork_slug> \
  --local-score <local-score> --local-residual "<linked-residual>" \
  --local-flags "<exact local flags>" \
  --proof-result "PROVEN-BOUNDED(n)" --equiv-result "EQUIV 60/60" \
  --expected-score <dry-run-score>
```
Refresh the axis-2 figures (`python3 scripts/calcprogress.py`) into
`docs/frontier.md` (matching-C %, N still-asm) and `docs/unmatched_functions_report.md`.

---

## Guardrails
- `make compare` is the ONLY match proof; decomp.me score / asm-differ / permuter
  are aids. Never mark matched without `fireemblem8.gba: OK`.
- Never put a non-matching body in the oracle (`src/*.c`); non-matching stays in
  `src/nonmatching/` (built by `make nonmatching` only).
- Commit each match atomically; keep `make compare` OK + `make shiftcheck` 0 HIGH
  on every commit. Push (CI re-runs both with `baserom.gba` absent).
- A pulled MATCHED base scratch or family fork is incomplete until its owned
  registry scratch is marked solved with that score-0 solution and its registry
  row is removed.
- A proven nonzero adoption is incomplete until the owned registry scratch has
  the same normalized source and records local score/residual/flags beside the
  verified decomp.me score/compiler/flags. A better remote score is not proof,
  and a worse remote score is not failure when toolchains differ. Keep the row
  active; score>0 must never be labeled SOLVED or removed from the registry.
- Never execute downloaded scratch/fork source locally. Review and adopt it as
  text, run the formal local proof/equivalence gates, and let
  `sync_improvement.py` send only the adopted local file to decomp.me.
- Don't grind low-ROI reg-coloring walls by hand; one or two precise lever variants,
  then hand off to permuter/community and record the residual.
