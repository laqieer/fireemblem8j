# sub_8057F80 / PrepareBattleGraphicsMaybe — UNKNOWN stop-loss CBMC spike

Verdict: **UNKNOWN (does-not-close in this stop-loss spike)**.  I did not produce a
sound bounded C-vs-C proof for this function.

What was attempted:

- copied and cleaned the m2c reference into `sub_8057F80_ref_clean.c` by fixing the
  known `*(void *)` type artifact (`0x10 & *(void *)0x0203A4D0` etc.);
- added `gen_shared_oracles.py`, which scans the reconstruction and m2c reference and
  emits `oracle_stubs.generated.h` (26 distinct callee names; 204 dynamic calls remain
  to classify/index precisely);
- built `harness.c` as a compile/symex stop-loss probe with shared-oracle skeletons and
  a return-only call of `ref_PrepareBattleGraphicsMaybe()` then
  `impl_PrepareBattleGraphicsMaybe()`.

Exact command:

```sh
.cbmc-spike-tools/root/usr/bin/cbmc \
  -I . -I include -I tools/agbcc/include \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8057F80/harness.c \
  --32 --unwind 2 --unwinding-assertions --bounds-check --pointer-check \
  --signed-overflow-check --slice-formula --stop-on-fail
```

Exact wall with pointer checks enabled:

```text
Violated property:
  file ./scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8057F80/sub_8057F80_ref_clean.c function ref_PrepareBattleGraphicsMaybe line 154 thread 0
  dereference failure: pointer NULL in *((s32 *)((s8 *)*((void **)((s8 *)sp8 + 4)) + 0x34))
  !(__CPROVER_POINTER_OBJECT(((s32 *)NULL)) == __CPROVER_POINTER_OBJECT(*((void **)((s8 *)sp8 + 4))))

VERIFICATION FAILED
```

Interpretation: this is a harness/modeling wall, not evidence of inequivalence.  The
m2c reference uses absolute EWRAM addresses (`0x0203A4E8`, `0x0203E184`, ...), while the
reconstruction uses typed C globals (`gBattleActor`, `gpEkrBattleUnitLeft`, ...).  CBMC's
pointer provenance does not know those are the same objects, so after the ref stores a
constant address and reloads through it, the nested `sp8->unit.pClassData` dereference is
not a valid typed object.  A closing proof needs an address-space shim that maps the m2c
absolute EWRAM accesses onto the exact typed global objects before the 204-call shared
oracle argument records are meaningful.

I also tried disabling pointer checks as a diagnostic only; it progressed further but
then failed on another m2c artifact:

```text
line 464: arithmetic overflow on signed shl in (signed int)*((u8 *)0x202BD2C) << 0x1F
VERIFICATION FAILED
```

No mutation gate was run because there is no anchor proof.  The function should remain at
the existing mGBA live-state 115/115 tier until a typed EWRAM-address shim is built.
