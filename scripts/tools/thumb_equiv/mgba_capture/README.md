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

## Findings for `sub_8057F80` (research-grade)

The live harness turned an untestable function into a testable one and produced
three concrete results:

1. **The real ABI is a callback.** At the actual call, `r0 = 0x08011ff1` — an
   *odd ROM address*, i.e. a **function pointer**, not a faction `int`. The
   reconstruction header's `GetBanimAllyPositionJ(int, int)` signature is wrong;
   `sub_8057F80` takes a **callback** (`r0`) + `r1 = 0x10`.

2. **A harness correctness bug (now fixed).** `sub_8057F80.c` defines **two**
   functions — the small `static GetBanimAllyPositionJ` (46 B, offset 0) and
   `PrepareBattleGraphicsMaybe` (2942 B, offset 0x30) — but the JP target at
   `0x08057F80` is the *second* one. Both `candidate_linked` /
   `candidate_bytes_callmap` used to extract `.text` from **offset 0**, so they
   compared the *wrong 46-byte helper*. Fixed via size-matched symbol selection
   (`_pick_symbol`); audited that `sub_8057F80` is the *only* file where the JP
   target isn't the first symbol, so the 12 SMT-PROVEN + differential EQUIV
   verdicts are unaffected.

3. **Remaining divergence is a callback-modelling gap, not a proven bug.** With
   the right function and the exact live state, the candidate now matches the
   target's first 19 memory writes, then branches into the BIOS region and
   faults — it invokes the `r0` callback along a path the black-box Unicorn model
   doesn't yet reproduce. Fully resolving `sub_8057F80` needs the callback modelled
   (or captured/replayed) — a well-defined next step. Its equivalence still rests
   on the block-by-block objdump in the reconstruction header.

`make compare` is never touched by any of this — it stays the sole oracle.
