# sub_8001570 focused CBMC proof

This is the first working m2c-trust CBMC bridge instance.

- raw implementation: `src/nonmatching/sub_8001570.c` included as `impl_AddAttr2dBitMap`
- raw m2c reference: `m2c_ref_raw.c`
- mechanical ABI/pointer lowering: `m2c_ref_byteptr_lowered.c`
  - m2c emits byte-offset pointer arithmetic in C pointer syntax for this function;
    the lowering changes only pointer carrier types/increments so CBMC checks the
    intended byte-addressed m2c semantics.
- harness: `harness_origin_1x1.c`

Current proved domain: 1x1 bitmap at origin (`ix=0`, `iy=0`, header width/height
bytes both zero), arbitrary source pixel and `chr`. All CBMC safety checks and
unwinding assertions pass with `--unwind 3`. This is a pipeline proof, not yet the
full 32x32 clipped-domain proof.

Command:

```sh
.cbmc-spike-tools/root/usr/bin/cbmc \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8001570/harness_origin_1x1.c \
  -I include -I . --32 --unwind 3 --unwinding-assertions \
  --bounds-check --pointer-check --pointer-overflow-check --div-by-zero-check \
  --signed-overflow-check --undefined-shift-check --slice-formula --verbosity 5
```

Evidence:

- `cbmc_origin_1x1.out`: `VERIFICATION SUCCESSFUL`
- `cbmc_origin_1x1_mutated.out`: flipped written bit refutes at the final assertion.
