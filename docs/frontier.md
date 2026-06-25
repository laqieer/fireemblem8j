# FE8J decomp frontier (living doc — update every session)

> **This is the SINGLE SOURCE OF TRUTH for what remains.** All other docs (README,
> CLAUDE.md, strategy/porting/etc.) point here for "the frontier / what's left" and
> must not fork it. Do **not** read `layout/nofuncmap_*.tsv` as the work list — it is
> a stale, ~10× inflated classification cache (see "Pitfall" below).

**Keep this current.** Refresh the numbers from `scripts/calcprogress.py` and the target lists from
ground truth whenever an axis moves. Stale frontier data caused real wasted work (see "Pitfall" below).

## Current state (2026-06-24)
- BUILD SELF-CONTAINMENT: 100%
- **MATCHING-C: 97.97%** (8355/8528 funcs) → **~173 functions genuinely unmatched**
  - +sub_8048AC4 + sub_8048BAC (JP-only SIO start/teardown leaves, from-scratch). The JP-only LEAF veins
    (SIO/efx/augury helpers — NOT proc functions, which are all carved) are the productive +matching-C now.
  - ⚠️ stale-base merge note: workers branched before a prior merge produce a feat branch whose diff-vs-main
    shows the intervening carves as "deleted" — the 3-WAY MERGE keeps both sides' independent additions
    (verified: ColorFade preserved + SIO added). Safe for independent new-TU carves; VERIFY no regression on merge.
  - +ColorFadeSetup×4 (sub_80017EC/8001870/80018F0/8001974, +4 from one recipe).
  - 💡 **`short`-PARAM-PROMOTION + PROTO-HIDE technique (colorfade-worker, reusable):** for a u8/s8-param func whose
    residual is the base-load-vs-arg-extension SCHEDULING order (JP loads the loop-invariant global base BEFORE
    zero-extending the param; agbcc zexts first) — declare the param `short` (not u8/s8) so PROMOTE_FUNCTION_ARGS
    (-mjp-promote) reorders the base load ahead of the arg extension → JP prologue. The shared-header proto is u8,
    so HIDE it for this TU via the rename-macro idiom (`#define Fn Fn_u8_proto_hidden` around the includes, `#undef`
    — same as StartEventBattle, NO header edit) + split the store through a temp. (u8-cast/register-pin/plain-reorder
    all FAIL — confirmed.) The permuter finds it embedded in a noisy best-output; extract the deterministic fix.
  - 🔬 **TWO-CLASS spill distinction (seb-worker): PRESSURE vs SLOT-ORDER.** carve BIGGER than JP (extra push) =
    spill-PRESSURE → the split-the-final-write lever REMOVES a register and matches (efxLuce). carve EXACT-size with a
    rotated `[sp,#N]` slot assignment = spill-SLOT-ORDER (agbcc assign_stack_local numbering, INVARIANT to C source,
    default permuter plateaus, NO C-level fix exists) → transmuter-only. ClassStatsDisplay_Loop is SLOT-ORDER (6B 3-slot
    rotation). Diagnostic: bigger=pressure(try split lever), exact-size-rotated-[sp,#N]=slot-order(transmuter batch).
  - +LinkArenaTeamBuild_Init (sub_8046924, verbatim fe8u sio_term.c, msgid -0x75 shift; "Str→StrEx" was a
    gbadisasm naming artifact). +sub_8048F78 (JP-only SIO text-draw leaf, from-scratch, 26/26 identical).
  - 🟢 **PRODUCTIVE VEIN: JP-only small wrappers/leaves** (the size-match harness EXCLUDES these — no fe8u row to
    match — but they byte-match from a faithful from-scratch decode). Cheap carve fuel. The **0x08048xxx SIO band**
    (sub_8048AC4/CD8/BAC/D74/C08/C7C — Proc_Start/teardown/cursor/help-popup handlers, mostly all-named) is queued
    to sio-worker. msgid-shift (-0x75) is the consistent JP link-arena/sio const pattern.
  - 🟢 **AUGURY/占い JP-only leaf vein (0x080A2xxx–0x080A4xxx, IsDivinationPortrait*/CgText*):** productive, like the
    SIO text-draws. ⭐ **sub_80A462C** (28 instr, ALL named, ZERO struct ambiguity — near-certain byte-match, recon-worker
    on it): proc->unk_2c=0x7B1 msgid; StartCgText(...,VRAM 0x06011000,...); GetCgTextFlags|0x0004004E→SetCgTextFlags.
    DEFER-band next-most-tractable (need a few binds/struct trace): sub_80490C8 (SIO score time-display, 2 digit-extractor
    binds sub_80D637C/74 + 2 sprite-table aliases), sub_80491B8 (score-display loop, carve after 80490C8). AVOID (deep
    IDA struct): sub_80487D8 (multiboot, MultiBootParam@0x03004EB0 + ~25 syms), sub_8048DC0 (digit renderer).
  - 🛠 **REG-COLORING NEAR backlog → TRANSMUTER DEPLOYED (task #15).** Region-same PORTS now hit a 1-2 register-coloring
    ceiling on nearly every one (exact size + ~99% structural, blocked by a scratch-reg renumber the default permuter
    can't reach): AiAttemptStealActionWithinMovement (sub_803DAF0, r3→r4, /tmp/aiattemptsteal_best.c — EASIEST), Event0F_CounterOps
    (r4↔r5), ClassStatsDisplay_Loop, AdjustNewUnitPosition, HandleTurnRecordText, GmapScreen2_Loop, Event18_ColorFade.
    transmuter-worker is evaluating the transmuter on the AiAttemptSteal single-register case; if it cracks → batch-clear
    the backlog (+7). **Stop hand-grinding region-same ports — carve JP-divergent reconstructs + JP-only leaves instead.**
  - +efxLuceBGCOL spawner+loop pair (sub_8067040/8067160, JP-only efx; `int terminator` not s16; 6 data binds).
  - 💡 **KEY TECHNIQUE (seb-worker, efxLuceBGCOL): the default permuter FINDS the unlocking source mutation even when
    its SCORE never reaches 0.** The score-N best-output's source diff often contains the mutation (e.g. splitting
    `x=(v&m)|b` into two statements to drop a spill) that, applied to clean source, byte-matches. So **extract the
    permuter best-output MUTATION, apply to clean source, byte-diff is the oracle** — don't require the permuter to
    self-reach 0. This REOPENS the spill-slot NEAR backlog (seb-worker testing it on ClassStatsDisplay best-5).
  - +StrInsertTact (sub_800A118, Shift-JIS reconstruct: JP copies 2-byte SJIS chars where fe8u copies 1 byte;
    the natural `*dst++=*src++` pointer idiom colors source→r5/dest→r4 to match JP — a PRODUCTIVE new text vein).
  - +EfxDrsmmoyaMain (sub_80705E8, JP-only efx reconstruct, hand-closed no permuter: if/else timer order +
    per-branch PlaySFX duplication + state3@0x10 load-schedule). +SioBat_SetupLoop (sub_8045EEC, fe8u sio_bat.c +
    JP msgids 0x6D3/4/5 + JP hoists EndLinkArenaButtonSpriteDraw to the Proc_Find==NULL path = the no-r7 frame).
  - +StartEventBattle (sub_8012038, local-prototype-shadow fix for isBallista s8 — NO shared-header edit;
    re-land of the earlier CI-breaking attempt) +ply_memacc (sub_80D60E8, verbatim fe8u m4a under old_agbcc;
    the 41B "residual" was 100% standalone reloc/veneer noise, byte-identical in-tree).
  - +ekrGaugeMain (int-local-widen `s32 r4` cracked the asrs-cascade extra-mov NEAR — a SUBSET of the
    "config-ceiling" NEARs are int-widen-fixable, NOT permuter-only; cfbind zfix) +LoadUnit
    (reconstruct: JP earlier build omits the Shadowshot/Stone secondary-weapon block).
  - +BattleAIS_ExecCommands (JP sub_80599F8 reconstruct; gbadisasm-split 3 stubs→1; JP earlier build:
    C03 clears debuff on `anim` only not the 4× gAnims loop, C07 Pierce omits the FROZEN-unfreeze block).
  - +BattleAIS_ExecCommands (JP sub_80599F8 reconstruct; gbadisasm-split 3 stubs→1).
  - 🗺 **EMPIRICAL FRONTIER MAP (D2026-06-25, validated full-TU compile+byte-diff harness over the 33 named
    still-asm funcs that have a fe8u source).** HONEST bucket counts — **the lever veins are EXHAUSTED for the
    named set; remaining yield is reconstruct + permuter + the unnamed-sub harvest:**
    - **free-carve (0-real-diff) = 0.** int-widen = **0** (the re-truncation-count heuristic gave 9 FALSE
      positives; BYTE-DIFF is the only oracle; int-widen only helps a TIGHT near-match where truncation is the
      SOLE residual — ekrGaugeMain was the one historical win and was already tight). cast-signedness = 0.
    - **permuter ≈ 11** (reg-renumber/schedule): AddAttr2dBitMap (reg-save-order, algorithmic), PutFaceOnBackGround,
      Event0E_STAL, Event0F_CounterOps, AdjustNewUnitPosition, GMapScreen_UpdateScroll, 4× ColorFadeSetupFrom*
      (r0↔r2 pool-reg, likely ONE shared fix), **ply_memacc (m4a → try `CC1 := old_agbcc` FIRST: drops 100→41B)**.
    - **reconstruct ≈ 22** (the bulk of named yield): StrInsertTact, EventA8_WmUnitMoveFree, PutUnitSpriteIconsOam,
      UnitList_PutRow, HandleTurnRecordText, OpAnimFaceMontageBegin, Event1B_TEXTSHOW, StartEventBattle (re-land
      LOCAL-prototype, NOT shared-header), Tactician_InitScreen, ClassIntro_Init, Guide_MainLoop, GmapScreen2_Loop,
      WriteNewGameSave, PrepareBattleGraphicsMaybe (+266B, huge), AgbMain, SioBat_SetupLoop, ClassStatsDisplay_Loop, …
    - **+~169 UNNAMED sub_** (no fe8u name): TRIAGED (D2026-06-25) — **≈0 clean-carve yield.** 66 leaf (un-fingerprintable),
      34 weak (1 callee), 69 fingerprintable but dominated by COLLISIONS (high-Jaccard match names a fe8u func ALREADY
      carved in JP at another addr; the sub_ is a region-different sibling sharing generic helpers) + non-distinctive
      callees (BG_EnableSyncByMask/SetBlendConfig/PutText) + size-mismatch (JP 1.5-2.3× larger = divergent). ONE recon
      lead: sub_8046924 (LinkArenaTeamBuild_Init family, DrawChapterTitleStr→StrEx swap). callee-fingerprint IDs the
      SUBSYSTEM, not portable identity. → reconstruct-dominated, NOT a harvest.
  - 🏁 **STRATEGIC MILESTONE (D2026-06-25): the matching-C frontier is at its FLOOR for ports + levers.** Empirically
    floored, ALL = 0 new carves: free-carve, int-widen, cast-signedness, cross-jump knob, reg-order knob, unnamed-sub
    fingerprint. **The ONLY remaining path to 100% is RECONSTRUCT (hand-decompile the JP-divergent/JP-only source shape)
    + PERMUTER (reg-alloc/schedule residuals).** Do NOT run more identification/lever sweeps. Highest-confidence
    reconstruct vein = PROC-NAME-STRING self-identifying JP-only procs (efx spawners proved this; link-arena/name-entry/
    augury subsystems next) + the decoded medium reconstructs. The remaining ~185 is a reconstruct backlog (multi-session).
    - **cross-jump/reg-save-order/reg-pressure knobs = ALL empirically ZERO yield (D277), do NOT pursue.**
    Harness: /tmp/cjtest/ (bucket.sh, classify2.py, retrunc.sh) — byte-diff is the oracle, re-trunc count is not.
  - ⚡ **CRITICAL RULE (D2026-06-25, verified): re-measure every NEAR with `-mjp-promote` BEFORE classifying.**
    The frontier's per-function byte-gaps were measured against PLAIN agbcc and are STALE — `-mjp-promote`
    collapses the asr/lsr/s8-s16 sign-extension cascade, routinely turning a "30-40-byte reg-alloc ceiling" into
    a 0-6-instr permuter residual. PROVEN: **AdjustNewUnitPosition (sub_807C8DC)** plain=161 instr →
    -mjp-promote=**139 = EXACT JP length**. GMapScreen_UpdateScroll plain=295→260 (6 over). So promote collapses
    the STALE plain-agbcc gaps — but ⚠️ EXACT-LENGTH ≠ tractable: the residual is often a reg-COLORING ceiling, not
    a small schedule fix. **AdjustNewUnitPosition (sub_807C8DC) = CONFIRMED reg-coloring CEILING** (anup-worker): exact
    139-instr length but the 49B residual is a 3-register loop rotation (body callee-saved reg-SWAP, the genuine-ceiling
    class) — source reorders ZERO effect, permuter plateau 485/825, register-pins make body swaps WORSE. Needs a
    stronger reg-alloc permuter profile (transmuter). So "permuter ≈ 11" splits into tractable-schedule (ColorFade×4
    style) vs reg-COLORING-ceiling (AdjustNewUnitPosition style) — re-measure tells you length, not winnability.
    (int-widen+cast add nothing beyond promote — promote already does the signedness work; that's why those buckets are 0.)
  - 🟥 **CONFIRMED reg-PRESSURE (Class-3) ceilings — do NOT retry as reconstructs** (recon-worker verified: after
    the s8/s16 signedness fix + -mjp-promote they reach EXACT JP size + 99% structural match, but the residual is
    an agbcc spill/high-reg-count tiebreak the permuter can't reach): **Event18_ColorFade (sub_800E1FC)** (JP s8
    start/size, 204B exact, JP spills r+g to a 4-word frame; permuter plateau 980@8k), **EventA8_WmUnitMoveFree
    (sub_800C994)** (JP s16 args, 8B delta = one extra callee-saved high reg kept live across Proc_Find/GmMu_SetPosition).
  - 🟧 **SPILL-SLOT / REG-ROTATION NEAR backlog (STRATEGIC: needs a stronger reg-alloc tool, NOT more default permuter).**
    A growing class of reconstructs that are **100% structurally correct** (exact size + all-but-N-bytes byte-0) but blocked
    by an agbcc frame-layout/stack-slot/register-rotation tiebreak the **default decomp-permuter randomizer plateaus on**
    (never reaches 0). VALIDATED, worktrees PRESERVED for a future pass:
    • **ClassStatsDisplay_Loop (sub_80B8B28)** — reconstruct done (drop GetClassReelName + 32B buf, inline classReelEnt
      deref, (u8*) cast, drop null-guard; frame 0x30→0x10); residual = 6B cyclic rotation of 3 spill slots
      ([sp,#4]/[sp,#8]/[sp,#0xc]); 14 source variants + 15k permuter @ plateau 5. Worktree /home/laqieer/fe8j-wt-class.
    • **AdjustNewUnitPosition (sub_807C8DC)** — exact 139-instr; 3-register loop-counter rotation; plateau 485/825.
      Worktree /home/laqieer/fe8j-wt-anup (+ _permwork/AdjustNewUnitPosition.best485.c).
    **UNLOCK = the transmuter** (agbcc+Thumb+Claude-Code-in-the-loop permuter rewrite, github.com/macabeus/transmuter,
    flagged in memory for EXACTLY this reg-alloc NEAR backlog) OR a PERM-macro register-hint profile OR a 100k+
    differently-seeded run. Register pins make BODY swaps WORSE (don't). When N such NEARs accumulate, deploy the
    transmuter as a batch — it's the highest-leverage move for the spill/rotation tail. Do NOT keep throwing 15k
    default-permuter runs at individual ones (proven to plateau).
  - ⚠️ **cfbind BUG to fix before carving EventA8: `cfbind_eventscr_gmap.tsv:21` binds `StartGmapAutoMu_Type1` to
    GARBAGE 0x07E72DA4 — correct = 0x080C818C** (Type0@0x080C8130 +0x5C; matches asm `.set sub_80C818C`). Latent
    (no carved code refs it yet) but WILL link-fail/mis-bind the EventA8 carve. Fix via additive zfix last-wins.
  - 🔸 **Genuine LARGE reconstructs (JP earlier-build SMALLER, need a dedicated session + unnamed-callee binds):**
    WriteNewGameSave (sub_80A98B4, JP 44B smaller — likely omits the Sacred-Stones dungeon[2]/bonus/worldmap save
    blocks; binds sub_8000CE4/8030C44/80D6370/80A9778/80A9784), AgbMain, PrepareBattleGraphicsMaybe (+266B).
  - 📋 **DECODED reconstruct recipes ready (researcher, in /tmp + relayed to workers):** 3× efx JP-ONLY spawners
    (StartSubSpell_efxLuceBGCOL sub_8067040, efxLuceBGCOL_Loop sub_8067160, EfxDrsmmoyaMain sub_80705E8 — identity
    PROVEN via proc-name strings, all callees named, cheapest reconstructs in the tail); SioBat_SetupLoop (JP
    msgids 0x6D3/4/5 vs US 0x748/9/A); ClassStatsDisplay_Loop (JP drops GetClassReelName, 0x30→0x10 frame);
    StrInsertTact (recon-worker); StartEventBattle (seb-worker, LOCAL-prototype). **WRONG-ID:** sub_80CAEF4 is
    NOT Nop_Titlescreen_0 (that's a 2-byte bx lr) — it's a 101-instr JP-only tile-blit; do NOT name it Nop_*.
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
- NAMED SYMBOLS: 85.36% (13175/15435; capped by ~1611 asset labels fe8u itself doesn't name — structurally < 100%)
- **Batch + CI-incident (2026-06-24):** carved DisplayPage0/1, NewPopup2_PlanD, Loop6C_efxMagicQUAKE,
  UnitKakudaiMain, UnitKakudaiPrepareAnimScript, ParseBattleHitToBanimCmd (all `-mjp-promote` where noted;
  fixed 2 corrupt cfbind addrs: gBanimForceUnitChgDebug→0x0203E1A0, gBanimPositionIsEnemy→0x0203E104,
  gBanimMaxHP still TODO). ⚠️ **CI INCIDENT + LESSON:** StartEventBattle's `include/functions.h` isBallista
  u8→s8 SHARED-HEADER edit passed the warm `rm rom/elf` gate but CLEAN-BUILD-BROKE the ROM (12.7M-byte
  cascade) → CI red twice → REVERTED (restored 0-diff). **RULE:** any shared-header
  (functions.h/variables.h/struct header) or cfbind/data-bind commit MUST be gated with
  `make clean && make compare` (NOT warm `rm rom/elf`) + a `gh run list` CI check. Re-land such carves
  with LOCAL prototypes/structs, never a shared-header edit. The clean-recipe vein is now ~EXHAUSTED —
  even the 'self-cert leaves' EfxAdvanceFrameLut + AddAttr2dBitMap match the fe8u ELF but NOT JP
  (compiler-config PROMOTE/CSE/reg-pressure divergence). The tail is now: `-mjp-promote`/jp_agbcc
  config-NEARs, permuter-running reg-alloc NEARs (Tactician_InitScreen 320→125, SelectSummonPos,
  ClassIntro_Init, AdjustNewUnitPosition, StrInsertTact, SioBat_SetupLoop, EfxAdvanceFrameLut,
  AddAttr2dBitMap, ColorFadeSetup×4), reconstructs (Menu_OnIdle, SaveMenuExtrasMenuLoop, LoadUnit,
  BattleAIS_ExecCommands, PrepareBattleGraphicsMaybe), and corrupt-cfbind blockers (NewEfxHitQuake
  gEfxTerrainPalette→0x02016828, ekrGauge gBanimMaxHP).

#### Group A/B clean-fuel batch (2026-06-24, +5)
Carved **PutFaceChibi** (-mjp-promote s8 isFlipped + `gFace_1` bind @0x085B8F5C),
**HbMoveCtrl_OnIdle** (s8 boxMoved + -mjp-promote), **Sio_ReadPacket** (-mjp-promote s8 playerId,
extern sio_core statics), **GenerateBestMovementScript** (-mjp-promote), **DrawUiFrame2**
(-mjp-promote s8-spill collapse). Clean-port yield has dropped to ~45% — the tail is filling with
reg-alloc NEARs. NEW NEARs added to backlog (mostly PERMUTER-RESISTANT body reg-swaps, NOT
register-pin-fixable): **SioBat_SetupLoop** (+48B, r5-base-cache vs extra callee-saved r7),
**WriteNewGameSave** (+44B, agbcc won't OVERLAY GameSavePackedUnit+Dungeon[2] onto one stack slot —
frame 0x54 vs JP 0x38), **StrInsertTact** (r4↔r5 src/dst, permuter 375→125 no-zero),
**AiAttemptStealActionWithinMovement** (r4↔r5 gBmMapSize.y index reg), **Menu_OnIdle** (region-diff:
JP INLINED ClearMenuBgs — reconstruct, not a NEAR). Two NEEDS-SERIAL-INTEGRATION items (1-step each,
integrator-only): **StartEventBattle** (sub_8012038 — ONE instruction: needs
include/functions.h:79 isBallista u8->s8 + -mjp-promote, but that regresses the committed caller
Event3F_ScriptBattle which must be re-matched in the SAME commit; ZERO binds otherwise, recipe was at
/tmp/StartEventBattle.c.recipe) and **PutUnitSpriteIconsOam** (data_080DC8B0 residue split at 0DC940).

#### 0x80B opinfo/difficulty/bonus/ending cluster (2026-06-24, +5)
Carved **ClassIntro_LoopOut** (LOCAL OpInfoEnterProcJ struct — JP opinfo procs use local workaround
structs, NEVER edit shared `include/opinfo.h`; iconProc@0x5C/parentProc@0x60/classReelEnt@0x64,
letterProcs[10] inline@0x34, mod/div const 6, bound classReelEnt->unk_0C),
**DifficultySelect_Loop_KeyHandler** (UP-path goto restructure), **InitDifficultySelectScreen** (JP
applies TSA via `CallARM_FillTileRect` directly, no Decompress staging — a recurring JP-uncompressed-asset
pattern, also in ChapterStatus_Init/SoloEndingBattleDisp_Init), **BonusClaim_StartSelectTargetSubMenu**
(5 JP deltas: DrawUiFrame2 dims, win0_left, cursor coords, tm+16, PutNumber col, msgid 0x308->0x28F),
**SoloEndingBattleDisp_Init** (drops 2x Decompress + msgids 0x4CC-0x4CE + fixed-col PutNumber).
ADDED to the permuter backlog (codegen-shape NEARs, NOT const fixes): **HandleTurnRecordText**
(sub_80BC2A4, 44B short, y/textIndex r4/r8-vs-r6/r9 + tilemap-col factoring), **ClassStatsDisplay_Loop**
(sub_80B8B28, JP REVERSES the gauge-pip loop + spills i+1/&unk_34/&unk_35 each outer iter, ~121 opcodes
diff, permuter base 3885->1450). INTEGRATOR gotcha: do NOT rm+rebuild data objects
`menu_save_main_bg` / `worldmap_gmapunit_p1634` in a worktree — regenerating their `.s` shifts
`frontier_df4_menu` gap-packed `.rodata` by 8 bytes (breaks savemenu/difficulty palette literals); the
forced-clean gate must `rm` only `fireemblem8.gba`/`.elf`, never the `.o` cache.

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

### Vein status (2026-06-24) — 0x802/0x807/0x80B batch
- **0x802/0x807/0x80B batch (2026-06-24, +7):** carved **DrawPrepScreenItemUseDesc** (data-alias a shared
  rodata thlut instead of splitting the gap), **GenerateMonsterLevel** (`-mjp-promote` + `gMonsterLevelWeights`
  bind), **EkrHenseiEnd_FadeOutLoop**, **EfxSkillType01BGMain** (dropped a loop + a call = 0x2C shrink),
  **EkrDragonSetBgAndFrontPos** + **BanimUpdateSpriteRotScale** (`-mjp-promote` s16 x/y),
  **ClassInfoDisplay_Init** (opinfo LOCAL ClassReelEntJ struct + `gOpinfo_0` extern-bind @0x081F5900 + several
  committed syms sit +4 past the asm literal because the gfx skip a 4-byte LZ77 header — bind distinct aliases
  at the TRUE asm addrs; `gUnk_4`@0x0200A2D8). **BLOCKED** (needs SERIAL integration, not parallel-safe):
  **PutUnitSpriteIconsOam** (sub_802758C) — C is correct + compiles + .o has the right `rescuePalLut` .rodata,
  but those 6 bytes must land at 0x080DC940 which is inside the committed shared data residue TU
  `data_080DC8B0` (range 0DC8B0–0DC948); splitting it shifts the .rom packing (+0x10 VMA). The integrator
  must split `data_080DC8B0` at 0DC940 and re-verify .rom packing in a single serial step.

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

### How the remaining ~193 are carved (D275 — the current playbook)
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
