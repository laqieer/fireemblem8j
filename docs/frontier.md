# FE8J decomp frontier (living doc — update every session)

> **This is the SINGLE SOURCE OF TRUTH for what remains.** All other docs (README,
> CLAUDE.md, strategy/porting/etc.) point here for "the frontier / what's left" and
> must not fork it. Do **not** read `layout/nofuncmap_*.tsv` as the work list — it is
> a stale, ~10× inflated classification cache (see "Pitfall" below).

**Keep this current.** Refresh the numbers from `scripts/calcprogress.py` and the target lists from
ground truth whenever an axis moves. Stale frontier data caused real wasted work (see "Pitfall" below).

## Current state (2026-06-24)
- BUILD SELF-CONTAINMENT: 100%
- **MATCHING-C: 97.40%** (8306/8528 funcs) → **~222 functions genuinely unmatched**
- 🛠 **SCALING METHOD (this session, +44): parallel carve-researchers → serial integration.**
  Dispatch 3-5 `carve-researcher` agents (read-only) in ONE message, each producing a complete
  build-ready recipe (verbatim fe8u C, all `#include`s grepped from JP `include/`, callee/data
  resolution + bind lines for JP-unnamed `sub_` callees, asm range, the `-mjp-promote` lever).
  The main thread (sole oracle) integrates each serially: apply → full `make compare` → commit on
  match / revert on NEAR. Hit rate ~60% (clean flag wins land first try; reg-alloc NEARs revert).
  Carved this session: FilterBattleAnimCharacterPalette, PointInCameraBounds, AiIsWithinRectDistance,
  MoveUnitExt, InitPlayConfig, GmMuPrim_TrackMovementDelta (+s16), GmMuPrim_GetMovementFacing,
  ColorFadeTickThumb, EventA7_WmUnitSetPosition, MuCtr_StartMoveTowards, MuCtr_InitDefinedMove,
  EventSetFogVisionExt, ForEachPosAtSinglePosition, Event88_WmScrollCameraOntoUnit,
  MoveUnit_, ChangeAiForPositions, Event3F_ScriptBattle.
- 🟢🟢 **PERMUTER PHASE IS LIVE & FAST — the flag-saturation reg-alloc NEARs are NOT a wall.** When a
  faithful port + `-mjp-promote` leaves a small reg-alloc/scheduling NEAR, decomp-permuter cracks it in
  SECONDS-to-MINUTES. Proven: **ComputeBattleUnitAttack** (base 15 → 0 @ iter 30) and **CheckCanSummon**
  (base 35 → 0 @ iter 149). **REPRODUCIBLE RECIPE (the critical detail is the flag):**
  1. near-match `_permwork/<Fn>.c` (the faithful flag near-match) + glabel'd `_permwork/<Fn>.s`
     (`.syntax unified` + `glabel <Fn>` + the asm body after `<Fn>:`, DROP the `.set`/`.section`/`.global`
     preamble so callees stay external relocs).
  2. `scripts/permuter/permute.sh import _permwork/<Fn>.c _permwork/<Fn>.s` (run from repo root; inputs
     must be INSIDE the repo or import.py errors "Can't find root dir").
  3. **CRITICAL: `sed -i 's#agbcc -mthumb-interwork#agbcc -mthumb-interwork -mjp-promote#' nonmatchings/<Fn>/compile.sh`**
     — without the flag the permuter searches stock-agbcc space and the base score is huge/unwinnable; WITH
     it the base score is the small flag-NEAR.
  4. `scripts/permuter/permute.sh bg nonmatchings/<Fn> -j 4 --stop-on-zero` (detached, survives turns; cap
     ~1 concurrent run, -j4 ≈ 4 workers — more OOM-starve).
  5. Extract the MUTATION from `nonmatchings/<Fn>/output-0-*/source.c` (it's the preprocessed source —
     diff vs the near-match to find the load-bearing change), apply it to a CLEAN `#include` version, carve.
     Mutations seen: split `x = a*3` → `x=a; x=x*3` (reg-alloc); wrap `return X` in `do{ }while(0)` (reg-alloc).
- ⚠️ Remaining decomp-permuter queue (faithful flag near-match known; same recipe). PRIME targets:
  - ✅ ComputeBattleUnitAttack (DONE — permuter) · ✅ CheckCanSummon (DONE — permuter)
  - **Event0E_STAL** (sub_800DD9C, 10B — proc r3↔r4)
  - **Event1B_TEXTSHOW** (sub_800E5CC, 6B — `ea` u16-narrow r0-temp vs in-place r1; + bind
    EventText_StartBoxDialogueMsg=0x0800E574)
  - **PutFaceOnBackGround** (sub_800663C, 16B — r4↔r6 loop-temps; + face.h:155 `int c`→`s8 c`)
  - **Event35_UnitClassChanging** (sub_801060C, 61B — larger, switch/class-data codegen; lower priority)
  - **GetPathFromMovementScript** (sub_8032AB8 — eval-order; faithful+split layout-shifted, reconstruct)
- 🟢 **PROVEN PLAYBOOK — the `-mjp-promote` flag-carve (D276c).** The pre-flag verification run
  (`/tmp/verify_results.json`, 42 PARTIAL near-misses) diagnosed many functions as
  "param-extension ORDER / decl-order / sign-vs-zero-extend" — i.e. unfixable by any C lever because
  it is *compiler behavior*. The `-mjp-promote` flag IS that behavior. Carve recipe (5-10 min each):
  port the faithful fe8u C verbatim → `src/<Fn>.c`, `git rm asm/sub_<addr>.s` + its gbadisasm tsv,
  add `layout/carved_rom.d/handdecomp_<Fn>.tsv` (`<start>\t<end>\tsrc/<Fn>.o(.text)\thanddecomp: <Fn>`)
  and `layout/baseline_syms_drop.d/handdecomp_<Fn>.tsv` (just the name), add
  `src/<Fn>.o: CC1FLAGS += -mjp-promote` to the Makefile per-TU block, `gen_layout.py` + full
  `make compare`. Carved this way this session: FilterBattleAnimCharacterPalette, PointInCameraBounds,
  AiIsWithinRectDistance, MoveUnitExt, InitPlayConfig (+ GetEventTriggerId). **Best targets = the
  remaining PARTIALs whose note says param-order / decl-order / extension scheduling.** Skip the
  ones noted "decomp-permuter target / intractable reg-alloc" (ColorFadeSetup*, Event0E_STAL,
  StartSubSpell_efxIvaldi*, ShopTryMoveHand r6/r7 cascade) — those are genuine reg-alloc, not flag.
  Traps: callees that are JP-unnamed sub_ (need a bind, e.g. PutFaceChibi) cost more; missing
  prototypes are -Werror compile fails (add the header, e.g. MoveUnitExt needed bmmap.h+bmudisp.h).
- 🔑🔑 **TWO major ceiling subclasses RECLASSIFIED from "unreachable" to "fixable" (D276/D276b)**, now served
  by a SINGLE agbcc with a **`-mjp-promote` CC flag** (D276c — built by `scripts/build_jp_agbcc.sh`, applied
  **PER-TU** via Makefile `CC1FLAGS += -mjp-promote`, like m4a `CC1_OLD` / Sram `-O1`). Default-off it is
  byte-identical to stock agbcc (the ~8077 normal TUs are unchanged). The flag gates two thumb-config knobs:
  (1) `PROMOTE_MODE` preserve sub-word signedness → **s8/s16-hold form** (TsaModifyFirstPalReverse,
  DrawNumberText_WithReset, UpdateLinkArenaMenuScrollBar); (2) `PROMOTE_FUNCTION_ARGS` → **arg-extension ORDER**
  (AddGorgonEggTrap — D275's flagship "impossible" fn). It ALSO dissolves downstream reg-alloc tiebreaks
  (UpdateLinkArenaMenuScrollBar's r4↔r7), LICM/IV-strength-reduction (GetEventTriggerId), and scheduling
  residuals (Sio_RasterRotatedBoxToWinBuf). **Campaign all promotion/extension/reg-alloc/LICM/scheduling
  ceilings this way**, each gated by full COLD `make compare`.
- The WINNABLE remainder also = **JP-divergent reconstruction** (rebuild from gbadisasm when the fe8u port is
  a structural mismatch — often a first-compile match) + localized signedness/int-widen/empty-if-hoist/
  scheduling levers + saturation-killed permuter NEARs re-run solo on a quiet machine.
- ⚠️ Still-open ceiling classes (test whether they too are agbcc thumb-config/flag knobs, D276): arg-extension
  ORDER, eager-vs-deferred, LICM hoist, cross-jump/tail-merge, reg-coalescing+DSE. Investigate the config,
  don't blind-grind.
- EXTRACTED DATA: 100% of the measured set (but data is ~94% of ROM; see Data frontier)
- NAMED SYMBOLS: 85.32% (13165/15431; capped by ~1611 asset labels fe8u itself doesn't name — structurally < 100%)

### PIVOT: permuter campaign is now the highest-leverage move (2026-06-24)
The clean-recipe engine drove matching-C 8150→8298 (+148 over the session); yield has dropped to ~50%
as remaining functions hit agbcc CSE/reg-alloc divergences that `-mjp-promote` does NOT fix. The next
leverage is a PERMUTER CAMPAIGN on the ~17-function NEAR backlog (many byte-close). BLOCKER to fix
first: the decomp-permuter `compile.sh` (a) resolves its root to the shared MAIN repo not the worker's
worktree, (b) uses bare agbcc WITHOUT `-mjp-promote` (wrong codegen space — base score huge), (c) its
`run` deletes `src/F.c` from the MAIN tree (not parallel-safe). FIX: make `permute.sh` import/run
operate relative to an explicit root (worktree), and always `sed`-patch `compile.sh` to
`agbcc -mthumb-interwork -mjp-promote`. Then run `permute.sh bg <dir> -j4 --stop-on-zero` per NEAR.
CLOSEST NEARs first (best permuter ROI):
- **EkrLvup_InitStatusText** — 1 instruction (`adds r1,r0,#0` move agbcc won't emit; near-match
  preserved `/tmp/banim-ekrlvup_08075A08.NEAR.c`).
- **EkrDragonBodyAnimeMain** — 4-byte literal-pool flush/pad.
- **Event26_CameraControl** — 3B sc2-first scheduling.
- **Event1B_TEXTSHOW** — 9B.
- **Event0E_STAL** — 10B.

Heavier: ChapterStatus_Init (gGenericBuffer-CSE-into-r4, +16B), EkrDragonQuakeMain (r6↔r7 + CSE),
AdjustNewUnitPosition (39B), SallyCir_Loop, GmapScreen2_Loop, GMapScreen_UpdateScroll, GmapEffect_0,
Event18/35/A8, OpAnimFaceMontageBegin, Event0F.

**Permuter campaign round 1 (2026-06-24): +8 cracked** — EkrLvup_InitStatusText (135), EkrDragonBodyAnimeMain
(35, the 'pool-flush' premise was a DCE'd dead-copy), Event26_CameraControl (manual `register int asm("r0/r1/r2")`
arg-order pin — permuter alone plateaued 105), EkrDragonQuakeMain (r6↔r7 via do-while removal),
Event35_UnitClassChanging (2000→0), ChapterStatus_Init (permuter-as-diagnostic found a REGION-DIFF: JP
CallARM_FillTileRect directly, skips Decompress staging), SallyCir_Loop + GmapEffect_0 (deterministic
-mjp-promote, NOT actually permuter). PLATEAUED (genuine reg-alloc ceiling, need a stronger profile next
session; WIPs in _permwork/*.wip): Event0E_STAL (10B proc/subcode r3↔r4), Event1B_TEXTSHOW (6B evArgument
widen-scratch), AdjustNewUnitPosition (base810→185, 4-way reg perm). LEVER TRIAGE: arg-MOVE-order residual →
manual `register int asm("rN")` pins (permuter can't); BODY callee-saved reg-SWAP → pins make it WORSE; always
retry `-mjp-promote` before importing (cracks sign-domain NEARs deterministically). The worktree permuter is
parallel-safe (3 workers -j4, no OOM) with the documented import.py-direct + compile.sh -mjp-promote two-step
plumbing.

### Vein status (2026-06-24) — battle-anim efx
Verified vein-exhaustion + technique notes so future sessions don't re-dispatch teams at dead veins.
- **The two clean efx fingerprints are EXHAUSTED in still-asm** (verified by a full `asm/` sweep):
  (a) the **"BG-scroll shake loop"** (`GetAnimPosition` + `gLCDControlBuffer.bgoffset[N].x` ± delta +
  timer/terminator/`Proc_Break`), and (b) the **"frame-LUT BG-loop"** (`EfxAdvanceFrameLut` + conditional
  `SpellFx_RegisterBgGfx` + `WriteBgMap` / `ClearBG1`). The 4 carved members were `sub_80661EC`,
  `sub_8066E40`, `sub_806166C`, `sub_8070724`. **No clean instances remain.**
- **The `StartSubSpell_efx*` proc-spawner class is ~EXHAUSTED: 171/172 bodies carved.** Only THREE remain,
  all **FIELD-WRITERS** (lower confidence — need `-mjp-promote` + the `make compare` oracle):
  - `StartSubSpell_efxIvaldiOBJ1` (JP `0x08068600`)
  - `StartSubSpell_efxIvaldiOBJ2` (JP `0x08068738`, GNU computed-goto = high codegen risk)
  - `StartSubSpell_efxMaohFlashThunderOBJ2` (US `0x08067400`; JP addr needs an IDA pin via an
    `EfxCreateFrontAnim` xref)
- **Carved this session via the researcher→worker→serial-integrate engine: +13** — the 4 fingerprint fns,
  5 demonlight Eye spawners, `EfxTriangleQUAKEMain`, `sub_805DE74` + `sub_8055F90` reconstructs, and
  `StartSubSpell_efxNaglfarOBJ2`.
- **Techniques worth keeping:**
  (i) function-local `u32* tbl[N]` AnimScr arrays in JP spawners are **JP-specific addresses** — read the
  rodata blob straight from `baserom.gba` at the pool literal as a **3rd ID signal**, and bind/extern them
  (split the carved data-gap TU, e.g. `frontier_df4_misc_lo`, if the rodata lands wrong);
  (ii) **alias-by-name spawners** (the name is a `baseline_syms_drop` rename alias, and carved callers
  already `bl` it) need **NO caller rewire** — just drop the alias + add the C TU;
  (iii) **ALWAYS re-verify callee names against `layout/baseline_syms.tsv`**, not behavioral guesses —
  e.g. `sub_8001EE4` = `EnablePaletteSync`, NOT `EnableKeyComboResetEN`; a misID fabricates a false
  region-diff;
  (iv) **`fe6j/src/banim_efxmagic.c` is the reconstruction byte-shape source** for fe8u-absent efx idioms;
  mind fe6j `s16`/`s8` → JP `ldrh`+`lsrs` (unsigned read) to avoid `asr`.
- **Next veins (not yet swept):** the secondary larger **region-diff efx dispatchers** (`sub_80705E8`,
  `sub_8067040`, `sub_8067160`, `sub_8070A4C`, `EkrDragonBodyAnimeMain`/`sub_807949C`, `sub_806A41C`)
  and the **worldmap `Gm*` / AI `Ai*` helper families**.

### Vein status (2026-06-24) — worldmap Gm*/opanim/savedraw/SIO
Carved this session: GmapLineFade_0, GMScreenVSync_Loop, GmFindPath cluster (3, incl. permuter on
GmFindPath + gUnk_12 alias fix 0xF7FF9A04→0x0201B100), GmapRmUpdateExt_ScrollPosition,
OpAnimFaceMontageBlendOut, SaveDrawCursor_Loop (lut bound from baserom @0x081F57F1, NOT re-emitted),
DrawGMapPIPanelAtHeight (width 13→12), SioHandleIrq_Serial (0x1288→0x1286), SioTeamList_1/2
(gSioMain2_1 alias fix 0x20013144→0x080DED3D).
- **Vein depth remaining:** worldmap band ~14 still-asm (now fewer), SIO band ~7, save band 1;
  **name-entry/kana has NO fe8u twin** (reconstruct-only).
- **Reusable technique — stale EWRAM-alias detection:** a `jp_syms`/baseline `.set NAME,0x20xxxxxx`
  whose function pool literal is `.4byte 0x08xxxxxx` AND funcmap says ROM-exact = STALE alias; fix it
  before carving any data-reader (hit on `gUnk_12` and `gSioMain2_1`).

### Vein status (2026-06-24) — eventscr Event-dispatch
- **eventscr.c Event-dispatch vein (2026-06-24):** of ~10 still-asm Event handlers, CARVED this session:
  Event25_ChangeMap, Event27_MapChange, Event2C_LoadUnits, Event01_End, LoadUnit_0,
  EventLoadUnitSliently (+ earlier Spline_SetupChannels). The eventscr clean-port vein is now nearly
  exhausted. REMAINING are reg-alloc/scheduling NEARs (need a permuter campaign or an agbcc tie-break
  lever, NOT clean-port workers): Event0E_STAL (sub_800DD9C, r3↔r4 swap, ~10B), Event18_ColorFade
  (sub_800E1FC, spill-pattern/frame-size), Event26_CameraControl (sub_800F41C, **3-byte** arg-scheduling
  sc2-first — CLOSEST), Event35_UnitClassChanging (sub_801060C, argv-read reorder/reg-perm),
  Event1B_TEXTSHOW (sub_800E5CC, **9-byte** ea-zero-extend-via-scratch + zeroFlag re-materialize; KEEP
  the case-3 inline-asm trick), EventA8_WmUnitMoveFree (sub_800C994, sl/r8-vs-ip/r7 cascade — and it OWNS
  the poisoned-alias fix below), Event0F_CounterOps (sub_800DE3C, r4↔r5). Best permuter targets first:
  Event26 (3B), Event1B (9B), Event0E (10B).

### Vein status (2026-06-24) — 0x800–0x808 clean vein
- **0x800–0x808 clean vein (2026-06-24, +14 more):** carved ApplySepiaToPaletteBuffer,
  NewPopup_VerySimple (JP popup-opcode enum SOUND=0xA/COLOR=6/MSG=4 ≠ US), AiFindTargetInReachByFunc,
  AiFindTargetInReachNeglectWallByFunc, AiRandomMove (cp_utility AI map-scan idiom = reliable clean
  vein), MuCtr_StartDefinedMove, MuCtr_GenMoveScript (JP terrain-guard ==1 not !=0), MoveActiveUnit
  (extern-inline GetUnitCurrentHp/GetUnitMaxHp lever CRACKED the long-standing 99B NEAR), SortMus,
  AutoGenerateUnitdef+SetupAutoGeneratedUnitdefs (the −8 divergence is BSS-base-only — struct field
  offsets are US-identical), AutolevelSecondaryLord, Text_DrawNumberOrSpace (JP SJIS fullwidth-zero
  0x4F82), SioWeaponSelectMenu_Draw. Per-band still-asm depth (clean fuel remains): 0x801=19,
  0x807=~20, 0x803=~12, 0x808=~6. Technique: masked-layer / graduated-accessor / handdecomp TUs
  already supply many callees (CopyEventMoveREDAs, GetItemHpBonus, GetStringFromIndex, etc.) —
  re-check `git ls-files src/` before flagging NEEDS_ALIAS (collapses phantom binds to zero).
- **0x801–0x807 clean vein (+8 more):** carved GenerateSummonUnitDef (gSummonConfig JP=0x089CFD18; the
  'suspect' addr was just the US funcmap column), RefreshUnitStealInventoryInfoWindow, AiTryMoveTowards +
  AiTryMoveTowardsNeglectWall (cp_utility.h `unk` param u8->s8, byte-neutral across callers),
  AiBallistaRideExit, GetPathFromMovementScript, EkrPalModifyUnused, RegisterEkrDragonStatusType (JP omits
  7 fe8u guards in the MANAKETE_MYRRH arm — region-different reconstruct). IMPORTANT LESSON: three prior
  'dead-end' flags were DEBUNKED this round — GetPathFromMovementScript ('eval-order reconstruct'),
  EkrPalModifyUnused ('193B structural fail'), AdjustNewUnitPosition ('structural fail') were all
  -mjp-promote / loop-invariant-cast-hoist / stack-spill issues, NOT structural. Treat ALL
  'structural/dead-end' flags as PROVISIONAL — re-attempt with -mjp-promote + cast-hoist before deferring.

### Vein status (2026-06-24) — 0x801–0x80B clean vein
- **0x801-0x80B clean vein (+9 more):** carved the bmidoten range-gen cluster
  (GenerateUnitCompleteAttackRange/StandingReachRange/CompleteStaffRange via `static inline`
  MapAddInBoundedRange+SetWorkingBmMap), ShopTryMoveHand ('r6/r7 cascade' flag DEBUNKED — just
  -mjp-promote), WmMain_MoveCursor (do-while→if reg-alloc fix), BallistaRangeMenu_Draw (load-bearing
  missing return), GenerateSummonUnitDef, RefreshUnitStealInventoryInfoWindow. NEW INTEGRATION TRAP:
  when a carve `static inline`s a helper that is ALSO committed out-of-line
  (MapAddInBoundedRange@0x0801B674, SetWorkingBmMap@0x0801B668), a botched inline emits a SECOND
  out-of-line copy → CATASTROPHIC full-ROM layout shift (12.6M diff bytes), and an incremental worktree
  build can stale-OK-mask it. SAFEGUARDS: (a) `nm src/<fn>.o` must show the helper as `U` not `T`;
  (b) integrator gate = FORCED-CLEAN `rm -f fireemblem8.gba fireemblem8.elf && make compare`; (c) workers
  must stay in their worktree (never cd to the shared main checkout). The D99 integrator
  full-make-compare caught it; reverted + re-dispatched cleanly.

### Cross-cutting facts (corrections discovered 2026-06-24)
- **ChangeUnitSpritePalette (0x0800BFC8) and RestartBattleMap (0x08030E94) are ALREADY committed C globals**
  (src/ChangeUnitSpritePalette.c, src/bmio_08030E94.c) — bind them ZERO times; adding a bind = multiple-
  definition link error.
- **Poisoned alias StartGmapAutoMu_Type1:** layout/baseline_syms.d/cfbind_eventscr_gmap.tsv line 21 has an
  impossible 0x07E72DA4 → real target 0x080C818C; this fix only lands WITH a future EventA8_WmUnitMoveFree
  carve (it owns that bind).

#### Deferred reg-alloc NEARs (need a lever find or fresh permuter seed — NOT clean-recipe targets)
Do NOT spend a clean-port worker on these — a faithful fe8u port + `-mjp-promote` lands a small NEAR
that current levers don't close. They need a register-allocation lever discovery or a fresh permuter
seed, not another port attempt.
- **GmapScreen2_Loop** @0x080C05C8 — JP allocator spills `chr` to a 0x14 stack frame + keeps `proc`
  in r9; agbcc uses a 0x10 frame + registers. permuter (jp-promote, ~46k iters) plateaued at 1745
  (best 536/544 bytes). Needs a lever forcing the `chr` stack-spill.
- **GMapScreen_UpdateScroll** @0x080BF73C — 3-way reg permutation (r9/r5/r7 vs sl/r7/r5) + one
  `str [sp,#8]` reorder; permuter plateaued 245.
- **GmapEffect_0** @0x080C5F68 — clean reg permutation (JP i=r6/ptr=r4 vs agbcc r7/r5); permuter
  1315/1650. Needs `gWorldmapEffect_0` data bind + baseline alias drop when solved.
- **OpAnimFaceMontageBegin** @0x080CDCCC — blocked by a shared opanim `.text` +8-byte region shift
  (`OpAnimEphraimExit.o`/`OpAnimDarken*` land 8 high); needs a SERIAL fix of the shared opanim region
  + `cfbind_opanim-main.tsv` garbage Face rows, not a parallel carve.
- **AdjustNewUnitPosition** @0x0807C8DC (sub_807C8DC) — 39-byte reg-alloc NEAR (body VERIFIED correct,
  prior "structural fail" flag DEBUNKED; JP allocates iy→r2/ix→r4/yCur→r5 vs agbcc r5/r3/r4); reaches
  correct 308B length under `-mjp-promote` + explicit s8 x/y locals; permuter target (patch compile.sh
  with `-mjp-promote`).

Also in the 0x080C band remaining: **Nop_Titlescreen_0** @0x080CAEF4 + **Title_Loop_LightExplosionFx**
@0x080CB114 are hard RECONSTRUCTs (US is a no-op stub / JP adds a banner ladder) — likely permuter.

### How the remaining ~222 are carved (D275 — the current playbook)
Every *named* game function is already carved; the frontier is the ~426 `asm/sub_*.s`, region-different
in **codegen** (JP built from a different compiler/source than fe8u, so a verbatim fe8u-C port reproduces
the logic but not the bytes). They are cracked **per function** with the agbcc lever kit, verified in
isolated worktrees by carve-workers and integrated serially through the single `make compare` oracle:
- **signedness cast** at the shift/load site (`(s16)/(s8)/(int)` ⇄ `(u16)/(u8)`) — flips `asr↔lsr`,
  `ldrh↔ldrsh`. Caveat: a cast whose result only feeds `!=0`/a narrow store collapses back to `lsr`.
- **int + `(s16)` cast** — `int v; v = (s16)(...)` keeps field loads `ldrh` while sign-extending in-reg
  (use when the signed value is reused). [SetCRSpellBgPosition]
- **int-local-widen** — `int v = (s8)field;` hoists a loop-invariant sign-extend to one entry op.
  [PrepItemScreen_DrawVisibleUnitNames]
- **empty-if hoist** — `if (param){}` (one per arg, in order) forces arg-evaluation ORDER.
  [GmMu_SetBlendEnabled, GmapRmBorder1_PutSpriteAll]
- **TU-local macro-shadow prototype** — give a callee an `int` arg in ONE TU without touching the shared
  header or the callee's own s8 body (parallel-safe).
- **decomp-permuter** for genuine reg-alloc/scheduling residual.
- **~~CEILING~~ → SOLVED by `-mjp-promote` (D276b):** the arg-extension REORDER once thought
  "agbcc-impossible" (params extended in declaration order in-place) is exactly what the
  `-mjp-promote` flag now produces. **AddGorgonEggTrap — D275's flagship "impossible" example —
  byte-matches under the flag.** The only remaining genuine ceiling is *free* reg-alloc tiebreaks
  (not promotion-driven) and instruction scheduling that the flag doesn't touch → decomp-permuter,
  not a structural wall. 100% matching-C is NOT believed unreachable anymore.

> ⚠️ **KNOWN TOOLING BUG — `layout_frag.py write`.** The `layout_frag.py write <task> <manifest> <row>`
> CLI deletes that task's fragments in the OTHER manifests (`write()` iterates all MANIFESTS, removing
> rowless ones). When a carve needs BOTH a `carved_rom` AND a `baseline_syms` fragment, write them in a
> **single `layout_frag.write()` python call**, NOT two CLI calls (the 2nd wipes the 1st → 16MB-overflow build).

## Code frontier — priority order (USER-DEFINED, JP-area-first)
The remaining matching-C work is JP-only / JP-divergent code that **cannot be ported from fe8u** and
needs real reconstruction (asm → behavior → idiomatic C → byte-match). Work these areas first:
1. **sio / link-arena** — link/multiplayer arena (`sio_battlemap`, `sio_uiutils`, `LinkArena*`)
2. **name-entry / kana** — JP kana name-input screen (JP-exclusive UI)
3. **debug / augury** — `bmdebug` + the 占い/augury fortune feature
4. **worldmap** — `worldmap_*`
5. **save / 周回** — save menu + New Game+/周回 (`savemenu`, `savedraw`)

## How to find REAL targets (ground truth — NOT the stale tsv lists)
The unmatched frontier = functions whose `.text` still comes from `asm/` (what calcprogress counts):
- **~432 `asm/sub_*.s` stubs** (region-different gbadisasm code) — the bulk of the real frontier.
- plus any named region-diff `.s` and functions still inside the `asm/baserom.s` incbin.

A target is REAL **iff** it is still in `asm/` (a `sub_<H>.s` exists, or still in the baserom incbin)
and is **not** already a `src/*.c` (including carved-as `src/<module>_<addr>.c`). Before dispatching a
team, **spot-check a sample** — if they're already carved, the list is stale; fix it first.

### Ground-truth reality check (2026-06-22) — the remainder is HARD, not a sweep
The 432 `sub_*.s` stubs are **scattered across all ROM regions** (0x080Axxxx:65, 0x0800xxxx:55,
0x080Dxxxx:44, …), **mostly UNNAMED** `sub_<hex>`, and **region-different**. The JP "areas" above
(sio, name-entry, augury, save) are **already largely carved** under `sub_<addr>`/`module_addr` names
— so they are a *priority lens*, not a pool of easy named ports. The fe8u-module subsystem-sweep
approach is EXHAUSTED (a 6-team sweep this session produced ~0 net-new matching-C). The remaining work
is **function-by-function reconstruction** (IDA/Ghidra decompile → idiomatic C → byte-match, playbook §9)
plus **decomp-permuter-agbcc** for the reg-alloc/instruction-order near-misses. Dispatch SMALL bounded
batches of specific `sub_<H>` addresses, not module names. The big parallel lever left is the **data
frontier** (data is ~94% of ROM; port fe8u `scripts/gfxtools/`).

### ⚠️ Pitfall (do not repeat)
`layout/nofuncmap_region_*.tsv` is a **stale, un-pruned classification cache**: it lists ~3,926
entries but only ~389 are truly unmatched (≈10× inflated; addresses for region-different entries are
also stale/wrong). **Never define a work frontier from it.** Reconcile any scope discrepancy against
calcprogress (389) before spending team effort. Regenerate via `scripts/classify_nofuncmap.py` if the
canonical lists are needed, but the `asm/sub_*.s` set is the authoritative remainder.

## Data frontier (future — data is ~94% of the ROM)
- Port fe8u `scripts/gfxtools/` (tsa_generator.py) — FE8J Makefile feimg/fetsa rules are already wired
  → unblocks btl_bg + worldmap graphics (bulk of graphics volume).
- JP Huffman **text tree differs from US** → re-encode or named-incbin; biggest data target.
- Port the `dump_*.py` family + `scripts/texttools/`. See `docs/fe8u_decomp_history.md` for the order
  fe8u extracted data and the pitfalls (palette bit-15 0x7FFF, gbagfx flags, mid2agb caveats).

## Genuine exclusions (not winnable as C)
Hand-written asm (`arm.s`, `arm_call.s`, m4a `m4a_1.s`, Sram fast funcs) + ARM-mode funcs + libc/libgcc.
These stay as asm by design; do not grind them.
