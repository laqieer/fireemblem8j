# Axis #2 (matching-C) — 31 still-asm functions, ranked recipe queue (D307/W3)

Tractability order (full per-recipe detail in the D307/W3 triage report):

## HIGH-CONFIDENCE RECONSTRUCTS (clear asm body, do first)
- **#3 sub_80D17C8** (124B, classchg-sel): JP reads precomputed `gClassReelNameTable @0x089CF318`
  directly (no GetClassData). Full C in W3 report. +`-mjp-promote`, add `gClassReelNameTable`
  data alias. JP precomputed-class-name-table pattern (shared w/ sub_80D1844).
- **#8/#30 sub_80A73D4** (256B, divination): sequential PutNumber/PutNumberOrBlank, NO control
  flow — reconstruct directly from asm. EASIEST augury fn.
- **#26 sub_800FAD0** (464B): fe8u eventscr.c NONMATCHING GetUnitDefinitionFormEventScr body +
  JP arg-sign (arg2 u8/lsrs, arg3/4 s8/asrs) + -mjp-promote.
- **#9 sub_80BB240** (232B): ending_details defeat-text builder, msgids US-0x88, JP callees.
- **#10 sub_80BCD74** (244B): worldmap path-follow proc, 0x100/0x200 floor-quantize.
- **#11 sub_800FF08** (384B): Event2F_MoveUnit analog + -mjp-promote (watch subcmd dir order).

## PERMUTER NEARs (stochastic; import nonmatching + glabel asm, patch -mjp-promote, run bg)
- #1 Event1B_TEXTSHOW (9B), #2 Event0F_CounterOps (r4r5 ~10B), #6 EfxAdvanceFrameLut (87/132
  branch-polarity), #7 sub_8084CE4 (8B spill-split lever), #5 LoadClassNameInClassReelFont (35B),
  #4 ClassStatsDisplay_Loop (slot-rotation, extract best-5 mutation from wt).

## DEFERRED (plateaued reg-alloc walls / large reconstructs, lowest priority)
- Event18_ColorFade, RegisterTsaWithOffset, GmapScreen2_Loop, PutFaceOnBackGround,
  AdjustNewUnitPosition, AddAttr2dBitMap, sub_800A34C (spline 534/584), PrepareBattleGraphicsMaybe
  (2936B +266B JP), the augury cluster (sub_80A2E64/3528/390C/3300/6D34/6E4C/6F1C/730C/800A594).

WIRING: carved fns drop their baseline alias from layout/baseline_syms.d/ (else multiple-def);
add NEEDS_ALIAS data entries (gClassReelNameTable etc.); fix cfbind garbage StartGmapAutoMu_Type1
(07E72DA4 -> 080C818C) before any EventA8 carve. make compare is the ONLY oracle.

## PERMUTER WALL RECORDS (D307/W17 adversarial-verifier, D308) — confirmed irreducible
- **Event1B_TEXTSHOW** (356B): 50,879 permuter iters, best 35, **6-byte residual** = agbcc
  RTL reg-alloc wall (u16 zero-extend via r0→r1 temp vs JP direct r3→r1). NOT source-fixable.
- **sub_8084CE4** (120B): ~1.1M iters, best 795, **8-byte residual** = agbcc hoists the 0xff
  mask into a 3rd hi-reg (extra push/pop) vs JP inline `movs;ands` per iter. Structural wall.
- **sub_80A73D4** (256B): base 7290 → best 4070, deep reg-coloring wall.
These 3 + the W14-verified walls (sub_80BB240 80B, sub_800FF08 261B, sub_80BCD74 no-analog)
are kept as descriptive asm (fe8u-NONMATCHING-equivalent). Axis #2 literal-100% needs a
transmuter/compiler breakthrough (D277 proved transmuter infeasible for reg-coloring).

## D312 — Event0F_CounterOps (sub_800DE3C): asr-fix → 1-swap NEAR (permuter candidate)
fe8u eventscr.c:476 body + the real JP divergence FIXED: COUNTER_SET uses an ARITHMETIC shift
(`asrs r3,r0,#0x18`) not the US logical shift — port as `newValue = (s16)argument >> 8`. With
that, the body byte-matches the JP target (size 0xB4, exact `mov ip,r2` prologue) EXCEPT a single
clean **r4↔r5** swap (JP: subcode-copy in r5 / shift in r4; agbcc colors inverted). `-mjp-promote`
on. register-pin `register u32 shift asm("r4")` moved shift to r4 but broke the prologue (worse).
The tightest NEAR in the #2 set → strong 1-shot permuter target with the asr-fixed body.
