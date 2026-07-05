#include "global.h"
#include "proc.h"

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

__asm__(
"	.section .data.frontier_df3_ending.gap0, \"aw\", %progbits\n"
"	.global frontier_df3_ending_000_AC1BC0\n"
"frontier_df3_ending_000_AC1BC0:\n"
"	.4byte 0x00080A14, 0x00000000, MenuItemDef_WMNodeMenu, WMNodeMenu_OnInit, WMNodeMenu_OnEnd, 0x00000000\n"
"	.4byte WMNodeMenu_OnCancel, sub_8050294, MenuStdHelpBox, 0x000A0113, 0x000A0101, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x08001000, 0x00001000, 0x00000000\n"
"	.4byte 0x00000001, gWorldmapPath_20 + 0x8, 0x0008000F, 0x00000000, 0x00000004, GmMuPrim_OnEnd_Null\n"
"	.4byte 0x00000002, GmMuPrim_OnInit, 0x0000000B, 0x00000000, 0x00000003, GmMuPrim_Loop_Null\n"
"	.4byte 0x0001000B, 0x00000000, 0x00000002, GmMuPrim_0, 0x00000003, GmMuPrim_1\n"
"	.4byte 0x0000000C, 0x00000000, 0x0002000B, 0x00000000, 0x00000002, GmMuPrim_2\n"
"	.4byte 0x00000003, GmMuPrim_3, 0x0000000C, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gWorldmapPath_20 + 0x18, 0x0008000F, 0x00000000, 0x00000004, nullsub_100\n"
"	.4byte 0x00000002, GmMu_OnInit, 0x00000010, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x09090908, 0x00090909, 0x00020010, 0x00000096, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000097, 0x00000000, 0x00000000, 0x00000000, 0x00020020\n"
"	.4byte 0x000000A4, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x000000A5, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00030015, 0x0000009A\n"
"	.4byte 0x009B0000, 0x00000000, 0x00000000, 0x00000000, 0x0000009C, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00140000, 0x00A00001, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00140000, 0x00A60001, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00140000, 0x02E00001, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00180000, 0x030F0001, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x030E0000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0xFF0101FF, 0xFFFFFFFF, 0xFF01FFFF, 0xFF01FFFF\n"
"	.4byte 0x03040301, 0x07030001, 0x00020609, 0x00000001, gWorldmapPath_20 + 0x20, 0x0008000F\n"
"	.4byte 0x00000000, 0x00000015, 0x00000000, 0x0000000E, 0x00000000, 0x00000002\n"
"	.4byte GMapPI_Init, 0x0000000B, 0x00000000, 0x00000003, GMapPI_WaitForNodeLoop, 0x00000003\n"
"	.4byte GMapPI_ShowInit, 0x00000003, GMapPI_ShowLoop, 0x00000003, GMapPI_TrackCursorLoop, 0x00000002\n"
"	.4byte GMapPI_RequestHide, 0x00000003, GMapPI_HideLoop, 0x0000000C, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x0008000F, 0x00000000, 0x00000014, DoesBMXFADEExist, 0x00000002\n"
"	.4byte StartWorldMapPlayerInterface, 0x00000000, 0x00000000, 0x00000001, gWorldmapPath_20 + 0x24, 0x0008000F\n"
"	.4byte 0x00000000, 0x00000004, GmMoveCursor_OnEnd, 0x00000002, sub_80C3F7C, 0x0000000E\n"
"	.4byte 0x00000000, 0x00000003, GmMoveCursor_OnLoop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapPath_20 + 0x38, 0x0008000F, 0x00000000, 0x00000004, GmScrollManage_OnEnd, 0x00000002\n"
"	.4byte sub_80C40BC, 0x00000003, GmScrollManage_OnLoop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapPath_20 + 0x4C, 0x0008000F, 0x00000000, 0x00000004, nullsub_101, 0x0000000E\n"
"	.4byte 0x00000000, 0x00000002, GmPalFade_Init, 0x00000003, GmPalFade_Loop, 0x00000000\n"
"	.4byte 0x00000000, 0x00000001, gWorldmapPath_20 + 0x5C, 0x0008000F, 0x00000000, 0x00000004\n"
"	.4byte GmapBaseEntry_OnEnd, 0x00000002, GmapBaseEntry_Init, 0x0000000E, 0x00000000, 0x00000002\n"
"	.4byte GmapBaseEntry_2, 0x0000000E, 0x00000000, 0x00000002, GmapBaseEntry_0, 0x00000003\n"
"	.4byte GmapBaseEntry_1, 0x00000000, 0x00000000, 0x00000001, gWorldmapPath_20 + 0x6C, 0x0008000F\n"
"	.4byte 0x00000000, 0x00000004, GmapMuEntry_OnEnd, 0x00000002, GmapMuEntry_Init, 0x0000000E\n"
"	.4byte 0x00000000, 0x00000002, GmapMuEntry_0, 0x00000003, GmapMuEntry_1, 0x00000000\n"
"	.4byte 0x00000000, 0x00000001, gWorldmapPath_20 + 0x6C, 0x0008000F, 0x00000000, 0x00000004\n"
"	.4byte nullsub_102, 0x00000002, GmMuEntry_Init, 0x0000000E, 0x00000000, 0x0000000B\n"
"	.4byte 0x00000000, 0x00000010, 0x00000000, 0x0001000B, 0x00000000, 0x00000002\n"
"	.4byte GmMuEntry_0, 0x00000003, GmMuEntry_2, 0x0000000C, 0x00000000, 0x0001000B\n"
"	.4byte 0x00000000, 0x00000002, GmMuEntry_1, 0x00000003, GmMuEntry_3, 0x0000000C\n"
"	.4byte 0x00000000, 0x0003000B, 0x00000000, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapPath_20 + 0x7C, 0x0008000F, 0x00000000, 0x00000004, GmapLineFade_OnEnd, 0x00000002\n"
"	.4byte GmapLineFade_Init, 0x0000000E, 0x00000000, 0x00000003, GmapLineFade_Loop, 0x00000000\n"
"	.4byte 0x00000000, 0x00000001, gWmSkirmish_PositionsC + 0x8, 0x0008000F, 0x00000000, 0x00000004\n"
"	.4byte gap_000C532C + 0x1, 0x0000000E, 0x00000000, 0x00000002, GmTmConfront_InitUnitPositionA, 0x00000003\n"
"	.4byte GmTmConfront_Loop_MoveUnitPositions, 0x00000002, GmTmConfront_InitUnitPositionB, 0x0000000E, 0x00000000, 0x00000003\n"
"	.4byte GmTmConfront_Loop_MoveUnitPositions, 0x00000002, GmTmConfront_InitUnitPositionC, 0x0000000E, 0x00000000, 0x00000003\n"
"	.4byte GmTmConfront_Loop_MoveUnitPositions, 0x00000002, GmTmConfront_InitUnitPositionB, 0x0000000E, 0x00000000, 0x00000003\n"
"	.4byte GmTmConfront_Loop_MoveUnitPositions, 0x00000002, GmTmConfront_InitUnitPositionC, 0x0000000E, 0x00000000, 0x00000003\n"
"	.4byte GmTmConfront_Loop_MoveUnitPositions, 0x00000002, GmTmConfront_StartAnim, 0x00000003, GmTmConfront_WaitForAnim, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_WorldmapStatus + 0x1C, gHelpInfo_WorldmapStatus + 0xA8, 0x00000000, 0x000050A8\n"
"	.4byte 0x00000000, WorldmapStatus_GetCharDescription, gHelpInfo_WorldmapStatus, gHelpInfo_WorldmapStatus + 0x38, gHelpInfo_WorldmapStatus + 0xC4, 0x00000000\n"
"	.4byte 0x066B6888, 0x00000000, WorldmapStatus_GetClassDescription, gHelpInfo_WorldmapStatus + 0x1C, gHelpInfo_WorldmapStatus + 0x70, gHelpInfo_WorldmapStatus + 0xE0\n"
"	.4byte gHelpInfo_WorldmapStatus + 0x54, 0x04D77888, 0x00000000, 0x00000000, gHelpInfo_WorldmapStatus + 0x1C, gHelpInfo_WorldmapStatus + 0x70\n"
"	.4byte gHelpInfo_WorldmapStatus + 0x38, 0x00000000, 0x04D878A8, 0x00000000, 0x00000000, gHelpInfo_WorldmapStatus + 0x38\n"
"	.4byte 0x00000000, gHelpInfo_WorldmapStatus + 0xE0, 0x00000000, 0x04D98888, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_WorldmapStatus + 0xA8, 0x00000000, gHelpInfo_WorldmapStatus, 0x06083020, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_WorldmapStatus + 0x8C, gHelpInfo_WorldmapStatus + 0xC4, 0x00000000, gHelpInfo_WorldmapStatus, 0x06094810\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_WorldmapStatus + 0xA8, gHelpInfo_WorldmapStatus + 0xE0, 0x00000000, gHelpInfo_WorldmapStatus + 0x1C\n"
"	.4byte 0x06765810, 0x00000000, 0x00000000, gHelpInfo_WorldmapStatus + 0xC4, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_WorldmapStatus + 0x70, 0x06737818, 0x00000000, 0x00000000, 0x60000000, 0x00000000\n"
"	.4byte 0x00006800, 0x70000000, 0x80000000, 0x00007800, 0x0008000F, 0x00000000\n"
"	.4byte 0x00000003, WorldmapStatus_PutTimeAndGold, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_WorldmapStatusUi[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_MARK(0x8), PROC_SET_END_CB(WorldmapStatus_OnEnd), PROC_CALL(WorldmapStatus_Init), PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend), PROC_SLEEP(0x1), PROC_CALL(WorldmapStatus_InitGfx), PROC_CALL(StartGreenText),
    PROC_CALL(WorldmapStatus_InitDetails), PROC_CALL(WorldmapStatus_0), PROC_START_CHILD((void*)((u8*)gBgConfig_WorldmapStatus + 0x18)), PROC_REPEAT(WorldmapStatus_Loop_KeyHandler),
    PROC_CALL(WorldmapStatus_1), PROC_CALL(EndAllMus), PROC_CALL(BMapDispResume), PROC_CALL(UnlockGame),
    PROC_END,
};
__asm__(
"	.section .data.frontier_df3_ending.gap0, \"aw\", %progbits\n"
"	.4byte 0x04000001, 0x00000000, 0x04000001, 0x00001000, 0x04000001, 0x00002000\n"
"	.4byte 0x04000001, 0x00003000, 0x04000001, 0x00004000, 0x04000001, 0x00005000\n"
"	.4byte 0x04000001, 0x00006000, 0x04000001, 0x00007000, 0x04000001, 0x00008000\n"
"	.4byte 0x04000001, 0x00009000, 0x04000001, 0x0000A000, 0x04000001, 0x0000B000\n"
"	.4byte ProcScr_WorldmapStatusUi + 0x88, 0x00F8F844, ProcScr_WorldmapStatusUi + 0x90, 0x00F80044, ProcScr_WorldmapStatusUi + 0x98, 0x0000F844\n"
"	.4byte ProcScr_WorldmapStatusUi + 0xA0, 0x00000044, ProcScr_WorldmapStatusUi + 0xA8, 0x00F0F004, ProcScr_WorldmapStatusUi + 0xB0, 0x00F00004\n"
"	.4byte ProcScr_WorldmapStatusUi + 0xB8, 0x0000F004, ProcScr_WorldmapStatusUi + 0xC0, 0x00000004, ProcScr_WorldmapStatusUi + 0xC8, 0x00E0E000\n"
"	.4byte ProcScr_WorldmapStatusUi + 0xD0, 0x00E00000, ProcScr_WorldmapStatusUi + 0xD8, 0x0000E000, ProcScr_WorldmapStatusUi + 0xE0, 0x00000000\n"
"	.4byte 0x00000001, gWmSkirmish_PositionsC + 0x1C, 0x0008000F, 0x00000000, 0x00000004, GmapEffectPal_OnEnd\n"
"	.4byte 0x00000002, GmapEffectPal_Init, 0x00000003, GmapEffectPal_Loop, 0x00000010, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gWmSkirmish_PositionsC + 0x2C, 0x0008000F, 0x00000000\n"
"	.4byte 0x00000004, GmapEffect_OnEnd, 0x00000002, GmapEffect_Init, 0x0000000E, 0x00000000\n"
"	.4byte 0x00000003, GmapEffect_Loop, 0x00000000, 0x00000000\n"
);
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
__asm__(
"	.section .data.frontier_df3_ending.gap0, \"aw\", %progbits\n"
"	.global data_08AC2510\n"
"data_08AC2510:\n"
);
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
__asm__(
"	.section .data.frontier_df3_ending.gap0, \"aw\", %progbits\n"
"	.4byte 0x00000001, GfxSet_WmNationMap + 0x60, 0x0008000F, 0x00000000, 0x00000004, GmapRmBorder1_End\n"
"	.4byte 0x00000002, GmapRmBorder1_0, 0x00000003, GmapRmBorder1_NationMergeIn, 0x00000002, GmapRmBorder1_2\n"
"	.4byte 0x00000003, GmapRmBorder1_3, 0x0001000B, 0x00000000, 0x00000003, GmapRmBorder1_4\n"
"	.4byte 0x00000003, GmapRmBorder1_3, 0x00000002, GmapRmBorder1_1, 0x00000003, GmapRmBorder1_NationMergeOut\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_WmDotPalAnim[] __attribute__((section(".data.frontier_df3_ending.gap0"))) = {
    PROC_NAME((void*)((u8*)WmMonsterGenerateRates_XmapEphraim + 0x31)), PROC_MARK(0x8), PROC_SET_END_CB(WmDotPalAnim_OnEnd), PROC_CALL(WmDotPalAnim_Init),
    PROC_SLEEP(0x1), PROC_LABEL(0x0), PROC_REPEAT(WmDotPalAnim_Loop1), PROC_SLEEP(0x2),
    PROC_REPEAT(WmDotPalAnim_Loop2), PROC_SLEEP(0x2), PROC_GOTO(0x0), PROC_END,
};
__asm__(
"	.section .data.frontier_df3_ending.gap0, \"aw\", %progbits\n"
"	.4byte 0x00000001, 0x00000000, 0x00000001, GfxSet_WmNationMap + 0x60, 0x0008000F, 0x00000000\n"
"	.4byte 0x00000004, WmPlaceDot_OnEnd, 0x00000002, WmPlaceDot_Init, 0x00000003, WmPlaceDot_Loop1\n"
"	.4byte 0x0001000B, 0x00000000, 0x00000003, WmPlaceDot_Loop2, 0x00000003, WmPlaceDot_Loop1\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, GfxSet_WmNationMap + 0x70, 0x0008000F, 0x00000000\n"
"	.4byte 0x00000004, GmapAutoMu_OnEnd, 0x0000000E, 0x00000000, 0x00000003, GmapAutoMu_WaitInitialDelay\n"
"	.4byte 0x00000002, GmapAutoMu_0, 0x00000002, GmapAutoMu_2, 0x0000000B, 0x00000000\n"
"	.4byte 0x00000002, GmapAutoMu_StartFadeIn, 0x00000003, GmapAutoMu_WaitForFadeEnd, 0x00000002, GmapAutoMu_2\n"
"	.4byte 0x0001000B, 0x00000000, 0x00000002, GmapAutoMu_3, 0x0003000C, 0x00000000\n"
"	.4byte 0x0002000B, 0x00000000, 0x00000002, GmapAutoMu_4, 0x0003000B, 0x00000000\n"
"	.4byte 0x00000003, GmapAutoMu_5, 0x00000002, GmapAutoMu_1, 0x0005000C, 0x00000000\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000002, GmapAutoMu_StartFadeOut, 0x00000003, GmapAutoMu_WaitForFadeEnd\n"
"	.4byte 0x0005000B, 0x00000000, 0x00000000, 0x00000000, 0x40080005, 0x0200C008\n"
"	.4byte 0xC0484008, 0x40080208, 0x0210C088, 0x80C88008, 0x80080218, 0x021A40D8\n"
"	.4byte 0x0008000F, 0x00000000, 0x00000002, WmText_Init, 0x0000000E, 0x00000000\n"
"	.4byte 0x00000003, WmText_Loop_DrawText, 0x00000000, 0x00000000, MenuStdHelpBox + 0x34, 0x00010205\n"
"	.4byte 0x00000001, gWorldmapRadar_0 + 0x14, 0x0008000F, 0x00000000, 0x00000015, 0x00000000\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, GMapRadar_Init, 0x0000000B, 0x00000000\n"
"	.4byte 0x00000003, GMapRadar_1, 0x00000003, GMapRadar_SlideIn, 0x00000003, GMapRadar_2\n"
"	.4byte 0x00000003, GMapRadar_SlideOut, 0x0000000C, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x0008000F, 0x00000000, 0x00000002, StartWorldMapMinimapCore, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gWorldmapRadar_0 + 0x20, 0x0008000F, 0x00000000, 0x00000004, nullsub_107\n"
"	.4byte 0x00000002, GMapBaseMenu_Init, 0x0000000B, 0x00000000, 0x00000002, GMapBaseMenu_StartItemScreen\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, GMapBaseMenu_ShopFromItemScreen, 0x0001000B, 0x00000000\n"
"	.4byte 0x00000002, GMapBaseMenu_StartArmory, 0x0000000E, 0x00000000, 0x0004000C, 0x00000000\n"
"	.4byte 0x0002000B, 0x00000000, 0x00000002, GMapBaseMenu_StartVendor, 0x0000000E, 0x00000000\n"
"	.4byte 0x0004000C, 0x00000000, 0x0003000B, 0x00000000, 0x00000002, GMapBaseMenu_StartSecretShop\n"
"	.4byte 0x0000000E, 0x00000000, 0x0004000C, 0x00000000, 0x0004000B, 0x00000000\n"
"	.4byte 0x00000002, GMapBaseMenu_RestoreBgm, 0x0000000C, 0x00000000, 0x0005000B, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00020001, 0x00150014, 0x001F001C\n"
"	.4byte 0x00280020, 0x00000000, 0x00010000, 0x00030002, 0x00150014, 0x001F0016\n"
"	.4byte 0x002D0020, 0x0000002E, 0x00000000, 0x00030000, 0x00140005, 0x001C0016\n"
"	.4byte 0x0020001F, 0x00280026, 0x002E002D, 0x00000033, 0x00000000, 0x00000000\n"
"	.4byte 0x00030000, 0x00140005, 0x001C0016, 0x0020001F, 0x00280026, 0x002E002D\n"
"	.4byte 0x00000033, 0x00000000, 0x00000000, 0x00020000, 0x000D0003, 0x00160015\n"
"	.4byte 0x001A001C, 0x00280020, 0x002E0024, 0x00310034, 0x00000000, 0x00070004\n"
"	.4byte 0x0012000D, 0x001A0017, 0x0021001E, 0x002A0024, 0x0031002F, 0x00340033\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x004B0000\n"
"	.4byte 0x00500056, 0x003F0038, 0x0000006C, 0x00000000, 0x00380000, 0x003F0039\n"
"	.4byte 0x00450040, 0x004C004B, 0x00690058, 0x006D006C, 0x0070006F, 0x00000000\n"
"	.4byte 0x003A0039, 0x00450040, 0x004B0046, 0x0050004C, 0x006E006C, 0x0000006F\n"
"	.4byte 0x00000000, 0x00380000, 0x003F0039, 0x00450040, 0x004C004B, 0x00690058\n"
"	.4byte 0x006D006C, 0x0070006F, 0x00390000, 0x0040003A, 0x00460045, 0x004C004B\n"
"	.4byte 0x006C0050, 0x006F006E, 0x00000000, 0x00390000, 0x003F003A, 0x00410040\n"
"	.4byte 0x00460045, 0x0050004C, 0x006C0059, 0x006E006D, 0x0000006F, 0x00390000\n"
"	.4byte 0x0040003A, 0x00450041, 0x004C0046, 0x006D004D, 0x006F006E, 0x00000000\n"
"	.4byte 0x003A0039, 0x00410040, 0x00460045, 0x004D004C, 0x006C0050, 0x006F006D\n"
"	.4byte 0x0000006E, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00120000, 0x001E002A, 0x000B0031, 0x003B0042, 0x00510048, 0x005B004D\n"
"	.4byte 0x0061005C, 0x0064006B, 0x00660065, 0x00680067, 0x00000097, 0x002A0012\n"
"	.4byte 0x0031001E, 0x00420019, 0x0049003B, 0x004D004F, 0x005C005B, 0x006B0063\n"
"	.4byte 0x00650064, 0x00670066, 0x00970068, 0x00000000, 0x00000000, 0x001D000C\n"
"	.4byte 0x00230086, 0x003C0032, 0x004E0043, 0x005C005B, 0x005E005D, 0x0060005F\n"
"	.4byte 0x00650064, 0x00670066, 0x00970068, 0x00000000, 0x00000000, 0x00000000\n"
);
u8 frontier_df3_ending_001_AC3AA8[] __attribute__((section(".data.frontier_df3_ending.gap1"))) = INCBIN_U8("graphics/frontier_df3_ending/frontier_df3_ending_001_AC3AA8.bin");
u8 frontier_df3_ending_002_AC50A4[] __attribute__((section(".data.frontier_df3_ending.gap2"))) = INCBIN_U8("graphics/frontier_df3_ending/frontier_df3_ending_002_AC50A4.bin");
