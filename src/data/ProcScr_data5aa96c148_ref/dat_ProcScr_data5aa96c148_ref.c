#include "global.h"
#include "proc.h"

/* #148 Wave 3 - typed proc-script tables carved from the opaque inline-asm blobs in
 * src/data/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c.c (Sio / LinkArena UI).
 * Byte-identical to the original blob words (make compare sha1 is the oracle); placed by
 * layout/carved_rom.d/data_frontier3_df3_data_5aa96c.tsv. Generated via depoint_procscr.py. */

/* ---- externs (deduped) ---- */
extern void EndLinkArenaTitleBanner();
extern void FadeOutBlackSpeed20Locking();
extern void LinkArenaTeamBuild_GotoExitIfNoCursor();
extern void Nop_SioUiutils_0();
extern struct ProcCmd ProcScr_SioPostBattle[];
extern void ResetLinkArenaUiBlend();
extern void SetSioSaveConfigFlag3();
extern void Set_UnkData_0();
extern void SioBat_LoadAllTeamUnits();
extern void SioMain2_WaitEndAndRoute();
extern void StartLinkArenaTeamList();
extern u8 data_080DEE1A[];
extern void sub_8045BB4();
extern void Clear_UnkData_0();
extern void DrawLinkArenaLoadingScreen();
extern void DrawLinkArenaRuleScreen();
extern void EndLinkArenaVersusSpriteDraw();
extern void EndSioProcs();
extern void FadeInBlackSpeed20();
extern struct ProcCmd ProcScr_RuleSettingSpriteDraw_Static[];
extern void ResetFaces();
extern void SioBat_DecideFirstMover();
extern void SioBat_FirstMoverRoulette();
extern void SioBat_InitSetupScreen();
extern void SioBat_InitTeamTransfer();
extern void SioBat_PlayFirstMoverSound();
extern void SioBat_ReceiveFirstMover();
extern void SioBat_RegisterHighScore();
extern void SioBat_ReleaseIrq();
extern void SioBat_SetupLoop();
extern void SioBat_TeamTransferLoop();
extern void SioBat_WaitSetupAck();
extern void SioBat_WaitTeamTransferDone();
extern void Sio_InitAckMask();
extern void Sio_Msg89Barrier_Loop();
extern void Sio_ResetState();
extern void StartSioProcs();
extern u8 gLinkArenaRuleData[];
extern void sub_804690C();
extern void sub_8046918();
extern void BMapVSync_End();
extern void BMapVSync_Start();
extern void ClearSioBGFull();
extern void EndLinkArenaButtonSpriteDraw();
extern void LinkArenaTeamBuild_GotoIfNoSelection();
extern void LinkArenaTeamBuild_Init();
extern void LinkArenaTeamBuild_LoadSelectedSave();
extern void LinkArenaTeamBuild_Loop();
extern void LinkArenaTeamBuild_OnTacticianDone();
extern void LinkArenaTeamBuild_ResetBg1Position();
extern void LinkArenaTeamBuild_WaitAtMenu();
extern void StartPrepAtMenuWithConfig();
extern void StartTacticianNameEntry();
extern void SioResult_Init();
extern void SioResult_Loop_Main();
extern void SioRuleSettings_Init();
extern void SioRuleSettings_Loop_Main();
extern void LinkArenaFogSprite_Loop();
extern void SioMuFade_RestorePal();
extern void SioWarp_End();
extern void SioWarp_Init();
extern void SioWarp_Loop();
extern u8 data_080DEF7C[];
extern void SioWarpFx_0();
extern void SioWarpFx_1();
extern void SioWarpFx_AwaitSioWarp();
extern void SioWarpFx_HideMoveUnit();
extern void SioWarpFx_SetMUPosition();
extern void SioWarpFx_ShowMoveUnit();
extern void SioWarpFx_StartSioWarp();
extern void LAButtonSprites_Loop();
extern void LATitleBanner_Init();
extern void LATitleBanner_Loop();
extern void SioMenuItem_Loop();
extern void SioTeamMenuSpriteDraw_Loop();
extern void LATeamSpriteDraw_Loop();
extern void NameEntrySpriteDraw_Loop();
extern void RuleSettingSprites_Interactive_Loop();
extern void RuleSettingSprites_Static_Loop();
extern void SioMenuBurstFx_Loop();
extern void LinkArenaMenuScroll_Init();
extern void LinkArenaMenuScroll_Loop();
extern void LAVersusSpriteDraw_Loop();
extern void LinkArenaResultBanner_Loop();

/* ==== block gap0 (base 0x085D367C) ==== */
struct ProcCmd ProcScr_SIOPRA[] __attribute__((section(".rodata.dat_ProcScr_SIOPRA_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DEE1A + 0x6)),
    PROC_SLEEP(0x0),
    PROC_CALL(StartLinkArenaTeamList),
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaTeamBuild_GotoExitIfNoCursor),
    PROC_CALL(SioBat_LoadAllTeamUnits),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_CALL(EndLinkArenaTitleBanner),
    PROC_CALL(ResetLinkArenaUiBlend),
    PROC_SLEEP(0x0),
    PROC_CALL(sub_8045BB4),
    PROC_SLEEP(0x0),
    PROC_REPEAT(SioMain2_WaitEndAndRoute),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_START_CHILD_BLOCKING(ProcScr_SioPostBattle),
    PROC_SLEEP(0x0),
    PROC_CALL(SetSioSaveConfigFlag3),
    PROC_LABEL(0x4),
    PROC_LABEL(0x1),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_END,
};

struct ProcCmd ProcScr_SIOBAT[] __attribute__((section(".rodata.dat_ProcScr_SIOBAT_ref"))) = {
    PROC_NAME((void*)((u8*)gLinkArenaRuleData + 0x3c)),
    PROC_LABEL(0x0),
    PROC_CALL(StartLinkArenaTeamList),
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaTeamBuild_GotoExitIfNoCursor),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_CALL(EndLinkArenaTitleBanner),
    PROC_CALL(ResetLinkArenaUiBlend),
    PROC_CALL(SioBat_InitSetupScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_CALL(StartSioProcs),
    PROC_LABEL(0x3),
    PROC_REPEAT(SioBat_SetupLoop),
    PROC_CALL(sub_804690C),
    PROC_REPEAT(SioBat_WaitSetupAck),
    PROC_CALL(Sio_InitAckMask),
    PROC_REPEAT(Sio_Msg89Barrier_Loop),
    PROC_CALL(SioBat_DecideFirstMover),
    PROC_REPEAT(SioBat_ReceiveFirstMover),
    PROC_CALL(Sio_InitAckMask),
    PROC_REPEAT(Sio_Msg89Barrier_Loop),
    PROC_REPEAT(SioBat_FirstMoverRoulette),
    PROC_SLEEP(0xA),
    PROC_CALL(SioBat_PlayFirstMoverSound),
    PROC_SLEEP(0x50),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_CALL(EndMuralBackground),
    PROC_CALL(DrawLinkArenaRuleScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_SLEEP(0xB4),
    PROC_CALL(Sio_InitAckMask),
    PROC_REPEAT(Sio_Msg89Barrier_Loop),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_END_EACH(ProcScr_RuleSettingSpriteDraw_Static),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_CALL(EndLinkArenaTitleBanner),
    PROC_CALL(ResetLinkArenaUiBlend),
    PROC_CALL(DrawLinkArenaLoadingScreen),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_CALL(SioBat_InitTeamTransfer),
    PROC_REPEAT(SioBat_TeamTransferLoop),
    PROC_REPEAT(SioBat_WaitTeamTransferDone),
    PROC_CALL(Sio_InitAckMask),
    PROC_REPEAT(Sio_Msg89Barrier_Loop),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_CALL(EndMuralBackground),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_SLEEP(0x1),
    PROC_CALL(sub_8045BB4),
    PROC_SLEEP(0x0),
    PROC_REPEAT(SioMain2_WaitEndAndRoute),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(sub_8046918),
    PROC_CALL(EndSioProcs),
    PROC_START_CHILD_BLOCKING(ProcScr_SioPostBattle),
    PROC_SLEEP(0x0),
    PROC_CALL(SioBat_ReleaseIrq),
    PROC_CALL(SioBat_RegisterHighScore),
    PROC_SLEEP(0x0),
    PROC_CALL(SetSioSaveConfigFlag3),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_GOTO(0x1),
    PROC_LABEL(0x2),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(ResetFaces),
    PROC_CALL(EndLinkArenaVersusSpriteDraw),
    PROC_CALL(EndMuralBackground),
    PROC_GOTO(0x0),
    PROC_LABEL(0x4),
    PROC_CALL(Sio_InitAckMask),
    PROC_REPEAT(Sio_Msg89Barrier_Loop),
    PROC_SLEEP(0x1),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(sub_8046918),
    PROC_CALL(EndSioProcs),
    PROC_CALL(SioBat_ReleaseIrq),
    PROC_LABEL(0x1),
    PROC_CALL(Sio_ResetState),
    PROC_END,
};

struct ProcCmd ProcScr_SIOTERM[] __attribute__((section(".rodata.dat_ProcScr_SIOTERM_ref"))) = {
    PROC_NAME((void*)((u8*)gLinkArenaRuleData + 0x44)),
    PROC_LABEL(0x0),
    PROC_CALL(StartLinkArenaTeamList),
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaTeamBuild_GotoExitIfNoCursor),
    PROC_LABEL(0x3),
    PROC_CALL(LinkArenaTeamBuild_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_REPEAT(LinkArenaTeamBuild_Loop),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(ClearSioBGFull),
    PROC_CALL(LinkArenaTeamBuild_LoadSelectedSave),
    PROC_CALL(Nop_SioUiutils_0),
    PROC_CALL(EndLinkArenaTitleBanner),
    PROC_CALL(ResetLinkArenaUiBlend),
    PROC_CALL(EndLinkArenaButtonSpriteDraw),
    PROC_CALL(EndMuralBackground),
    PROC_CALL(BMapVSync_End),
    PROC_SLEEP(0x0),
    PROC_CALL(StartPrepAtMenuWithConfig),
    PROC_LABEL(0x5),
    PROC_REPEAT(LinkArenaTeamBuild_WaitAtMenu),
    PROC_CALL(BMapVSync_Start),
    PROC_CALL(LinkArenaTeamBuild_GotoIfNoSelection),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(StartTacticianNameEntry),
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaTeamBuild_OnTacticianDone),
    PROC_SLEEP(0x0),
    PROC_GOTO(0x0),
    PROC_LABEL(0x2),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_GOTO(0x3),
    PROC_LABEL(0x4),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaTeamBuild_ResetBg1Position),
    PROC_CALL(EndLinkArenaButtonSpriteDraw),
    PROC_CALL(EndMuralBackground),
    PROC_GOTO(0x0),
    PROC_LABEL(0x1),
    PROC_END,
};

struct ProcCmd ProcScr_SIORESULT[] __attribute__((section(".rodata.dat_ProcScr_SIORESULT_ref"))) = {
    PROC_NAME((void*)((u8*)gLinkArenaRuleData + 0x4c)),
    PROC_SLEEP(0x0),
    PROC_CALL(SioResult_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_REPEAT(SioResult_Loop_Main),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(EndMuralBackground),
    PROC_END,
};

struct ProcCmd ProcScr_SIO_RuleSettings[] __attribute__((section(".rodata.dat_ProcScr_SIO_RuleSettings_ref"))) = {
    PROC_CALL(SioRuleSettings_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0x0),
    PROC_CALL(Clear_UnkData_0),
    PROC_REPEAT(SioRuleSettings_Loop_Main),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0x0),
    PROC_CALL(EndMuralBackground),
    PROC_END,
};

/* ==== block gap1 / data_085D4010 (base 0x085D4010) ==== */
struct ProcCmd ProcScr_DrawLinkArenaFogPlaceholders[] __attribute__((section(".rodata.dat_ProcScr_DrawLinkArenaFogPlaceholders_ref"))) = {
    PROC_15,
    PROC_MARK(0x1),
    PROC_SLEEP(0x0),
    PROC_REPEAT(LinkArenaFogSprite_Loop),
};

/* ==== block gap3 (base 0x085D48E0) ==== */
struct ProcCmd ProcScr_SioMu_0[] __attribute__((section(".rodata.dat_ProcScr_SioMu_0_ref"))) = {
    PROC_SLEEP(0x11),
    PROC_CALL(SioMuFade_RestorePal),
    PROC_END,
};

struct ProcCmd ProcScr_SIOWARP[] __attribute__((section(".rodata.dat_ProcScr_SIOWARP_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DEF7C + 0x34)),
    PROC_SLEEP(0x0),
    PROC_CALL(SioWarp_Init),
    PROC_REPEAT(SioWarp_Loop),
    PROC_CALL(SioWarp_End),
    PROC_END,
};

struct ProcCmd ProcScr_SIOWARPFX[] __attribute__((section(".rodata.dat_ProcScr_SIOWARPFX_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DEF7C + 0x3C)),
    PROC_SLEEP(0x0),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(0x5),
    PROC_CALL(SioWarpFx_0),
    PROC_SLEEP(0xF),
    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(0x1),
    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(0x5),
    PROC_CALL(SioWarpFx_ShowMoveUnit),
    PROC_CALL(SioWarpFx_1),
    PROC_REPEAT(SioWarpFx_AwaitSioWarp),
    PROC_END,
};

struct ProcCmd ProcScr_SioWarpFxPartial[] __attribute__((section(".rodata.dat_ProcScr_SioWarpFxPartial_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(SioWarpFx_HideMoveUnit),
    PROC_SLEEP(0x1),
    PROC_CALL(SioWarpFx_SetMUPosition),
    PROC_CALL(SioWarpFx_StartSioWarp),
    PROC_SLEEP(0x5),
    PROC_CALL(SioWarpFx_ShowMoveUnit),
    PROC_END,
};

struct ProcCmd ProcScr_LAButtonSpriteDraw[] __attribute__((section(".rodata.dat_ProcScr_LAButtonSpriteDraw_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(LAButtonSprites_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_LinkArenaTitleBanner[] __attribute__((section(".rodata.dat_ProcScr_LinkArenaTitleBanner_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(LATitleBanner_Init),
    PROC_REPEAT(LATitleBanner_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SioMenuItem[] __attribute__((section(".rodata.dat_ProcScr_SioMenuItem_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(SioMenuItem_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SioUiutils_0[] __attribute__((section(".rodata.dat_ProcScr_SioUiutils_0_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(SioTeamMenuSpriteDraw_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_LinkArenaTeamSpriteDraw[] __attribute__((section(".rodata.dat_ProcScr_LinkArenaTeamSpriteDraw_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(LATeamSpriteDraw_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_NameEntrySpriteDraw[] __attribute__((section(".rodata.dat_ProcScr_NameEntrySpriteDraw_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(NameEntrySpriteDraw_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_RuleSettingSpriteDraw_Interactive[] __attribute__((section(".rodata.dat_ProcScr_RuleSettingSpriteDraw_Interactive_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(RuleSettingSprites_Interactive_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_RuleSettingSpriteDraw_Static[] __attribute__((section(".rodata.dat_ProcScr_RuleSettingSpriteDraw_Static_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(RuleSettingSprites_Static_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SioMenuBurstFx[] __attribute__((section(".rodata.dat_ProcScr_SioMenuBurstFx_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(SioMenuBurstFx_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_LinkArenaMenuScrollBar[] __attribute__((section(".rodata.dat_ProcScr_LinkArenaMenuScrollBar_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(LinkArenaMenuScroll_Init),
    PROC_REPEAT(LinkArenaMenuScroll_Loop),
    PROC_END,
};

/* ==== block gap4 (base 0x085D4C5C) ==== */
struct ProcCmd ProcScr_LAVersusSpriteDraw[] __attribute__((section(".rodata.dat_ProcScr_LAVersusSpriteDraw_ref"))) = {
    PROC_REPEAT(LAVersusSpriteDraw_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SioUiutils_1[] __attribute__((section(".rodata.dat_ProcScr_SioUiutils_1_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(LinkArenaResultBanner_Loop),
    PROC_END,
};

