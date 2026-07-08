#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness (WAVE 1, frontier_df4_uistuff.c).
 *
 * These proc scripts previously existed ONLY as baseline `.set` aliases pointing
 * into opaque inline-hex inline-asm INCBIN blobs (`.data.frontier_df4_uistuff.gapN`)
 * inside frontier_df4_uistuff.c -- i.e. not decompiled, and their interior code /
 * child-script pointers were raw un-relocated words (invisible to `make shiftcheck`,
 * a +0x40000 shifted-ROM "false floor").
 *
 * Each table is decoded (from JP bytes, symbols resolved against the freshly-built
 * ELF via scripts/depoint_procscr.py) into a typed `struct ProcCmd NAME[]` in its
 * OWN 4-aligned `.rodata.dat_NAME_ref` section, which the carved_rom layout places
 * at its exact JP address; the surrounding blob is split into `.4byte` slices
 * (scripts/split_procscr_blob.py) that stay in frontier_df4_uistuff.c. Every pointer
 * word thus becomes an R_ARM_ABS32 relocation. REGION_SAME structure; the ONLY
 * correctness oracle is `make compare` (sha1). Callee symbols are shared fe8u/fe8j
 * names resolving to JP addresses; FUNC targets are bare (NO addend -- ld ORs the
 * Thumb bit), interior/data targets use byte-exact (u8*) arithmetic.
 *
 * The `.set` aliases for every carved name are dropped in
 * layout/baseline_syms_drop.d/procscr_uistuff_148.tsv so the real typed symbol wins.
 */

/* ---- _022 (gap22, base 0x085B90D8): Talk ------------------------------------ */
extern void TalkPause_OnIdle();
extern void TalkOpen_OnEnd();
extern void TalkOpen_InitBlend();
extern void TalkOpen_PutTalkBubble();
extern void TalkOpen_OnIdle();

struct ProcCmd gProcScr_TalkPause[] __attribute__((section(".rodata.dat_gProcScr_TalkPause_ref"))) = {
    PROC_MARK(0x5),
    PROC_SLEEP(0x1),
    PROC_REPEAT(TalkPause_OnIdle),
    PROC_END,
};

struct ProcCmd gProcScr_TalkOpen[] __attribute__((section(".rodata.dat_gProcScr_TalkOpen_ref"))) = {
    PROC_MARK(0x5),
    PROC_SET_END_CB(TalkOpen_OnEnd),
    PROC_CALL(TalkOpen_InitBlend),
    PROC_REPEAT(TalkOpen_PutTalkBubble),
    PROC_REPEAT(TalkOpen_OnIdle),
    PROC_END,
};

/* ---- gap23 (base 0x085B9454): ProcScr_EventDisplayCursor ProcScr_ScriptBattleDeamon */
extern void EventDisplayCursor_Loop();
extern void ScriptBattleDeamon();

struct ProcCmd ProcScr_EventDisplayCursor[] __attribute__((section(".rodata.dat_ProcScr_EventDisplayCursor_ref"))) = {
    PROC_REPEAT(EventDisplayCursor_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_ScriptBattleDeamon[] __attribute__((section(".rodata.dat_ProcScr_ScriptBattleDeamon_ref"))) = {
    PROC_REPEAT(ScriptBattleDeamon),
    PROC_END,
};


/* ---- gap24b (base 0x085C2458): ProcScr_SpacialSeTest ProcScr_PalFade ProcScr_FadeToBlack ProcScr_FadeFromBlack ProcScr_FadeToWhite ProcScr_FadeFromWhite ProcScr_TemporaryLock ProcScr_PaletteAnimator ProcScr_CallDelayed */
extern void LockGame();
extern void SpacialSeTest_OnInit();
extern void SpacialSeTest_OnLoop();
extern void PalFade_OnLoop();
extern void FadeToBlack_OnInit();
extern void FadeToCommon_OnLoop();
extern void FadeFromBlack_OnInit();
extern void FadeFromCommon_OnLoop();
extern void FadeToWhite_OnInit();
extern void FadeCore_Init();
extern void FadeCore_Loop();
extern void FadeCore_Tick();
extern void FadeFromWhite_OnInit();
extern void TemporaryLock_OnLoop();
extern void PaletteAnimator_Loop();
extern void CallDelayed_OnLoop();

struct ProcCmd ProcScr_SpacialSeTest[] __attribute__((section(".rodata.dat_ProcScr_SpacialSeTest_ref"))) = {
    PROC_CALL(LockGame),
    PROC_CALL(SpacialSeTest_OnInit),
    PROC_REPEAT(SpacialSeTest_OnLoop),
};

struct ProcCmd ProcScr_PalFade[] __attribute__((section(".rodata.dat_ProcScr_PalFade_ref"))) = {
    PROC_MARK(0xA),
    PROC_REPEAT(PalFade_OnLoop),
    PROC_END,
};

struct ProcCmd ProcScr_FadeToBlack[] __attribute__((section(".rodata.dat_ProcScr_FadeToBlack_ref"))) = {
    PROC_CALL(FadeToBlack_OnInit),
    PROC_SLEEP(0x0),
    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd ProcScr_FadeFromBlack[] __attribute__((section(".rodata.dat_ProcScr_FadeFromBlack_ref"))) = {
    PROC_CALL(FadeFromBlack_OnInit),
    PROC_SLEEP(0x0),
    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd ProcScr_FadeToWhite[] __attribute__((section(".rodata.dat_ProcScr_FadeToWhite_ref"))) = {
    PROC_CALL(FadeToWhite_OnInit),
    PROC_SLEEP(0x0),
    PROC_REPEAT(FadeToCommon_OnLoop),
    PROC_BLOCK,
};

struct ProcCmd ProcScr_FadeFromWhite[] __attribute__((section(".rodata.dat_ProcScr_FadeFromWhite_ref"))) = {
    PROC_CALL(FadeFromWhite_OnInit),
    PROC_SLEEP(0x0),
    PROC_REPEAT(FadeFromCommon_OnLoop),
    PROC_BLOCK,
    PROC_MARK(0xA),
    PROC_CALL(FadeCore_Init),
    PROC_SLEEP(0x0),
    PROC_CALL(FadeCore_Tick),
    PROC_REPEAT(FadeCore_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_TemporaryLock[] __attribute__((section(".rodata.dat_ProcScr_TemporaryLock_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(TemporaryLock_OnLoop),
    PROC_END,
};

struct ProcCmd ProcScr_PaletteAnimator[] __attribute__((section(".rodata.dat_ProcScr_PaletteAnimator_ref"))) = {
    PROC_REPEAT(PaletteAnimator_Loop),
};

struct ProcCmd ProcScr_CallDelayed[] __attribute__((section(".rodata.dat_ProcScr_CallDelayed_ref"))) = {
    PROC_REPEAT(CallDelayed_OnLoop),
    PROC_END,
};


/* ---- gap28 (base 0x085C411C): gProcScr_UpdateTraps */
extern void CountDownTraps();
extern void GenerateDisplayedTrapDamageTargets();
extern void GenerateTrapDamageTargets();
extern void PostTrapExecFlag();
extern void RecordTrapDamageDefeats();
extern void RefreshEntityBmMaps();
extern void RefreshEntityBmMapsAsRed();
extern void ResetCountedDownTraps();
extern struct ProcCmd gProcScr_TrapDamageDisplay[];

struct ProcCmd gProcScr_UpdateTraps[] __attribute__((section(".rodata.dat_gProcScr_UpdateTraps_ref"))) = {
    PROC_CALL(CountDownTraps),
    PROC_CALL(RefreshEntityBmMapsAsRed),
    PROC_CALL(GenerateTrapDamageTargets),
    PROC_CALL(RecordTrapDamageDefeats),
    PROC_CALL(GenerateDisplayedTrapDamageTargets),
    PROC_START_CHILD_BLOCKING(gProcScr_TrapDamageDisplay),
    PROC_CALL(ResetCountedDownTraps),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(PostTrapExecFlag),
    PROC_END,
};

/* ---- gap31 (base 0x085C5DE8): sProcScr_AfterDropAction sProcScr_CombatAction */
extern void AfterDrop_CheckTrapAfterDropMaybe();
extern void AfterDrop_RefreshMapAndSprites();
extern void MuExistsActive();
extern void BATTLE_DeleteLinkedMOVEUNIT();
extern void BATTLE_GOTO1_IfNobodyIsDead();
extern void BATTLE_HandleCombatDeaths();
extern void BATTLE_HandleItemDrop();
extern void BATTLE_PostCombatDeathFades();
extern void BattleApplyGameStateUpdates();
extern void BeginBattleAnimations();

struct ProcCmd sProcScr_AfterDropAction[] __attribute__((section(".rodata.dat_sProcScr_AfterDropAction_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_WHILE(MuExistsActive),
    PROC_CALL_2(AfterDrop_CheckTrapAfterDropMaybe),
    PROC_CALL(AfterDrop_RefreshMapAndSprites),
    PROC_END,
};

struct ProcCmd sProcScr_CombatAction[] __attribute__((section(".rodata.dat_sProcScr_CombatAction_ref"))) = {
    PROC_CALL(BeginBattleAnimations),
    PROC_SLEEP(0x1),
    PROC_CALL(BattleApplyGameStateUpdates),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(BATTLE_GOTO1_IfNobodyIsDead),
    PROC_CALL(BATTLE_PostCombatDeathFades),
    PROC_SLEEP(0x20),
    PROC_CALL(BATTLE_DeleteLinkedMOVEUNIT),
    PROC_LABEL(0x1),
    PROC_CALL_2(BATTLE_HandleItemDrop),
    PROC_CALL(BATTLE_HandleCombatDeaths),
    PROC_SLEEP(0x0),
    PROC_END,
};


/* ---- gap25 (base 0x085C2E50): ProcScr_DebugMonitor gProcScr_DebugStartNameEntry gProcScr_PlayerPhase gProcScr_ADJUSTSFROMXI */
extern void StartTacticianNameEntry();
extern void ApplyUnitAction();
extern void DisplayActiveUnitEffectRange();
extern void EndAllMus();
extern void EndPlayerPhaseSideWindows();
extern void EnsureCameraOntoActiveUnitPosition();
extern void EventEngineExists();
extern void HandlePostActionTraps();
extern void PlayerPhase_ApplyUnitMovement();
extern void PlayerPhase_DisplayDangerZone();
extern void PlayerPhase_DisplayUnitMovement();
extern void PlayerPhase_FinishAction();
extern void PlayerPhase_HandleAutoEnd();
extern void PlayerPhase_InitUnitMovementSelect();
extern void PlayerPhase_MainIdle();
extern void PlayerPhase_PrepareAction();
extern void PlayerPhase_RangeDisplayIdle();
extern void PlayerPhase_ReReadGameSaveGfx();
extern void PlayerPhase_ResumeRangeDisplay();
extern void PlayerPhase_Suspend();
extern void PlayerPhase_WaitForUnitMovement();
extern struct ProcCmd ProcScr_CamMove[];
extern void RefreshEntityBmMaps();
extern void RefreshUnitSprites();
extern void RenderBmMap();
extern void ResetUnitSpriteHover();
extern void RunPotentialWaitEvents();
extern void SetAllUnitNotBackSprite();
extern void StartMapSongBgm();
extern void StartPlayerPhaseSideWindows();
extern void StartPlayerPhaseStartTutorialEvent();
extern u8 Str_DebugRedArmy[];
extern void ADJUSTFROMXI_MoveCameraOnSomeUnit();
/* child proc spawned at PlayerPhase's one-past-end (== next slice's start);
   reference the slice's own symbol so the ptr stays intra-resource (no cross-
   resource shiftcheck HIGH) instead of gProcScr_PlayerPhase+0x210. Byte-exact. */
extern struct ProcCmd frontier_df4_uistuff_025d_5C3168[];

struct ProcCmd ProcScr_DebugMonitor[] __attribute__((section(".rodata.dat_ProcScr_DebugMonitor_ref"))) = {
    PROC_END,
};

struct ProcCmd gProcScr_DebugStartNameEntry[] __attribute__((section(".rodata.dat_gProcScr_DebugStartNameEntry_ref"))) = {
    PROC_CALL(StartTacticianNameEntry),
    PROC_SLEEP(0x0),
    PROC_END,
};

struct ProcCmd gProcScr_PlayerPhase[] __attribute__((section(".rodata.dat_gProcScr_PlayerPhase_ref"))) = {
    PROC_NAME((void*)((u8*)Str_DebugRedArmy + 0x50)),
    PROC_MARK(0x2),
    PROC_SLEEP(0x0),
    PROC_LABEL(0x0),
    PROC_CALL(PlayerPhase_Suspend),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),
    PROC_CALL(StartPlayerPhaseStartTutorialEvent),
    PROC_WHILE(EventEngineExists),
    PROC_CALL(PlayerPhase_HandleAutoEnd),
    PROC_CALL(StartMapSongBgm),
    PROC_LABEL(0x9),
    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_CALL(ResetUnitSpriteHover),
    PROC_REPEAT(PlayerPhase_MainIdle),
    PROC_LABEL(0x1),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(SetAllUnitNotBackSprite),
    PROC_CALL(RefreshUnitSprites),
    PROC_START_CHILD_BLOCKING(frontier_df4_uistuff_025d_5C3168),
    PROC_CALL(PlayerPhase_InitUnitMovementSelect),
    PROC_SLEEP(0x1),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_CALL(PlayerPhase_DisplayUnitMovement),
    PROC_REPEAT(PlayerPhase_WaitForUnitMovement),
    PROC_LABEL(0x2),
    PROC_REPEAT(PlayerPhase_ApplyUnitMovement),
    PROC_LABEL(0x7),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL_2(PlayerPhase_PrepareAction),
    PROC_CALL_2(ApplyUnitAction),
    PROC_CALL_2(HandlePostActionTraps),
    PROC_CALL_2(RunPotentialWaitEvents),
    PROC_CALL_2(EnsureCameraOntoActiveUnitPosition),
    PROC_CALL(PlayerPhase_FinishAction),
    PROC_GOTO(0x0),
    PROC_LABEL(0x4),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_GOTO(0x1),
    PROC_LABEL(0x5),
    PROC_CALL(PlayerPhase_ReReadGameSaveGfx),
    PROC_LABEL(0xA),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),
    PROC_GOTO(0x9),
    PROC_LABEL(0x6),
    PROC_CALL(PlayerPhase_ResumeRangeDisplay),
    PROC_GOTO(0x1),
    PROC_LABEL(0x8),
    PROC_SLEEP(0x0),
    PROC_CALL(EndAllMus),
    PROC_GOTO(0x0),
    PROC_LABEL(0xB),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_GOTO(0x9),
    PROC_LABEL(0xC),
    PROC_CALL(PlayerPhase_DisplayDangerZone),
    PROC_REPEAT(PlayerPhase_RangeDisplayIdle),
    PROC_GOTO(0x9),
    PROC_LABEL(0x3),
    PROC_WHILE(DoesBMXFADEExist),
    PROC_END,
};

struct ProcCmd gProcScr_ADJUSTSFROMXI[] __attribute__((section(".rodata.dat_gProcScr_ADJUSTSFROMXI_ref"))) = {
    PROC_NAME((void*)((u8*)Str_DebugRedArmy + 0x94)),
    PROC_CALL(ADJUSTFROMXI_MoveCameraOnSomeUnit),
    PROC_SLEEP(0x1),
    PROC_END,
};


/* ---- gap38 (base 0x085D32D8): ProcScr_TacticianNameSelection */
extern void Clear_UnkData_0();
extern void FadeInBlackSpeed20();
extern void FadeOutBlackSpeed20Locking();
extern void NameSelect_ConfirmLoop();
extern void NameSelect_DrawName();
extern void Set_UnkData_0();
extern void Tactician_InitScreen();
extern void Tactician_Loop();
extern void Tactician_OnEnd();
extern void Tactician_PageFadeIn_Loop();
extern void Tactician_PageFadeOut_Loop();
extern void Tactician_PageFade_Init();
extern void Tactician_SwapPage();

struct ProcCmd ProcScr_TacticianNameSelection[] __attribute__((section(".rodata.dat_ProcScr_TacticianNameSelection_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(Tactician_InitScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_LABEL(0x0),
    PROC_REPEAT(Tactician_Loop),
    PROC_GOTO(0x2),
    PROC_LABEL(0x1),
    PROC_CALL(Tactician_PageFade_Init),
    PROC_REPEAT(Tactician_PageFadeOut_Loop),
    PROC_CALL(Tactician_SwapPage),
    PROC_REPEAT(Tactician_PageFadeIn_Loop),
    PROC_GOTO(0x0),
    PROC_LABEL(0x3),
    PROC_CALL(NameSelect_DrawName),
    PROC_REPEAT(NameSelect_ConfirmLoop),
    PROC_GOTO(0x0),
    PROC_LABEL(0x2),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(Tactician_OnEnd),
    PROC_END,
};

