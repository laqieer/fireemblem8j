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
| 6 | **Only instruction ORDERING differs, no source change flips it** | Same instructions, permuted order (arg-load order, batched vs inline) | §5b: scheduler artifact. Hand-permute the C structure deterministically; if that fails, it's a real permuter target — park as `src/nonmatching/`, permute out-of-sandbox. |

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
