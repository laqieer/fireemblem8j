# mgba_capture — live game-state harness for equivalence research (Discussion #149)

Some `src/nonmatching/*.c` functions read a **live, self-consistent battle state**
(dozens of `gBanim*` / `gEkr* `/ `gBattle*` globals) and **fault on synthetic
black-box input**, so the [SMT prover](../prove_nonmatching.py) and the
[differential tester](../differential_test.py) can't reach them. The prime example
is `sub_8057F80` = **`PrepareBattleGraphicsMaybe`**.

This harness runs the actual game in **mGBA** (full-system emulator, `libmgba`),
drives it into a real battle, captures the exact CPU + RAM state at the instant a
target function is called, and replays the JP ROM bytes vs the compiled
reconstruction from that state under Unicorn.

## Build & run

```bash
sudo apt-get install -y libmgba-dev                       # provides libmgba.so + headers
gcc capture.c -o capture -I/usr/include -lmgba
./capture ../../../../fireemblem8.gba 08057f80 12100 60000000
#          ^rom                        ^target  ^fast  ^max single-steps
$HOME/z3-venv/bin/python replay_diff.py sub_8057F80
```

`capture.c` boots the ROM, mashes **A** to fast-forward (~12k frames) into FE8's
opening prologue — which plays **scripted combat** — then single-steps to catch
the exact entry of the target ROM address and dumps
`/tmp/mgbah/{regs.txt,ewram.bin,iwram.bin}`. A-mash is deterministic, so the same
state is reproduced every run from the committed ROM (no binary snapshot shipped).

## Findings for `sub_8057F80` (drove it from untestable → 114/115-writes-equivalent)

The live harness turned an untestable function into a testable one and produced
three concrete fixes:

1. **A harness correctness bug (now fixed).** `sub_8057F80.c` defines **two**
   functions — the small `static GetBanimAllyPositionJ` (46 B, offset 0) and
   `PrepareBattleGraphicsMaybe` (2942 B, offset 0x30) — but the JP target at
   `0x08057F80` is the *second* one. Both `candidate_linked` /
   `candidate_bytes_callmap` used to extract `.text` from **offset 0**, so they
   compared the *wrong 46-byte helper*. Fixed via size-matched symbol selection
   (`_pick_symbol`); audited that `sub_8057F80` is the *only* file where the JP
   target isn't the first symbol, so the 12 SMT-PROVEN + differential EQUIV
   verdicts are unaffected.

2. **A missing `inline`.** The JP asm has **zero** calls to `GetBanimAllyPositionJ`
   — it is *inlined* (the US analog is `static inline`). The reconstruction wrote
   plain `static`, so agbcc emitted a standalone helper + a `bl` to it → the
   two-function `.o` (and, in the harness, an unresolved internal call → BIOS
   fault). Restoring `static inline` collapses it to one function matching the JP
   structure and removes the fault.

3. **Corrupt baseline symbols.** `layout/baseline_syms.d/cfbind_banim-ekrbattleintro.tsv`
   (an auto-generated "confidence-bind" fragment) had five wrong data addresses
   from a swapped-row copy-paste (`gAnimCharaPalConfig`'s ROM address `089CDE18`
   landed in `gBanimIdx_bak`'s row, etc.). Corrected against the JP asm literal
   pools / `sym_jp.txt` / the uniform −4 EWRAM shift: `gBanimIdx_bak →0203E108`,
   `gBanimMaxHP →0203E1AC`, `gBanimForceUnitChgDebug →0203E1A0`,
   `gAnimCharaPalConfig →089CDE18`, `gAnimCharaPalIt →089CEC18`.

**ABI correction:** `PrepareBattleGraphicsMaybe` is **`(void)`** — it `push`es then
immediately `bl ResetEkrDragonStatus` (clobbering r0-r3) without reading incoming
args. The `r0 = 0x08011ff1` seen at the call is the caller's leftover register
garbage, ignored by the void function — **not** a callback (an earlier note here
said otherwise).

After these fixes the only residual from the live state is **1 of 115 writes**:
`gEkrSpellAnimIndex[POS_R]` = 0 (target) vs 0xffff (reconstruction) — a genuine
small spell-animation control-flow difference still needing RE (plus the ~46-byte
codegen/register-coloring size gap for a full byte-match).

`make compare` is never touched by any of this — verified `fireemblem8.gba: OK`.
