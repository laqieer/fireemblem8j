# Reconstruction-base byte-gaps (ground truth)

Complete measurement of every `src/nonmatching/*.c` reconstruction base against the
ROM, taken 2026-06-26. **Purpose: kill the unreliable `// FLAGS: ... EXACT / N-byte`
header annotations** — those conflate structural closeness with byte-closeness and have
repeatedly sent sessions down dead carves (sub_800A34C's "EXACT" was 536/584 differing).
`make compare` is the only oracle; this table is the honest permuter-priority list.

Method: `agbcc -O2 -fhex-asm <FLAGS-hint>` standalone, `objcopy --only-section=.text`,
byte-diff vs `baserom.gba[start:end]`. Standalone is an **upper bound** (it lacks the
full per-TU build context — real `-mjp-promote`/struct-layout/surrounding-pressure — so
the in-build gap can be smaller), but it definitively shows **none is exact** and all are
pervasive register-coloring NEARs. The in-build permuter fleet (running 5–9 h on these)
has cracked none, corroborating.

| base | JP range | size | differ / total | header claim (UNRELIABLE) |
|---|---|---|---|---|
| sub_800A34C | 0A34C..0A594 | 584 | **536/584** | "-fno-gcse EXACT" — FALSE |
| sub_800E1FC (Event18_ColorFade) | 0E1FC..0E2C8 | 204 | 107/204 | -mjp-promote |
| sub_8056890 (EfxAdvanceFrameLut) | 56890..56914 | 132 | 87/132 (+4) | "2-insn" |
| sub_807C8DC (AdjustNewUnitPosition) | 7C8DC..7CA10 | 308 | 92/308 (+4) | -mjp-promote; reg-coloring ceiling (plateau 485) |
| sub_8084CE4 | 84CE4..84D5C | 120 | 109/120 (+32) | "8-byte" — optimistic |
| sub_80A2E64 | A2E64..A3018 | 436 | 301/436 | -fno-gcse |
| sub_80A3528 | A3528..A3898 | 880 | 645/880 | plain -O2 |
| sub_80CAEF4 | CAEF4..CB014 | 288 | 158/288 | plain agbcc |
| sub_80D1844 (LoadClassNameInClassReelFont) | D1844..D18D0 | 140 | 84/140 | "35-byte" — optimistic |
| RegisterTsaWithOffset (sub_80D19DC) | D19DC..D1A3C | 96 | 91/96 | "6-byte" — FALSE; r8+ip pressure |

**Conclusion:** zero deterministic carves remain among reconstruction bases; the path to
100% on these is permuter compute-time (machine currently CPU-saturated, load 17.9/16) +
decomp.me community. The 22 still-asm without a base are big region-different
reconstructions (e.g. `sub_8057F80`/PrepareBattleGraphicsMaybe = 2936 B) or have a live
permuter. See [`frontier.md`](frontier.md).

## Live permuter best-score state (2026-06-26, from `nonmatchings/<fn>/output-<score>-*`)

decomp-permuter objective units (compile+byte-objective; **0 = match**, lower = closer).
These are the closest-first priority for permuter compute / manual mining. **Verified
no unintegrated matches** — the only score-0 logs (CheckCanSummon, ComputeBattleUnitAttack,
PutWMFaceOnBg) are already carved to `src/`.

| still-asm fn | best score | note |
|---|---|---|
| Event0F_CounterOps | **75** | closest; plateaued 75 over 753K+ iters = cross-jump ceiling (the score-75 best already applied the drop-`do/while(0)`+split-`+1` mining mutations — source-mutation-invariant residual) |
| PutFaceOnBackGround | 105 | "tried 60+ forms" ceiling |
| AddAttr2dBitMap | 120 | |
| AdjustNewUnitPosition | 185 | reg-coloring ceiling (iy/ix/yCur rotation, source-reorder-invariant) |
| sub_80D17C8 | 255 | |
| sub_80A3300 | 315 | |
| sub_80A730C | 360 | |
| sub_80BB240 | 540 | |
| Event18_ColorFade | 780 | |
| sub_8084CE4 | 795 | (the "8-byte" header claim is wrong) |
| sub_80BCD74 | 990 | |
| sub_80A6E4C | 1440 | |
| sub_80CAEF4 | 2555 | |
| sub_80A3528 | 2590 | |
| sub_80A2E64 | 4045 | |
| sub_80A73D4 | 4835 | |
| sub_800A34C | 10155 | far (matches the 536/584 byte measurement) |

**Takeaway:** even the closest (Event0F_CounterOps=75) is a plateaued ceiling after
hundreds of thousands of permuter iterations — the remainder is genuine agbcc codegen
ceilings, not unexplored levers. Progress is wall-clock permuter time + community.

## Authoritative `-mjp-promote` byte-gaps (2026-06-26) — the closest functions are SMALL scheduling NEARs

The earlier standalone gaps above lacked `-mjp-promote`; re-measuring the permuter
`base.c` files **with the flag the fleet actually uses** (`compile.sh` has it) reveals
several are much closer than the "ceiling" framing implied — and the residuals are
**instruction-scheduling/ordering**, not pervasive register-coloring:

| fn | `-mjp-promote` gap | residual character |
|---|---|---|
| **AddAttr2dBitMap** | **10/224** (size-exact) | pure instruction ORDERING — 3 sites: two `mov` swapped (0x26), an `adds r2,r1,#0` scheduled late (0xa4), a nop placement (0xde) |
| **PutFaceOnBackGround** | **22/176** (size-exact) | small, mostly ordering |
| Event0F_CounterOps | 48/180 (size-exact) | reg-coloring + cross-jump |
| sub_80D17C8 | 114/124 | |
| sub_80BB240 | 123/232 | |
| sub_80A3300 | 160/224 | |
| sub_80A730C | 164/200 | |

Tested and ruled out on these: the two built-but-unwired custom agbcc flags
**`-mjp-nocrossjump`** and **`-mjp-regorder`** — both same-or-WORSE than `-mjp-promote`
alone on every function (nocrossjump notably hurt PutFaceOnBackGround 22→67 and
sub_80BB240 +44 tail). And **manual source reordering** of AddAttr2dBitMap (swap
`_src`/`dst` init, hoist `++_src`, split the `i` loop init) does NOT close the 10.

**DECISIVE (permuter has PLATEAUED — these are NOT "converging"):** the permute.log
score history proves the permuter is stuck. AddAttr2dBitMap hit its best (obj 120 = the
10 bytes) in the FIRST half of **839,821 iterations** and never beat it again over the
second ~420K; sub_8084CE4 identically plateaued at 795 over 787,880 samples. So
decomp-permuter **cannot reach** these residuals via source mutation — the 10 bytes are
codegen-order (the prologue `mov ip,r6`/`mov r8,r2` save-order is agbcc register-save
codegen, not source-controlled; site 2/3 are scheduler). **Implication 1:** more permuter
wall-clock will NOT crack the plateaued ones — they are at the permuter ceiling, needing a
new agbcc-internals lever (none found: all stock + 3 custom flags tested) or community.
**Implication 2:** reallocating fleet compute between plateaued targets is zero-EV — do
NOT churn the fleet for it. The honest path for these is decomp.me community (all posted
owned) or a future agbcc codegen patch, NOT compute-time.
