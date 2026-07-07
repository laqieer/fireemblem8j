# sub_800FAD0 / GetUnitDefinitionFormEventScr — CBMC C-vs-C spike

**Verdict:** `PROVEN-BOUNDED-CBMC-CVC` for the bounded model in `harness.c`.

This harness follows the validated `sub_80A6F1C` shared-oracle pattern: the
reconstruction from `src/nonmatching/sub_800FAD0.c` is checked against the m2c
reference shape from `full16/generated/reference_c/sub_800FAD0_ref.c`.  The
observable is the return value plus the modelled `gLoadUnitBuffer` writes.  Calls
to `Div` and `NextRN_N` are shared call-indexed oracles, and their scalar
arguments/call order are recorded and asserted equal post-hoc so shared return
values cannot mask argument divergence.

Scope is intentionally honest and bounded: `count <= 1`, `arg2 <= 100`, the
`BuildDeployedUnitDefinitionList` branch is excluded (`arg3 != 1`), and the
probabilistic selection loop is bounded by assuming the shared RNG trace makes
progress (no duplicate selected slot before all requested picks are made).  CBMC
uses `--unwind 24 --unwinding-assertions`; all unwinding assertions pass.  This is
a source-level m2c/spec + agbcc/codegen + shared-oracle abstraction tier, below
`make compare` and weaker than compiler-free ARM proofs.

## Commands

```sh
.cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800FAD0/harness.c \
  --32 --unwind 24 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check \
  --div-by-zero-check --signed-overflow-check --undefined-shift-check
# ** 0 of 362 failed (1 iterations)
# VERIFICATION SUCCESSFUL

.cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_800FAD0/harness_mut.c \
  --32 --unwind 24 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check \
  --div-by-zero-check --signed-overflow-check --undefined-shift-check
# [main.assertion.1] ... return value equal: FAILURE
# ** 1 of 362 failed (2 iterations)
# VERIFICATION FAILED
```

`harness_mut.c` changes the reconstruction return from `0x0203EFB4` to
`0x0203EFB5`, proving the return observable is non-vacuous.
