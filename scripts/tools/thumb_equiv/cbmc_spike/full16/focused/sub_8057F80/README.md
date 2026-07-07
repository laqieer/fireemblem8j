# sub_8057F80 / PrepareBattleGraphicsMaybe — typed-EWRAM shim spike

Verdict: **UNKNOWN (does not close as a sound bounded CBMC C-vs-C proof)**.

This follow-up built a typed-address shim for the m2c absolute EWRAM accesses.  The
cleaned ref now maps the main absolute clusters onto typed C globals:

- `0x0202BCAC..0x0202BD2C` -> `gBmSt` / `gPlaySt`
- `0x0203A4D0..0x0203A568` -> `gBattleStats`, `gBattleActor`, `gBattleTarget`
- `0x0203E0FA..0x0203E1D8` -> battle-graphics globals (`gBanim*`, `gEkr*`, `gpEkr*`)
- `0x02000000` -> `gAnims`
- ROM palette table refs -> `gAnimCharaPalConfig` / `gAnimCharaPalIt`

The shim gets past the original hard pointer-provenance wall at ref line 154 and also
cleans several m2c type artifacts (`void*` scalar loads/stores and signed-left-shift
idioms).  Diagnostic command:

```sh
.cbmc-spike-tools/root/usr/bin/cbmc \
  -I . -I include -I tools/agbcc/include \
  scripts/tools/thumb_equiv/cbmc_spike/full16/focused/sub_8057F80/harness.c \
  --32 --unwind 65 --unwinding-assertions --bounds-check --pointer-check \
  --signed-overflow-check --slice-formula --stop-on-fail
```

Diagnostic result:

```text
[main.assertion.1] line 152 return equal: SUCCESS
** 0 of 810 failed (1 iterations)
VERIFICATION SUCCESSFUL
```

This is **not** claimed as PROVEN-BOUNDED-CBMC-CVC because it violates the requested
soundness gates:

1. Observable is only the return value, not the caller-visible battle-graphics writes.
2. The 204 dynamic calls are represented by a skeleton shared return stream, not full
   per-callee anti-masking argument records.
3. The harness pins `CharacterData.number = 1` for both sides to avoid the m2c ROM-palette
   pointer-as-integer artifact; that is a domain restriction and would be auto-reject as a
   final proof.
4. No behavioral mutation gate was run because there is no sound anchor proof.

Specific boundary: after mapping 4 EWRAM/ROM regions and 2 nested object levels
(`BattleUnit -> Unit -> CharacterData/ClassData`, plus ROM palette tables), a truly sound
proof still needs a full observable list and generated anti-masking records for the 26
callee names / ~204 dynamic calls.  That exceeds this stop-loss attempt.  Keep
`sub_8057F80` at the existing mGBA live-state 115/115 tier.
