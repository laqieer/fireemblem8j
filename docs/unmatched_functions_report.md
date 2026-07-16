# The 2 remaining unmatched functions — understanding report

> **CURRENT UPDATE 2026-07-16.** `SplineEvalCatmullRom`
> (`sub_800A34C`) graduated through decomp.me fork fHkHP/P25. Axis 2 is
> **99.98% (8690/8692), 2 still-asm**. The live survivors are
> `sub_800A594` and `sub_807D3BC`; use [`frontier.md`](frontier.md) for the
> authoritative work list.
>
> **PRIOR UPDATE 2026-07-15.** `GmapScreen2_Loop` (`sub_80C05C8`) graduated
> from this cohort through decomp.me fork KxTCq and is now matching C at
> `main@9a291a0cf4e6d748f273e14f8bbd064178de9056`. Axis 2 is **99.97%
> (8689/8692), 3 still-asm**. The live survivors are `sub_800A34C`,
> `sub_800A594`, and `sub_807D3BC`; use [`frontier.md`](frontier.md) for the
> authoritative work list.

> **HISTORICAL CAMPAIGN SNAPSHOT 2026-07-13 (`origin/main`
> `5b35c7635a847b70cca70f4bff77418801a209b6`).**
> Current metrics and the live four-function list are maintained only in
> [`frontier.md`](frontier.md); the SHA and research metrics below are retained
> as campaign evidence.
> The final two campaign changes are **proven nonmatching seed improvements, not
> matching-C promotions**: `sub_800A594` landed at
> `42a562774ce82b52ee20bcf19235c0543f4ef2e8`, then `sub_80C05C8` landed at
> `5b35c7635a847b70cca70f4bff77418801a209b6`; both exact-SHA CI/Pages and
> secret-scan runs are green. Therefore axis-2 remains **99.95% (8688/8692),
> 4 still-asm**.
>
> This session byte-matched **11 functions**:
> `AddAttr2dBitMap`, `Augury_InitResultScreen`, `DivinationRankSpriteUpdate`,
> `PutDivinationRankSprite`, `Event18_ColorFade`, `AdjustNewUnitPosition`,
> `DrawAuguryResultPanel`, `EncodeLinkArenaRecord`,
> `DecodeAndVerifyArenaRecord`, `DecodeLinkArenaRecordHeader`, and
> `GetUnitDefinitionFormEventScr`.
>
> Historical proven state of the four survivors at that snapshot:
> - `sub_800A34C`: score **60**, real five-argument solver ABI,
>   `PROVEN-BOUNDED(3)`, active `ABtKz`; only the costly-argument
>   precompute/load ordering before `sub_800A194` remains. **46,080** targeted
>   trees found no lower candidate.
> - `sub_800A594`: local **369/500 bytes, 208/250 halfwords**,
>   `PROVEN-BOUNDED(1)`, `EQUIV 60/60`; active `Sp10a` holds the exact guarded
>   project source and provenance at hosted score **8906** under stock hosted
>   flags. Local 369 and hosted 8906 are different toolchain metrics.
> - `sub_807D3BC`: local score **550**, linked residual **61/392**, exact
>   size **392** and frame **0x90**, `PROVEN-BOUNDED(1)`, `EQUIV 60/60`.
>   Active `J1ka1` hosts score **10499** because decomp.me lacks the project's
>   `-mjp-promote`; its function body is diff-zero against the integrated source.
> - `sub_80C05C8`: local score **230**, hosted `R7AaX` score **480**, target and
>   candidate size **544 B**, `PROVEN-BOUNDED(2)`. The phase-1 spill is removed,
>   the phase transition and AP_Update r7/r6 carriers are exact, and the active
>   scratch contains exact source/provenance. Remaining differences are
>   allocator/scheduling residuals outside those solved anchors.
>
> For Sp10a and R7AaX, decomp.me transport strips exactly one final newline
> from the generated context. Source text, context lines, provenance, flags,
> compile score, family response, and active registry rows were independently
> verified; this canonicalization is not source drift.
>
> **PRIOR UPDATE 2026-07-13 (`sub_800FAD0` resolved).**
> `GetUnitDefinitionFormEventScr` now compiles byte-exact from C. The P23 match
> uses an ABI-wide fifth argument with a delayed `(s8)` local re-narrow, direct
> `arg2` lifetime, explicit `[sp,#0x40]/[sp,#0x44]` stack homes, and an r5 tail
> readback. Axis-2 is **99.95% (8688/8692), 4 still-asm**.
>
> **HISTORICAL UPDATE 2026-07-13.** The combined harvest graduates five more study members:
> `Event18_ColorFade`, `AdjustNewUnitPosition`, `PutDivinationRankSprite`,
> `DrawAuguryResultPanel`, and `EncodeLinkArenaRecord`. Their
> uVVvN/gdTId/Br4VJ/vdXu7/XOT5k forks and owned
> nlJVc/taZrH/ENay1/MaiDT/g7FXU families all expose raw score 0 upstream.
> A follow-up local match then graduates `DecodeAndVerifyArenaRecord`
> (`sub_80A6F1C`): owned h2W8F reports raw score 0 and its registry row is
> retired. A deterministic cross-version follow-up also graduates
> `DecodeLinkArenaRecordHeader` (`sub_80A6D34`): FE6J/FE7J/FE7U align to the
> same password decoder, and P14 two-address accumulators plus an r1 struct alias
> close the final codegen residual. The original 16-function cohort now has
> **4 active members**; axis-2 is **99.95% (8688/8692), 4 still-asm**. Resolved
> reports remain below as historical analysis because their live/dead and
> cross-game findings are still useful.
>
> **Purpose of this document.** Preserve the original four-function study while
> tracking the 2 functions whose bytes still come from `asm/*.s` (the
> authoritative `src/nonmatching/*.c` set). For each: correspondence, purpose,
> behavior, reachability, callers/callees, and current blocking-diff class. The
> authoritative work list remains
> [`frontier.md`](frontier.md) → *Code frontier — the 4 remaining functions*.
>
> Detailed section numbers below retain the original 16-function study IDs so old
> cross-references remain readable; resolved studies are clearly marked.

## Method

- **Identity / logic / callees / why-unmatched**: read from each `src/nonmatching/<fn>.c`
  reconstruction header + body (these are already faithful, structurally-exact decodes of
  the JP asm; their headers record the fe8u correspondence and the exact blocking diff).
- **Callers / references / dead-or-alive**: `scripts/tools/find_xrefs.py` (added this
  session) scans the whole 16 MB `fireemblem8.gba` for **(a)** Thumb `BL`/`BLX` and ARM
  `bl`/`blx` instruction pairs whose computed target is the function, and **(b)** every
  word-aligned 4-byte pointer word equal to `addr` or `addr|1` (Thumb function pointer, i.e.
  ProcScr / event-handler / jump-table entries and literal-pool loads). Each hit is mapped
  to its containing symbol from a sorted `nm -n fireemblem8.elf` table. A verdict of
  **"no caller"** therefore means *no statically-encoded reference of any kind exists
  anywhere in the ROM* — the only escape hatch is a pointer assembled arithmetically at
  runtime, which is ruled out for these because even that needs the address as a literal
  somewhere (0 literal words were found).
- **fe8u correspondence**: cross-checked against `../fireemblem8u` source, `include/`,
  and `fireemblem8.map`.

## Summary

| # | JP addr | Name | Subsystem | fe8u twin? | Live / Dead | Callers | Current blocker |
|---|---|---|---|---|---|---|---|
| 2 | 0x0800A34C | SplineEvalCatmullRom | JP-only Catmull-Rom eval | no | **DEAD** (transitive) | 1 (SplineSampleAtTime) | whole-fn reg-coloring/spill |
| 3 | 0x0800A594 | SplineSampleAtTime | JP-only spline driver | no | **DEAD (root)** | **0** | spill/reg-coloring |
| 8 | 0x0807D3BC | SelectSummonPos | summon positioning | analog only | **LIVE** | SelSumPosAndMoveCamera | spill/frame decision |
| 16 | 0x080C05C8 | GmapScreen2_Loop | worldmap node icons | **yes** (worldmap_screen2.c) | **LIVE** | ProcScr_GmNodeIconDisplay | clean JP-vs-US coloring divergence |


**Headline results (2 live / 2 dead)**
- **2 of 4 are live, actively reachable game code.** Their remaining asm status is
  a byte-generation problem, not an understanding gap.
- **2 of 5 are unreachable dead code**, forming the spline island found by the
  original study:
  - **Spline island** — `SplineSampleAtTime` [study #3] →
    `SplineEvalCatmullRom` [study #2] → `sub_800A194`.
- **Password decode island — resolved:** `DecodeAndVerifyArenaRecord`
  [resolved study #15] and its `DecodeLinkArenaRecordHeader` callee
  [resolved study #13] are both matching C.
- **Every one of the 4 has a real, non-stub ROM body.** “Dead” means statically
  unreferenced, not empty.
- The 2026-07-10/11 wins are a methodology correction: measured plateaus remain useful,
  but “permanent/source-invariant” claims require stronger evidence than failed source
  sweeps. `make compare` is the only completion oracle.

---

## Subsystem call-tree map (verified)

```
mapanim / summon fx ─────────────────────────────────────────────
  12 *_Loop / *_PlayAnim TUs ──► AddAttr2dBitMap [MATCHED 2026-07-10]

event engine ────────────────────────────────────────────────────
  gEventLoCmdTable[COLORFADE] ──► Event18_ColorFade [MATCHED 2026-07-11]
  Event2C_LoadUnits ──► GetUnitDefinitionFormEventScr [MATCHED 2026-07-13]

battle-anim intro ────────────────────────────────────────────────
  EkrBattleStarting_* ──► PrepareBattleGraphicsMaybe [MATCHED 2026-07-07]

unit placement / summon ─────────────────────────────────────────
  MoveUnitExt / MuCtr_InitDefinedMove / GenUnitDefinitionFinalPosition
                             ──► AdjustNewUnitPosition [MATCHED 2026-07-11]
  SelSumPosAndMoveCamera ──► SelectSummonPos [8]

worldmap ─────────────────────────────────────────────────────────
  ProcScr_GmNodeIconDisplay ──► GmapScreen2_Loop [16]

augury / divination result screen  (占い)  — LIVE
  ProcScr_SaveMenu ──► data_08A95548
        ├─ OnInit ──► Augury_InitResultScreen [MATCHED 2026-07-10]
        │              └─► DrawAuguryResultPanel [MATCHED 2026-07-11]
        ├─ sub_80A3458 ──► PutDivinationRankSprite [MATCHED 2026-07-11]
        └─ sub_80A3074 ──► DivinationRankSpriteUpdate [MATCHED 2026-07-11]

password record codec  — ENCODE live, DECODE dead
  menu ProcScr ──► sub_80A74D4 ──► EncodeLinkArenaRecord [MATCHED 2026-07-11]
  (no caller) ✗ DecodeAndVerifyArenaRecord [MATCHED 2026-07-12]
                 ──► DecodeLinkArenaRecordHeader [MATCHED 2026-07-13]

JP-only DEAD spline island
  (no caller) ✗ SplineSampleAtTime [3] ──► SplineEvalCatmullRom [2]
```

---

# Per-function reports

## Resolved study #1. AddAttr2dBitMap — `0x08001570`  ✅ MATCHED 2026-07-10

- **fe8u twin:** yes — `fireemblem8u/src/hardware.c:468`. The US TU compiles byte-identical
  to fe8u's own `hardware.o`; the **JP is region-different codegen** (different agbcc shape),
  reproduced to within one instruction with `-mjp-promote`. Declared in `include/hardware.h:380`.
- **Purpose:** the core map-animation **2-D tile blitter**. Copies a variable-size bitmap of
  tile-attribute halfwords into a 32-tile-wide destination buffer, with clipping and a
  per-tile character/palette offset (`chr`) added to every copied entry.
- **Logic:** width/height come from the first two bytes of the source (`src[0]+1`, `src[1]+1`);
  the source pointer advances past that 2-byte header; the blit is clipped to the 32×32 tile
  grid (handles `ix`/`iy` running negative or past `0x20`), then copies rows bottom-to-top,
  writing `*dst = *src + chr`.
- **Callees:** none (leaf).
- **Callers (12 direct `BL`):** `MapAnim_GorgonHatch_Loop`, `NightMarefx_Loop`,
  `MapAnimMonsterStone_Loop1`, `MapEventcallFx0_PlayIntroAnim`, `MapEventcallFx0_PlayMainAnim`,
  `MapEventcallFx1_PlayFadeAnim`, `MapEventcallFx2_PlayAnim`,
  `MapanimEventcall_SummonLoadFrameAndPal`, `MapanimEventcall_SummonLoadFrame`,
  `SummonGfxAnim_Loop`, `SummonUnitGfx_Loop`, `GlowingCross_Loop`.
- **Verdict:** **LIVE** — a fundamental primitive of the whole map-animation / summon-fx layer.
- **Matching lever:** under `-mjp-promote`, place a zero-instruction
  `do { } while (0);` separator between `_width = width;` and `_height = height;`.
  It emits no code but changes agbcc's basic-block/local-allocation decision so the
  `mov ip,r6` / `mov r8,r2` saves appear in JP order. The prior “source-invariant”
  verdict is retracted.

## Resolved study #2. SplineEvalCatmullRom — `0x0800A34C`  ✅ MATCHED 2026-07-16

- **fe8u twin:** **none.** JP-only Catmull-Rom / natural-cubic-spline 2-D evaluator. The
  fe8u `spline.c` library (`Spline_Ease`, `Spline_Eval`, `Spline_BuildCubicCoeffs`, …) is a
  *different* code set and does not contain this function.
- **Purpose:** evaluate a 2-D spline at a query time — segment search, tangent/coefficient
  build, tridiagonal solve, then a fixed-point cubic (Horner) evaluation for x and y.
- **Logic:** `ti = t>>12`; do/while segment search; build `coeffA/coeffB/sub/tan` arrays;
  `sub_800A194(...)` solves the tridiagonal system (Thomas algorithm); clamp `i>=last`;
  compute the cubic coefficients and evaluate via three nested `DivArm(0x1000, u*…)`
  fixed-point (`>>12`) multiplies per axis. (The uninitialized `int r;` return is intentional —
  the asm epilogue reuses r0 as the branch target; the caller ignores the return.)
- **Callees:** `sub_800A194` (tridiagonal solver — itself reachable *only* from here),
  `sub_80D6378` (GBA BIOS `DivArm` quotient / `>>12` fixed-point multiply).
- **Callers (1):** `SplineSampleAtTime` only (internal call site `_0800A758`).
- **Verdict:** **DEAD** — its sole caller is the unreferenced root #3, so the whole island is
  unreachable.
- **Match:** fHkHP replaced the score-60 allocator script with clean parallel
  arrays, natural loops, and direct indexed expressions while retaining the
  real five-argument solver ABI. The project adaptation casts only the six
  polynomial denominators to `s32` and uses a scoped real-symbol
  `__divsi3 -> DivArm` alias; the initial time-fraction division remains
  unsigned. The linked 584-byte range is exact, ABtKz reports raw score 0, and
  its registry row is retired.

## 3. SplineSampleAtTime — `0x0800A594`  (DEAD — unreferenced root)

- **fe8u twin:** **none.** JP-only spline driver sitting directly above (and driving) #2.
- **Purpose:** given an (x,y,time) control-point array, optionally wrap the query time modulo
  the spline period (loop mode), find the segment containing `t>>12`, materialise a 3-point
  window (wrap-around for closed splines, clamped for open), call the evaluator, store the
  resulting (x,y), and return the segment index.
- **Logic:** `loop` branch uses `sub_80D6384` (BIOS `DivArm` remainder = `v % m`) to wrap `t`;
  both branches binary-walk the control points, fill `lpts/ltimes`, then
  `SplineEvalCatmullRom(lpts, lout, ltimes, t, 3)` and write `out->x/y`.
- **Callees:** `SplineEvalCatmullRom` (#2), `sub_80D6384` (BIOS DivArm remainder).
- **Callers:** **none.** Zero Thumb/ARM `BL`, zero pointer words (`0x0800A594`/`0x0800A595`),
  zero literal-pool references anywhere in the 16 MB ROM.
- **Verdict:** **DEAD CODE.** This is the root of an isolated 3-function island
  (`SplineSampleAtTime → SplineEvalCatmullRom → sub_800A194`) that nothing in the game
  reaches. Almost certainly a JP-only left-over Catmull-Rom implementation superseded by the
  `spline.c` easing library the game actually uses (`Spline_Ease` is called from
  `GetEasedProgress`/bmlib). *Understanding value only — there is no runtime behaviour.*
- **Current proven seed / why still asm:** the integrated candidate has the
  target **500-byte extent** and frame/stack anchors, with local residual
  **369/500 bytes (208/250 halfwords)**, `PROVEN-BOUNDED(1)`, and
  `EQUIV 60/60` with all five arguments modeled. Active scratch
  [`Sp10a`](https://decomp.me/scratch/Sp10a) contains the exact guarded source
  plus provenance and compiles at hosted score **8906** with stock
  `-mthumb-interwork -Wimplicit -Wparentheses -Werror -O2`. The project-local
  score 369 uses the additional per-TU `-fno-rerun-cse-after-loop`; therefore
  **369 and 8906 are not directly comparable**. The remaining root is
  allocator/scheduling: JP has the direct early r0→r7 `pts` placement, while the
  retained safe source reaches r7 later and leaves a register-role permutation.
  P25 was tested immediately after the sibling match: the clean aggregate source
  produced 496 bytes and 68/500 exact bytes with the current flag, or 488 bytes
  and 79/500 under stock `-O2`, so both variants were rejected.

## Resolved study #4. Event18_ColorFade — `0x0800E1FC`  ✅ MATCHED 2026-07-11

- **fe8u twin:** yes — `fireemblem8u/src/eventscr.c:747`, verbatim.
- **Purpose:** the event-script **opcode handler for `COLORFADE`** (`EV_CMD_COLORFADE`). Starts
  a fade, ends a fade, or fades a contiguous range of palette colours.
- **Logic:** reads the sub-command and args from the event stream; `switch(subcode)`:
  `STARTFADE → EventStartFade`, `ENDFADE → EventEndFade`, `FADECOLORS →` build a bitmask over
  `[start, start+size)` and call `NewEventFadefx(speed, mask, r,g,b, proc)` (speed forced to 0
  when skipping / already faded-in); default → `EVC_ERROR`.
- **Callees:** `EventStartFade`, `EventEndFade`, `NewEventFadefx` (all `bmfx.h`);
  `EVT_SUB_CMD` / `EVT_CMD_ARGV` macros.
- **Callers:** the event command dispatch table **`gEventLoCmdTable`** (entry `+0x60`,
  i.e. `EV_CMD_COLORFADE`); the table is populated in `include/eventscript.h:186`.
- **Verdict:** **LIVE** — invoked by the event interpreter for any script using the colour-fade
  command (very common in cutscenes).
- **Matching levers:** uVVvN pins `proc`/stream/colour values to the JP high-register
  allocation, widens the real `NewEventFadefx` ABI view to avoid unwanted u16
  normalizations, scripts the target `and`, and uses scoped empty barriers for the final
  argument/spill order. The project source retains the real `NewEventFadefx` symbol.

## Resolved study #5. GetUnitDefinitionFormEventScr — `0x0800FAD0`  ✅ MATCHED 2026-07-13

- **fe8u twin:** yes — `fireemblem8u/src/eventscr.c:2376` (also NON_MATCHING in fe8u itself).
- **Purpose:** event-script helper that **builds a randomised unit-load list** from a
  `UnitDefinition` source array — selects a percentage of the summonable units, partitions
  selected/unselected into `gLoadUnitBuffer`, optionally clears reinforcement data and builds
  the deployed-unit list.
- **Logic:** counts units with `sumFlag`; `i = Div(count*arg2 + 50, 100)`; random-picks `i`
  distinct indices via `NextRN_N` using a 64-bit `{loBits,hiBits}` mask; copies unselected then
  selected units into `gLoadUnitBuffer` (clearing/setting `sumFlag`); terminates with
  `charIndex = 0`; `arg4 → ` clear each unit's REDAs; `arg3 → BuildDeployedUnitDefinitionList`.
- **Callees:** `Div`, `NextRN_N`, `BuildDeployedUnitDefinitionList`; global `gLoadUnitBuffer`.
- **Callers:** 1 direct `BL` — `Event2C_LoadUnits` (`src/eventscr_0800FD04.c:76`, the Event2C
  "load units" command).
- **Verdict:** **LIVE** — used whenever an event loads/generates units (e.g. reinforcements,
  summons defined in-script).
- **Resolution:** P23 declares the stacked fifth argument ABI-wide and narrows it
  locally only after `arg3` receives its target stack home. Direct `arg2`, scoped
  word-sized RNG spill/reload constraints, and an r5 tail readback reproduce the
  four formerly differing clusters. Linked range and whole-ROM comparisons are exact.

## 6. PrepareBattleGraphicsMaybe — `0x08057F80`  (LIVE, **genuinely region-different**)

- **fe8u twin:** yes, as an **analog** — `fireemblem8u/src/banim-ekrbattleintro.c ::
  PrepareBattleGraphicsMaybe` (US `.o` = 3250 B vs JP 2936 B). The JP is *smaller* — the US
  **added** logic during localisation.
- **Purpose:** front-loads **all** per-combat state the EKR battle-animation renderer needs
  before a battle plays (arena / link-arena flags; EKR distance class close/far/farfar/
  monocombat/promotion; left-vs-right BattleUnit assignment and per-side "valid/drawn";
  battle-anim ids; unique & faction palettes; terrain / floor-fx / background; gauge HP/hit/
  dmg/crit; exp bars; weapon-triangle bonus & effectiveness). Returns a bool **"should the full
  battle animation play?"** (false ⇒ fall back to map-quick combat).
- **Region differences (verified by aligning the 57-call `BL` sequence 1:1 vs the US `.o`):**
  - **[R1]** ally left/right decision: JP guards on `GetSelectTargetCount() != 1`; US on
    `GetBanimLinkArenaFlag() != true`.
  - **[R2]** unique-palette-disable: JP `GetSelectTargetCount() == 1 || config.unitColor`;
    US `GetBanimLinkArenaFlag() == true || config.unitColor`.
  - **[R3]** the whole US-only tail (the bulk of the +314 B): 8 `GetItemIndex` Manakete/Myrrh
    staff-immunity tests + a Demon-King `return true` fast-path — **absent in JP**.
- **Callees:** 57 calls, incl. `SetBanimLinkArenaFlag`, `GetBattleAnimationId`,
  `FilterBattleAnimCharacterPalette`, `GetSpellAnimId`, `IsItemDisplayedInBattle`,
  `UnsetMapStaffAnim`, `GetBattleAnimArenaFlag`, `SetBattleUnscripted`, …
- **Callers:** 2 direct `BL` — `EkrBattleStarting_IsBattleAnimEnabled`,
  `EkrBattleStarting_CheckBattleAnimEnabled` (`src/exact_08056b3c.c` / `exact_08056b4c.c`).
- **Verdict:** **LIVE** — the gate that decides, at battle start, whether the animated battle
  plays.
- **Why still asm:** **not** a codegen NEAR — a genuine JP↔US *source* difference (R1–R3).
  A byte match is out of scope (STRETCH-only). This is the largest of the 16 (2936 B).

## Resolved study #7. AdjustNewUnitPosition — `0x0807C8DC`  ✅ MATCHED 2026-07-11

- **fe8u twin:** yes — `fireemblem8u/src/muctrl.c:475`, verbatim.
- **Purpose:** adjust a freshly-placed unit's tile — either scatter it to a random free
  reachable neighbour (flag&2) or snap it to the nearest valid tile if its terrain is blocked
  (flag&1).
- **Logic:** flag&2 → `GenerateExtendedMovementMapOnRange` then scan the 3×3 neighbourhood,
  rejecting tiles that are occupied (`gBmMapUnit/Other/Hidden`) or out of movement range
  (`gMapRangeSigned<0`), collect candidates, and `NextRN_N`-pick one. else flag&1 → if
  `gBmMapTerrain` blocked, `AiGetUnitClosestValidPosition`.
- **Callees:** `GetUnitMovementCost`, `GenerateExtendedMovementMapOnRange`, `NextRN_N`,
  `AiGetUnitClosestValidPosition`.
- **Callers:** 3 direct `BL` — `MuCtr_InitDefinedMove`, `MoveUnitExt`,
  `GenUnitDefinitionFinalPosition`.
- **Verdict:** **LIVE** — unit movement/spawn placement.
- **Matching levers:** gdTId expresses the nested scan as exact goto-shaped loops, pins
  counters/bases/map offsets to the ROM-derived registers, scripts only the packed `strh`
  store, and adds a zero-instruction input barrier to preserve call argument order. Real map
  globals and the real `AiGetUnitClosestValidPosition` prototype remain intact.

## 8. SelectSummonPos — `0x0807D3BC`  (LIVE)

- **fe8u twin:** functional **analog** only — `fireemblem8u/src/mapanim_summon.c:204`, but the
  **JP body is a different algorithm** (this is a from-JP-asm reconstruction, not a US port).
- **Purpose:** pick a random valid summon tile around `(x,y)`.
- **Logic:** walk the 3×3 grid writing `array[count].x/y` *before* the checks; on fail set
  `boolAvailable |= 0xff`, on pass set `= 1` and `count++`; `count==0 → -1`; zero-fill
  `indices[9]`; compact the passed slots; `pick = DivRem(AdvanceGetLCGRNValue(), count+1) - 1`;
  `*result = array[indices[pick]]`; return 1.
- **Callees:** `DivRem`, `CanUnitCrossTerrain` (`sub_8019174`), `AdvanceGetLCGRNValue`.
- **Callers:** 1 direct `BL` — `SelSumPosAndMoveCamera`.
- **Verdict:** **LIVE** — summon-spell target positioning.
- **Current proven seed / why still asm:** local score **550**, linked residual
  **61/392**, exact size **392**, and exact frame **0x90** under the required
  project `-mjp-promote`; `PROVEN-BOUNDED(1)` and `EQUIV 60/60` pass. The
  compaction core now matches (scan r1, index r5, j r6); the remaining wall is
  reject materialization/register order — the candidate forms `0xff` in r2 at
  +0x30, while JP does so at +0x3A after loading `gBmMapSize`, rotating the outer
  loop's remaining register roles. Active scratch
  [`J1ka1`](https://decomp.me/scratch/J1ka1) has a function body diff-zero against
  the integrated source and remains registered; its hosted score is **10499**
  because stock decomp.me agbcc does not implement `-mjp-promote`.

## Resolved study #9. DivinationRankSpriteUpdate — `0x080A2E64`  ✅ MATCHED 2026-07-11

- **fe8u twin:** **none** (JP-only 占い/augury/divination subsystem).
- **Purpose:** per-frame update proc of the divination rank-sprite animator — advances a frame
  counter, emits rows of rank sprites, and applies a rotating affine transform (sin/cos) to
  five OAM affine slots.
- **Logic:** advance `unk2C`; for 5 rows, `PutSpriteExt` the row's sprites gated by
  `rowCounts[]` and the counter; then a 5-slot loop computing affine params via `sub_80D6374`
  (fixed-point multiply) from `DIVINATION_SIN/COS` constants and installing them with
  `sub_8002100`.
- **Callees:** `sub_80A2E4C`, `Div`, `SetObjAffine`, `PutSpriteExt`; reads
  `gUnk_08A95478`.
- **Callers:** the address is loaded from the literal pool of the proc-starter routine
  `sub_80A3074` (`+0xA0`), which starts it as a proc; `sub_80A3074` is `PROC_CALL`-ed by the
  ProcScr `data_08A9548C`, itself spawned by `sub_80A2E4C` (which this function also calls —
  a mutually-recursive augury animation family).
- **Verdict:** **LIVE** — animation proc of the augury result screen.
- **Match lever:** harvest-first found score-0 community fork `l4bts`. Relative to
  the proved nonmatching parent, the matching source reuses one `data` pointer for
  the sine-table reads, explicitly materialises `xArg` and `next = i + 1`, pins
  `pRow/x/sa/sb/sc` to the JP registers, and places two empty `+r` fences after
  the first two `Div` results. Under `-fno-gcse`, this preserves JP's
  proc/table/output live ranges. The project adaptation removed decomp.me `.set`
  scaffolding and contains no raw opcode asm. `make compare` is the match proof.

## Resolved study #10. PutDivinationRankSprite — `0x080A3300`  ✅ MATCHED 2026-07-11

- **fe8u twin:** **none** (JP-only augury rank-sprite OAM emitter).
- **Purpose:** emit the augury rank-icon sprites for `DivinationSpriteProc`.
- **Logic:** for each of the 5 rows whose `rowCounts[i] != 0xFF`, compute an (x,y) origin and
  inner-loop `PutSpriteExt` across `gUnk_08A95478[col]`; then one extra sprite if `unk3E`.
- **Callees:** `PutSpriteExt`; reads `gUnk_08A95478`.
- **Callers:** the address is loaded by the proc-starter routine `sub_80A3458` (`+0x94`), a
  member of the augury result-screen proc family under ProcScr `data_08A95548`.
- **Verdict:** **LIVE** — augury result-screen sprite emitter.
- **Matching levers:** Br4VJ splits the signed x/y loads into short ROM-derived r0/r1
  lifetimes before the pinned r2 x origin, fences the x load once, and uses a
  continue/do-while loop shape while preserving per-iteration
  `(objects = gUnk_08A95478)[col]` rematerialization. It reuses main's single
  `gUnk_08A95478` alias.

## Resolved study #11. DrawAuguryResultPanel — `0x080A3528`  ✅ MATCHED 2026-07-11

- **fe8u twin:** **none** (JP-only augury result-panel draw).
- **Purpose:** paint the divination result panel — title, five rank rows, score, H:MM:SS clear
  time, overall-rank icon and win count — into the BG2 tilemap, with a "valid record" layout and
  a "no record / dash" placeholder layout.
- **Logic:** `ResetText`/`BG_Fill`/font setup; `PutDrawText` the title from
  `gUnknown_08A9553C[index]`; then per-field `PutDrawText` / `PutNumber` / `PutNumber2Digit` /
  `PutSpecialChar` for the five ranks, score, clear-time, overall-rank glyph
  (`gUnknown_08A95524[overallRank]`), locked/unlocked strings and win count; the invalid branch
  substitutes dashes via `sub_80A34F0`.
- **Callees:** `ResetText`, `BG_Fill`, `SetTextFontGlyphs`, `SetTextFont`, `PutDrawText`,
  `GetStringFromIndex`, `PutNumber`, `PutNumber2Digit`, `PutSpecialChar`, `sub_80A34F0`,
  `BG_EnableSyncByMask`; reads `gPrepItemTextMsgIds`, `gUnknown_08A9553C`, `gUnknown_08A95524`.
- **Callers:** 1 direct `BL` — matched `Augury_InitResultScreen`, internal site `_080A3AB6`.
- **Verdict:** **LIVE** — drawn by the augury OnInit.
- **Matching levers:** vdXu7 explicitly hoists the six proc-field pointers, rematerializes the
  tilemap base into the target low register, preserves the table's post-increment walk with
  one `ldmia`, and fences only the address/argument lifetimes whose scheduling differed.

## Resolved study #12. Augury_InitResultScreen — `0x080A390C`  ✅ MATCHED 2026-07-10

- **fe8u twin:** **none** (JP-only augury result-screen ProcScr OnInit).
- **Purpose:** initialise the 占い result screen — load the saved ranking record, unpack it into
  the proc, compute the composite grade, decompress + apply the panel graphics, draw the
  sub-panels, and (for a valid record with a portrait) start the tactician face + rank-badge CG.
- **Logic:** `sub_80D6370` (CpuSet) zero-fills a 0x18-byte `GameRankSaveData` scratch;
  `GetSavedRankData(&rank, index, unlocked)`; bit-unpacks the record into the proc fields
  (`rowCounts[5]`, turns H:MM:SS, 24-bit `score`, `portraitId`, `overallRank` via
  `GetOverallRank`, `winCount`, tactician name); `Decompress(data_08A9A8D4)` + `j_TmApplyTsa`;
  `sub_80A3528` (#11) + `sub_80A33E0`; then face (`sub_80063F8`) + CG text (`StartCgText` /
  `SetCgTextFlags`) when valid & has portrait. (Invalid record ⇒ each rank `|= 0xFF` "dash".)
- **Callees:** `sub_80D6370`(CpuSet), `GetSavedRankData`, `GetOverallRank`, `strcpy`,
  `sub_8031438`, `GetStringFromIndex`, `sub_80A40A0`, `Decompress`, `j_TmApplyTsa`,
  `sub_80A3528`, `sub_80A33E0`, `BG_EnableSyncByMask`, `EndFaceById`, `sub_8091544`,
  `sub_80063F8`, `InitTalk`, `StartCgText`, `SetCgTextFlags`; reads `gUnk_088582BC`,
  `data_08A9A8D4`.
- **Callers:** the augury result-screen ProcScr **`data_08A95548`** (OnInit entry `+0x1C`),
  which is started by `sub_80AEBAC` and reached from **`ProcScr_SaveMenu`** (`+0x22C`).
- **Verdict:** **LIVE** — the augury result screen, reachable from the save/extras menu.
- **Matching levers:** read the five `GetOverallRank` arguments back from the
  just-stored `proc->rowCounts[]` destination instead of the source bitfields, keeping
  the destination-field addresses live so agbcc hoists/reuses them like JP. Then write
  the behaviorally equivalent duplicate-arm test as `index == 0` to match JP branch
  polarity and downstream block/pool layout. No register pins or inline asm.

## Resolved study #13. DecodeLinkArenaRecordHeader — `0x080A6D34`  ✅ MATCHED 2026-07-13

- **fe8u twin:** **none.** At the *same numeric address range* the US ROM has completely
  different code — `fireemblem8.map` shows `0x080a6d34 = bmsave_null_false2` and the
  neighbourhood is `bmsave-xmap` (world-map save: `WriteWorldMapNodes`, `ReadWorldMapNodes`,
  `WriteWorldMapPaths`, …). Exact cross-game twins are FE6J
  `func_fe6_08083180`, FE7J `sub_809E4D0`, and FE7U `sub_809DAB8`; this identifies
  the subsystem as the shared password/secret-code codec.
- **Purpose:** password record **header DECODE** — the exact inverse of the
  matched same-TU sibling `sub_80A6C60` (encode-interleave). De-obfuscates the packed buffer
  (subtract the rolling checksum, mask to `(1<<bits)-1`) then de-interleaves 30 bits back into
  the 3 codec-header words at `0x02014FC8`.
- **Logic:** `sub_80A6AC0()`; `sb = sub_80A6C20(payload, base[3])`; subtract-and-mask loop over
  `gBuf_2014F28`; clear the 3 header words; 30-iteration de-interleave using the `i%3` bucket,
  `i/3` shift and `i%bits` stride.
- **Callees:** `sub_80A6AC0`, `sub_80A6C20`; reads `gUnk_02014EF0/EF4`, `gBuf_2014F28`.
- **Callers:** 1 direct `BL` — `DecodeAndVerifyArenaRecord` (#15) only.
- **Verdict:** **DEAD** — reachable only from the unreferenced root #15.
- **Matching levers:** block-by-block FE6J/FE7J alignment proved there is no helper
  inlining, callback, argument-order, signedness, or phase-boundary delta inside
  this function. Phase-local pins reproduce the JP value roles; explicit r0/r2
  accumulators force the two commutative `adds` operand orders; r1 delta/mask
  temporaries fix the subtract loop; and an r1 `struct LinkArenaRecordHeader *`
  alias preserves immediate offsets for duplicated field tails. The source uses
  named globals and empty constraints only—no raw opcode asm.

## Resolved study #14. EncodeLinkArenaRecord — `0x080A6E4C`  ✅ MATCHED 2026-07-11

- **fe8u twin:** **none** (JP-only link-arena record ENCODE; US region has `bmsave-xmap` here).
- **Purpose:** link-arena record **ENCODE / commit** — packs a record for storage/transmission
  (the encode half of the codec).
- **Logic:** reverse-clears `gBuf[0..0x9f]`; calls the caller-supplied callback
  `func(&len, payload)` to emit the raw payload; `hdr[3] = sub_80A6A7C(len)` (block count);
  `hdr[1] =` payload checksum; `hdr[0] =` nonce seeded from `GetGameClock()>>3` (mirrored to
  `*(int*)0x02014F24`); LCG-obfuscates the buffer byte-by-byte (`sub_80A6AA8`); `hdr[2] =`
  second checksum; `sub_80A6C60()` interleaves the 30 header bits. Header words at
  `(u16*)0x02014FC8`.
- **Callees:** `sub_80A6A7C`, `sub_80A6AA8` (LCG PRNG), `sub_80A6C20` (checksum), `sub_80A6C60`
  (interleave), `GetGameClock`, and the caller callback via a `_call_via_rN` veneer.
- **Callers:** 1 direct `BL` — `sub_80A74D4`, which is a `PROC_CALL` entry in ProcScr
  `gUnknown_08A95E20` (started by `sub_80A7650 ← sub_80A4088`, reached from the augury/save
  menu ProcScr region `data_08A95548`).
- **Verdict:** **LIVE** — the encode/commit path is wired and menu-reachable (the "pack/save
  your ranking record" direction).
- **Matching levers:** XOT5k pins the real callback to r3 and calls it normally, so agbcc
  emits `_call_via_r3`; it does not hardcode a callee or script a branch opcode. Scoped
  buffer/bound/offset/count pins plus one empty loop-base fence reproduce the remaining
  lifetime and spill choices.

## Resolved study #15. DecodeAndVerifyArenaRecord — `0x080A6F1C`  ✅ MATCHED 2026-07-12

- **fe8u twin:** **none** (JP-only link-arena record DECODE + VERIFY; US region = `bmsave-xmap`).
- **Purpose:** the decode/verify counterpart of #14 — unpacks a received/stored record and
  returns whether it is authentic.
- **Logic:** `sub_80A6D34()` de-interleaves the 3 header words; seed the LCG from `hdr[0]`
  (`*(int*)0x02014F24`); `chk = checksum(obfuscated payload)`; `a = LCG()`; de-obfuscate the
  payload (`payload[i] = (payload[i] - LCG()) & mask`); `b = LCG()`; `consume(&cbarg, payload)`
  lets the caller read the plaintext; `chk2 = checksum(plaintext)`; **return
  `hdr[1] == ((chk2+a)&0x3FF) && hdr[2] == ((chk+b)&0x3FF)`** — packet valid iff both 10-bit
  verify tags reconstruct.
- **Callees:** `DecodeLinkArenaRecordHeader` (#13, header decode), `sub_80A6C20` (checksum), `sub_80A6AA8`
  (LCG), and the `consume` callback.
- **Callers:** **none.** Zero Thumb/ARM `BL`, zero pointer words (`0x080A6F1C`/`0x080A6F1D`),
  zero literal-pool references anywhere in the ROM.
- **Verdict:** **DEAD CODE.** The link-arena codec ships a **live encoder but a dead decoder**:
  nothing in the JP ROM ever decodes/verifies a record. The receive side of the feature is
  either handled by other code or was never wired up. Its only distinct callee (`sub_80A6D34`)
  is dead-by-transitivity. *Understanding value only — no runtime behaviour.*
- **Matching levers:** paired `u16 tags[2]` plus `int cbarg` produce the target
  frame-8 layout and clean halfword homes. Phase-local aliases pin `chk` to r6,
  the real callback to r9, `&cbarg` to r8, and the loop base to r4; the callback
  is still invoked normally, so agbcc selects the existing `_call_via_r9`
  veneer. `int` helper declarations with only the first checksum explicitly
  narrowed reproduce the target extension points. The decisive final residual
  was the target's explicit constant copy: `raw_mask` pinned to r1, an empty
  `+r` fence, then `mask` pinned to r2 emits
  `ldr r1,=0x3FF; adds r2,r1,#0` without a raw opcode.
- **Lifecycle / evidence:** commit `6aa5f35fa` passed full linked `make compare`
  and `make shiftcheck` (0 HIGH). ARM-vs-ARM SMT reports
  `PROVEN-BOUNDED(3)`; differential testing is EQUIV for 60/60 trials; bounded
  shared-oracle CBMC is successful at 0/409 assertions, while the loop and mask
  mutations each refute at the intended assertion. Owned scratch h2W8F reports
  raw score 0 and its registry row is removed.

## 16. GmapScreen2_Loop — `0x080C05C8`  (LIVE — worldmap)

- **fe8u twin:** yes — `fireemblem8u/src/worldmap_screen2.c :: GmapScreen2_Loop` (US
  `0x080BB798`). Adopted from a proved-equivalent community decomp.me shape
  (`prove_nonmatching → PROVEN-BOUNDED(2)`, `differential_test → EQUIV`).
- **Purpose:** the worldmap node-icon display proc's per-frame `_Loop` — draws the map node
  icons (pre-clear vs post-clear variant) for up to 29 nodes at their computed screen positions,
  plus an optional "merge next node" flag icon.
- **Logic:** early-out unless `proc->skip`; for `i` in `[0,0x1D)` with node state bit 0 set,
  select the icon by state bit 1 (pre/post clear), `GmapScreen2_GetNodeScreenPos(...)`, and
  `PutSpriteExt(...)` at the masked screen coords with the palette/flag bits; then, if
  `merge_next_node`, compute the flag-icon position and `AP_Update(...)` when on-screen.
- **Callees:** `GmapScreen2_GetNodeScreenPos`, `PutSpriteExt`, `AP_Update`.
- **Callers:** ProcScr **`ProcScr_GmNodeIconDisplay`** (`+0x24` — a `PROC_REPEAT(GmapScreen2_Loop)`);
  also referenced from a `src/data/frontier_df4_ending` ProcScr.
- **Verdict:** **LIVE** — the worldmap node-icon display loop.
- **Current proven seed / why still asm:** authoritative local score **230** and
  hosted [`R7AaX`](https://decomp.me/scratch/R7AaX) score **480**, with target
  and candidate size both **544 B** and `PROVEN-BOUNDED(2)`. The final source
  removes the phase-1 `sp+8` spill, makes the phase transition exact, and keeps
  the AP_Update r7/r6 carriers exact. R7AaX contains the exact guarded source,
  provenance, and active registry row. The residual is still an agbcc
  allocator/scheduling divergence elsewhere in the two paths; the final
  source/header does not establish a narrower single root, so no more specific
  cause is claimed here.

---

## Cross-game presence — do the fe8u-absent functions exist in FE6 / FE7J / FE7U?

Ten of the 16 have **no fe8u twin** (the spline pair, the "augury" cluster, the link-arena/
codec cluster, and `SelectSummonPos` whose fe8u analog is a different algorithm). This section
checks whether they exist in the other three GBA Fire Emblem games.

**Method.** Cross-game function matches from `../FE_GBA_Function_Library` — Zynel/BinDiff 4.3
pairwise results **FE8J↔FE7J**, chained **FE7J↔FE6** and **FE7J↔FE7U** — with real names from
`../fireemblem6j` (`fe6.map`/`fe6.elf`). Every non-trivial verdict was then **verified by
`objdump` call-structure comparison** (BinDiff's graph-similarity score alone is not trusted:
two of the ten "matches" turned out spurious).

| FE8J fn (addr) | FE7J | FE7U | FE6 | Verdict / real cross-game identity |
|---|---|---|---|---|
| SplineEvalCatmullRom (0800A34C) | 0.37 ✗ | ✗ | ✗ | **FE8J-specific.** BinDiff→FE7J 0805BF80 is *spurious* (see note A). |
| SplineSampleAtTime (0800A594) | 0.25 ✗ | ✗ | ✗ | **FE8J-specific.** spurious match, same as above. |
| DivinationRankSpriteUpdate (080A2E64) | **08099E34 (1.00)** | **08099474 (1.00)** | ✗ (0.02) | **PRESENT FE7J+FE7U** (identical: 19/19 BBs, 191/191 insns). = Play-Ranking sprite update. |
| sub_80A3300 (080A3300) | **0809A324 (1.00)** | **08099968 (1.00)** | ✗ | **PRESENT FE7J+FE7U** (10/10 BBs, 103/103 insns). = Play-Ranking sprite emit. |
| sub_80A3528 / DrawAuguryResultPanel (080A3528) | 080B92E8 (0.01 ✗) | (0.98 via FE7J) | ✗ | **UNCERTAIN** — likely present but the text-layout draw diverges too much for BinDiff to align (note B). |
| Augury_InitResultScreen (080A390C) | **0809A9FC (0.97)** | **0809A024 (0.99)** | ✗ | **PRESENT FE7J+FE7U** (17/17 BBs). = Play-Ranking screen init. |
| sub_80A6D34 (080A6D34) | **0809E4D0 (0.96)** | **0809DAB8 (1.00)** | **08083180 (1.00)** | **PRESENT FE6+FE7J+FE7U.** Password DECODE (secretscreen.c). |
| sub_80A6E4C (080A6E4C) | **0809E5F0 (0.99)** | **0809DBD8 (1.00)** | **080832A0 = `ModifyPassword` (0.99)** | **PRESENT FE6+FE7J+FE7U.** Password ENCODE — call-structure 1:1 verified (note C). |
| DecodeAndVerifyArenaRecord (080A6F1C) | **0809E6C0 (0.99)** | **0809DCA8 (1.00)** | **08083378 (1.00)** | **PRESENT FE6+FE7J+FE7U.** Password DECODE+VERIFY (secretscreen.c). |
| SelectSummonPos (0807D3BC) | 0800B578 (0.01 ✗) | ✗ | ✗ | **FE8-ONLY.** Summoner is an FE8 class; FE7J/FE6 have 0 summon references. spurious match. |

(BinDiff scores are `similarity`; ✗ = no match / spurious. FE7J/FE7U/FE6 decomps have **not
named** these — they are still `sub_`/`func_fe6_` in those ROMs — but the functions demonstrably
exist there.)

### The two big cross-game reclassifications

- **The "link-arena record codec" is really the Secret-Screen PASSWORD codec.** All three of
  `sub_80A6D34/sub_80A6E4C/DecodeAndVerifyArenaRecord` are present near-identically in **FE6,
  FE7J and FE7U** — the strongest cross-game sharing of any function in this set. In FE6 the
  encode function is literally named **`ModifyPassword`** (`src/secretscreen.c:245`), and its
  0xA0-byte work buffer (`Unk_02016924[0xA0]`) is the FE8J `gBuf[0..0x9f]`. **Note C:** FE8J
  `sub_80A6E4C` and FE6 `ModifyPassword` have a 1:1 call correspondence —
  `GetGameClock↔GetGameTime`, the nonce/checksum helpers line up, the LCG PRNG `sub_80A6AA8`
  (×3) **= FE6 `GetSecretScreenRN`**, and both use the same `_call_via_r3` callback veneer. So
  this cluster is the shared **password / "secret code" serialiser** (encode a record →
  checksum + LCG-obfuscate + 30-bit interleave; decode = inverse + verify), not a link-arena–
  specific thing. (It stays *dead on the decode side* only in FE8J — see report #15.)
- **The "augury / divination result screen" is really the Play-Ranking display.** The cluster
  `DivinationRankSpriteUpdate / sub_80A3300 / Augury_InitResultScreen` matches FE7J and FE7U at
  0.97–1.00 with byte-identical basic-block/instruction counts. It reads `GameRankSaveData`; FE6
  `src/playrank.c` computes the **same five ranks** (`PlayRankGetter_Tactics / Combat / Survival
  / Experience / Asset(=funds) / Power`) plus clear time and score. FE6's *display* code did not
  match (0.02) — FE6 renders the ranking differently — but the subsystem is the shared
  **Total Play Rank** screen. (The FE8J label "augury/divination" appears to be a mis-name.)

### The two FE8J-specific functions

- **Note A — the spline pair is FE8J-specific.** BinDiff pairs `0800A34C/0800A594` with FE7J
  `0805BF80/0805BF2C` at only 0.25–0.37, which chain to FE6 `EfxAureolaOBJ_Loop /
  NewEfxAureolaOBJCtrl` at 1.00. That chain is a **red herring**: `objdump` shows FE8J
  `0800A34C` is pure spline math (`DivArm`×6, `__udivsi3`, the tridiagonal solver
  `sub_800A194`), whereas FE6 `EfxAureolaOBJ` is a battle-anim effect proc (`BanimSpawnRandB`,
  `SpawnProc`, `GetAnimPosition`, `Proc_Break`) — functionally unrelated. So the JP-only Catmull-
  Rom spline island (report #2/#3) has **no genuine FE6/FE7 counterpart**; combined with its
  dead-code status in FE8J it is a JP-FE8 remnant. (The spline library the game *uses* is
  fe8u's `spline.c`, present in all games.)
- **Note B — `SelectSummonPos` is FE8-only.** Summoning (the Summoner class raising Phantoms) is
  an FE8 feature; FE7J and FE6 contain no summon logic, so there is no counterpart. The 0.01
  BinDiff "match" is a leftover assignment.

**Bottom line.** Of the ten fe8u-absent functions: **6 are shared engine code** present in the
other games (the 3 password-codec functions in FE6+FE7J+FE7U; the 3 play-ranking-display
functions in FE7J+FE7U), **1 is uncertain** (`sub_80A3528` play-ranking draw — probably present
but unmatchable), and **3 are genuinely FE8J-/FE8-specific** (the two dead spline functions and
`SelectSummonPos`).

---

## ROI — effort vs value to byte-match the remaining 4

The 4 already have readable `src/nonmatching/*.c` reconstructions and a green,
self-contained checksum build. Matching them moves **2,020 bytes** from descriptive asm
to compiled C and advances axis-2 from **99.95% toward 100%**. It is valuable
decomp polish, not a functional bug fix.

The 2026-07-10 results correct the old effort model: deterministic levers are **not
proven exhausted merely because a permuter plateaus**. AddAttr yielded to a zero-code BB
separator; Augury yielded to lvalue/address-lifetime and branch-layout choices. For the
remaining set, preserve exact residual evidence, try materially new source-shape levers,
then stop repeated variants of the same idea and hand off to community/permuter compute.

| # | function (size) | live? | residual class | relative ROI |
|---|---|---|---|---|
| 2 | SplineEvalCatmullRom (584 B) | dead | whole-fn coloring/spill | VERY LOW |
| 3 | SplineSampleAtTime (500 B) | dead | spill/coloring | VERY LOW |
| 8 | SelectSummonPos (392 B) | live | spill-slot/frame decision | LOW |
| 16 | GmapScreen2_Loop (544 B) | live | clean JP-vs-US coloring divergence | HIGH |

### Recommendation
1. Harvest registered decomp.me families before any local attempt.
2. Try the now-proven clean levers first: P9 zero-instruction BB separation, P12/P13
   destination or pointer-role readback, explicit IV/argument temps, and scoped
   address rematerialization. For isolated commutative-order residuals, use P14
   two-address accumulators and a phase-local struct alias before microprobes.
   For callback functions, pin the function pointer only
   when the ROM proves the register and call it normally so agbcc selects the veneer.
   Add empty barriers or scripted opcodes only with disassembly evidence.
3. Require `make compare` for every claimed match; a decomp.me score or permuter zero is not
   the ROM oracle.
4. Avoid broad “permanent ceiling” language. State the tested variants and exact residual;
   reserve “handwritten/wrong compiler” for positive instruction-level evidence.

**Bottom line:** the current remainder is **4 functions / 2,020 bytes / ~0.05%
of the axis-2 function count** (584 + 500 + 392 + 544 bytes, matching the table
above and [`frontier.md`](frontier.md)).
The new wins improve the expected value of *targeted, structurally different* attempts,
not endless re-runs of an unchanged permuter search space.
---

## Appendix — tool

`scripts/tools/find_xrefs.py <hexaddr>…` — ROM-wide caller/reference finder used for this
report. Regenerate the symbol table first:

```sh
arm-none-eabi-nm -n fireemblem8.elf | grep -E '^[0-9a-f]{8} [a-zA-Z] ' > /tmp/sym_all.txt
python3 scripts/tools/find_xrefs.py --syms /tmp/sym_all.txt 0800a594 080a6f1c …
```

It reports, per target: Thumb `BL`/`BLX` callers, ARM `bl`/`blx` callers, and word-aligned
pointer words `== addr` / `== addr|1` (ProcScr / event-table / jump-table / literal-pool refs),
each attributed to its containing symbol. A target with empty output on all four is
unreferenced (dead) in the ROM.
