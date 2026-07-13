# sub_800A34C / SplineEvalCatmullRom — contract-assisted relational equivalence
# (refresh against current source, D349/Discussion #149 method)

## Verdict

**PROVEN-BOUNDED-CBMC-CVC** (relational, contract-assisted) for the bounded
domain `count ∈ [2,4]` (`MAXN=4`, `--unwind 17 --unwinding-assertions`), PLUS
an independently re-run **ARM-vs-ARM `PROVEN-BOUNDED(3)`** from the project's
compiler-free machine-code prover. Both anchors hold on the CURRENT source;
neither was assumed from the historical package.

This is a **refresh**, not a reuse: `src/nonmatching/sub_800A34C.c` was rewritten
today (commit `c044360b9`, "improve sub_800A34C to score 60") after the prior
CBMC package (`c58b127b8`, 2026-07-07) and after `27e98caa2` ("enforce
sub_800A194 five-arg ABI"). The prior package's `harness.c`/`harness_mut.c`
were audited line-by-line against the new source (see "Line-by-line audit"
below) and this package's `harness.c`/`harness_mut.c` were **rewritten from
that audit**, not copied.

## Exact proposition

For all `pts[0..8)` (`s32`), `times[0..4)` (`u16`, strictly increasing),
`t` (`u32`), `count ∈ {2,3,4}`, and all oracle return values for
`sub_800A194`/`DivArm`/the `u*value` 32-bit multiply/`__udivsi3`: the current
candidate `src/nonmatching/sub_800A34C.c` and an independently ASM-traced
reference produce

1. identical `out[0]` and `out[1]` (the function is `void`; these two `s32`
   words are the ONLY caller-visible data effect), and
2. an identical ordered trace of external calls (same kind, same count, same
   order) to `sub_800A194`, `DivArm`, the `u*value` multiply site, and
   `__udivsi3`, each with byte-identical arguments (full pointed-to buffer
   *contents*, never raw addresses) before either side receives the SAME
   (shared) oracle return/havoc value.

## Provenance (exact)

- Base repo commit: `5c210a85c99fb20d222b1d398dca3d22f015c2b1` ("Consolidate
  battle background palettes") — matches the task's expected base.
- Worktree: `/home/laqieer/fe8j-proof-a34c`, branch `copilot/proof-final4-a34c`.
- Candidate source: `src/nonmatching/sub_800A34C.c`, last touched by
  `c044360b9aa86dbc01dbba0f9de494ff3083128f` (2026-07-13, "nonmatching: improve
  sub_800A34C to score 60"). SHA-256 at base commit:
  `6812f3ae518024464e7356a1f09fdd13dc6bbc51ee5602af2ee2c10c8c520dfd`.
- JP byte source: `asm/sub_800A34C.s`, last touched by
  `6585bcbd200df875c0fa6466fd9418f740f64c4a` (2026-07-05, `.set`
  symbolization, byte-identical per that commit's own message). SHA-256:
  `e295cbb70533729bf5083c769b6c62b68bea92259314c13a2cd0f3de36953ca6`. Verified
  **unchanged** since the 2026-07-07 proof commit `c58b127b8`
  (`git diff c58b127b8 HEAD -- asm/sub_800A34C.s` is empty).
- Prior art (audited, NOT reused as-is): `c58b127b8` "Add CBMC C-vs-C proof for
  sub_800A34C", package at
  `scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800A34C/`. That
  package's `impl_fn`/`ref_fn` already modeled the eventual void/5-arg-ABI
  shape (anticipating `27e98caa2`), so its *algorithm* survived the rewrite,
  but its literal C text predates today's candidate; this package's
  `harness.c`/`harness_mut.c` are freshly written from an independent
  instruction-by-instruction trace of the CURRENT candidate and the unchanged
  JP asm (see below), reusing only the validated *methodology*
  (shared call-indexed oracle + anti-masking + mutation gate).

## Modeled inputs / domain

| Symbol | Type | Domain |
|---|---|---|
| `pts[0..8)` | `s32` | fully symbolic |
| `times[0..4)` | `u16` | fully symbolic, `ASSUME` strictly increasing |
| `t` | `u32` | fully symbolic |
| `count` | `s32` | `ASSUME(count >= 2 && count <= 4)` |
| oracle returns (`DivArm`×6, `u*value`×6, `__udivsi3`×1, `sub_800A194` result buffer×8) | — | fully symbolic |

`count ∈ [2,4]` is the same bound the historical package used, re-justified
here rather than assumed: it is the smallest domain that exercises **both key
paths** —

- `count == 2`: the middle spline-coefficient loop (`k` from 1 to `last-1`)
  does not run (`last == 1`); both `i >= last` (fallback = last-endpoint copy)
  and `i < last` (interpolation) are reachable depending on the symbolic
  `times`/`t` relationship, since the do-while search can end with `i == 0`
  or `i == 1`.
- `count == 3`: the middle loop runs exactly once.
- `count == 4` (`MAXN`): the middle loop runs twice, and is the deepest bound
  the `--unwind 17` budget was sized against (segment-search do-while ≤3
  iterations + coefficient loop ≤2 iterations + the two flat init loops in
  `main` over `PTS_WORDS`/`MAXN`, all with room to spare).

This is not a "1×1" or return-only degeneracy: the fallback branch, the
interpolation branch, and both trip-counts of the coefficient loop are all
live, symbolic-input-dependent paths in the same bounded run.

## Complete caller-visible observable / call / alias audit

- **Return value:** `sub_800A34C` is declared `void`; there is no return-value
  observable.
- **Output words:** `out[0]`, `out[1]` — the *only* data written through a
  caller-supplied pointer. Both are asserted equal at the end of `main`.
- **External calls, in order, each a shared call-indexed oracle:**
  1. `sub_800A194(coeffA, coeffB, sub, tan, count)` — **once**. Five ABI
     words: `r0..r3` = the four pointers, `n` (`count`) at `[sp]` (confirmed
     against the `bl sub_800A194` call site in `asm/sub_800A34C.s`: `str r1,
     [sp]` immediately before the branch, with `r0=coeffA, r1=coeffB,
     r2=sub-array, r3=tan`). The oracle compares the full *contents* of
     `coeffA[0..4)`, `coeffB[0..4)`, `sub[0..4)`, `tan[0..8)` (never pointer
     identity — the candidate's `work.*` fields and the reference's SP-offset
     arrays live at unrelated host addresses in the harness) and `n`, THEN
     applies the identical (shared, symbolic) havoc to `tan[0..8)` on both
     sides — this is the buffer `sub_800A194` is documented (by the existing
     ABI validator) to solve in place, and the caller reads `tx`/`ty` (aliases
     into `tan[]`) again afterward for the interpolation math, so the
     post-call contents genuinely matter and are modeled, not skipped.
  2. `__udivsi3(t - (times[i]<<12), times[i+1]-times[i])` — **0 or 1 times**
     (only on the interpolation path); bounded at 1 in the domain.
  3. `DivArm(0x1000, u*value)` — **6 times** (3 on the x Horner chain, 3 on
     the y chain), each compared on both scalar arguments.
  4. the `u*value` 32-bit multiply (`muls`) feeding each `DivArm` call — **6
     times**, modeled the same call-indexed way specifically to keep
     multiplication out of the solver's nonlinear bitvector path without
     weakening the claim: both sides must present IDENTICAL operands, in
     identical order, before receiving the shared result, so this abstraction
     cannot mask a real divergence in what is multiplied or in what order.
- **Pointer/alias relations:** `tx = &tan[0]`, `ty = &tan[1]` (interleaved
  x/y pairs, confirmed by the asm: the y-tangent store at prologue is
  `str r0,[r4,#4]` where `r4` holds the SAME base as `tx`); `ep0`/`ep1` alias
  the tail of `pts[]` and are reused, unmodified, by the `i>=last` fallback
  branch after the `sub_800A194` call (confirmed live in a callee-saved
  register — `r4` — across the call site in the asm, i.e. NOT re-derived).
  The harness never compares raw addresses; every comparison is on array
  *contents* at the model's own (harness-local) storage.
- **Callee-saved / SP conditions:** covered by the **ARM-vs-ARM** engine
  (`prove_nonmatching.py`), which lifts real THUMB bytes and checks the full
  machine state (registers + memory + `sp&7==0` precondition) — re-run fresh
  for this package (see below), not assumed from history. CBMC operates on
  C semantics only and does not model registers/SP; the two proof layers are
  complementary, and both are recorded.
- **Loop/unwind scope:** segment-search do-while (≤3 trips at `count=4`),
  coefficient-build do-while (≤2 trips), plus `main`'s two flat init loops
  over `MAXN`/`PTS_WORDS` (≤4 trips each). `--unwind 17 --unwinding-assertions`
  is comfortably above the deepest of these, and CBMC's own unwinding
  assertions (part of `$COMMON`) fail loudly if any loop needed more.
- **Trust boundary:** this is **bounded C-vs-C** equivalence — it trusts (a)
  that the hand-traced `ref_fn` faithfully represents the JP asm (see the
  line-by-line audit below, independently re-derived for this package), (b)
  agbcc/CP932/codegen relevance is out of scope here (covered instead by the
  ARM-vs-ARM engine, which lifts the REAL compiled bytes), and (c) the shared
  call-indexed oracle abstraction for `sub_800A194`/`DivArm`/multiply/udiv,
  which is sound under the stated anti-masking argument-equality checks but
  does not independently verify those callees' own behavior (out of scope:
  they are unchanged baseline/library code, not part of this candidate).
  `run.sh` hard-pins the candidate/asm SHA-256 hashes and fails closed
  (exit `2`, prints `UNKNOWN`) rather than silently re-printing a stale
  verdict if either file drifts from what this audit was performed against
  (verified: a deliberately corrupted pin on either hash aborts before any
  proof runs). `make compare` remains the project's only byte oracle and is unaffected by
  any of this (isolated worktree, see below).

## Line-by-line audit (current candidate ⇄ current JP asm)

Performed by hand, instruction-by-instruction against `asm/sub_800A34C.s`
and statement-by-statement against `src/nonmatching/sub_800A34C.c` before
writing `harness.c`. Every register-pinned candidate local
(`register int *ptsBase asm("sl")`, etc.) and every `work.{sub,coeffA,coeffB,
tan}` struct-field access was checked to resolve to the exact SP offset the
asm uses (`sub@sp+4`, `coeffA@sp+0x14`, `coeffB@sp+0x24`, `tan@sp+0x34`,
`i@sp+0x60`, `count8@sp+0x68`, `tx-ptr-slot@sp+0x6c`, `ty-ptr-slot@sp+0x70`,
`out@sp+0x54`, `times@sp+0x58`, `t@sp+0x5c`); every `MATCH_BARRIER` expands to
zero instructions (a pure GCC asm-volatile allocation fence) and is erased in
the model. Key correspondences verified:

- Segment search: the three-way branch (`ti<times[0]` → fall into loop body;
  `times[0]<=ti<times[1]` → `goto search_done`; else → fall into loop body)
  matches `blo _0800A392` / `blo _0800A3AE` / fallthrough exactly, both in the
  candidate's `goto search_times` / `goto search_done` labels and in the
  ASM's label topology.
- Tangent-endpoint idiom `-3*(a-b)` appears at all **six** sites (both ends
  + both interior-loop stores ×2 iterations max) as `subs; lsls #1; adds;
  rsbs #0` in the asm and as the identical arithmetic in the candidate; both
  `harness.c` sides route it through one shared `three_neg_diff` helper so
  the operation order is pinned identically on both sides.
- The coefficient loop's per-iteration stores (`sub[k]=0x1000`,
  `coeffA[k]=0x4000`, `coeffB[k]=0x1000`, `tan[2k]`, `tan[1+2k]`) match the
  asm's `stm`/`str` sequence at `_0800A3FC` field-for-field, including the
  SAME cursor-pointer aliasing (`dp` walks `sub[1..]`, `txw` walks
  `tan[2..]`).
- The `sub_800A194` call site: `str r1,[sp]` (n=count) then
  `r0=coeffA,r1=coeffB,r2=sub,r3=tan; bl sub_800A194` — confirms the real
  five-word ABI the candidate's `extern void sub_800A194(int*,int*,int*,
  struct SplineVec2*,int)` declaration and call already use (this is the
  ABI the project's `equiv.py` validator enforces per `27e98caa2`).
- Post-call fallback (`i>=last`): `ldr r0,[r4]` / `ldr r0,[r4,#4]` reads
  `ep1[0]`/`ep1[1]` from the SAME register (`r4`) set up before the call —
  i.e. the asm keeps `ep1` live across `bl sub_800A194` in a callee-saved
  register, exactly as the candidate's C model (which just re-reads the
  already-computed `ep1` local) requires for equivalence.
- Both Horner chains (`ax→bx→m0x→px0` / `ay→by→m0y→py0`, three nested
  `DivArm(0x1000, u*value)` each) match instruction-for-instruction, including
  the constant `0x1000` always being the FIRST `DivArm` argument in both.

No discrepancy was found; the residual (decomp.me score 60, one scheduling
swap of a `tx` load relative to the `count`-to-stack store, see the
candidate's own header comment) is a pure ARM instruction-scheduling
difference with zero effect on any modeled observable — confirmed separately
by the ARM-vs-ARM engine, which reasons about the real compiled bytes and
still proves `PROVEN-BOUNDED(3)` (see below).

## Commands and actual outputs

Run from `scripts/tools/thumb_equiv/cbmc_spike/final4/sub_800A34C/` in the
worktree `/home/laqieer/fe8j-proof-a34c` (branch `copilot/proof-final4-a34c`),
base commit `5c210a85c`:

```sh
$ ./run.sh
== provenance: hash-pinning candidate source and JP asm ==
6812f3ae518024464e7356a1f09fdd13dc6bbc51ee5602af2ee2c10c8c520dfd  .../src/nonmatching/sub_800A34C.c
e295cbb70533729bf5083c769b6c62b68bea92259314c13a2cd0f3de36953ca6  .../asm/sub_800A34C.s
OK: asm/src bytes match the hashes this package's harnesses were derived from
base repo HEAD: 5c210a85c99fb20d222b1d398dca3d22f015c2b1 2026-07-13 13:31:47 +0000

== stage 1: real ARM-vs-ARM machine-code proof (project oracle-adjacent) ==
sub_800A34C      PROVEN-BOUNDED(3)
PROVEN: 1/1

== stage 2: CBMC relational proof (harness.c) -- expected VERIFICATION SUCCESSFUL ==
** 0 of 681 failed (1 iterations)
VERIFICATION SUCCESSFUL

== stage 3: CBMC mutation (harness_mut.c) -- expected VERIFICATION FAILED on out[1] ==
  out[1] equal
VERIFICATION FAILED

===== VERDICT: PROVEN-BOUNDED-CBMC-CVC (relational, contract-assisted) =====
ARM-vs-ARM: PROVEN-BOUNDED(3)
CBMC anchor: VERIFICATION SUCCESSFUL (see harness_out.txt)
CBMC mutation: VERIFICATION FAILED on out[1] equal (non-vacuous, see harness_mut_out.txt)
```

`run.sh` hard-pins `EXPECT_SRC_SHA256`/`EXPECT_ASM_SHA256` (the exact hashes
above, recorded against base commit `5c210a85c`) and fails closed — printing
`FAIL-CLOSED: ...` plus `UNKNOWN (verdict withheld ...)` on stderr and exiting
`2` — if either the candidate source or the JP asm has drifted from those
pinned values, mirroring the sibling `sub_800A594`/`sub_807D3BC` packages'
provenance gate. Verified by deliberately corrupting each pinned constant in
turn (`EXPECT_SRC_SHA256`/`EXPECT_ASM_SHA256` set to a dummy all-zero/all-one
hash) and re-running: both mismatches correctly abort at the provenance stage
before any proof is attempted, with exit code `2` and the `UNKNOWN` verdict
printed; both were reverted immediately after confirming the fail-closed
behavior (no proof stage ever ran under a mismatched hash).

Standalone equivalents (same flags `run.sh` uses,
`COMMON="--32 --unwind 17 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"`):

```sh
$ cbmc harness.c $COMMON
** 0 of 681 failed (1 iterations)
VERIFICATION SUCCESSFUL          # real elapsed: ~8m10s

$ cbmc harness_mut.c $COMMON
Violated property:
  file harness_mut.c function main line 490 thread 0
  out[1] equal
  out_r[1] == out_i[1]
VERIFICATION FAILED               # real elapsed: <1s (SAT found fast)

$ $HOME/z3-venv/bin/python scripts/tools/thumb_equiv/prove_nonmatching.py sub_800A34C
sub_800A34C      PROVEN-BOUNDED(3)
PROVEN: 1/1
```

`harness_mut.c` mutates only the candidate side's (`impl_fn`'s) final
`out[1]` Horner add, negating `py0` (`sub32(0, py0)` instead of `py0`) — a
real output-computation change, not a dead/unreachable edit — and CBMC
correctly refutes exactly `out[1] equal`, confirming the base harness is
non-vacuous (capable of catching a genuine divergence in this observable).

`make compare` in the worktree: `fireemblem8.gba: OK` (confirmed before and
unaffected by this package — see below).

## Honest confidence label

**PROVEN-BOUNDED-CBMC-CVC**, layered with an independently-current
**ARM-vs-ARM PROVEN-BOUNDED(3)**. This is explicitly BELOW the project's only
true oracle (`make compare` / byte-exact match) and BELOW an unbounded proof:
it is bounded to `count ∈ [2,4]`, trusts the hand-traced `ref_fn`'s fidelity
to the JP asm (audited above, not independently re-derived by a second
party), and trusts the shared-oracle abstraction's anti-masking argument for
`sub_800A194`/`DivArm`/multiply/`__udivsi3` rather than modeling those
callees' own internals. No degenerate narrowing (return-only, trivial count,
or dead-mutation) was used anywhere in this package; both the fallback and
interpolation branches, and both loop trip-counts, are live in the modeled
domain, and the mutation gate demonstrates the two-word output observable is
actually exercised.
