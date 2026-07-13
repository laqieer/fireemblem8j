# `sub_807D3BC` (SelectSummonPos) — contract-assisted relational equivalence

Status label for this artifact: **PROVEN-BOUNDED-CBMC-CVC** for the modeled
domain below, corroborating the project's existing **PROVEN-BOUNDED(1)**
ARM-vs-ARM SMT proof and **EQUIV (100/100)** Unicorn differential result.
`make compare` remains the only byte-match oracle; **none of this changes the
match status** (still `UNSOLVED`, score 550, 61/392 linked residual bytes —
see `docs/nonmatching.md` and the header comment of
`src/nonmatching/sub_807D3BC.c`). This directory adds a fourth, independent,
mutation-tested evidence layer on top of the two ARM-level tools, following
the Discussion #149 contract method (`docs/equivalence_proving.md`).

## Exact proposition being proved

> For every `(x, y)` and every state of the 9-cell 3×3 neighborhood
> (`gBmMapSize`, `gBmMapUnit`, `gBmMapFog`, `gBmMapTerrain`,
> `gPlaySt.chapterVisionRange`) and every possible sequence of
> `CanUnitCrossTerrain` / `AdvanceGetLCGRNValue` / `DivRem` results, the
> current best staging candidate for `sub_807D3BC`
> (`src/nonmatching/sub_807D3BC.c`, the `-mjp-promote` score-550 source) and
> an independent reconstruction hand-derived from `asm/sub_807D3BC.s`
> (the real JP bytes) produce:
> 1. the same `s8` return value,
> 2. the same 12 bytes written through `struct SumThing *result` (or leave
>    `*result` untouched, in lock-step, when the return is `-1`), and
> 3. the same ordered, argument-matching trace of calls to
>    `CanUnitCrossTerrain`, `AdvanceGetLCGRNValue`, and `DivRem`,
>
> subject to the disclosed domain bounds and trust-boundary caveats below.

## Provenance (D1 — do not trust a stale snapshot)

| Artifact | Path | SHA-256 |
|---|---|---|
| Candidate (live) | `src/nonmatching/sub_807D3BC.c` | `91ff1d92b7c6c95062df624bffea622ce8927cc4ec087dd5fb8793cb993ebed4` |
| Candidate snapshot (this dir) | `candidate_snapshot.c` | same as above (verified by `run.sh` step 1) |
| Target bytes (live) | `asm/sub_807D3BC.s` | `0a61a7b5018d82b13eeffd6b735113657676216dce763cc0007b23c4dfb42b03` |
| m2c-from-asm reference (consulted) | `scripts/tools/thumb_equiv/cbmc_spike/full16/generated/reference_c/sub_807D3BC_ref.c` | `6964298015989144e3a85023c564d892651c205a0a5fd8acf613d4090c87c275` |
| Independent decomp.me upload (consulted) | `scripts/tools/decompme/pending/SelectSummonPos.c` | (read-only cross-check, not modified) |
| Base commit | `origin/main` | `5c210a85c99fb20d222b1d398dca3d22f015c2b1` |
| This work | branch | `copilot/proof-final4-d3bc`, worktree `/home/laqieer/fe8j-proof-d3bc` |

`ref_fn` in `harness.c`/`harness_mut.c` was authored by hand-cleaning the
generic `M2C_FIELD`/`M2C_UNK` macros in the m2c-from-asm reference into the
real typed `struct SumThing` field accesses (`include/mapanim.h:55`), using a
`goto`/`skip` control shape (matching the independently authored decomp.me
upload's structure) rather than `candidate_snapshot.c`'s `for`/`if-else`
shape — a deliberate structural divergence so `ref_fn` is a genuinely
separate re-derivation of the same asm bytes, not a renamed copy of the
candidate. All three readings (candidate `.c`, decomp.me `.c`, m2c-from-asm
`.c`) were cross-checked by hand against `asm/sub_807D3BC.s` while authoring
this contract and agree on the algorithm implemented below. No behavior was
invented: every branch, field offset, and callee in `ref_fn` traces to a
specific instruction range in `asm/sub_807D3BC.s` (see "asm cross-reference"
below).

`run.sh` step 1 re-hashes the live `src/`/`asm/` files and the committed
`candidate_snapshot.c` on every invocation and **fails closed** (non-zero
exit, no proof claimed) if any of them have drifted since this contract was
authored — a stale snapshot cannot silently report success.

### asm cross-reference (spot check, not exhaustive)

| Behavior | `asm/sub_807D3BC.s` |
|---|---|
| 3×3 outer/inner bounds (`iy < y+2`, `ix < x+2`) | `_0807D3E4`/`_0807D40A`, cmp against `sl`/`r6` |
| `array[count].x/y` written before validity check | `strb r5,[r4]; strb r6,[r4,#1]` before the `cmp`/`bl` chain |
| `gBmMapSize` (`0x0202E4D0`), `.x`/`.y` at `+0`/`+2` | `_0807D478`, `ldrsh r0,[r3,r1]` with `r1∈{0,2}` |
| `gBmMapUnit[iy][ix]` (`0x0202E4D4`, row-pointer table) | `_0807D47C` block |
| `gPlaySt.chapterVisionRange` (`0x0202BCEC+0xd`) | `_0807D480` block |
| `gBmMapFog[iy][ix]` (`0x0202E4E4`) | block after `_0807D450` |
| `gBmMapTerrain[iy][ix]` (`0x0202E4D8`) + `CanUnitCrossTerrain(&gBattleActor.unit@0x0203A4E8, terrain)` | `_0807D450`..`bl CanUnitCrossTerrain` |
| reject OR-with-0xff on fail / `boolAvailable=1; count++` on success | `_0807D46E` vs `_0807D490` |
| zero-fill `indices[8..0]` | `_0807D4D0` loop |
| compaction `for i<count: if boolAvailable==1: indices[j++]=i` | `_0807D4EC`/`_0807D500` |
| `AdvanceGetLCGRNValue()` then `DivRem(rn, count+1)`, `- 1` | `bl AdvanceGetLCGRNValue; ...; bl DivRem; subs r0,#1` |
| 12-byte `*result = array[indices[pick]]` (`ldm`/`stm` of 3 words) | tail of `_0807D50C` block |
| `return -1` / `return 1` | `movs r0,#1; rsbs r0,r0,#0` vs `movs r0,#1` |

## Input / global model (complete)

* **Function args**: `x`, `y` (`s32`), `result` (`struct SumThing *`).
* **Read-only globals** (never written by this function, so a single shared
  instance is read identically by both `impl_fn` and `ref_fn` — no
  per-side copy or oracle needed for these): `g_mapSize_x`/`g_mapSize_y`
  (`gBmMapSize.x`/`.y`), `g_mapUnit[3][3]`/`g_mapFog[3][3]`/
  `g_mapTerrain[3][3]` (the only 9 `(iy,ix)` cells the fixed loop can ever
  reach, `gBmMapUnit`/`gBmMapFog`/`gBmMapTerrain`), `g_chapterVisionRange`
  (`gPlaySt.chapterVisionRange`).
* **`gBattleActor.unit`'s address**: modeled as one shared opaque marker
  object (`g_battleActorUnit_marker`); only its **identity** (same pointer
  value on both sides) matters here, since the callee's body is out of
  scope (see "external calls" below) — this still catches a mutation that
  passes a *different* pointer (e.g. `&gBattleTarget.unit`).
* **Shared per-slot "stack garbage"** (`g_garbage_hi`/`g_garbage_lo`,
  9 × 2 × `u32`): stands in for `struct SumThing.unk04`/`.unk08`, which this
  function never initializes — see trust boundary §1.

## Observables (complete)

1. The `s8` return value (`-1` or `1`).
2. All 12 bytes of `*result` when the return is `1` (`x`, `y`,
   `boolAvailable`, `unk04`, `unk08`); `*result` must be bit-for-bit
   untouched (checked against a shared sentinel) when the return is `-1`.
3. The interleaved, kind-and-order-checked call log (`note_kind`/
   `g_log_kind`) covering every external call, plus per-callee argument
   tables:
   * `CanUnitCrossTerrain(unit, terrain)` — up to 9 calls (one per grid
     cell that reaches it); target pointer and terrain argument checked
     equal at each call index.
   * `AdvanceGetLCGRNValue()` — 0 or 1 call; its nondeterministic return is
     shared by call index (never ignored — a mutation that calls it an
     extra time or skips it changes `R.ci_rng != I.ci_rng` or the unified
     `nlog` count).
   * `DivRem(a, b)` — 0 or 1 call; concrete and deterministic
     (`a % b`, matching the BIOS SWI 6 remainder in
     `src/libagbsyscall.s:46`), with its arguments checked equal.

## Loop / domain bounds

* `--unwind 12` covers every loop in both functions: the fixed 3×3 outer/inner
  grid loops (3 iterations each), the 9-iteration zero-fill and compaction
  loops, and the `main()` setup loops (largest is the 9-slot terrain-return
  table) — all strictly under the bound, so `--unwinding-assertions` proves
  the bound is never exceeded (no silently-truncated loop).
* `x, y ∈ [-1, 1]`, `gBmMapSize.x, gBmMapSize.y ∈ [0, 2]`: small enough to be
  tractable, wide enough that every relationship between the 3×3 window and
  the map bounds is exercised — fully inside, fully outside on every edge,
  and straddling a bound in both axes independently. Because the per-cell
  occupancy/fog/terrain/callee-return values are all free (see below), CBMC
  explores **every** reachable `count` from 0 through 9 for **every** such
  window/bounds combination — the zero-candidate path, the all-9-candidates
  path, and every count in between are all covered simultaneously; this is
  not reduced to one cell or one scenario.
* `gBmMapUnit[iy][ix]`, `gBmMapFog[iy][ix]`, `gBmMapTerrain[iy][ix]` are
  free but restricted to `{0, 1}`: every use site of these three globals only
  ever compares against `0` (occupancy/fog) or forwards the value opaquely to
  the `CanUnitCrossTerrain` contract (terrain — its magnitude never drives
  this function's own control flow), so `{0,1}` preserves full 2-way branch
  coverage at every use site while cutting the SAT search space.
  `g_chapterVisionRange` similarly restricted to `{0,1}` (only ever compared
  against 0).
* `g_terrain_ret[k] ∈ {0, 1}` (only ever compared `!= 0`/`== 0`).
  `g_rng_ret[k] ∈ [-20, 20]`: wide enough to realize both the in-domain
  (`DivRem` remainder ends up non-negative) and the excluded
  out-of-domain case (see trust boundary §2), narrow enough to keep the
  `%` arithmetic in the SAT encoding cheap.

## Pointer / alias treatment

`array[9]`, `indices[9]`/`sel[9]` in `impl_fn` and `ref_fn` are independent
local (stack) objects in each function — per requirement 7, this harness
never compares their addresses, only their **logical contents** (element
values) and the **effects** written through `result`. The only pointer
*identity* asserted anywhere is the `CanUnitCrossTerrain` unit argument
(`&gBattleActor.unit`'s single shared marker), which is a real, disclosed
comparison (not a byte-address coincidence): both functions are required to
pass the same fixed global, and a mutation that swaps in a different global
is exactly what that assertion is there to catch.

## Trust boundary / domain caveats (disclosed, not hidden)

1. **Pass-through garbage** (`unk04`/`unk08`): never initialized by this
   function; real target vs. candidate machine code can have different
   local-frame shapes (that is *why* this function is still non-matching),
   so those two words are not soundly comparable against a literal, real
   stack byte-for-byte. This harness instead shares one symbolic
   per-logical-slot value between `impl_fn`'s and `ref_fn`'s own local
   arrays, which lets the proof machine-check the actual unsolved part (the
   selection/compaction/copy logic) while being explicit that the garbage
   *value* equality is a modeling convenience, not a hardware byte-identity
   claim. (The initial garbage of `boolAvailable` needs no such modeling:
   any value OR'd with the reject constant `0xff` yields `0xff` regardless,
   so the algorithm's behavior is provably invariant to it — see
   `init_garbage()` and the harness header comment.)
2. **Negative `DivRem` remainder**: `AdvanceGetLCGRNValue()` returns a
   genuinely full-range `unsigned` (`src/rng.c:103`); `DivRem` receives it as
   a signed `int` (`include/gba/syscall.h:36`), and the BIOS SWI 6 remainder
   truncates toward zero, so a numerically negative input can produce a
   negative remainder — making `pick = DivRem(...) - 1` fall outside
   `[0, count-1]` and the real ROM read *before* `indices[]`. This is a
   genuine, shared property of the real game (not introduced by either
   reconstruction) whose *concrete* byte effect depends on target-vs-candidate
   stack shape (same root cause as caveat 1) and is therefore not soundly
   comparable at this contract's level. Both `impl_fn` and `ref_fn`
   explicitly `ASSUME(pick >= 0 && pick < count)` — a disclosed domain
   restriction, not a silent narrowing: `run.sh`'s ARM-vs-ARM step (which
   operates over the real shared ROM/candidate memory model, not this
   contract's local stack fiction) is the tool that already covers the
   full, unrestricted byte-level behavior for this edge (see its
   `PROVEN-BOUNDED(1)` result).
3. This is a **bounded** contract proof over the domain in "loop / domain
   bounds" above, not an unbounded proof over all 32-bit `x`/`y`/map sizes.
   `make compare` and the project's ARM-vs-ARM tools remain the stronger,
   real-address oracles; this contract is a third, complementary,
   more-auditable-at-the-C-level check, per Discussion #149's own stated
   tier ordering (`docs/decisions.md` D349): bounded SMT/contract proofs are
   *below* byte-match, never a substitute for it.

## Mutation (`harness_mut.c`)

`impl_fn`'s final pick computation drops the `- 1` that both the asm
(`subs r0, #1` immediately after `bl DivRem`) and every independent reading
agree on: `pick = DivRem(rn, count + 1);` instead of
`pick = DivRem(rn, count + 1) - 1;`. This changes *which* accepted slot is
materialized into `*result` (a random-selection / result-materialization
class bug per requirement 8) and refutes via `result.y equal` whenever the
free grid produces ≥2 accepted cells with the two candidate picks landing on
different slots — reachable directly in the unconstrained domain, no
scenario narrowing needed.

An earlier mutation attempt (compaction condition `boolAvailable != 0`
instead of `== 1`) was tried first and found **undetectable**: this
algorithm has a genuine invariant that every slot below the final `count` is
locked to `boolAvailable == 1` the moment `count` advances past it and is
never revisited (`indices[i] == i` always), so the `==1`/`!=0` test is
provably always true either way. This is documented here rather than
silently discarded, per the "no evidence-shopping" principle: not every
plausible-sounding mutation in the requested categories is actually
observable for this specific algorithm, and finding that out (and recording
why) is itself part of the validation.

## Commands and evidence

```sh
$ sh run.sh
== step 1/5: source/asm provenance check (fail closed on staleness) ==
OK: live src/asm match the hashes this contract was authored against

== step 2/5: current ARM-vs-ARM bounded proof + differential test ==
sub_807D3BC      PROVEN-BOUNDED(1)
PROVEN: 1/1
sub_807D3BC      EQUIV (100 trials, ret1B args=['val', 'val', 'ptr'])
EQUIV: 1/1

== step 3/5: CBMC relational contract proof (harness.c) -- expect VERIFICATION SUCCESSFUL ==
** 0 of 257 failed (1 iterations)
VERIFICATION SUCCESSFUL
OK: harness.c VERIFICATION SUCCESSFUL

== step 4/5: CBMC mutation (harness_mut.c) -- expect VERIFICATION FAILED (refutation) ==
Violated property:
  file harness_mut.c function main line 464 thread 0
  result.y equal
  result_ref.y == result_impl.y
VERIFICATION FAILED
OK: harness_mut.c refuted as expected (mutation is observable)

== step 5/5: make compare (project oracle; source is NOT modified by this task) ==
...
fireemblem8.gba: OK

================= VERDICT =================
sub_807D3BC (SelectSummonPos): UNSOLVED (byte-match) / PROVEN-BOUNDED(1) (ARM-vs-ARM SMT) /
  EQUIV (100/100 differential trials) / CBMC contract PROVEN for the modeled
  domain (harness.c) / mutation-sensitive (harness_mut.c refutes).
make compare: OK (project oracle unaffected by this validation task).
=============================================
```

Actual timings observed while authoring this contract (worktree
`/home/laqieer/fe8j-proof-d3bc`, CBMC 6.10.0, `.cbmc-spike-tools` cache):
`harness.c` anchor proof ≈ 7m46s; `harness_mut.c` refutation ≈ 2m42s (a
refutation only needs to find one counterexample, so it is typically faster
than a full proof); `make compare` full rebuild ≈ several minutes (`sha1sum -c
checksum.sha1` → `fireemblem8.gba: OK`).

Set `SKIP_MAKE_COMPARE=1` to skip the ~10-minute full rebuild in step 5 once
it has been independently verified OK for the current tree (the CBMC/ARM
proof steps are unaffected either way and are never skipped).

## Files in this directory

| File | Role |
|---|---|
| `common.h` | shared typedefs/`ASSERT`/`ASSUME`/`nondet_*` decls |
| `candidate_snapshot.c` | byte-identical snapshot of `src/nonmatching/sub_807D3BC.c` (provenance; not compiled directly — `impl_fn` in the harnesses is its hand-transcribed body, see file header) |
| `harness.c` | the relational CBMC proof (deliverable) |
| `harness_mut.c` | `harness.c` + the pick-computation mutation, expected to refute (deliverable) |
| `run.sh` | provenance check → ARM-vs-ARM proof/differential → CBMC proof/mutation → `make compare` → verdict (deliverable) |
| `README.md` | this file (deliverable) |
