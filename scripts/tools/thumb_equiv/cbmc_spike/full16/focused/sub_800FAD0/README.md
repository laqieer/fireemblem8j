# sub_800FAD0 / GetUnitDefinitionFormEventScr — CBMC C-vs-C spike

**Verdict:** `PROVEN-BOUNDED-CBMC-CVC`, bounded at `COUNTMAX=4`.

The requested `COUNTMAX=8` was attempted with both the direct word-level model and
this reduced observable-token model, but CBMC did not close within 300 seconds.  The
checked domain is therefore the largest domain closed in this spike: `count` remains
fully symbolic in `[0, 4]` (not pinned to a singleton), exercising multi-unit
selection, two-pass reorder, the terminator write, optional `arg4` REDA clearing,
`arg3 == TRUE` callback havoc, and bounded collision/retry behaviour.

## Model

The harness compares the reconstruction from `src/nonmatching/sub_800FAD0.c` with
the m2c reference shape from `full16/generated/reference_c/sub_800FAD0_ref.c`.
`UnitDefinition` is represented by observable tokens: copied opaque payload,
`charIndex` byte 0, `sumFlag` byte 5, `redaCount` byte 7, and the `redas` word at
byte 8.  This preserves every byte category the function copies or writes while
keeping the SAT instance tractable.

Shared call-indexed oracles model `Div`, `NextRN_N`, and
`BuildDeployedUnitDefinitionList`.  Scalar call arguments and call order are
recorded and asserted equal.  For the build callback, the full modelled output
buffer passed to the callee is snapshotted and compared post-hoc before the shared
havoc, so the callback cannot mask a pre-call divergence.

`arg2 <= 100` is retained because the code uses `((selected_count * arg2) + 50) /
100`; it is a percentage parameter.  `arg3` is fully symbolic; no `arg3 != 1`
assumption remains.

The retry loop uses `RETRYMAX = 2 * COUNTMAX`.  RNG results are constrained to the
valid selected-slot range, and even draws guarantee progress while odd draws remain
symbolic, so collisions/retries are included instead of assumed away.  CBMC runs
with `--unwind 24 --unwinding-assertions`; all unwinding assertions pass.

## Commands and results

```sh
.cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800FAD0/harness.c \
  --32 --unwind 24 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check \
  --div-by-zero-check --signed-overflow-check --undefined-shift-check --slice-formula
# ** 0 of 374 failed (1 iterations)
# VERIFICATION SUCCESSFUL

.cbmc-spike-tools/root/usr/bin/cbmc .../harness_mut.c [same flags]
# [main.assertion.1] ... return value equal: FAILURE
# ** 1 of 374 failed (2 iterations)
# VERIFICATION FAILED

.cbmc-spike-tools/root/usr/bin/cbmc .../harness_mut_shuffle.c [same flags]
# [main.assertion.2] ... final output buffer equal: FAILURE
# [main.assertion.7] ... same BuildUnitDefinitionList input bytes: FAILURE
# ** 2 of 374 failed (3 iterations)
# VERIFICATION FAILED
```

Tier: bounded source-level C-vs-C proof trusting m2c(spec), agbcc(codegen), and the
shared-oracle abstraction.  It is below the `make compare` byte oracle and weaker
than compiler-free ARM proofs.
