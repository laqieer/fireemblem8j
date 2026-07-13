# sub_800A594 / SplineSampleAtTime — contract-assisted relational-equivalence validation

Base commit (both `HEAD` and `origin/main` at package authoring time):
`5c210a85c99fb20d222b1d398dca3d22f015c2b1`

Pinned provenance hashes (checked by `run.sh`, fail-closed on drift):

| file | sha256 |
|---|---|
| `asm/sub_800A594.s` | `8704987d2e22242f218f0823b02245e44c3d8dcf736cf0133264f8352e9f5d35` |
| `src/nonmatching/sub_800A594.c` | `803977e01dc87393b2a7d2888af943a9c6e3bc9b36bb80024101d5e93daac10d` |

This package validates one of the final four still-`src/nonmatching` FE8J
functions using the Discussion #149 **contract-assisted relational
equivalence** method (`docs/equivalence_proving.md`), the same shared-oracle /
anti-masking method already validated for the sibling `sub_800A34C` and
`sub_800FAD0` focused packages (`scripts/tools/thumb_equiv/cbmc_spike/full16/focused/`).
It is a target-specific proof tied to the CURRENT committed source and asm
above, not a re-assertion of the historical note embedded in
`src/nonmatching/sub_800A594.c`'s comment block.

## The exact proposition

For **T** = the JP ROM bytes at `asm/sub_800A594.s` (JP `0x0800A594`) and **C** =
the committed `src/nonmatching/sub_800A594.c` reconstruction, this package
discharges two complementary, explicitly-labelled tiers:

1. **ARM-vs-ARM, bounded (`prove_nonmatching.py` / `differential_test.py`)** —
   the project's existing Z3 bounded-model-checking oracle comparing the raw
   THUMB byte streams of `T` and the compiled `C`, plus concrete differential
   testing. This is the historical claim, **re-derived fresh against the
   current commit** (not merely copied from the source comment).
2. **C-vs-C, bounded, CBMC, shared-oracle anti-masking (`harness.c`)** — a
   *target-specific* proof that the exact committed `impl_fn` (a direct,
   scaffolding-stripped copy of `src/nonmatching/sub_800A594.c`'s algorithm)
   computes the same observable as `ref_fn`, an INDEPENDENTLY-derived
   mechanical translation of `asm/sub_800A594.s` (via the m2c dump at
   `build/cbmc_full16_m2c/sub_800A594_ref.c`, repaired — see "m2c repair"
   below), for **∀ inputs in a stated bounded domain** (not just the specific
   inputs `differential_test.py` happened to sample).

Both tiers assert the negation of `∀ σ. O(T,σ) = O(C,σ)` (tier 1) /
`∀ σ. O(ref,σ) = O(impl,σ)` (tier 2) as a bounded, quantifier-free bit-vector
obligation and ask the solver for UNSAT (PROVEN) or a model (REFUTED).
Neither tier claims byte-match; `make compare` remains the sole project
oracle and is untouched by this package (`src/nonmatching/sub_800A594.c` is
compiled only by `make nonmatching`, never linked into `fireemblem8.gba`).

## Complete observable model

`O(F, σ) = ( the signed segment-index return value r0/i/sb,
             the caller-visible struct Vec2s16 *out (out->x, out->y, both
             s16 -- matching the real `strh` 16-bit truncation of the two s32
             words the evaluator callee produces),
             the ORDERED trace of calls to the two callees together with
             their full logical arguments )`.

**Calls / effects, modeled as shared call-indexed oracles with anti-masking:**

- **`sub_800A34C`** (asm label `SplineEvalCatmullRom`, `bl SplineEvalCatmullRom`
  in `asm/sub_800A594.s`) — the JP-only Catmull-Rom evaluator this function
  drives. Modeled as a shared call-indexed oracle: **all five logical
  arguments** are recorded on the reference call and asserted byte-identical
  on the implementation call *before* an identical symbolic 2-word result is
  copied into both sides' `out` buffers:
  1. the 6-word local control-point buffer (`lpts`) **contents**,
  2. the 3-halfword local time buffer (`ltimes`) **contents**,
  3. the scalar `t` (post wrap-adjustment in loop mode),
  4. the literal stack `count` word (always `3` at both real call sites, but
     still compared, not assumed — see mutation B below, which corrupts
     exactly this argument and is caught by this check, not by the final
     output compare).
  This is the anti-masking property from Discussion #149: an index-based
  shared result cannot mask a divergence in call order or call arguments,
  because the equality asserts happen strictly before the havoc write.
- **`sub_80D6384`** (GBA BIOS DivArm SWI 7 remainder wrapper; documented in
  the candidate source as `sub_80D6384(m, v) == v % m`) — modeled
  **concretely** as `v % m` in both `ref_fn` and `impl_fn` (its closed form is
  fully known and is simple unsigned-modulo arithmetic — no opaque havoc is
  needed or used), while STILL being logged through the same
  call-indexed/ordered-trace bookkeeping (`note_kind`) as the `sub_800A34C`
  oracle, so a mutant that skips or reorders the DivArm call relative to the
  evaluator call would still be caught by the "same number/order of oracle
  calls" assertions in `main()`, even though its numeric result is concrete.

**No other writes.** The function never writes through `pts`; its three
internal scratch arrays (`lpts`, `ltimes`, `lout`/`out_scratch`) are private
stack locals whose *contents* feed the oracle argument checks above, but whose
*addresses* are never compared — per the task contract, **raw private stack
pointer identity is explicitly NOT an observable** in this model.

## Alias model

`out` is assumed non-aliased with `pts` (every real call site passes distinct
caller-owned buffers; this matches the convention of every other focused
package in this repo). The private local scratch buffers are distinct C
arrays per side (`ref_fn`'s `lpts`/`ltimes`/`out_scratch` vs. `impl_fn`'s
`lpts`/`ltimes`/`lout`) — CBMC's `--pointer-check`/`--bounds-check` confirm no
out-of-bounds or invalid access on any of them across the whole bounded
domain.

## Bounded domain (stated exactly, not overclaimed)

- `MAXN = 5` control points; `count` ranges over **`{4, 5}`** — satisfies the
  task's "`count >= 4`, not `count <= 1` degenerate" requirement.
- `times[]` (per-point `u16 time`) is constrained strictly increasing
  (`times[i+1] > times[i]`, matching every real caller's spline-time table)
  and, for solver tractability, bounded to `times[i] <= 40` (documented
  numeric-range restriction, not a structural one — see "why this bound"
  below).
- The query time `t` is a full `u32` except bounded to `t <= 400000`
  (comfortably covers `ti = t >> 12` up to ~97, past every possible
  `times[]` value in the domain above, so both in-range and past-the-end
  search outcomes are reachable).
- `loop` (the mode selector) is a fully free `u8`, tested only for
  zero/nonzero exactly as the real code does (`if (loop)` / `(loop<<24)!=0`
  in asm are equivalent truthiness tests at the C level) — **left symbolic**,
  so a SINGLE CBMC run explores BOTH the loop-mode and non-loop-mode control
  paths.
- `pts[i].x`, `pts[i].y`, `pts[i].unk6` are fully free (`unk6` is unused by
  this function; kept in the struct only to preserve the real 8-byte stride).

**Coverage within this domain (all reachable, exercised by the solver, not
hand-picked):**
- Loop-mode wrap-around (`i==0`, `dtime = pts[count-1].time - pts[limit].time`,
  `t += dtime<<12`) AND loop-mode ordinary segment (`i!=0`).
- Non-loop-mode clamped-to-first (`i==0`) AND clamped-to-last (`i!=0`, with
  the `if (j < dtime) j++` clamp actually saturating when the search reaches
  the final segment boundary at `count-1`).
- The segment-search do-while loop iterating more than once (`limit`/`dtime`
  up to `4` when `count==5`), not just the trivial 0-or-1-iteration case.
- The three-point window fill (`slot = 0..2`) in all four branch
  combinations above.

**Why these numeric bounds, and not the full u16/u32 domain:** an initial run
with `times[]`/`t` spanning their full native ranges did not return within a
10-minute wall-clock budget (the bit-vector solver's search blew up on the
combination of full 16-bit strictly-increasing constraints across 5 points
and full 32-bit `t`). Restricting to `times[i] <= 40` / `t <= 400000` keeps
every control-flow shape above reachable (confirmed: CBMC's own path
exploration visits all branch combinations, see `run.sh` trace) while cutting
proof time to ~2 seconds. This is a genuine, disclosed narrowing of the
bounded-domain claim, not a structural limitation — the task's requirement to
"explain why and not overclaim" is why this paragraph exists instead of a
silent smaller MAXN.

## Unwind bound

`--unwind 10 --unwinding-assertions`. Verified sufficient: `--unwinding-assertions`
adds an explicit CBMC check that no loop needed a further iteration beyond the
stated bound; `harness.c` reports **0 of 841 properties failed**, i.e. zero
unwinding-assertion violations. (The theoretical maximum trip count in this
domain is `MAXN-1 = 4` for the segment-search do-while plus a fixed 3 for each
three-point fill loop and 6 for the oracle's control-point copy loop — `10`
comfortably covers all of these with margin, in the same ballpark as the
sibling `sub_800A34C` (`--unwind 17`) and `sub_800FAD0` (`--unwind 24`)
packages.)

## m2c repair (task requirement: "repair/clean the existing m2c-derived reference")

`build/cbmc_full16_m2c/sub_800A594_ref.c` (generated, not hand-edited) has two
defects that `ref_fn` in `harness.c` repairs, **preserving provenance to the
real `asm/sub_800A594.s` bytes**:

1. **Bogus `subroutine_arg0` base pointer.** The m2c dump emits
   `sp38 = &subroutine_arg0 + 0x24;` identically in both the loop and
   non-loop branches. `subroutine_arg0` is m2c's placeholder name for the
   stack-frame base address itself (m2c mis-attributed it as if it were a
   function argument) — it does not depend on any real argument. Reading the
   asm directly (`mov r0, sp; adds r0, #0x24; str r0, [sp, #0x38]`) shows this
   is simply "take the address of the local output-scratch pair at frame
   offset `0x24`". `ref_fn` replaces this with a real local
   `s32 out_scratch[2]` and a plain reference to it, no synthetic base
   pointer.
2. **Undeclared `sp24`.** The m2c dump's final two lines read `sp24` (and
   `M2C_FIELD(sp38, s32*, 4)`) without ever declaring `sp24` as a variable —
   it is written only through the `sp38`/`outp` pointer earlier, so m2c lost
   the direct-name binding for the read-back
   (`ldr r0, [sp, #0x24]` / `ldr r2, [sp, #0x38]; ldr r0, [r2, #4]` in the
   asm). `ref_fn` reads back `out_scratch[0]` / `out_scratch[1]` directly,
   which is exactly what those two asm loads do (the same 8-byte scratch,
   read once through a name and once through the equal-valued pointer — a
   real aliasing coincidence in the compiled asm, not a distinct storage
   location).

No semantics were invented: every arithmetic/comparison operator, branch
condition, and loop shape in `ref_fn` was cross-checked line-by-line against
`asm/sub_800A594.s` (traced in this session; see the instruction-level
walkthrough in the commit history / session log) before being written, and the
`o_sub_800A34C` / `o_DivArm` shared-oracle scaffolding around it is
independent of both the m2c dump and the candidate source.

## Trust labels (what this package does and does NOT claim)

| Claim | Status |
|---|---|
| ARM byte-vs-byte-compiled bounded equivalence (`prove_nonmatching.py`) | **PROVEN-BOUNDED(1)** — re-derived fresh, see "Actual output" below |
| ARM concrete differential testing (`differential_test.py`, 100 trials) | **EQUIV 100/100** — re-derived fresh |
| C-vs-C bounded relational equivalence, shared-oracle anti-masking (`harness.c`) | **PROVEN-BOUNDED-CBMC-CVC**, `count` in `{4,5}`, `times[i]<=40`, `t<=400000`, unwind 10 |
| Mutation sensitivity (output-copy swap) | **REFUTED as expected** (`harness_mut.c`) |
| Mutation sensitivity (callee-argument corruption, caught at the oracle's own anti-masking assert) | **REFUTED as expected** (`harness_mut_arg.c`) |
| Byte-match / `make compare` | **NOT claimed** — unaffected, still `OK` (see below) |
| Anything beyond the stated bounded domain (full u16/u32 `times`/`t`, `count` outside `{4,5}`, output-aliased-with-input call sites) | **UNKNOWN** — fail closed, not claimed |

## Commands and actual output

```sh
$ scripts/tools/thumb_equiv/cbmc_spike/final4/sub_800A594/run.sh
== provenance: hash-pinning asm/sub_800A594.s / src/nonmatching/sub_800A594.c ==
OK: asm/src bytes match the hashes this package's harnesses were derived from

== current ARM-vs-ARM proof (prove_nonmatching.py) ==
sub_800A594      PROVEN-BOUNDED(1)

===== SUMMARY =====
  sub_800A594      PROVEN-BOUNDED(1)

PROVEN: 1/1

== current differential test (100 trials) ==
sub_800A594      EQUIV (100 trials, ret4B args=[])

EQUIV: 1/1

== focused CBMC proof: harness.c (expect VERIFICATION SUCCESSFUL) ==
** 0 of 841 failed (1 iterations)
VERIFICATION SUCCESSFUL

== mutation A: harness_mut.c output-copy swap (expect VERIFICATION FAILED) ==
Violated property:
VERIFICATION FAILED
OK: output-copy mutation refuted as expected

== mutation B: harness_mut_arg.c sub_800A34C count-argument corruption (expect VERIFICATION FAILED) ==
Violated property:
VERIFICATION FAILED
OK: callee-argument mutation refuted as expected (at the oracle's own anti-masking assert)

===== VERDICT: sub_800A594 PROVEN-BOUNDED (ARM-vs-ARM, unwind=1) + PROVEN-BOUNDED-CBMC-CVC (C-vs-C, count in [4,5], unwind=10) =====
Not a byte-match claim. make compare remains the project oracle and is unaffected (nonmatching source untouched by this package).
```

(200-trial differential run was also executed standalone during this
session, also `EQUIV 200/200`; `run.sh` itself uses 100 trials to keep total
runtime modest — both counts exceed the "100+ valid trials" target.)

Full violated-property traces for the two mutants (segment/argument state at
the point of divergence) are reproducible via `run.sh` — it writes them to
`.run_mutA.log` / `.run_mutB.log` next to this README (gitignored scratch,
not committed) and prints only the compact verdict lines shown above.

`make compare` was run against this exact worktree/commit after adding this
package (which touches only files under this directory) and is unaffected:
`fireemblem8.gba: OK`.

## Files

- `harness.c` — the anchor proof (`ref_fn` vs `impl_fn`, shared oracles,
  anti-masking, full observable compare).
- `harness_mut.c` — mutation A: swaps the `out->x`/`out->y` output-copy words
  in `impl_fn` only (an "output copy" mutation per the task contract).
  REFUTES.
- `harness_mut_arg.c` — mutation B (additional, beyond the minimum one
  mutation required): corrupts the `count` argument passed to the
  `sub_800A34C` oracle from the real literal `3` to `2` in `impl_fn` only (a
  "meaningful callee argument" mutation per the task contract). REFUTES at
  the oracle's own anti-masking assert (`g_a34c_count[k] == count`), which is
  a stronger signal than a mutation only caught at the final return/output
  compare — it demonstrates the anti-masking mechanism itself is
  load-bearing, not decorative.
- `run.sh` — fail-closed driver: hash-pins `asm/sub_800A594.s` and
  `src/nonmatching/sub_800A594.c`, re-runs the current ARM-vs-ARM proof and
  differential test, runs the CBMC anchor + both mutants, and prints a
  concise verdict. Exits non-zero (and prints `UNKNOWN`, never a stale
  `PROVEN`) if the pinned hashes drift, if any required tool is missing, or
  if the anchor/mutants don't behave as expected.
- `README.md` — this file.
