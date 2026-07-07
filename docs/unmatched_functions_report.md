# The 16 remaining unmatched functions — understanding report

> **UPDATE 2026-07-07 — now 15.** `#6 PrepareBattleGraphicsMaybe (sub_8057F80)` was
> **MATCHED byte-exact** (community decomp.me fork
> [rtMN6](https://decomp.me/scratch/rtMN6)) and graduated to `src/`; `make compare`
> stays OK, axis-2 → **99.83% (8677/8692), 15 still-asm**. This directly bears out this
> report's ROI call: sub_8057F80 was rated *"≈NONE ROI / don't attempt (Stretch-only,
> community/compute)"* — and it was the **community decomp.me path**, not agent effort,
> that landed it. Integrating it also uncovered a **funcmap misID bug**: the JP guard
> reads `GetBanimLinkArenaFlag` (0x08050AC8), not `GetSelectTargetCount` — the two are
> byte-identical `return *global` getters, so `us_jp_funcmap.tsv` had mislabeled
> 0x08050AC8. There was therefore **no [R1]/[R2] region difference**; the only JP↔US
> delta is the US-only Manakete/Demon-King tail. The sections below are otherwise
> as-written (they say "16"); treat #6 as ✅ MATCHED.

> **Purpose of this document.** Understand (not match) the 16 functions whose bytes
> still come from `asm/*.s` (the `src/nonmatching/*.c` set — axis-2 = 99.82% matching-C,
> 16 unmatched). For each: does it exist in fe8u? what is it for? what does it do? is
> it live or dead code? plus its call tree (callers ↑ and callees ↓) and references.
>
> This is an **analysis/documentation** deliverable, orthogonal to matching. It does not
> touch `make compare`. Byte-matching status is summarized only as the "why-unmatched"
> class; the authoritative matching frontier stays in
> [`frontier.md`](frontier.md) → *Code frontier — the 16 permuter-bound functions*.

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

| # | JP addr | Name | Subsystem | fe8u twin? | Live / Dead | Callers | Why still asm |
|---|---|---|---|---|---|---|---|
| 1 | 0x08001570 | AddAttr2dBitMap | mapanim blit primitive | **yes** (hardware.c:468, region-diff codegen) | **LIVE** (heavy) | 12 map/summon-fx TUs | reg save-order tie-break (2 halfwords) |
| 2 | 0x0800A34C | SplineEvalCatmullRom | JP-only Catmull-Rom eval | no | **DEAD** (transitive) | 1 (SplineSampleAtTime) | whole-fn reg-coloring/spill |
| 3 | 0x0800A594 | SplineSampleAtTime | JP-only spline driver | no | **DEAD (root)** | **0** | spill/reg-coloring |
| 4 | 0x0800E1FC | Event18_ColorFade | event opcode handler | **yes** (eventscr.c:747) | **LIVE** | `gEventLoCmdTable` | ~95 B spill residual |
| 5 | 0x0800FAD0 | GetUnitDefinitionFormEventScr | event unit loader | **yes** (eventscr.c:2376, NM in fe8u too) | **LIVE** | Event2C_LoadUnits | reg-permutation NEAR |
| 6 | 0x08057F80 | PrepareBattleGraphicsMaybe | EKR battle-anim gate | **yes** analog (banim-ekrbattleintro.c) | **LIVE** | 2 EkrBattleStarting fns | ✅ **MATCHED 2026-07-07** (decomp.me rtMN6); was region-diff-only in the US-only tail |
| 7 | 0x0807C8DC | AdjustNewUnitPosition | unit placement | **yes** (muctrl.c:475) | **LIVE** | 3 (Move/MuCtr/GenUnit) | if/else branch reg coloring |
| 8 | 0x0807D3BC | SelectSummonPos | summon positioning | analog only (diff algorithm) | **LIVE** | SelSumPosAndMoveCamera | reg-alloc micro-decision |
| 9 | 0x080A2E64 | DivinationRankSpriteUpdate | augury result screen | no | **LIVE** | augury proc sub_80A3074 | reg-coloring tie-break |
| 10 | 0x080A3300 | (augury rank-sprite emit) | augury result screen | no | **LIVE** | augury proc sub_80A3458 | inner-loop reg swap |
| 11 | 0x080A3528 | DrawAuguryResultPanel | augury result screen | no | **LIVE** | Augury_InitResultScreen | invariant-scheduling + coloring |
| 12 | 0x080A390C | Augury_InitResultScreen | augury result screen | no | **LIVE** | ProcScr data_08A95548 (OnInit) | reg-pressure field-ptr materialization |
| 13 | 0x080A6D34 | (link-arena hdr decode) | link-arena record codec | no (US=bmsave-xmap here) | **DEAD** (transitive) | 1 (DecodeAndVerify…) | pure reg-coloring |
| 14 | 0x080A6E4C | (link-arena record encode) | link-arena record codec | no | **LIVE** | sub_80A74D4 (ProcScr) | spill / callback-veneer reg |
| 15 | 0x080A6F1C | DecodeAndVerifyArenaRecord | link-arena record codec | no | **DEAD (root)** | **0** | callback-in-high-reg veneer |
| 16 | 0x080C05C8 | GmapScreen2_Loop | worldmap node icons | **yes** (worldmap_screen2.c) | **LIVE** | ProcScr_GmNodeIconDisplay | clean JP-vs-US coloring divergence |

**Headline results (12 live / 4 dead)**
- **12 of 16 are live, actively-reachable game code.** They remain asm purely because of
  agbcc-2.95 register-allocation / spill tie-breaks (permuter-bound), *except* #6
  `PrepareBattleGraphicsMaybe`, which is a **true region difference** (the US localisation
  added a Manakete/Demon-King block + link-arena flag swaps), so a byte match is out of scope.
- **4 of 16 are unreachable dead code**, forming **two dead islands** — in each, a *root
  driver* has zero references anywhere in the ROM, and its callees are reachable only through
  it (so they are dead-by-transitivity). Two of the four island members are themselves in the
  16-function set; the spline island also drags in `sub_800A194`, which is not one of the 16:
  - **Spline island** — `SplineSampleAtTime (0x0800A594)` [root, #3] →
    `SplineEvalCatmullRom (0x0800A34C)` [#2] → `sub_800A194`. A JP-only Catmull-Rom 2-D spline
    with **zero external references**. It is *not* the spline system the game uses (that is
    fe8u's `spline.c`: `Spline_Ease` ← `GetEasedProgress` ← bmlib timers, all live).
  - **Link-arena decode island** — `DecodeAndVerifyArenaRecord (0x080A6F1C)` [root, #15] →
    `sub_80A6D34 (header decode)` [#13]. The **receive/verify half** of the link-arena
    "通信闘技場" record codec. Its **encode/commit half is live** (`sub_80A6E4C` [#14] ←
    `sub_80A74D4`, reachable from a menu ProcScr), but nothing in the ROM ever invokes the
    decoder.
- **Every one of the 16 exists in the ROM as a real, non-stub function body.** "Dead" here
  means *statically unreferenced*, not empty.

---

## Subsystem call-tree map (verified)

```
mapanim / summon fx ─────────────────────────────────────────────
  12 *_Loop / *_PlayAnim TUs ──► AddAttr2dBitMap [1]  (leaf, live)

event engine ────────────────────────────────────────────────────
  gEventLoCmdTable[COLORFADE] ──► Event18_ColorFade [4] ──► EventStartFade/EndFade/NewEventFadefx
  Event2C_LoadUnits ──► GetUnitDefinitionFormEventScr [5] ──► NextRN_N, Div, BuildDeployedUnitDefinitionList

battle-anim intro ───────────────────────────────────────────────
  EkrBattleStarting_Is/CheckBattleAnimEnabled ──► PrepareBattleGraphicsMaybe [6] ──► 57 setters/getters

unit placement / summon ─────────────────────────────────────────
  MoveUnitExt / MuCtr_InitDefinedMove / GenUnitDefinitionFinalPosition
                             ──► AdjustNewUnitPosition [7] ──► AiGetUnitClosestValidPosition …
  SelSumPosAndMoveCamera ──► SelectSummonPos [8] ──► DivRem, CanUnitCrossTerrain

worldmap ─────────────────────────────────────────────────────────
  ProcScr_GmNodeIconDisplay (PROC_REPEAT) ──► GmapScreen2_Loop [16] ──► GmapScreen2_GetNodeScreenPos, PutSpriteExt, AP_Update

augury / divination result screen  (占い)  — LIVE, reachable from Save menu
  ProcScr_SaveMenu[+0x22C] ──► sub_80AEBAC ──► StartProc( ProcScr data_08A95548 )
        ├─ OnInit  ──► Augury_InitResultScreen [12] ──► GetSavedRankData, GetOverallRank,
        │                         Decompress+TSA, sub_80A3528 [11], sub_80A33E0, face/CG
        ├─ child   ──► sub_80A3458 (proc-starter) ──► sub_80A3300 [10]  (rank-sprite emit)
        └─ child   ──► sub_80A2E4C ──► StartProc( ProcScr data_08A9548C )
                             └─ PROC_CALL ──► sub_80A3074 (proc-starter) ──► DivinationRankSpriteUpdate [9]

link-arena record codec  (通信闘技場)  — ENCODE live, DECODE dead
  … menu ProcScr … ──► sub_80A4088 ──► sub_80A7650 ──► StartProc( ProcScr gUnknown_08A95E20 )
        └─ PROC_CALL ──► sub_80A74D4 ──► sub_80A6E4C [14]  (ENCODE/commit)
                                          └─ sub_80A6A7C, sub_80A6AA8(LCG), sub_80A6C20(cksum), sub_80A6C60(interleave)
  (no caller anywhere) ✗   DecodeAndVerifyArenaRecord [15] ──► sub_80A6D34 [13] (hdr decode), sub_80A6C20, sub_80A6AA8

JP-only DEAD spline island  — no reference anywhere
  (no caller anywhere) ✗   SplineSampleAtTime [3] ──► SplineEvalCatmullRom [2] ──► sub_800A194 (tridiagonal), sub_80D6378/84 (BIOS DivArm)
```

---

# Per-function reports

## 1. AddAttr2dBitMap — `0x08001570`  (LIVE, heavily used)

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
- **Why still asm:** one reg-allocator save-order tie-break — the two "save original
  width/height into callee-saved regs" copies (`mov ip,r6` / `mov r8,r2`) are emitted in the
  opposite order (2 halfwords). Source-invariant; needs `-mjp-promote`.

## 2. SplineEvalCatmullRom — `0x0800A34C`  (DEAD by transitivity)

- **fe8u twin:** **none.** JP-only Catmull-Rom / natural-cubic-spline 2-D evaluator. The
  fe8u `spline.c` library (`Spline_Ease`, `Spline_Eval`, `Spline_BuildCubicCoeffs`, …) is a
  *different* code set and does not contain this function.
- **Purpose:** evaluate a 2-D spline at a query time — segment search, tangent/coefficient
  build, tridiagonal solve, then a fixed-point cubic (Horner) evaluation for x and y.
- **Logic:** `ti = t>>12`; do/while segment search; build `coeffA/coeffB/sub/tan` arrays;
  `sub_800A194(...)` solves the tridiagonal system (Thomas algorithm); clamp `i>=last`;
  compute the cubic coefficients and evaluate via three nested `sub_80D6378(0x1000, u*…)`
  fixed-point (`>>12`) multiplies per axis. (The uninitialized `int r;` return is intentional —
  the asm epilogue reuses r0 as the branch target; the caller ignores the return.)
- **Callees:** `sub_800A194` (tridiagonal solver — itself reachable *only* from here),
  `sub_80D6378` (GBA BIOS `DivArm` quotient / `>>12` fixed-point multiply).
- **Callers (1):** `SplineSampleAtTime` only (internal call site `_0800A758`).
- **Verdict:** **DEAD** — its sole caller is the unreferenced root #3, so the whole island is
  unreachable.
- **Why still asm:** deep whole-function register-coloring / spill divergence (`pts`↔`coeffA`
  color swap; GCSE hoists tx/ty). 515/600 bytes differ under plain `-O2` — a coloring
  *permutation*, not extra work.

## 3. SplineSampleAtTime — `0x0800A594`  (DEAD — unreferenced root)

- **fe8u twin:** **none.** JP-only spline driver sitting directly above (and driving) #2.
- **Purpose:** given an (x,y,time) control-point array, optionally wrap the query time modulo
  the spline period (loop mode), find the segment containing `t>>12`, materialise a 3-point
  window (wrap-around for closed splines, clamped for open), call the evaluator, store the
  resulting (x,y), and return the segment index.
- **Logic:** `loop` branch uses `sub_80D6384` (BIOS `DivArm` remainder = `v % m`) to wrap `t`;
  both branches binary-walk the control points, fill `lpts/ltimes`, then
  `sub_800A34C(lpts, lout, ltimes, t, 3)` and write `out->x/y`.
- **Callees:** `SplineEvalCatmullRom` (#2), `sub_80D6384` (BIOS DivArm remainder).
- **Callers:** **none.** Zero Thumb/ARM `BL`, zero pointer words (`0x0800A594`/`0x0800A595`),
  zero literal-pool references anywhere in the 16 MB ROM.
- **Verdict:** **DEAD CODE.** This is the root of an isolated 3-function island
  (`SplineSampleAtTime → SplineEvalCatmullRom → sub_800A194`) that nothing in the game
  reaches. Almost certainly a JP-only left-over Catmull-Rom implementation superseded by the
  `spline.c` easing library the game actually uses (`Spline_Ease` is called from
  `GetEasedProgress`/bmlib). *Understanding value only — there is no runtime behaviour.*
- **Why still asm:** spill/reg-coloring (`count` spilled to stack in the JP build vs kept in
  `sl` here; frame 60 vs 52). 421/500 bytes differ.

## 4. Event18_ColorFade — `0x0800E1FC`  (LIVE)

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
- **Why still asm:** ~95-byte pure register-alloc/spill residual (JP anchors `proc` to caller-
  saved `ip` and spills 2 colour locals to the frame; the repo agbcc colours `proc` into `r7`
  and spills 1 — frame 16 vs 12). Opcodes/count identical. `-mjp-promote`.

## 5. GetUnitDefinitionFormEventScr — `0x0800FAD0`  (LIVE)

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
- **Why still asm:** clean register-permutation NEAR (JP holds the loop induction `i` in
  caller-saved `r3` and spills it around `NextRN_N`, keeping `arg2` in callee-saved `r7`; agbcc
  colours `i` into `r7` with no spill). `-mjp-promote`; JP prologue has region-different arg
  signedness.

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

## 7. AdjustNewUnitPosition — `0x0807C8DC`  (LIVE)

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
- **Why still asm:** if-branch vs else-branch register coloring (JP assigns `iy/ix` to opposite
  register banks; `unit` param spills to hi-reg `r8`). `-mjp-promote`; 92/308 bytes differ.

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
- **Why still asm:** agbcc register-allocation micro-decision (a `0xff` reject-constant hoist
  forces an extra `iy` spill → frame 140 vs 144, cascading the register renumber).
  `-mjp-promote`; JP-specific reimplementation.

## 9. DivinationRankSpriteUpdate — `0x080A2E64`  (LIVE — augury screen)

- **fe8u twin:** **none** (JP-only 占い/augury/divination subsystem).
- **Purpose:** per-frame update proc of the divination rank-sprite animator — advances a frame
  counter, emits rows of rank sprites, and applies a rotating affine transform (sin/cos) to
  five OAM affine slots.
- **Logic:** advance `unk2C`; for 5 rows, `PutSpriteExt` the row's sprites gated by
  `rowCounts[]` and the counter; then a 5-slot loop computing affine params via `sub_80D6374`
  (fixed-point multiply) from `DIVINATION_SIN/COS` constants and installing them with
  `sub_8002100`.
- **Callees:** `sub_80A2E4C`, `sub_80D6374`, `sub_8002100`, `PutSpriteExt`; reads
  `gUnk_08A95478`.
- **Callers:** the address is loaded from the literal pool of the proc-starter routine
  `sub_80A3074` (`+0xA0`), which starts it as a proc; `sub_80A3074` is `PROC_CALL`-ed by the
  ProcScr `data_08A9548C`, itself spawned by `sub_80A2E4C` (which this function also calls —
  a mutually-recursive augury animation family).
- **Verdict:** **LIVE** — animation proc of the augury result screen.
- **Why still asm:** register-coloring tie-break (a 67 k-iter permuter reported "score 0" but
  that scorer is register-blind — false-green). `-fno-gcse` community fork shape.

## 10. sub_80A3300 — `0x080A3300`  (LIVE — augury screen)

- **fe8u twin:** **none** (JP-only augury rank-sprite OAM emitter).
- **Purpose:** emit the augury rank-icon sprites for `DivinationSpriteProc`.
- **Logic:** for each of the 5 rows whose `rowCounts[i] != 0xFF`, compute an (x,y) origin and
  inner-loop `PutSpriteExt` across `gUnk_08A95478[col]`; then one extra sprite if `unk3E`.
- **Callees:** `PutSpriteExt`; reads `gUnk_08A95478`.
- **Callers:** the address is loaded by the proc-starter routine `sub_80A3458` (`+0x94`), a
  member of the augury result-screen proc family under ProcScr `data_08A95548`.
- **Verdict:** **LIVE** — augury result-screen sprite emitter.
- **Why still asm:** a stubborn inner-loop call-saved register swap (`xr`/`col` = `r4`/`r5`
  vs `r5`/`r4`) cascading ~10 insns; permuter score 285 from base 1850. The GCSE-hoist spill
  barrier was already cracked (`(new_var = gUnk_08A95478)[col]`).

## 11. sub_80A3528 — `0x080A3528`  (DrawAuguryResultPanel — LIVE)

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
- **Callers:** 1 direct `BL` — `Augury_InitResultScreen` (#12), internal site `_080A3AB6`.
- **Verdict:** **LIVE** — drawn by the augury OnInit.
- **Why still asm:** agbcc invariant-scheduling + register-coloring (the JP build hoists six
  loop-invariant field/base addresses into the loop preheader and rematerialises the tilemap
  base into a low reg; agbcc emits each at point-of-use and keeps the base in a hi callee-saved
  reg). `-Os`/`-O2` identical.

## 12. Augury_InitResultScreen — `0x080A390C`  (LIVE — augury screen OnInit)

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
- **Why still asm:** register-coloring + field-pointer materialization under reg-pressure
  (`proc` in `r6` vs `r7`; JP hoists several `proc+0x3X` byte-pointers into hi regs for the
  `GetOverallRank` argument gather). 13-insn whole-function allocation-shape gap.

## 13. sub_80A6D34 — `0x080A6D34`  (DEAD by transitivity — link-arena decode leaf)

- **fe8u twin:** **none.** At the *same numeric address range* the US ROM has completely
  different code — `fireemblem8.map` shows `0x080a6d34 = bmsave_null_false2` and the
  neighbourhood is `bmsave-xmap` (world-map save: `WriteWorldMapNodes`, `ReadWorldMapNodes`,
  `WriteWorldMapPaths`, …). The JP link-arena record codec occupies this region instead — a
  structural region difference, no function-level twin.
- **Purpose:** link-arena ("通信闘技場") record-codec **header DECODE** — the exact inverse of the
  matched same-TU sibling `sub_80A6C60` (encode-interleave). De-obfuscates the packed buffer
  (subtract the rolling checksum, mask to `(1<<bits)-1`) then de-interleaves 30 bits back into
  the 3 codec-header words at `0x02014FC8`.
- **Logic:** `sub_80A6AC0()`; `sb = sub_80A6C20(payload, base[3])`; subtract-and-mask loop over
  `gBuf_2014F28`; clear the 3 header words; 30-iteration de-interleave using the `i%3` bucket,
  `i/3` shift and `i%bits` stride.
- **Callees:** `sub_80A6AC0`, `sub_80A6C20`; reads `gUnk_02014EF0/EF4`, `gBuf_2014F28`.
- **Callers:** 1 direct `BL` — `DecodeAndVerifyArenaRecord` (#15) only.
- **Verdict:** **DEAD** — reachable only from the unreferenced root #15.
- **Why still asm:** pure register-coloring (JP keeps the advancing packed pointer in a low reg
  `adds r6,#1` and hoists `&0x02014EEC` into a hi reg; agbcc does neither). 24 register-shuffle
  lines, no logic difference. `-O2`.

## 14. sub_80A6E4C — `0x080A6E4C`  (LIVE — link-arena encode)

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
- **Why still asm:** spill-decision / callback-veneer register choice (JP uses `_call_via_r3`;
  agbcc keeps `func` in `r2` → `_call_via_r2`; `r4`↔`r5` role swap). 212 B vs 208 B. `-O2`.

## 15. DecodeAndVerifyArenaRecord — `0x080A6F1C`  (DEAD — unreferenced root)

- **fe8u twin:** **none** (JP-only link-arena record DECODE + VERIFY; US region = `bmsave-xmap`).
- **Purpose:** the decode/verify counterpart of #14 — unpacks a received/stored record and
  returns whether it is authentic.
- **Logic:** `sub_80A6D34()` de-interleaves the 3 header words; seed the LCG from `hdr[0]`
  (`*(int*)0x02014F24`); `chk = checksum(obfuscated payload)`; `a = LCG()`; de-obfuscate the
  payload (`payload[i] = (payload[i] - LCG()) & mask`); `b = LCG()`; `consume(&cbarg, payload)`
  lets the caller read the plaintext; `chk2 = checksum(plaintext)`; **return
  `hdr[1] == ((chk2+a)&0x3FF) && hdr[2] == ((chk+b)&0x3FF)`** — packet valid iff both 10-bit
  verify tags reconstruct.
- **Callees:** `sub_80A6D34` (#13, header decode), `sub_80A6C20` (checksum), `sub_80A6AA8`
  (LCG), and the `consume` callback.
- **Callers:** **none.** Zero Thumb/ARM `BL`, zero pointer words (`0x080A6F1C`/`0x080A6F1D`),
  zero literal-pool references anywhere in the ROM.
- **Verdict:** **DEAD CODE.** The link-arena codec ships a **live encoder but a dead decoder**:
  nothing in the JP ROM ever decodes/verifies a record. The receive side of the feature is
  either handled by other code or was never wired up. Its only distinct callee (`sub_80A6D34`)
  is dead-by-transitivity. *Understanding value only — no runtime behaviour.*
- **Why still asm:** the callback pointer must stay live across the `sub_80A6D34` call, so agbcc
  parks it in a callee-saved hi reg and calls through a `_call_via_rN` veneer; the JP build
  picks `r9` (`_call_via_r9`) while agbcc from portable C picks a different reg → a different
  veneer symbol. A global allocation decision. `-O2`.

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
- **Why still asm:** a **clean register-coloring NEAR** — the *same* C compiles to a matching
  coloring on the US axis (fe8u's `worldmap_screen2.s` matches the US ROM) but a different JP
  coloring: a genuine agbcc JP-vs-US divergence, not a source problem. Default flags.

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

## ROI — effort vs value to byte-match the remaining 16

**Framing (why this is enhancement, not obligation).** The project's stated final goal is
*"every byte of the ROM produced from real source (`src/` C **+ descriptive asm/data**),
`make compare` → OK"* (CLAUDE.md). Descriptive asm **already counts as real source**, and
`make compare` is OK with self-containment **100%**. Every one of these 16 also already has a
**readable, documented `src/nonmatching/*.c` body**. So byte-matching them:
- does **not** advance the final goal (already met),
- does **not** add readability/understanding (the C already exists and is committed),
- only moves the *byte-source* from `asm/` → `src/` and bumps the cosmetic **matching-C axis
  from 99.82 % → toward 100 %** (each function ≈ **+0.012 %**; all 16 ≈ **+0.18 %**).

**Effort model.** Every one is an **agbcc-2.95 whole-function register-coloring / spill
tie-break** with the deterministic lever kit **exhausted** (the headers record the full flag
matrix + register-pin + source-shape attempts). The frontier is explicit: *"Path to 100 % =
permuter compute-time + community, NOT more deterministic levers."* So the effort is **not
reasoning-solvable** — it is decomp-permuter compute (millions of iterations / the original IS
agbcc) or a decomp.me community hit (scratches already posted for all 16). **The sandbox
SIGTERMs long permuter runs**, so an autonomous agent here is structurally ill-suited to move
them. Effort tiers below use the documented permuter best-score / residual size.

**Value model.** Uniform **+1 function** on axis-2 for each, weighted by (a) code bytes moved to
`src/` and (b) whether the function is **live** (dead code has ~0 functional value — matching it
is pure metric vanity). Sizes are from the carve manifests.

| # | function (size) | live? | residual / permuter best | effort | value | **ROI** |
|---|---|---|---|---|---|---|
| 1 | AddAttr2dBitMap (224 B) | live (12 callers, core) | **2 halfwords**; permuter false-green | **Low*** | med | **HIGH** |
| 16 | GmapScreen2_Loop (544 B) | live | clean coloring; proved-EQUIV; same C matches US | Low–Med | med | **HIGH** |
| 5 | GetUnitDefinitionFormEventScr (464 B) | live | permuter 480→330 | Med | med | **MED-HIGH** |
| 9 | DivinationRankSpriteUpdate (436 B) | live | reg-coloring; false-green score-0 | Low–Med* | low–med | **MED-HIGH** |
| 10 | sub_80A3300 (224 B) | live | canon-diff 27/106; permuter 285 | Med | low–med | MED |
| 7 | AdjustNewUnitPosition (308 B) | live | 92/308 B; permuter 185 | Med | med | MED |
| 12 | Augury_InitResultScreen (612 B) | live | 13-insn gap | Med–High | med | MED |
| 4 | Event18_ColorFade (204 B) | live | ~95 B; permuter 2030→965 | High | low–med | LOW-MED |
| 14 | sub_80A6E4C password-encode (208 B) | live | 152 B; permuter 2215→1170 | High | low–med | LOW-MED |
| 8 | SelectSummonPos (392 B) | live | 331/392 B; permuter 1695→875 | High | low–med | LOW |
| 11 | sub_80A3528 draw-panel (880 B) | live | permuter 8135→2645 | High | med (biggest live) | LOW |
| 13 | sub_80A6D34 password-decode (280 B) | **dead** | 24 lines; permuter 1320 | High | ~0 (dead) | LOW |
| 15 | DecodeAndVerifyArenaRecord (212 B) | **dead** | veneer-reg; never marathoned | High | ~0 (dead) | LOW |
| 2 | SplineEvalCatmullRom (584 B) | **dead** | 515/600 B; permuter 12025→9115 | **Very High** | ~0 (dead) | **VERY LOW** |
| 3 | SplineSampleAtTime (500 B) | **dead** | 421/500 B; permuter 7215→5795 | **Very High** | ~0 (dead) | **VERY LOW** |
| 6 | PrepareBattleGraphicsMaybe (2936 B) | live | ✅ **MATCHED** (decomp.me rtMN6, 2026-07-07) | done | +1 (biggest) | **realised via community** |

`*` The two "false-green" NEARs (#1, #9) are blocked by a **permuter tooling bug** (agbcc's
"invalid zero-score" reports a spurious match), *not* by the function — see below.

### The single highest-leverage action
Fix the **decomp-permuter "invalid agbcc zero-score" detection** once (the `#1`/`#9` headers
both note the permuter reports score-0 candidates that don't actually reproduce the bytes). That
one-time tooling investment could cheaply validate the **≈2–4 closest NEARs** (#1 AddAttr2dBitMap
is only *2 halfwords* off; #9, and plausibly #4/#5/#10 which are "clean permutations"). This is
the only place where bounded agent effort plausibly converts to matches.

### Recommendation (tiered)
1. **Treat axis-2 as effectively DONE for engineering purposes.** The goal is met; the 16 are a
   cosmetic tier. Do **not** open a general "match the 16" campaign — it is compute/luck-bound
   and the sandbox can't run the marathons.
2. **Only worthwhile targeted work:** the one-time permuter zero-score fix + a short batch over
   the **~5 close, live NEARs** (#1, #16, #5, #9, #10). Best ROI by far.
3. **Leave the medium NEARs** (#4, #7, #8, #11, #12, #14) to opportunistic decomp.me community /
   idle compute — scratches are already posted; agent effort adds little.
4. **Do NOT spend on:** the **4 dead-code functions** (#2, #3, #13, #15 — matching unreachable
   code is pure metric vanity, and the spline pair is also the *farthest* from a match), or
   **#6 PrepareBattleGraphicsMaybe** (region-different 2936 B — a byte match needs a 2936-byte
   coloring lottery on top of the JP≠US source difference; STRETCH-only).

**Bottom line.** Total prize = **+0.18 % matching-C** (≈ 9 KB of `.text` re-sourced), with **no
functional or readability gain** (readable C already committed; `make compare` already OK).
~1.6 KB of that prize is **dead code** and ~2.9 KB is **effectively unmatchable**. The effort is
**compute-time / community**, which this environment is poorly suited to supply. **Overall ROI is
LOW**; the rational course is to bank the current state, make the one cheap permuter-tooling fix,
opportunistically pick off the handful of close live NEARs, and otherwise stop — spending agent
time on the strict `.bin`/asset frontier (or nothing) beats grinding these.

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
