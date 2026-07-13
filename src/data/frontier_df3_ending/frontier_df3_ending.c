#include "global.h"
#include "proc.h"

extern const u8 GMapBaseMenu_Init[];
extern const u8 GMapBaseMenu_RestoreBgm[];
extern const u8 GMapBaseMenu_ShopFromItemScreen[];
extern const u8 GMapBaseMenu_StartArmory[];
extern const u8 GMapBaseMenu_StartItemScreen[];
extern const u8 GMapBaseMenu_StartSecretShop[];
extern const u8 GMapBaseMenu_StartVendor[];
extern const u8 GMapPI_HideLoop[];
extern const u8 GMapPI_Init[];
extern const u8 GMapPI_RequestHide[];
extern const u8 GMapPI_ShowInit[];
extern const u8 GMapPI_ShowLoop[];
extern const u8 GMapPI_TrackCursorLoop[];
extern const u8 GMapPI_WaitForNodeLoop[];
extern const u8 GMapRadar_1[];
extern const u8 GMapRadar_2[];
extern const u8 GMapRadar_Init[];
extern const u8 GMapRadar_SlideIn[];
extern const u8 GMapRadar_SlideOut[];
extern const u8 GfxSet_WmNationMap[];
extern const u8 GmMoveCursor_OnEnd[];
extern const u8 GmMoveCursor_OnLoop[];
extern const u8 GmMuEntry_0[];
extern const u8 GmMuEntry_1[];
extern const u8 GmMuEntry_2[];
extern const u8 GmMuEntry_3[];
extern const u8 GmMuEntry_Init[];
extern const u8 GmMuPrim_0[];
extern const u8 GmMuPrim_1[];
extern const u8 GmMuPrim_2[];
extern const u8 GmMuPrim_3[];
extern const u8 GmMuPrim_Loop_Null[];
extern const u8 GmMuPrim_OnEnd_Null[];
extern const u8 GmMuPrim_OnInit[];
extern const u8 GmMu_OnInit[];
extern const u8 GmPalFade_Init[];
extern const u8 GmPalFade_Loop[];
extern const u8 GmScrollManage_OnEnd[];
extern const u8 GmScrollManage_OnLoop[];
extern const u8 GmTmConfront_InitUnitPositionA[];
extern const u8 GmTmConfront_InitUnitPositionB[];
extern const u8 GmTmConfront_InitUnitPositionC[];
extern const u8 GmTmConfront_Loop_MoveUnitPositions[];
extern const u8 GmTmConfront_StartAnim[];
extern const u8 GmTmConfront_WaitForAnim[];
extern const u8 GmapAutoMu_0[];
extern const u8 GmapAutoMu_1[];
extern const u8 GmapAutoMu_2[];
extern const u8 GmapAutoMu_3[];
extern const u8 GmapAutoMu_4[];
extern const u8 GmapAutoMu_5[];
extern const u8 GmapAutoMu_OnEnd[];
extern const u8 GmapAutoMu_StartFadeIn[];
extern const u8 GmapAutoMu_StartFadeOut[];
extern const u8 GmapAutoMu_WaitForFadeEnd[];
extern const u8 GmapAutoMu_WaitInitialDelay[];
extern const u8 GmapBaseEntry_0[];
extern const u8 GmapBaseEntry_1[];
extern const u8 GmapBaseEntry_2[];
extern const u8 GmapBaseEntry_Init[];
extern const u8 GmapBaseEntry_OnEnd[];
extern const u8 GmapEffectPal_Init[];
extern const u8 GmapEffectPal_Loop[];
extern const u8 GmapEffectPal_OnEnd[];
extern const u8 GmapEffect_Init[];
extern const u8 GmapEffect_Loop[];
extern const u8 GmapEffect_OnEnd[];
extern const u8 GmapLineFade_Init[];
extern const u8 GmapLineFade_Loop[];
extern const u8 GmapLineFade_OnEnd[];
extern const u8 GmapMuEntry_0[];
extern const u8 GmapMuEntry_1[];
extern const u8 GmapMuEntry_Init[];
extern const u8 GmapMuEntry_OnEnd[];
extern const u8 GmapRmBorder1_0[];
extern const u8 GmapRmBorder1_1[];
extern const u8 GmapRmBorder1_2[];
extern const u8 GmapRmBorder1_3[];
extern const u8 GmapRmBorder1_4[];
extern const u8 GmapRmBorder1_End[];
extern const u8 GmapRmBorder1_NationMergeIn[];
extern const u8 GmapRmBorder1_NationMergeOut[];
extern const u8 MenuItemDef_WMNodeMenu[];
extern const u8 MenuStdHelpBox[];
extern const u8 StartWorldMapMinimapCore[];
extern const u8 StartWorldMapPlayerInterface[];
extern const u8 WMNodeMenu_OnCancel[];
extern const u8 WMNodeMenu_OnEnd[];
extern const u8 WMNodeMenu_OnInit[];
extern const u8 WmPlaceDot_Init[];
extern const u8 WmPlaceDot_Loop1[];
extern const u8 WmPlaceDot_Loop2[];
extern const u8 WmPlaceDot_OnEnd[];
extern const u8 WmText_Init[];
extern const u8 WmText_Loop_DrawText[];
extern const u8 WorldmapStatus_GetCharDescription[];
extern const u8 WorldmapStatus_GetClassDescription[];
extern const u8 WorldmapStatus_PutTimeAndGold[];
extern const u8 gHelpInfo_WorldmapStatus[];
extern const u8 gWorldmapPath_20[];
extern const u8 gWorldmapRadar_0[];
extern const u8 gap_000C532C[];
extern const u8 nullsub_100[];
extern const u8 nullsub_101[];
extern const u8 nullsub_102[];
extern const u8 nullsub_107[];
extern const u8 sub_8050294[];
extern const u8 sub_80C3F7C[];
extern const u8 sub_80C40BC[];

/* Migrated from asm/frontier_df3_ending.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* #148 proc-script decomp-completeness (gap0): carve the 8 opaque worldmap/gmap
 * proc scripts out of the fully-symbolized .4byte blob into typed
 * struct ProcCmd[] in-place (byte-neutral: each carved word is an existing
 * .4byte Sym/immediate re-expressed as a ProcCmd macro with the identical
 * reloc). data_08AC2510 is preserved as a byte-neutral alias for
 * ProcScr_GmapRM (referenced by dat_worldmap_node_data_gf). Baseline .set
 * aliases dropped in layout/baseline_syms_drop.d/procscr_ending_148.tsv;
 * make compare (sha1) is the oracle. */
extern void BMapDispResume();
extern void BMapDispSuspend();
extern void EndAllMus();
extern void GmapRmBaPalAnim1_End();
extern void GmapRmBaPalAnim1_Init();
extern void GmapRmBaPalAnim1_Loop1();
extern void GmapRmBaPalAnim1_Loop2();
extern void GmapRmUpdateDirect_Loop();
extern void GmapRmUpdateExt_Delay();
extern void GmapRmUpdateExt_End();
extern void GmapRmUpdateExt_InitPosition();
extern void GmapRmUpdateExt_ScrollPosition();
extern void GmapRm_0();
extern void GmapRm_1();
extern void GmapRm_2();
extern void GmapRm_BlendIn();
extern void GmapRm_BlendOut();
extern void GmapRm_Blocking();
extern void GmapRm_Goto0IfFlag0();
extern void GmapRm_Goto1IfFlag1();
extern void GmapRm_InitBlend();
extern void GmapRm_InitNop();
extern void GmapRm_OnEnd();
extern void GmapRm_StartUpdateDirect();
extern void GmapSogu_End();
extern void GmapSogu_Init();
extern void GmapSogu_Loop1();
extern void GmapSogu_Loop2();
extern void GmapTimeMons_ExecMonsterMergeMu();
extern void GmapTimeMons_Init();
extern void GmapTimeMons_WaitSpriteDone();
extern void LockGame();
extern void StartGreenText();
extern void UnlockGame();
extern void WmDotPalAnim_Init();
extern void WmDotPalAnim_Loop1();
extern void WmDotPalAnim_Loop2();
extern void WmDotPalAnim_OnEnd();
extern void WorldmapStatus_0();
extern void WorldmapStatus_1();
extern void WorldmapStatus_Init();
extern void WorldmapStatus_InitDetails();
extern void WorldmapStatus_InitGfx();
extern void WorldmapStatus_Loop_KeyHandler();
extern void WorldmapStatus_OnEnd();
extern void nullsub_104();
extern u8 WmMonsterGenerateRates_XmapEphraim[];
extern u8 gBgConfig_WorldmapStatus[];
extern u8 gWmSkirmish_PositionsC[];

u32 frontier_df3_ending_000_AC1BC0[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    0x00080A14, 0x00000000, (u32)&MenuItemDef_WMNodeMenu, (u32)&WMNodeMenu_OnInit, (u32)&WMNodeMenu_OnEnd, 0x00000000,
    (u32)&WMNodeMenu_OnCancel, (u32)&sub_8050294, (u32)&MenuStdHelpBox, 0x000A0113, 0x000A0101, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x08001000, 0x00001000, 0x00000000,
    0x00000001, (u32)&gWorldmapPath_20 + 0x8, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmMuPrim_OnEnd_Null,
    0x00000002, (u32)&GmMuPrim_OnInit, 0x0000000B, 0x00000000, 0x00000003, (u32)&GmMuPrim_Loop_Null,
    0x0001000B, 0x00000000, 0x00000002, (u32)&GmMuPrim_0, 0x00000003, (u32)&GmMuPrim_1,
    0x0000000C, 0x00000000, 0x0002000B, 0x00000000, 0x00000002, (u32)&GmMuPrim_2,
    0x00000003, (u32)&GmMuPrim_3, 0x0000000C, 0x00000000, 0x00000000, 0x00000000,
    0x00000001, (u32)&gWorldmapPath_20 + 0x18, 0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_100,
    0x00000002, (u32)&GmMu_OnInit, 0x00000010, 0x00000000, 0x00000000, 0x00000000,
    0x09090908, 0x00090909, 0x00020010, 0x00000096, 0x00000000, 0x00000000,
    0x00000000, 0x00000097, 0x00000000, 0x00000000, 0x00000000, 0x00020020,
    0x000000A4, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x000000A5, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00030015, 0x0000009A,
    0x009B0000, 0x00000000, 0x00000000, 0x00000000, 0x0000009C, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00140000, 0x00A00001, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00140000, 0x00A60001, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00140000, 0x02E00001, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00180000, 0x030F0001, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x030E0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0xFF0101FF, 0xFFFFFFFF, 0xFF01FFFF, 0xFF01FFFF,
    0x03040301, 0x07030001, 0x00020609, 0x00000001, (u32)&gWorldmapPath_20 + 0x20, 0x0008000F,
    0x00000000, 0x00000015, 0x00000000, 0x0000000E, 0x00000000, 0x00000002,
    (u32)&GMapPI_Init, 0x0000000B, 0x00000000, 0x00000003, (u32)&GMapPI_WaitForNodeLoop, 0x00000003,
    (u32)&GMapPI_ShowInit, 0x00000003, (u32)&GMapPI_ShowLoop, 0x00000003, (u32)&GMapPI_TrackCursorLoop, 0x00000002,
    (u32)&GMapPI_RequestHide, 0x00000003, (u32)&GMapPI_HideLoop, 0x0000000C, 0x00000000, 0x00000000,
    0x00000000, 0x0008000F, 0x00000000, 0x00000014, (u32)&DoesBMXFADEExist, 0x00000002,
    (u32)&StartWorldMapPlayerInterface, 0x00000000, 0x00000000, 0x00000001, (u32)&gWorldmapPath_20 + 0x24, 0x0008000F,
    0x00000000, 0x00000004, (u32)&GmMoveCursor_OnEnd, 0x00000002, (u32)&sub_80C3F7C, 0x0000000E,
    0x00000000, 0x00000003, (u32)&GmMoveCursor_OnLoop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapPath_20 + 0x38, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmScrollManage_OnEnd, 0x00000002,
    (u32)&sub_80C40BC, 0x00000003, (u32)&GmScrollManage_OnLoop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapPath_20 + 0x4C, 0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_101, 0x0000000E,
    0x00000000, 0x00000002, (u32)&GmPalFade_Init, 0x00000003, (u32)&GmPalFade_Loop, 0x00000000,
    0x00000000, 0x00000001, (u32)&gWorldmapPath_20 + 0x5C, 0x0008000F, 0x00000000, 0x00000004,
    (u32)&GmapBaseEntry_OnEnd, 0x00000002, (u32)&GmapBaseEntry_Init, 0x0000000E, 0x00000000, 0x00000002,
    (u32)&GmapBaseEntry_2, 0x0000000E, 0x00000000, 0x00000002, (u32)&GmapBaseEntry_0, 0x00000003,
    (u32)&GmapBaseEntry_1, 0x00000000, 0x00000000, 0x00000001, (u32)&gWorldmapPath_20 + 0x6C, 0x0008000F,
    0x00000000, 0x00000004, (u32)&GmapMuEntry_OnEnd, 0x00000002, (u32)&GmapMuEntry_Init, 0x0000000E,
    0x00000000, 0x00000002, (u32)&GmapMuEntry_0, 0x00000003, (u32)&GmapMuEntry_1, 0x00000000,
    0x00000000, 0x00000001, (u32)&gWorldmapPath_20 + 0x6C, 0x0008000F, 0x00000000, 0x00000004,
    (u32)&nullsub_102, 0x00000002, (u32)&GmMuEntry_Init, 0x0000000E, 0x00000000, 0x0000000B,
    0x00000000, 0x00000010, 0x00000000, 0x0001000B, 0x00000000, 0x00000002,
    (u32)&GmMuEntry_0, 0x00000003, (u32)&GmMuEntry_2, 0x0000000C, 0x00000000, 0x0001000B,
    0x00000000, 0x00000002, (u32)&GmMuEntry_1, 0x00000003, (u32)&GmMuEntry_3, 0x0000000C,
    0x00000000, 0x0003000B, 0x00000000, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapPath_20 + 0x7C, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapLineFade_OnEnd, 0x00000002,
    (u32)&GmapLineFade_Init, 0x0000000E, 0x00000000, 0x00000003, (u32)&GmapLineFade_Loop, 0x00000000,
    0x00000000, 0x00000001, (u32)&gWmSkirmish_PositionsC + 0x8, 0x0008000F, 0x00000000, 0x00000004,
    (u32)&gap_000C532C + 0x1, 0x0000000E, 0x00000000, 0x00000002, (u32)&GmTmConfront_InitUnitPositionA, 0x00000003,
    (u32)&GmTmConfront_Loop_MoveUnitPositions, 0x00000002, (u32)&GmTmConfront_InitUnitPositionB, 0x0000000E, 0x00000000, 0x00000003,
    (u32)&GmTmConfront_Loop_MoveUnitPositions, 0x00000002, (u32)&GmTmConfront_InitUnitPositionC, 0x0000000E, 0x00000000, 0x00000003,
    (u32)&GmTmConfront_Loop_MoveUnitPositions, 0x00000002, (u32)&GmTmConfront_InitUnitPositionB, 0x0000000E, 0x00000000, 0x00000003,
    (u32)&GmTmConfront_Loop_MoveUnitPositions, 0x00000002, (u32)&GmTmConfront_InitUnitPositionC, 0x0000000E, 0x00000000, 0x00000003,
    (u32)&GmTmConfront_Loop_MoveUnitPositions, 0x00000002, (u32)&GmTmConfront_StartAnim, 0x00000003, (u32)&GmTmConfront_WaitForAnim, 0x00000000,
    0x00000000, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0x1C, (u32)&gHelpInfo_WorldmapStatus + 0xA8, 0x00000000, 0x000050A8,
    0x00000000, (u32)&WorldmapStatus_GetCharDescription, (u32)&gHelpInfo_WorldmapStatus, (u32)&gHelpInfo_WorldmapStatus + 0x38, (u32)&gHelpInfo_WorldmapStatus + 0xC4, 0x00000000,
    0x066B6888, 0x00000000, (u32)&WorldmapStatus_GetClassDescription, (u32)&gHelpInfo_WorldmapStatus + 0x1C, (u32)&gHelpInfo_WorldmapStatus + 0x70, (u32)&gHelpInfo_WorldmapStatus + 0xE0,
    (u32)&gHelpInfo_WorldmapStatus + 0x54, 0x04D77888, 0x00000000, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0x1C, (u32)&gHelpInfo_WorldmapStatus + 0x70,
    (u32)&gHelpInfo_WorldmapStatus + 0x38, 0x00000000, 0x04D878A8, 0x00000000, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0x38,
    0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0xE0, 0x00000000, 0x04D98888, 0x00000000, 0x00000000,
    0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0xA8, 0x00000000, (u32)&gHelpInfo_WorldmapStatus, 0x06083020, 0x00000000,
    0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0x8C, (u32)&gHelpInfo_WorldmapStatus + 0xC4, 0x00000000, (u32)&gHelpInfo_WorldmapStatus, 0x06094810,
    0x00000000, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0xA8, (u32)&gHelpInfo_WorldmapStatus + 0xE0, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0x1C,
    0x06765810, 0x00000000, 0x00000000, (u32)&gHelpInfo_WorldmapStatus + 0xC4, 0x00000000, 0x00000000,
    (u32)&gHelpInfo_WorldmapStatus + 0x70, 0x06737818, 0x00000000, 0x00000000, 0x60000000, 0x00000000,
    0x00006800, 0x70000000, 0x80000000, 0x00007800, 0x0008000F, 0x00000000,
    0x00000003, (u32)&WorldmapStatus_PutTimeAndGold, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_WorldmapStatusUi[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_MARK(0x8), PROC_SET_END_CB(WorldmapStatus_OnEnd), PROC_CALL(WorldmapStatus_Init), PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend), PROC_SLEEP(0x1), PROC_CALL(WorldmapStatus_InitGfx), PROC_CALL(StartGreenText),
    PROC_CALL(WorldmapStatus_InitDetails), PROC_CALL(WorldmapStatus_0), PROC_START_CHILD((void*)((u8*)gBgConfig_WorldmapStatus + 0x18)), PROC_REPEAT(WorldmapStatus_Loop_KeyHandler),
    PROC_CALL(WorldmapStatus_1), PROC_CALL(EndAllMus), PROC_CALL(BMapDispResume), PROC_CALL(UnlockGame),
    PROC_END,
};
u32 frontier_df3_ending_gap0_r0[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    0x04000001, 0x00000000, 0x04000001, 0x00001000, 0x04000001, 0x00002000,
    0x04000001, 0x00003000, 0x04000001, 0x00004000, 0x04000001, 0x00005000,
    0x04000001, 0x00006000, 0x04000001, 0x00007000, 0x04000001, 0x00008000,
    0x04000001, 0x00009000, 0x04000001, 0x0000A000, 0x04000001, 0x0000B000,
    (u32)&frontier_df3_ending_gap0_r0, 0x00F8F844, (u32)&frontier_df3_ending_gap0_r0 + 0x8, 0x00F80044, (u32)&frontier_df3_ending_gap0_r0 + 0x10, 0x0000F844,
    (u32)&frontier_df3_ending_gap0_r0 + 0x18, 0x00000044, (u32)&frontier_df3_ending_gap0_r0 + 0x20, 0x00F0F004, (u32)&frontier_df3_ending_gap0_r0 + 0x28, 0x00F00004,
    (u32)&frontier_df3_ending_gap0_r0 + 0x30, 0x0000F004, (u32)&frontier_df3_ending_gap0_r0 + 0x38, 0x00000004, (u32)&frontier_df3_ending_gap0_r0 + 0x40, 0x00E0E000,
    (u32)&frontier_df3_ending_gap0_r0 + 0x48, 0x00E00000, (u32)&frontier_df3_ending_gap0_r0 + 0x50, 0x0000E000, (u32)&frontier_df3_ending_gap0_r0 + 0x58, 0x00000000,
    0x00000001, (u32)&gWmSkirmish_PositionsC + 0x1C, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapEffectPal_OnEnd,
    0x00000002, (u32)&GmapEffectPal_Init, 0x00000003, (u32)&GmapEffectPal_Loop, 0x00000010, 0x00000000,
    0x00000000, 0x00000000, 0x00000001, (u32)&gWmSkirmish_PositionsC + 0x2C, 0x0008000F, 0x00000000,
    0x00000004, (u32)&GmapEffect_OnEnd, 0x00000002, (u32)&GmapEffect_Init, 0x0000000E, 0x00000000,
    0x00000003, (u32)&GmapEffect_Loop, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_GmapSogu[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)gWmSkirmish_PositionsC + 0x38)), PROC_MARK(0x8), PROC_SET_END_CB(GmapSogu_End), PROC_CALL(GmapSogu_Init),
    PROC_REPEAT(GmapSogu_Loop1), PROC_REPEAT(GmapSogu_Loop2), PROC_END,
};
struct ProcCmd ProcScr_GmapTimeMons[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x9)), PROC_MARK(0x8), PROC_SET_END_CB(nullsub_104), PROC_CALL(GmapTimeMons_Init),
    PROC_REPEAT(GmapTimeMons_ExecMonsterMergeMu), PROC_SLEEP(0x3C), PROC_REPEAT(GmapTimeMons_WaitSpriteDone), PROC_LABEL(0x0),
    PROC_END,
};
struct ProcCmd ProcScr_GmapRmUpdateDirect[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x19)), PROC_MARK(0x8), PROC_REPEAT(GmapRmUpdateDirect_Loop), PROC_END,
};
struct ProcCmd ProcScr_GmapRmUpdateExt[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x19)), PROC_MARK(0x8), PROC_SET_END_CB(GmapRmUpdateExt_End), PROC_SLEEP(0x0),
    PROC_REPEAT(GmapRmUpdateExt_Delay), PROC_CALL(GmapRmUpdateExt_InitPosition), PROC_REPEAT(GmapRmUpdateExt_ScrollPosition), PROC_END,
};
/* byte-neutral alias: data_08AC2510 == ProcScr_GmapRM (same address) */
extern const u32 data_08AC2510 __attribute__((alias("ProcScr_GmapRM")));
struct ProcCmd ProcScr_GmapRM[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x29)), PROC_MARK(0x8), PROC_SET_END_CB(GmapRm_OnEnd), PROC_CALL(GmapRm_InitNop),
    PROC_SLEEP(0x1), PROC_CALL(GmapRm_StartUpdateDirect), PROC_CALL(GmapRm_Goto0IfFlag0), PROC_CALL(GmapRm_InitBlend),
    PROC_REPEAT(GmapRm_BlendIn), PROC_LABEL(0x0), PROC_CALL(GmapRm_1), PROC_REPEAT(GmapRm_Blocking),
    PROC_CALL(GmapRm_Goto1IfFlag1), PROC_CALL(GmapRm_0), PROC_SLEEP(0x1), PROC_REPEAT(GmapRm_BlendOut),
    PROC_LABEL(0x1), PROC_CALL(GmapRm_2), PROC_END,
};
struct ProcCmd ProcScr_GmapRmBaPalAnim1[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x31)), PROC_MARK(0x8), PROC_SET_END_CB(GmapRmBaPalAnim1_End), PROC_CALL(GmapRmBaPalAnim1_Init),
    PROC_SLEEP(0x1), PROC_LABEL(0x0), PROC_REPEAT(GmapRmBaPalAnim1_Loop1), PROC_SLEEP(0x2),
    PROC_REPEAT(GmapRmBaPalAnim1_Loop2), PROC_SLEEP(0x2), PROC_GOTO(0x0), PROC_END,
};
u32 frontier_df3_ending_gap0_r1[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    0x00000001, (u32)&GfxSet_WmNationMap + 0x60, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapRmBorder1_End,
    0x00000002, (u32)&GmapRmBorder1_0, 0x00000003, (u32)&GmapRmBorder1_NationMergeIn, 0x00000002, (u32)&GmapRmBorder1_2,
    0x00000003, (u32)&GmapRmBorder1_3, 0x0001000B, 0x00000000, 0x00000003, (u32)&GmapRmBorder1_4,
    0x00000003, (u32)&GmapRmBorder1_3, 0x00000002, (u32)&GmapRmBorder1_1, 0x00000003, (u32)&GmapRmBorder1_NationMergeOut,
    0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_WmDotPalAnim[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x31)), PROC_MARK(0x8), PROC_SET_END_CB(WmDotPalAnim_OnEnd), PROC_CALL(WmDotPalAnim_Init),
    PROC_SLEEP(0x1), PROC_LABEL(0x0), PROC_REPEAT(WmDotPalAnim_Loop1), PROC_SLEEP(0x2),
    PROC_REPEAT(WmDotPalAnim_Loop2), PROC_SLEEP(0x2), PROC_GOTO(0x0), PROC_END,
};
u32 frontier_df3_ending_gap0_r2[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    0x00000001, 0x00000000, 0x00000001, (u32)&GfxSet_WmNationMap + 0x60, 0x0008000F, 0x00000000,
    0x00000004, (u32)&WmPlaceDot_OnEnd, 0x00000002, (u32)&WmPlaceDot_Init, 0x00000003, (u32)&WmPlaceDot_Loop1,
    0x0001000B, 0x00000000, 0x00000003, (u32)&WmPlaceDot_Loop2, 0x00000003, (u32)&WmPlaceDot_Loop1,
    0x00000000, 0x00000000, 0x00000001, (u32)&GfxSet_WmNationMap + 0x70, 0x0008000F, 0x00000000,
    0x00000004, (u32)&GmapAutoMu_OnEnd, 0x0000000E, 0x00000000, 0x00000003, (u32)&GmapAutoMu_WaitInitialDelay,
    0x00000002, (u32)&GmapAutoMu_0, 0x00000002, (u32)&GmapAutoMu_2, 0x0000000B, 0x00000000,
    0x00000002, (u32)&GmapAutoMu_StartFadeIn, 0x00000003, (u32)&GmapAutoMu_WaitForFadeEnd, 0x00000002, (u32)&GmapAutoMu_2,
    0x0001000B, 0x00000000, 0x00000002, (u32)&GmapAutoMu_3, 0x0003000C, 0x00000000,
    0x0002000B, 0x00000000, 0x00000002, (u32)&GmapAutoMu_4, 0x0003000B, 0x00000000,
    0x00000003, (u32)&GmapAutoMu_5, 0x00000002, (u32)&GmapAutoMu_1, 0x0005000C, 0x00000000,
    0x0004000B, 0x00000000, 0x00000002, (u32)&GmapAutoMu_StartFadeOut, 0x00000003, (u32)&GmapAutoMu_WaitForFadeEnd,
    0x0005000B, 0x00000000, 0x00000000, 0x00000000, 0x40080005, 0x0200C008,
    0xC0484008, 0x40080208, 0x0210C088, 0x80C88008, 0x80080218, 0x021A40D8,
    0x0008000F, 0x00000000, 0x00000002, (u32)&WmText_Init, 0x0000000E, 0x00000000,
    0x00000003, (u32)&WmText_Loop_DrawText, 0x00000000, 0x00000000, 0x08050201, 0x00010205,
    0x00000001, (u32)&gWorldmapRadar_0 + 0x14, 0x0008000F, 0x00000000, 0x00000015, 0x00000000,
    0x0000000E, 0x00000000, 0x00000002, (u32)&GMapRadar_Init, 0x0000000B, 0x00000000,
    0x00000003, (u32)&GMapRadar_1, 0x00000003, (u32)&GMapRadar_SlideIn, 0x00000003, (u32)&GMapRadar_2,
    0x00000003, (u32)&GMapRadar_SlideOut, 0x0000000C, 0x00000000, 0x00000000, 0x00000000,
    0x0008000F, 0x00000000, 0x00000002, (u32)&StartWorldMapMinimapCore, 0x00000000, 0x00000000,
    0x00000001, (u32)&gWorldmapRadar_0 + 0x20, 0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_107,
    0x00000002, (u32)&GMapBaseMenu_Init, 0x0000000B, 0x00000000, 0x00000002, (u32)&GMapBaseMenu_StartItemScreen,
    0x0000000E, 0x00000000, 0x00000002, (u32)&GMapBaseMenu_ShopFromItemScreen, 0x0001000B, 0x00000000,
    0x00000002, (u32)&GMapBaseMenu_StartArmory, 0x0000000E, 0x00000000, 0x0004000C, 0x00000000,
    0x0002000B, 0x00000000, 0x00000002, (u32)&GMapBaseMenu_StartVendor, 0x0000000E, 0x00000000,
    0x0004000C, 0x00000000, 0x0003000B, 0x00000000, 0x00000002, (u32)&GMapBaseMenu_StartSecretShop,
    0x0000000E, 0x00000000, 0x0004000C, 0x00000000, 0x0004000B, 0x00000000,
    0x00000002, (u32)&GMapBaseMenu_RestoreBgm, 0x0000000C, 0x00000000, 0x0005000B, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00020001, 0x00150014, 0x001F001C,
    0x00280020, 0x00000000, 0x00010000, 0x00030002, 0x00150014, 0x001F0016,
    0x002D0020, 0x0000002E, 0x00000000, 0x00030000, 0x00140005, 0x001C0016,
    0x0020001F, 0x00280026, 0x002E002D, 0x00000033, 0x00000000, 0x00000000,
    0x00030000, 0x00140005, 0x001C0016, 0x0020001F, 0x00280026, 0x002E002D,
    0x00000033, 0x00000000, 0x00000000, 0x00020000, 0x000D0003, 0x00160015,
    0x001A001C, 0x00280020, 0x002E0024, 0x00310034, 0x00000000, 0x00070004,
    0x0012000D, 0x001A0017, 0x0021001E, 0x002A0024, 0x0031002F, 0x00340033,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x004B0000,
    0x00500056, 0x003F0038, 0x0000006C, 0x00000000, 0x00380000, 0x003F0039,
    0x00450040, 0x004C004B, 0x00690058, 0x006D006C, 0x0070006F, 0x00000000,
    0x003A0039, 0x00450040, 0x004B0046, 0x0050004C, 0x006E006C, 0x0000006F,
    0x00000000, 0x00380000, 0x003F0039, 0x00450040, 0x004C004B, 0x00690058,
    0x006D006C, 0x0070006F, 0x00390000, 0x0040003A, 0x00460045, 0x004C004B,
    0x006C0050, 0x006F006E, 0x00000000, 0x00390000, 0x003F003A, 0x00410040,
    0x00460045, 0x0050004C, 0x006C0059, 0x006E006D, 0x0000006F, 0x00390000,
    0x0040003A, 0x00450041, 0x004C0046, 0x006D004D, 0x006F006E, 0x00000000,
    0x003A0039, 0x00410040, 0x00460045, 0x004D004C, 0x006C0050, 0x006F006D,
    0x0000006E, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00120000, 0x001E002A, 0x000B0031, 0x003B0042, 0x00510048, 0x005B004D,
    0x0061005C, 0x0064006B, 0x00660065, 0x00680067, 0x00000097, 0x002A0012,
    0x0031001E, 0x00420019, 0x0049003B, 0x004D004F, 0x005C005B, 0x006B0063,
    0x00650064, 0x00670066, 0x00970068, 0x00000000, 0x00000000, 0x001D000C,
    0x00230086, 0x003C0032, 0x004E0043, 0x005C005B, 0x005E005D, 0x0060005F,
    0x00650064, 0x00670066, 0x00970068, 0x00000000, 0x00000000, 0x00000000,
};
/* frontier_df3_ending_001 (JP 0x08AC3AA8..0x08AC4C88, 4576 B) is NOT compressed --
 * the 0x131D/0x111D leading u16 is a TSA width/height header, not an LZ77 0x10 tag.
 * It is four clean raw TSA tilemaps concatenated. Split byte-exact into descriptively
 * named JP-only sub-assets (each still a verbatim TSA binary -- fe8u-parity floor,
 * just NAMED), keeping the table-pinned base symbol at offset 0 so any external
 * base+offset references still resolve:
 *   Tsa_DfEnding001_0  [0x000,0x4B4)  1204 B  hdr 0x131D
 *   Tsa_DfEnding001_1  [0x4B4,0x8F0)  1084 B  hdr 0x111D
 *   Tsa_DfEnding001_2  [0x8F0,0xDA4)  1204 B  hdr 0x131D
 *   Tsa_DfEnding001_3  [0xDA4,0x11E0) 1084 B  hdr 0x111D
 */
u8 frontier_df3_ending_001_AC3AA8[] __attribute__((section(".data.frontier_df3_ending.gap1"))) = INCBIN_U8(
    "graphics/frontier_df3_ending/Tsa_DfEnding001_0.bin",
    "graphics/frontier_df3_ending/Tsa_DfEnding001_1.bin",
    "graphics/frontier_df3_ending/Tsa_DfEnding001_2.bin",
    "graphics/frontier_df3_ending/Tsa_DfEnding001_3.bin");
/* frontier_df3_ending_002 (JP 0x08AC50A4..0x08AC6C98, 7156 B) is also NOT compressed
 * (0x131D TSA header). Split byte-exact into two named JP-only sub-assets, keeping the
 * base symbol at offset 0:
 *   Tsa_DfEnding002         [0x000,0x4B4)  1204 B  raw TSA tilemap (hdr 0x131D)
 *   dat_DfEnding002_PalGfx  [0x4B4,0x1BF4) 5952 B  an opaque data block that is NOT a
 *     clean BGR555 palette (39% of its u16 have bit15 set, so it must not be typed as
 *     a .gbapal/Pal_). It leads with a 32-colour BGR555 palette (64 B, two gradient
 *     banks) followed by 4bpp-format graphics data (5888 B, 184 tiles). Kept as one
 *     verbatim byte-exact blob (named, not further decoded).
 */
u8 frontier_df3_ending_002_AC50A4[] __attribute__((section(".data.frontier_df3_ending.gap2"))) = INCBIN_U8(
    "graphics/frontier_df3_ending/Tsa_DfEnding002.bin",
    "graphics/frontier_df3_ending/dat_DfEnding002_PalGfx.bin");
