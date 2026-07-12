# Reconstruction-base byte-gaps (ground truth)

> **UPDATE 2026-07-11:** axis-2 is now **99.93% (8686/8692), 6 still-asm**.
> `DecodeAndVerifyArenaRecord` (`sub_80A6F1C`) matched byte-exact after the
> paired-halfword stack shape, phase-local register aliases, and explicit
> fenced r1-to-r2 mask copy reproduced the final allocator decisions. h2W8F
> reports raw score 0 and the registry row is retired.
>
> **PRIOR UPDATE 2026-07-11:** axis-2 was **99.92% (8685/8692), 7 still-asm**.
> The score-0 Br4VJ/uVVvN/gdTId/vdXu7/XOT5k harvest closes the historical
> `sub_80A3300`, `sub_800E1FC`, `sub_807C8DC`, `sub_80A3528`, and
> `sub_80A6E4C` gaps. Together with `DivinationRankSpriteUpdate`, these wins
> reinforce that the table below records old seed quality, not an impossibility bound.
>
> **UPDATE 2026-07-10:** axis-2 was **99.85% (8679/8692), 13 still-asm**.
> `AddAttr2dBitMap` and `Augury_InitResultScreen` matched byte-exact. AddAttr is
> the important correction to this document's prior ceiling framing: a
> zero-instruction `do { } while (0);` basic-block separator flipped the final
> callee-save copy order. A long permuter plateau did **not** prove the order was
> source-invariant; it proved only that the explored mutation vocabulary missed
> this block-structure lever.

Complete measurement of every `src/nonmatching/*.c` reconstruction base against the
ROM, taken 2026-06-26. **Purpose: kill the unreliable `// FLAGS: ... EXACT / N-byte`
header annotations** — those conflate structural closeness with byte-closeness and have
repeatedly sent sessions down dead carves (sub_800A34C's "EXACT" was 536/584 differing).
`make compare` is the only oracle; this table is the honest permuter-priority list.

Method: `agbcc -O2 -fhex-asm <FLAGS-hint>` standalone, `objcopy --only-section=.text`,
byte-diff vs `baserom.gba[start:end]`. Standalone is an **upper bound** (it lacks the
full per-TU build context — real `-mjp-promote`/struct-layout/surrounding-pressure — so
the in-build gap can be smaller). At the time of measurement, none was exact under
that setup and the in-build permuter fleet had cracked none. Later source-shape wins
show why this table is a historical baseline, not an impossibility proof.

| base | JP range | size | differ / total | header claim (UNRELIABLE) |
|---|---|---|---|---|
| sub_800A34C | 0A34C..0A594 | 584 | **536/584** | "-fno-gcse EXACT" — FALSE |
| sub_800E1FC (Event18_ColorFade) | 0E1FC..0E2C8 | 204 | 107/204 | **[MATCHED 2026-07-11 via uVVvN]** |
| sub_8056890 (EfxAdvanceFrameLut) | 56890..56914 | 132 | 87/132 (+4) | "2-insn" |
| sub_807C8DC (AdjustNewUnitPosition) | 7C8DC..7CA10 | 308 | 92/308 (+4) | **[MATCHED 2026-07-11 via gdTId]** |
| sub_8084CE4 | 84CE4..84D5C | 120 | 109/120 (+32) | "8-byte" — optimistic |
| sub_80A2E64 | A2E64..A3018 | 436 | 301/436 | -fno-gcse; **[MATCHED 2026-07-11 via l4bts/P13]** |
| sub_80A3528 | A3528..A3898 | 880 | 645/880 | **[MATCHED 2026-07-11 via vdXu7]** |
| sub_80CAEF4 | CAEF4..CB014 | 288 | 158/288 | plain agbcc |
| sub_80D1844 (LoadClassNameInClassReelFont) | D1844..D18D0 | 140 | 84/140 | "35-byte" — optimistic; **[MATCHED 2026-07-03 in-repo, banked]** |
| RegisterTsaWithOffset (sub_80D19DC) | D19DC..D1A3C | 96 | 91/96 | "6-byte" — FALSE; r8+ip pressure |

**Historical conclusion (superseded in part):** no deterministic carve was then known
among these reconstruction bases, so the recommended path was permuter compute +
decomp.me community. AddAttr and other later wins show that conclusion described the
known lever set, not the full source-shape space. The historical **16** still-asm without a base were big region-different
reconstructions (e.g. `sub_8057F80`/PrepareBattleGraphicsMaybe = 2936 B) or have a live
permuter. — [SUPERSEDED 2026-07-03: was "22" at this doc's 2026-06-26 measurement; 6 have since
matched byte-exact in-repo (banked), axis-2 22→16. Further wins now put the live set at 7.]
See [`frontier.md`](frontier.md).

## Live permuter best-score state (2026-06-26, from `nonmatchings/<fn>/output-<score>-*`)

decomp-permuter objective units (compile+byte-objective; **0 = match**, lower = closer).
These are the closest-first priority for permuter compute / manual mining. **Verified
no unintegrated matches** — the only score-0 logs (CheckCanSummon, ComputeBattleUnitAttack,
PutWMFaceOnBg) are already carved to `src/`.

| still-asm fn | best score | note |
|---|---|---|
| Event0F_CounterOps | **75** | closest; plateaued 75 over 753K+ iters = cross-jump ceiling (the score-75 best already applied the drop-`do/while(0)`+split-`+1` mining mutations — source-mutation-invariant residual) |
| PutFaceOnBackGround | 105 | "tried 60+ forms" ceiling |
| AddAttr2dBitMap | 120 | **[MATCHED 2026-07-10 via zero-instruction BB separator]** |
| AdjustNewUnitPosition | 185 | **[MATCHED 2026-07-11 via gdTId]** |
| sub_80D17C8 | 255 | |
| sub_80A3300 | 315 | **[MATCHED 2026-07-11 via Br4VJ]** |
| sub_80A730C | 360 | **[MATCHED 2026-07-03, banked]** |
| sub_80BB240 | 540 | |
| Event18_ColorFade | 780 | **[MATCHED 2026-07-11 via uVVvN]** |
| sub_8084CE4 | 795 | (the "8-byte" header claim is wrong) |
| sub_80BCD74 | 990 | |
| sub_80A6E4C | 1440 | **[MATCHED 2026-07-11 via XOT5k]** |
| sub_80CAEF4 | 2555 | |
| sub_80A3528 | 2590 | **[MATCHED 2026-07-11 via vdXu7]** |
| sub_80A2E64 | 4045 | **[MATCHED 2026-07-11 via l4bts/P13]** |
| sub_80A73D4 | 4835 | **[MATCHED 2026-07-03, banked]** |
| sub_800A34C | 10155 | far (matches the 536/584 byte measurement) |

**Takeaway (corrected):** a plateau is evidence about the tested mutation set, not a
proof of a permanent agbcc ceiling. Some remaining functions are still compute/community
targets, but AddAttr demonstrates that a zero-code basic-block shape can cross an apparent
save-order wall after hundreds of thousands of unsuccessful permutations.

## Authoritative `-mjp-promote` byte-gaps (2026-06-26) — the closest functions are SMALL scheduling NEARs

The earlier standalone gaps above lacked `-mjp-promote`; re-measuring the permuter
`base.c` files **with the flag the fleet actually uses** (`compile.sh` has it) reveals
several are much closer than the "ceiling" framing implied — and the residuals are
**instruction-scheduling/ordering**, not pervasive register-coloring:

| fn | `-mjp-promote` gap | residual character |
|---|---|---|
| **AddAttr2dBitMap** | **MATCHED: 0/224 in project** (historical standalone measurement: 10/224) | P9 zero-instruction BB separator flips the final `mov ip,r6` / `mov r8,r2` save order; declaration order had already removed the other scheduling residuals |
| **PutFaceOnBackGround** | **22/176** (size-exact) | small, mostly ordering |
| Event0F_CounterOps | 48/180 (size-exact) | reg-coloring + cross-jump |
| sub_80D17C8 | 114/124 | |
| sub_80BB240 | 123/232 | |
| sub_80A3300 | **MATCHED: 0/224 in project** (historical standalone measurement: 160/224) | Br4VJ signed-load live-range split + exact pins/barrier |
| sub_80A730C | 164/200 | **[MATCHED 2026-07-03, banked]** |

Tested and ruled out on these: the two built-but-unwired custom agbcc flags
**`-mjp-nocrossjump`** and **`-mjp-regorder`** — both same-or-WORSE than `-mjp-promote`
alone on every function (nocrossjump notably hurt PutFaceOnBackGround 22→67 and
sub_80BB240 +44 tail). The tested **manual statement reorderings** of AddAttr2dBitMap
(swap `_src`/`dst` init, hoist `++_src`, split the `i` loop init) did not close it;
the later successful lever was different in kind: an empty basic-block separator.

**PLATEAU EVIDENCE, NOT A PERMANENCE PROOF:** AddAttr2dBitMap hit obj 120 in the
first half of **839,821 iterations** and never improved over the second ~420K;
sub_8084CE4 likewise plateaued at 795 over 787,880 samples. This remains strong
evidence against spending more wall-clock on the *same* mutation vocabulary.
It does **not** establish that the source cannot steer the compiler: AddAttr later
matched via a zero-instruction BB separator that the campaign had not explored.
Operational rule: stop identical permuter grinding, preserve the exact residual,
and revisit only with a materially new source-shape/compiler lever.
