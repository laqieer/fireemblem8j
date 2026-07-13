# sub_800A34C / SplineEvalCatmullRom — PROVEN-BOUNDED-CBMC-CVC

Result: **PROVEN-BOUNDED-CBMC-CVC** for a bounded model with `count` in `2..4`
(`MAXN=4`, `--unwind 17`).  The proof compares the reconstruction against a cleaned
m2c-shaped reference for the same JP bytes.  The function is `void`, so the only
caller-visible observable checked is the two `s32` writes to `out[0]` and `out[1]`.

## Method and soundness

This follows the validated `sub_80A6F1C` shared-oracle pattern.  `sub_800A194` is a
shared call-indexed oracle: the reference records the full contents of the pointed-to
coefficient/result buffers plus scalar `n`, and the implementation must call it in the
same order with byte-equivalent contents before receiving the same shared havoc of the
result vector.  `DivArm`, the segment unsigned divide, and fixed-point multiply nodes are
also shared call-indexed oracles whose full scalar arguments are recorded and asserted
equal.  Thus an index-based shared return cannot mask a divergence in call order or call
arguments; it refutes at the post/inline argument checks instead.

`sub_800A194` has five ABI words: four pointers in `r0-r3` and `n` at `[sp]`.
The project ARM-vs-ARM oracle now carries explicit signature metadata for this call,
records the stack word, and rejects source that declares or calls it with four
arguments.  The focused Python regression models the unsafe BVOBw shape (a manual
`[sp]` local plus a four-argument declaration/call) and requires an `INVALID-ABI`
rejection before proof or differential testing.

Scope is deliberately labelled below the byte oracle: bounded C-vs-C equivalence,
trusting m2c/spec shape, agbcc/codegen relevance, and these shared-oracle abstractions.
`make compare` remains the stronger project oracle.

## Commands and evidence

```sh
CBMC=../../../../../../../.cbmc-spike-tools/root/usr/bin/cbmc
COMMON="--32 --unwind 17 --unwinding-assertions --bounds-check --pointer-check --signed-overflow-check --slice-formula --stop-on-fail"
$CBMC harness.c $COMMON
# ** 0 of 687 failed (1 iterations)
# VERIFICATION SUCCESSFUL

$CBMC harness_mut.c $COMMON
# Violated property:
#   file harness_mut.c function main line 362 thread 0
#   out[1] equal
#   out_r[1] == out_i[1]
# VERIFICATION FAILED
```

`harness_mut.c` mutates the implementation's final `out[1]` write (`+ py0` to `- py0`),
so the observable is non-vacuous.
