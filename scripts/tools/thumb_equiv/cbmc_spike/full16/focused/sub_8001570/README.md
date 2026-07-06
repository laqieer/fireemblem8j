# sub_8001570 focused CBMC proof attempt

This directory now distinguishes the earlier bounded smoke from the corrected
full-domain attempt.

## Full-domain harness (current verdict: UNKNOWN timeout@unwind33)

Harness: `harness_full_domain.c`

Design:
- raw reconstruction source included as `impl_AddAttr2dBitMap`;
- m2c reference generated from `asm/sub_8001570.s` (`m2c_ref_raw.c`), with only
  mechanical byte-pointer lowering in `m2c_ref_byteptr_lowered.c` so CBMC models
  m2c's byte-offset pointer arithmetic instead of host-C scaled pointer math;
- full symbolic inputs: `ix`, `iy`, `chr`, and both source header bytes;
- source memory is one shared uninitialized `src_oracle[]` array, run with
  `--arrays-uf-always`, so symbolic source reads are deterministic by address and
  shared by both sides;
- destination observable is a 32x32 u16 buffer checked by an arbitrary symbolic
  index `k` (universal under CBMC nondet semantics), with the compared cell
  initialized identically on both sides;
- loop proof obligation: `--unwind 33 --unwinding-assertions`.

Command used for the 20-minute full-domain run:

```sh
timeout 1200s .cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8001570/harness_full_domain.c \
  -I include -I . --32 --unwind 33 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check \
  --signed-overflow-check --undefined-shift-check --arrays-uf-always \
  --slice-formula --verbosity 5
```

Observed: `rc=124` timeout; no `VERIFICATION SUCCESSFUL` / `VERIFICATION FAILED`
was emitted. A shorter verbose run reached symbolic execution and SSA conversion
with 58,229 generated VCCs / 39,226 after simplification, then also timed out
before a solver verdict. See `cbmc_full_domain_timeout_excerpt.txt`.

Mutation harness: `harness_full_domain_mutated.c` flips one destination bit after
`impl_`. It also timed out at 300s before a REFUTED verdict, so the full-domain
harness has not passed the mutation gate.

Verdict: **UNKNOWN(timeout@unwind33)** for full-domain sub_8001570. Do not count
as PROVEN.

## Superseded bounded smoke (not a proof)

`harness_origin_1x1.c` proves only the restricted domain `ix=0`, `iy=0`,
header width/height bytes zero. It is retained as a smoke test for parser/prelude
plumbing and mutation behavior, but it is not a full-domain equivalence proof and
is not counted in the N/16 headline.
