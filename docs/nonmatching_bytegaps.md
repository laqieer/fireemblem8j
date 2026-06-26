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
