# agbcc Near-Miss Matching Playbook

**Purpose.** When you have logic-correct C for a region-different JP function but
the bytes are 1–2 instructions off, the cause is almost always a known **agbcc
codegen quirk**, not a logic error. This is the **first checklist to run before
reaching for the decomp-permuter** — most "almost-matching" near-misses are one
of the items below, and they are far cheaper to fix than a permuter long-run
(which gets SIGTERM'd in this sandbox; see D20). This is the diagnosis step of
the **asm→C graduation** path that turns the m2c-seeded non-matching C in
`src/nonmatching/` into byte-matching C (D26).

**Scope.** FE8J-specific. Every claim below is tagged **[verified]** (checked
against the real `tools/agbcc` and/or this repo's Makefile) or **[cited]**
(inherited from `docs/gba-decomp-survey.md` §"agbcc codegen quirks" + "Cross-region
techniques to apply now" §4, and the named community decomps — not independently
reproduced here). Read `docs/decisions.md` D20 (the sign-extension class) and D26
(the NON_MATCHING / graduation pipeline) alongside this.

**The oracle is still `make compare`.** Nothing here is a substitute for it.
Every candidate fix is verify-or-revert against the sha1, exactly like a carve.

---

## 0. Ground truth: what THIS repo's agbcc actually is

Verified facts about the build, so the rest of the playbook is anchored, not
folklore:

- **Compiler [verified].** `tools/agbcc/bin/agbcc` reports
  `GNU C version 2.9-arm-000512 (thumb-elf)` — the stock pret agbcc (GCC
  2.9-arm, dated 2000-05-12), the **same agbcc the US decomp uses** (its strings
  reference `…/fireemblem8u/.deps/agbcc/gcc`). This is **not** a fork. There is
  no `-ftst`, no Klonoa/luckytyphlosion/jiangzhengwenjz patch in this binary.
- **Two binaries ship [verified].** `tools/agbcc/bin/agbcc` (modern) and
  `tools/agbcc/bin/old_agbcc` (272 bytes smaller). Both report the same version
  string. The third, `agbcc_arm`, is the ARM (non-Thumb) code generator.
- **The default C pipeline [verified]** (FE8J `Makefile`, recipe at the
  `$(C_OBJECTS) $(NONMATCH_OBJECTS)` rule):
  ```
  cpp $(CPPFLAGS) src/x.c | iconv -f UTF-8 -t CP932 | tools/agbcc/bin/agbcc $(CC1FLAGS) -o x.s
  printf '\t.text\n\t.align 2, 0\n' >> x.s
  arm-none-eabi-as -mcpu=arm7tdmi -mthumb-interwork -I include -I . -g x.s -o x.o
  ```
  with
  ```
  CC1FLAGS := -mthumb-interwork -Wimplicit -Wparentheses -Werror -O2 -fhex-asm -ffix-debug-line -g
  CPPFLAGS := -I tools/agbcc/include -iquote include -iquote . -nostdinc -undef
  ```
- **There is NO `-fprologue-bugfix` and NO `-ftst` in the default `CC1FLAGS`
  [verified]** — neither in FE8J's nor in the US decomp's. The US decomp's
  `CC1FLAGS` is byte-identical to FE8J's. So a JP function matches under the same
  default flags the US source matched under; reach for a flag override only when
  the default doesn't match (see §1, §2).
- **`old_agbcc` is operationalized as a PER-TU compiler swap [verified].** In the
  US decomp, exactly one file uses it — `src/m4a.o: CC1 := $(CC1_OLD)` — under
  the comment *"Use the older compiler to build library code"* (and
  `src/agb_sram.o` drops to `-O1`). FE8J currently carves m4a as descriptive
  asm; it has **no per-TU `CC1`/`CC1FLAGS` overrides yet**. When you graduate
  m4a (or any original-ROM *library* TU) to C, the per-TU `CC1 := $(CC1_OLD)`
  override is how you select the old compiler — exactly as US does.

---

## 1. First-literal-pool register: r2 vs r3 (old vs modern agbcc)

**Symptom [cited].** Logic is identical but the function loads its first
literal-pool word into a different register than the JP ROM — e.g. the ROM does
`ldr r3, .L…` where your build emits `ldr r2, .L…`, and the register choice then
ripples through the rest of the function (every subsequent reg is shifted),
producing a wall of asm-differ red that is really **one** root difference. The
community shorthand: *old agbcc loads the first literal into r2, modern into r3.*

**What this repo verified [verified].** On the simple multi-literal test cases I
tried, **`agbcc` and `old_agbcc` in this build produced byte-identical output**
(both chose `r2`). The two binaries are the same agbcc *generation*
(`2.9-arm-000512`); they differ only on specific code shapes (the kind in m4a /
sound-library code). So in FE8J the r2-vs-r3 split is **not** a generic
"old-vs-new picks a different first reg on everything" — it is a per-shape
divergence that the US build resolves the same way FE8J should: **by selecting
`old_agbcc` for the affected TU.**

**How to tell which agbcc built a given JP subsystem [verified method].**
1. Find the function's owning TU and look up the **US** decomp's build rule for
   it (`grep '<tu>.o: CC1' ../fireemblem8u/Makefile`). If US compiles that TU
   with `$(CC1_OLD)` (today: `m4a`), the JP ROM's bytes for that subsystem were
   produced by the **old** compiler — use `old_agbcc`.
2. If US uses the default `CC1` (everything else), the JP subsystem was built by
   the **modern** agbcc — the default.
3. **Confirm empirically**, don't guess: compile the candidate `.c` once with
   each binary and diff against the ROM:
   ```
   tools/agbcc/bin/agbcc     -O2 -mthumb-interwork -fhex-asm staging.c -o /tmp/new.s
   tools/agbcc/bin/old_agbcc -O2 -mthumb-interwork -fhex-asm staging.c -o /tmp/old.s
   ```
   Whichever first-literal register matches the ROM tells you the variant. (For a
   TU that swaps, the fix is a per-TU `CC1 := $(CC1_OLD)` Makefile line, mirroring
   US.)

**Fallback agbcc forks [cited].** If neither stock binary matches a JP subsystem
(genuinely different codegen generation), the community forks are the documented
fallbacks — but none is vendored here and stock agbcc is the same one FE8 was
built with, so treat these as a last resort and log a decision before adopting:
- `jiangzhengwenjz/new_newlib_pret` (katam)
- `luckytyphlosion/new_layout_with_libs` (pwaa1 — a JP, text-heavy GBA game)
- Klonoa's `kl-eod-decomp` fork enabling the non-standard `-ftst` flag (see §3).

---

## 2. `-fprologue-bugfix`: spurious leaf-function LR saves

**What it is [verified].** `agbcc --help` documents it literally:
`-fprologue-bugfix   Prevent unnecessary saving of the lr register to the
stack`. Both `agbcc` and `old_agbcc` accept it (the internal `flag_prologue_bugfix`
variable is present in both binaries). It flips whether a **leaf** function
(one that calls nothing) saves/restores `lr` it never needs.

**Symptom.** A leaf function's prologue/epilogue differs from the ROM by exactly
a `push {…, lr}` / `pop {…, pc}` pair (or the reverse): your build saves LR and
the ROM doesn't, or vice-versa, and otherwise the bodies are identical.

**Verified caveat [verified].** It is **NOT** in this repo's (or the US decomp's)
default `CC1FLAGS`, and on a clean leaf both with-and-without `-fprologue-bugfix`
produced identical output in my tests (no spurious save to suppress in that
case). So:
- The flag only changes output on the **specific leaf shapes** the unfixed
  compiler over-saves. If the JP ROM's leaf has no LR save and your default build
  does, try adding `-fprologue-bugfix` to that TU's `CC1FLAGS`.
- Because US matches FE8 without it, expect this to be **rare**. If you find
  yourself needing it broadly, re-check that you actually have a leaf (a hidden
  call — including a compiler-emitted `__divsi3`/`__modsi3`/memcpy helper — makes
  it a non-leaf and the LR save is correct).

**How to apply (per-TU, mirroring US's per-TU override pattern):**
```
src/<tu>.o: CC1FLAGS += -fprologue-bugfix
```

---

## 3. `-ftst`: Thumb `tst` vs `cmp #0`

**Symptom [cited].** A comparison-against-zero is emitted as `cmp rX, #0` where
the ROM uses `tst rX, rX` (or vice-versa). Same flags, same condition, one
instruction differs.

**Verified status in THIS repo [verified].** `-ftst` is **NOT supported by this
agbcc** — passing it gives `agbcc: Invalid option '-ftst'`, and there is no
`flag_tst` variable in the binary. `-ftst` is a **fork-only flag** (Klonoa's
`kl-eod-decomp` agbcc fork). Therefore, in FE8J:
- You **cannot** flip `tst`/`cmp #0` with a flag on the stock compiler.
- If a JP function's only delta is `tst` vs `cmp #0` and no source restructuring
  changes it, this is a **scheduler/codegen-fork artifact** (same class as D20's
  instruction-scheduler artifacts). Options, in order: (a) try a source
  restructure that changes the comparison's data-flow context; (b) permuter;
  (c) only as a logged last resort, evaluate the Klonoa fork.
- Do **not** add `-ftst` to a Makefile — it will break every C build with
  `Invalid option`.

---

## 4. `bl` (not `bx`) for long intra-function branches — DO NOT CHASE

**The trap [cited + verified mechanism].** agbcc emits a `bl` for a long
**intra-function** branch when the target is out of range of a Thumb `b`
(uncond `b`: ±2 KB; conditional `b<cond>`: ±256 B). The `bl` here is **not a
call** — it is agbcc widening a branch into the BL encoding to reach a far label
in the same function. This is **standard agbcc behavior, identical US and JP** —
it is **NOT region-different behavior and NOT a bug to fix**.

- A `bl` to a `_08xxxxxx` / `.L` label *inside the same function's range* is this
  widened branch. A `bl sub_…` / `bl <NamedFunction>` is a real call. (In FE8J's
  carved asm, the `bl sub_…` forms you see are calls; the widened-branch form
  appears only in large functions whose branch distance exceeds the short
  encodings.)
- asm-differ will show these as matching once the surrounding bytes match — they
  are not the source of a near-miss. If you "fix" one by restructuring control
  flow, you will move the labels and make things worse.

**Rule:** when you see a `bl` to a local label, confirm it's a long branch (target
is a label within the function, not an exported symbol) and **move on** — it's
expected.

---

## 5. The sign-extension codegen class (D20) and its siblings

This is the near-miss class already characterized in **this repo's** decisions —
the most important one in practice, because it gates multiple region-different
TUs. Full record: `docs/decisions.md` D20.

### 5a. Sign-extend vs zero-extend of an `s16` [verified-in-repo, D20]

**Symptom.** The JP function sign-extends an `s16` (`lsl rX,#16; asr rX,#16`)
where your faithful US-derived port — compiled by the *same* agbcc — emits a
zero-extend (`lsl rX,#16; lsr rX,#16`). The US ROM itself uses `lsr` at the
matching site, so this is a genuine **JP↔US source-logic difference**, not a port
bug: the JP source flows the `s16` through a *signed* context the US source
doesn't.

**Levers (the cracked recipe, byte-perfect on 9/10 banim-efxmagic core-tail fns):**
1. **Widen the s16 to an `int` local before its first use** —
   `int val = b;` — and agbcc emits one `asr` instead of `lsr`. This is the main
   lever and generalizes to every lsr/asr-divergent site.
2. **Route a derived value through an explicit signed cast** —
   `int a; a = (s16)(x - y);` reproduces the exact
   `lsl; asr; mov ip,r0; cmp r0,#0` sequence (verified on EfxCircleWINMain).
3. **For signed *parameters*, the header prototype must also become `s16`**
   (e.g. NewEfxCircleWIN `d`/`e`) — a local cast alone won't move a param's
   extension.
4. **The hard residual: a store-only `s16` param** (`*buf = b;`). agbcc
   zero-extends it under *all* source variants unless `b` flows into a signed
   *use*. When you hit this, you must **decompile the JP function's actual logic
   (which differs from US), not port US** — the JP source genuinely uses the value
   signed somewhere.

### 5b. Instruction-scheduler artifacts [verified-in-repo, D20 UPDATE]

**Symptom.** Two functions differ *only* in instruction **ordering** —
argument-load order, or batched-vs-inline sign-extension — and **no** source
restructuring flips it (8+ variants tried each; US's own agbcc produces the same
ordering). Examples: `Loop6C_efxMagicQUAKE`, `StartStoneShatterAnim`.

**Resolution.** These need a **decomp-permuter** long run — and that is the class
permuter exists for. But permuter long-runs get **SIGTERM'd in this sandbox**
(multiprocessing killed ~144), so: prefer **deterministic C-structure
permutation** by hand first (bindingblade's split-`if`, EfxCircleWINMain's cast);
if that fails, the function is a known permuter target — park it as
`src/nonmatching/<fn>.c` (D26) with its asm byte source still in `asm/<fn>.s`,
and run the permuter out-of-sandbox when that path is unblocked.

### 5c. Re-identification gotcha [verified-in-repo, D20]

Not a codegen quirk but a near-miss *cause* worth the reminder: never assign a
region-different TU by **US-address coincidence**. Re-pin every region-different
function by IDA xref-from-a-ported-neighbor before assuming which US function it
is. ROM-pool literal addresses are ground truth when IDA's `.data` VMAs are
stale.

### 5d. Pointer-role readback and live-range preservation [verified-in-repo, D367]

**Symptom.** The instruction sequence and size are already right, but JP keeps a
table/base pointer in one high register across calls while the reconstruction
re-materialises equivalent global/absolute reads and rotates the proc/table registers.

**Lever.** Reuse one pointer local and read through it at the later sites instead of
re-spelling the same value. Pair that source shape with explicit IV/argument temps and,
only where disassembly shows a call result must stay live, an empty `+r` constraint:
```c
data = (const u16 * const *)gSinLookup;
sa = Div(COS(0) << 4, r);
asm("" : "+r"(sa));           /* no opcode; live-range fence */
sb = Div(-(*(const s16 *)data) << 4, scale);
```
This is **P13** in `docs/agbcc_codegen_levers.md`. It is related to destination-field
readback (P12), but preserves the role/lifetime of a pointer local rather than a
destination lvalue.

**Worked match.** `DivinationRankSpriteUpdate` (`sub_80A2E64`) score-0 fork `l4bts`
uses this pointer readback, `next = i + 1`, explicit `xArg`, six precise register
declarations, and two empty `+r` fences under `-fno-gcse`. The project adaptation
strips the scratch-only `.set gUnk_08A95478,...`; it contains no raw opcode asm.
Full linked `make compare`, not the standalone object or decomp.me score, proved it.

The 2026-07-11 follow-up harvest adds four complementary address/lifetime forms:
Br4VJ splits signed x/y loads before a pinned loop origin, vdXu7 explicitly hoists
proc-field addresses while rematerializing the tilemap base at use sites, XOT5k
keeps a caller-supplied callback in r3 so the compiler selects `_call_via_r3`, and
h2W8F shapes two halfword stack homes with `u16 tags[2]`, scopes the real callback
and address aliases to r9/r8/r4, and uses an empty `+r` fence to preserve the observed
r1→r2 constant copy. These are allocation levers, not permission to replace real
calls or pointers; the fence emits no opcode.

---

## 6. Workflow: the checklist to run when a function is 1–2 instructions off

You have a staging `src/nonmatching/<fn>.c` (m2c-seeded, US-ported, JP-repointed)
and `make nonmatching` proves it builds. asm-differ shows a small delta vs the
ROM. **Before the permuter**, walk this in order. Diff with the US compiled `.o`
as the asm-differ target (survey §4.3) so a literal-pool-only delta is visibly
*relocation* (auto-fixed) rather than real codegen.

| # | Check | asm-differ symptom | Action |
|---|-------|--------------------|--------|
| 0 | **Is the delta only literal-pool words / pointer values?** | The only red is in `.word`/`.4byte` pool entries or pointer operands; instructions line up | Not a codegen bug — pure relocation/region pointer delta. The linker fixes it at the real JP VMA. Carve and let `make compare` confirm. |
| 1 | **First-literal register shifted (r2↔r3) and everything downstream slides** | One early `ldr rN, .L…` differs, then a cascade of register-number shifts | §1: check US's build rule for this TU; if US uses `$(CC1_OLD)`, add `src/<tu>.o: CC1 := $(CC1_OLD)`. Confirm by compiling with both binaries and diffing. |
| 2 | **Leaf prologue/epilogue off by a `push/pop {…,lr}` pair** | Exactly one `push {…,lr}`/`pop {…,pc}` mismatch; bodies identical; function calls nothing | §2: try `src/<tu>.o: CC1FLAGS += -fprologue-bugfix`. First re-confirm it's truly a leaf (no hidden `__divsi3`/memcpy helper call). |
| 3 | **`tst rX,rX` vs `cmp rX,#0`** | A single compare-against-zero instruction differs | §3: NO flag fix available (stock agbcc rejects `-ftst`). Try a source restructure; else treat as a scheduler artifact (row 6). |
| 4 | **`bl` to a local `_08…`/`.L` label** | A `bl` where you expected a branch | §4: it's a widened long branch, **not** a near-miss. Verify the target is in-function and move on — do not restructure. |
| 5 | **`lsr` where ROM has `asr` (or vice-versa) on an s16** | `lsl;lsr` vs `lsl;asr` at an s16 narrowing | §5a: widen the s16 to `int` before first use; add an explicit `(s16)` cast; for params, change the prototype to `s16`. If store-only, decompile the JP's real (signed) logic. |
| 6 | **Only instruction ORDERING differs** | Same instructions, permuted order (arg-load order, save order, batched vs inline) | §5b/§5d + cookbook P9/P12/P13: first try a zero-instruction `do { } while (0);` separator, destination-field or pointer-role readback, explicit next-IV/argument temps, signed-load live-range splits, and deliberate address hoist/rematerialization. Add an empty fence only when disassembly proves a value must remain live. These can change allocation/block order without changing behavior (`AddAttr2dBitMap`, `Augury_InitResultScreen`, `DivinationRankSpriteUpdate`, `PutDivinationRankSprite`, `DrawAuguryResultPanel`). Only then park it as a permuter target. |

**After any candidate fix:** rebuild and run `make compare` (incremental, ~0.3 s
— D7). `OK` graduates the function: move the C up to `src/<owner>.c`, delete
`asm/<fn>.s`, flip the `carved_rom` row `asm/<fn>.o → src/<owner>.o` (JP range
unchanged), `make compare` again (the graduation oracle, D26). A FAIL
auto-reverts — the function stays `src/nonmatching/` and you escalate to the
permuter.

**When to stop checklisting and permute.** Rows 0–5 are the ones a quirk/flag/
source-cast fixes cheaply. Row 6 (pure scheduling) is the genuine
permuter/decomp-permuter case — but exhaust rows 0–5 first, because each is
seconds of work versus a permuter run that may be SIGTERM'd here (D20).

---

## 7. Harvesting decomp.me results — lifecycle and the symbol-mapping gotcha

When a still-asm function reaches **score 0** on decomp.me (our scratch or a community
fork), harvest it instead of re-deriving. Workflow (proven on `sub_8057F80`/rtMN6, D…):

1. **Find the matched fork.** `scripts/tools/decompme/registry.tsv` maps `fn → base slug`.
   Query the family: `GET https://decomp.me/api/scratch/<slug>/family` and pick the member
   with `score == 0`. **Cloudflare needs a browser UA + `Referer: https://decomp.me/`**
   header (plain curl gets 403) — `scripts/tools/decompme/integrate_matched.sh <fork>` sets
   these (extract `source_code`/`context`/`compiler_flags` from the JSON).
2. **Build the src file with the REAL project headers, not the decomp.me context.** Strip
   the decomp.me-only scaffolding the author adds to fake a local match: `asm(".set SYM,
   0x…")` blocks and any trailing `asm(".align 2, 0")` (they are usually flagged "REMOVE in
   real project"). Replace with the actual `#include`s; keep the `register … asm("rN")` pins.
3. **Carve + gate.** Add a `layout/carved_rom.d/<addr>-<name>.tsv` handdecomp row
   (`START<TAB>END<TAB>src/<Name>.o(.text)<TAB>handdecomp: …`), `git rm` the
   `gbadisasm_<fn>.tsv` row + `asm/<fn>.s` + `src/nonmatching/<fn>.c`. A pre-existing
   `layout/baseline_syms_drop.d/*<fn>*.tsv` (already dropped because the asm object exported
   the name) stays valid for the src object — no baseline edit. `make layout && make compare`
   → OK, then `make shiftcheck` → 0 HIGH.
4. **Close the owned registry family before deleting its row.**
   - If a decomp.me family member has raw `score == 0`, use
     `scripts/tools/decompme/mark_solved.sh <owned-base> --from-scratch <matched-member>`.
   - If the byte-exact source is a **local oracle match** that decomp.me's stock compiler or
     isolated context cannot reproduce (notably the project-local `-mjp-promote` flag), publish
     the local solution text/link on the owned scratch and set decomp.me's supported
     `match_override=true` (“matched elsewhere”) field. Do **not** forge the read-only raw score;
     verify the family exposes an effective match with
     `member.score == 0 || member.match_override`.
   - Only after that upstream check succeeds, remove the exact row from
     `scripts/tools/decompme/registry.tsv`.

   `ABitG` (`AddAttr2dBitMap`) and `xYHce` (`Augury_InitResultScreen`) are the
   2026-07-10 local-oracle worked examples. `qksQG` / score-0 fork `l4bts`
   (`DivinationRankSpriteUpdate`) is the 2026-07-11 raw-score worked example:
   local `make compare`/`make shiftcheck` passed, the owned base was updated from
   `l4bts` and re-verified at raw score 0, then the exact registry row was retired.
   The same lifecycle was then completed for ENay1/Br4VJ
   (`PutDivinationRankSprite`), nlJVc/uVVvN (`Event18_ColorFade`),
   taZrH/gdTId (`AdjustNewUnitPosition`), MaiDT/vdXu7
   (`DrawAuguryResultPanel`), g7FXU/XOT5k (`EncodeLinkArenaRecord`), and the
   locally matched owned h2W8F (`DecodeAndVerifyArenaRecord`): all eleven
   owned/community scratch pages report raw score 0, and exactly the six owned
   registry rows were removed.

   **Do not simplify a harvested source before measuring it.** In `l4bts`, reading
   the sine value through the reused `data` pointer looked equivalent to replacing
   it with a direct `gSinLookup`/absolute expression, but that simplification
   shortened the pointer lifetime and rotated `proc`/table high registers. Preserve
   subtle readback/IV/temp shapes until the project build proves which are codegen
   levers; strip only remote scaffolding (`.set`, fake alignment, context headers).

   **Callback-veneer safety.** If a match depends on `_call_via_rN`, keep the
   caller-supplied function pointer, pin it only to the ROM-proven register, and
   invoke it normally in C. Let agbcc emit the veneer. XOT5k's real-project
   adaptation pins `callback` to r3 and compiles to `_call_via_r3`; h2W8F pins
   its real callback alias to r9 and likewise compiles to `_call_via_r9`. Neither
   substitutes a fixed callee or contains a raw branch opcode. A fixed target or
   scripted `bl` may match bytes while changing semantics and must be rejected.

### Proven nonzero improvements: synchronize before committing

A score>0 family member is only an **adoption candidate**, never a match. Review
and install it in `src/nonmatching/<fn>.c` with real project includes, then run
`make nonmatching`, require `prove_nonmatching.py` to report
`PROVEN-BOUNDED(n)`, and require `differential_test.py --trials 60` to report
`EQUIV` on that exact file. Treat local replacement, upstream update, and the
local commit as one transaction. Because decomp.me has flattened context but
not this repository's header files, keep one byte-neutral include guard in the
exact adopted file:

```c
#ifndef FE8J_DECOMPME_CONTEXT
#include "global.h"
/* other project headers */
#endif
```

`sync_improvement.py` regenerates the flattened remote context from the trusted
project headers referenced by the exact file, using the Makefile's CPP flags,
and prepends that macro; normal project compilation still follows the real
includes.

```sh
# Read-only preflight: compile and score the exact adopted local file upstream.
LOCAL_FLAGS="<exact make-nonmatching compiler flags>"
scripts/tools/decompme/sync_improvement.py <owned-base> \
  --source src/nonmatching/<fn>.c \
  --compiler-settings-from <improved-fork> \
  --compiler-flags "$LOCAL_FLAGS" --local-flags "$LOCAL_FLAGS" \
  --local-score <local-score> --local-residual "<linked-residual>" \
  --proof-result "PROVEN-BOUNDED(n)" --equiv-result "EQUIV 60/60" --dry-run

# Authenticated PATCH + normalized-source/toolchain-record verification.
scripts/tools/decompme/sync_improvement.py <owned-base> \
  --source src/nonmatching/<fn>.c \
  --compiler-settings-from <improved-fork> \
  --compiler-flags "$LOCAL_FLAGS" --local-flags "$LOCAL_FLAGS" \
  --local-score <local-score> --local-residual "<linked-residual>" \
  --proof-result "PROVEN-BOUNDED(n)" --equiv-result "EQUIV 60/60" \
  --expected-score <dry-run-score>
```

The helper never executes downloaded source locally. It uses the established
browser-UA/Referer and `setup_auth.sh` credential file, verifies ownership,
preflight-compiles the exact local text, and rolls the remote scratch back if
the PATCH response or fresh GET does not preserve normalized source identity,
settings, nonzero score, and the metadata record. That record contains the local
score/residual/compiler flags and decomp.me score/compiler/flags. Commit the
local adoption only after this succeeds. Keep the registry row active and do
**not** set SOLVED or `match_override` while score>0.

For a locally discovered improvement, omit `--compiler-settings-from` to retain
the owned base's compiler settings. Always try the exact local flags through
`--compiler-flags "$LOCAL_FLAGS"` first. If stock decomp.me rejects a project-only
flag such as `-mjp-promote`, rerun without that override or with a supported
subset, while leaving `--local-flags "$LOCAL_FLAGS"` unchanged. The helper then
retains the exact source, records the toolchain mismatch, verifies the score
decomp.me actually produced, and keeps the row active.

The remote score may be equal or worse because it measures a different compiler
configuration. **Score monotonicity is not proof of synchronization.** The proof
is matching normalized source hashes plus the verified metadata record. Older
adopted seeds must add the guard and be backfilled with this same sequence.

**Confirmed fallback (`J1ka1`, `sub_807D3BC`).** The exact project flags fail
decomp.me preflight with `"Invalid option 'jp-promote'"`; no compatible hosted
compiler is exposed. The expected fallback retains the exact normalized source,
uses hosted stock `-O2`, and records local score **655**, linked residual
**82/392**, `PROVEN-BOUNDED(1)`, `EQUIV 60/60`, hosted score **10499**, and both
flag sets. The `J1ka1` registry row remains active. This is a successful source
sync with a documented toolchain mismatch, not a score regression failure.

### ⚠️ The gotcha: a score-0 scratch can match via a MISLABELED symbol

decomp.me resolves each `bl` against **its context's** symbol addresses. If the author's
context maps a callee to the wrong address, the scratch scores 0 *there* but the byte source
is calling the wrong function — so integrating it verbatim **fails `make compare` by a few
bytes**. Diagnose and fix:

- **Symptom:** `make compare` FAILS; the *linked* bytes are near-perfect. Extract both and
  `cmp -l`:
  ```sh
  dd if=fireemblem8.gba of=/tmp/mine.bin  bs=1 skip=$((JP-0x8000000)) count=$SIZE
  dd if=baserom.gba     of=/tmp/tgt.bin   bs=1 skip=$((JP-0x8000000)) count=$SIZE
  cmp -l /tmp/tgt.bin /tmp/mine.bin | wc -l    # e.g. 3 bytes
  ```
  (Compare the LINKED ROM, **not** the unlinked `.o` — its relocations read 0 and give false
  diffs at every `bl`/pool site.)
- **Localize:** `objdump -D -b binary -m arm -M force-thumb --adjust-vma=JP …` both at the
  differing offsets → the diff is a `bl 0xAAAA` (target) vs `bl 0xBBBB` (yours).
- **Root-cause:** `nm -n fireemblem8.elf` for what's really at `0xAAAA` vs `0xBBBB`. The
  classic trap is **two byte-identical `return *global` getters** (or `setter`s): the
  `us_jp_funcmap.tsv` "exact" tier wildcards the literal-pool word, so it cannot tell
  `GetX`/`GetY` apart and may swap them. **Disambiguate by the RAM global each accessor
  touches** — the `SetX` that writes `G` pairs with the `GetX` that reads `G`.
  *(rtMN6 example: the scratch called `GetSelectTargetCount`, but JP 0x08050AC8 is
  `GetBanimLinkArenaFlag` — reads the link-arena flag 0x0203E0EC set by
  `SetBanimLinkArenaFlag`; `GetSelectTargetCount` is the sibling at 0x08050A9C reading
  0x0203E0E8. Repointing the two call sites fixed the 3-byte diff, and the funcmap was
  corrected.)*
- **Fix:** repoint the call(s) to the correctly-named symbol; re-`make compare`. Then also
  **fix the source funcmap row** so the misID doesn't bite the next carve (fix-the-class).

---

## Quick reference — what's verified vs cited

**Verified against `tools/agbcc` / the Makefile:**
- agbcc is stock `2.9-arm-000512`, same as US; not a fork. (`agbcc -version`)
- `-fprologue-bugfix` is a real, supported flag (suppresses unneeded leaf LR
  saves); NOT in default `CC1FLAGS`. (`agbcc --help`; binary string
  `flag_prologue_bugfix`)
- `-ftst` is **rejected** by this agbcc (`Invalid option '-ftst'`) — fork-only.
- `-fhex-asm`, `-ffix-debug-line`, `-mthumb-interwork` are the live flags; full
  pipeline is `cpp | iconv UTF-8→CP932 | agbcc | as`.
- `old_agbcc` exists, same version string, differs from `agbcc` only on specific
  shapes; in US it's used per-TU only for `m4a` ("older compiler for library
  code"). FE8J has no per-TU overrides yet.
- agbcc/old_agbcc produced identical output on the simple literal/arith test
  cases I tried (so r2-vs-r3 is shape-specific, not a blanket old-vs-new split).
- Sign-extension class (§5) is recorded and partly cracked **in this repo** (D20).
- `make compare` → `fireemblem8.gba: OK` (pure documentation; touches no build input).

**Cited from `docs/gba-decomp-survey.md` / community decomps (not reproduced
here):**
- The r2-vs-r3 first-literal heuristic as a general old-vs-modern statement.
- The named agbcc forks (`new_newlib_pret`, `new_layout_with_libs`, Klonoa
  `-ftst`) and that they sometimes unlock a game-specific codegen.
- `-ftst` controlling `tst` vs `cmp #0` (in the forks that have it).
