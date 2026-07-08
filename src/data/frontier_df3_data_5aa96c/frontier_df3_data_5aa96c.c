#include "global.h"
#include "proc.h"

extern const u8 BATTLE_DeleteLinkedMOVEUNIT[];
extern const u8 BATTLE_GOTO1_IfNobodyIsDead[];
extern const u8 BattleApplyGameStateUpdates[];
extern const u8 DirectSoundData_k_brasstrm2_c4_13k[];
extern const u8 DirectSoundData_kansei1_e5l_13k8b[];
extern const u8 EndLinkArenaPointsBox[];
extern const u8 EraseSaveData[];
extern const u8 LABattleMap_AiPickBestAttack[];
extern const u8 LABattleMap_AiPickWeakestTeam[];
extern const u8 LABattleMap_Ai_HandleSurrender[];
extern const u8 LABattleMap_Ai_PrepareCombatants[];
extern const u8 LABattleMap_Ai_StartTargetCursor[];
extern const u8 LABattleMap_Ai_WaitCombatantMu[];
extern const u8 LABattleMap_ApplyCombatResults[];
extern const u8 LABattleMap_AwardBonusPoints[];
extern const u8 LABattleMap_BeginTurn[];
extern const u8 LABattleMap_CheckNoDamageStall_Loop[];
extern const u8 LABattleMap_ConfirmTarget[];
extern const u8 LABattleMap_DetermineAttackRange[];
extern const u8 LABattleMap_End[];
extern const u8 LABattleMap_ForecastConfirm_Loop[];
extern const u8 LABattleMap_ForecastMenu_Init[];
extern const u8 LABattleMap_ForecastMenu_Loop[];
extern const u8 LABattleMap_GenerateForecast[];
extern const u8 LABattleMap_HandleNoDamagePrompt[];
extern const u8 LABattleMap_HandleSurrenderPrompt[];
extern const u8 LABattleMap_PrepareCombatantSprites[];
extern const u8 LABattleMap_ReceiveAttackDeclaration[];
extern const u8 LABattleMap_ReceiveForecastResponse[];
extern const u8 LABattleMap_ReceiveTargetSelection[];
extern const u8 LABattleMap_RecordEliminationAndAdvance[];
extern const u8 LABattleMap_RecordSurrenderRanking[];
extern const u8 LABattleMap_RefreshAfterCombat[];
extern const u8 LABattleMap_Remote_RecordSurrenderRanking[];
extern const u8 LABattleMap_Remote_SetQuitEndState[];
extern const u8 LABattleMap_SelectAttacker_Loop[];
extern const u8 LABattleMap_SelectTarget_Loop[];
extern const u8 LABattleMap_SetQuitEndState[];
extern const u8 LABattleMap_StartBonusPointsHelp[];
extern const u8 LABattleMap_StartCombat[];
extern const u8 LABattleMap_StartCombatantWarpFx[];
extern const u8 LABattleMap_StartFactionTurn[];
extern const u8 LABattleMap_StartForecast[];
extern const u8 LABattleMap_StartNoDamagePrompt[];
extern const u8 LABattleMap_StartPointsBox[];
extern const u8 LABattleMap_StartStatScreen[];
extern const u8 LABattleMap_StartSurrenderPrompt[];
extern const u8 LABattleMap_WaitSioSendDrain_Loop[];
extern const u8 LABattleMap_WarpCombatantsToRoster[];
extern const u8 LABattle_BeginAnims[];
extern const u8 LABattle_MarkDeadCombatants[];
extern const u8 LABattle_StartDeathFades[];
extern const u8 LAPointsBox_LoadBoxes[];
extern const u8 LinkArenaBattleMap_Init[];
extern const u8 LinkArenaBattleMap_InitDisplay[];
extern const u8 LinkArenaBattleMap_StartSelectedUnitMu[];
extern const u8 LinkArena_StoreTalkChoice[];
extern const u8 MenuCancelSelect[];
extern const u8 MenuItems_SioMenudef_0[];
extern const u8 MenuItems_SioMenudef_1[];
extern const u8 PointsNumberMover_AwaitEnd[];
extern const u8 PointsNumberMover_Init[];
extern const u8 PointsNumberMover_InitScoreChange[];
extern const u8 PointsNumberMover_LoopMoveToPointsBox[];
extern const u8 PointsNumberMover_LoopNumberEmerge[];
extern const u8 PointsNumberMover_TickScore[];
extern const u8 PointsSpriteText_LoopIn[];
extern const u8 PointsSpriteText_LoopOut[];
extern const u8 ProcScr_LASurrender_HandleUnitDeaths[];
extern const u8 ProcScr_LinkArenaPhaseIntro[];
extern const u8 ProcScr_Popup[];
extern const u8 RefreshBMapGraphics[];
extern const u8 SioMenu_OnBPress[];
extern const u8 Sio_BoxTransitionClose_End[];
extern const u8 Sio_BoxTransitionClose_Loop[];
extern const u8 Sio_BoxTransitionOpen_End[];
extern const u8 Sio_BoxTransitionOpen_Loop[];
extern const u8 Sio_BoxTransition_Init[];
extern const u8 Sprite_LinkArenaBButton[];
extern const u8 Sprite_LinkArena_PressStart[];
extern const u8 Sprite_LinkArena_TeamName[];
extern const u8 Sprite_NameEntry_PositionIndicator[];
extern const u8 StartLinkArenaShowPointsAnimated[];
extern const u8 data_080DEF7C[];
extern const u8 data_080DF228[];
extern const u8 gProcScr_BKSEL[];
extern const u8 gSioUiutils_0[];
extern const u8 nullsub_48[];
extern const u8 sub_80487D8[];
extern const u8 sub_80489C8[];
extern const u8 sub_8048AC4[];
extern const u8 sub_8048B10[];
extern const u8 sub_8048BAC[];
extern const u8 sub_8048C08[];
extern const u8 sub_8048C7C[];
extern const u8 sub_8048CD8[];
extern const u8 sub_8048D74[];
extern const u8 sub_8048FC0[];
extern const u8 sub_80491B8[];
extern const u8 sub_8049274[];
extern const u8 sub_8049364[];
extern const u8 sub_8049460[];
extern const u8 sub_80494B0[];
extern const u8 sub_80494C8[];
extern const u8 sub_80494FC[];
extern const u8 sub_8049638[];
extern const u8 sub_8049658[];
extern const u8 sub_8049C94[];

extern void Clear_UnkData_0();
extern void EndMuralBackground();
extern void FadeInBlackSpeed20();
extern void FadeOutBlackSpeed20Locking();
extern void Set_UnkData_0();
extern void SioMenu_0();
extern void SioMenu_1();
extern void SioMenu_AnimateItemsSpreadFromSelection();
extern void SioMenu_End();
extern void SioMenu_Init();
extern void SioMenu_LoadGraphics();
extern void SioMenu_Loop_HandleKeyInput();
extern void SioMenu_RestartGraphicsMaybe();
extern void SioPointsSprite_Loop();
extern void SioPostBattleMusic_PlayFanfare();
extern void SioPostBattleMusic_PlayStandardBgm();
extern void SioResult_NewHS_AwaitAPress();
extern void SioResult_NewHS_Init();
extern void SioResult_NewHS_LoopScroll();
extern u8 frontier_df4_misc_lo_004b_0DEED0[];

/* Migrated from asm/frontier_df3_data_5aa96c.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

struct ProcCmd frontier_df3_data_5aa96c_000_5D367C[] SECTION(".data.frontier_df3_data_5aa96c.gap0") = {
    PROC_SLEEP(0x10),
    PROC_CALL(SioPostBattleMusic_PlayFanfare),
    PROC_SLEEP(0xD2),
    PROC_CALL(SioPostBattleMusic_PlayStandardBgm),
    PROC_END,
};

u32 frontier_df3_data_5aa96c_000b_5D376C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap0b"))) = {
    0x00007000, 0x00000001, 0x00007000, 0x00000001, 0x00007000, 0x00000001,
    0x00007000, 0x00000001, 0x02020188,
};
struct ProcCmd frontier_df3_data_5aa96c_000c_5D3CA0[] SECTION(".data.frontier_df3_data_5aa96c.gap0c") = {
    PROC_SLEEP(0),
    PROC_CALL(SioResult_NewHS_Init),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(Clear_UnkData_0),
    PROC_REPEAT(SioResult_NewHS_LoopScroll),
    PROC_REPEAT(SioResult_NewHS_AwaitAPress),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0),
    PROC_CALL(EndMuralBackground),
    PROC_END,
};

u32 frontier_df3_data_5aa96c_000d_5D3D50[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap0d"))) = {
    0x00007000, 0x00000001, 0x00007000, 0x00000001, 0x00007000, 0x00000001,
    0x00007000, 0x00000001, 0x00007000, 0x00000001, 0x00007000, 0x00000001,
    0x00007000, 0x00000001, 0x00007000, 0x00000001,
};

struct ProcCmd ProcScr_SioMenu_Init_5D3D50_0[] SECTION(".data.frontier_df3_data_5aa96c.gap0d") = {
    PROC_NAME(frontier_df4_misc_lo_004b_0DEED0),
    PROC_LABEL(0),
    PROC_CALL(SioMenu_Init),
    PROC_CALL(SioMenu_LoadGraphics),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(Clear_UnkData_0),
    PROC_REPEAT(SioMenu_0),
    PROC_GOTO(2),
    PROC_LABEL(1),
    PROC_CALL(SioMenu_RestartGraphicsMaybe),
    PROC_CALL(FadeInBlackSpeed20),
    PROC_SLEEP(0),
    PROC_CALL(Clear_UnkData_0),
    PROC_LABEL(2),
    PROC_REPEAT(SioMenu_AnimateItemsSpreadFromSelection),
    PROC_REPEAT(SioMenu_Loop_HandleKeyInput),
    PROC_REPEAT(SioMenu_1),
    PROC_CALL(Set_UnkData_0),
    PROC_CALL(FadeOutBlackSpeed20Locking),
    PROC_SLEEP(0),
    PROC_CALL(SioMenu_End),
    PROC_SLEEP(1),
    PROC_GOTO(1),
};

u32 frontier_df3_data_5aa96c_gap0d_r0[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap0d"))) = {
    0x00041020, 0x07B81B20, 0x00001D20, 0x00070540, 0x00000001, 0x00000C41,
    0x0007000C, 0x07B91B21, 0x00001D20, 0x00070540, 0x00000001, 0x00000C41,
    0x0007000C, 0x00000D40, (u32)&EraseSaveData, 0x07BA1B21, 0x00001D20, 0x00000820,
    0x00001B22, 0x00000120,
};

struct ProcCmd frontier_df3_data_5aa96c_001_5D3EA8[] SECTION(".data.frontier_df3_data_5aa96c.gap1") = {
    PROC_REPEAT(SioPointsSprite_Loop),
    PROC_END,
};

u32 frontier_df3_data_5aa96c_gap1_r1[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap1"))) = {
    0x00D600D5, 0x00D800D7, 0x00DA00D9, 0x00DC00DB, 0x00DE00DD, 0x00000061,
    0x0002006B, 0x0004006C, 0x0006006D, 0x0008006E, 0x000A006F, 0x000C0070,
    0x000E0071, 0x00100072, 0x00120073, 0x00140074, 0x00160075, 0x00180076,
    0x001A0077, 0x001C0078, 0x001E0079, 0x0020007A, 0x0022007B, 0x0024007C,
    0x0026007D, 0x0028007E, 0x002A007F, 0x002C0080, 0x002E0081, 0x00300082,
    0x00320083, 0x00140084, 0x00160085, 0x00220086, 0x00240087, 0x00260088,
    0x00280089, 0x0011008A, 0x0019008B, 0x001D008C, 0x0021008D, 0x0029008E,
    0x0029008F, 0x002B0090, 0x0000006B, 0x0000006B, 0x0000006B, 0x40030007,
    0xA2808000, 0x80204003, 0x4003A284, 0xA2888040, 0x80604003, 0x4003A28C,
    0xA2908080, 0x80A04003, 0x4003A294, 0xA29880C0, 0x40030003, 0x4140C000,
    0xC0404003, 0x40034148, 0x4150C080, 0x80000001, 0x91C00000, 0x00000001,
    0x91CB0000,
};

u32 data_085D3FC4[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap1"))) = {
    0x00000002, (u32)&sub_8048FC0, 0x0000000B, 0x00000000, 0x00000003, (u32)&sub_80491B8,
    0x00000003, (u32)&sub_8049274, 0x00000003, (u32)&sub_8049364, 0x00000000, 0x00000000,
    0x40000004, 0xA3408000, 0x80204000, 0x4000A344, 0xA3488040, 0x80604000,
    0x0000A34C,
};
u32 data_085D4010[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap1"))) = {
    0x00000002, (u32)&sub_80487D8, 0x00000004, (u32)&sub_8049658, 0x00000002, (u32)&FadeInBlackSpeed20,
    0x0000000E, 0x00000000, 0x00000002, (u32)&Clear_UnkData_0, 0x00000003, (u32)&sub_80489C8,
    0x00000002, (u32)&sub_8048AC4, 0x00000003, (u32)&sub_8048B10, 0x00000003, (u32)&sub_8048C08,
    0x00000003, (u32)&sub_8048C7C, 0x00000002, (u32)&Set_UnkData_0, 0x00000002, (u32)&FadeOutBlackSpeed20Locking,
    0x0000000E, 0x00000000, 0x0001000B, 0x00000000, 0x00000002, (u32)&sub_8049460,
    0x00000002, (u32)&FadeInBlackSpeed20, 0x0000000E, 0x00000000, 0x00000002, (u32)&Clear_UnkData_0,
    0x0002000B, 0x00000000, 0x00000003, (u32)&sub_8048CD8, 0x00000003, (u32)&sub_80494B0,
    0x00000002, (u32)&sub_80494C8, 0x00000003, (u32)&sub_80494FC, 0x00000003, (u32)&sub_80494B0,
    0x0002000C, 0x00000000, 0x0003000B, 0x00000000, 0x00000003, (u32)&sub_8048D74,
    0x000A000B, 0x00000000, 0x00000003, (u32)&sub_8049638, 0x00000002, (u32)&sub_8048BAC,
    0x000B000B, 0x00000000, 0x00000000, 0x00000000, 0x00000002, (u32)&LAPointsBox_LoadBoxes,
    0x00000002, (u32)&nullsub_48, 0x00000000, 0x00000000, 0x00000000, 0xFFFFFFEC,
    0xFFFFFFF0, 0x00000000, 0x00000000, 0x0000000C, 0x00000010, 0x00000000,
    0x00000000, 0x00010001, 0x00010001, 0x00010001, 0x00020002, 0x00010002,
    0x00010001, 0x00010001, 0x00010001, 0x00000000, 0x0003FFFF, 0x00020003,
    0x00010002, 0x00000000, 0x00000000, 0xFFFF0000, 0xFFFEFFFE, 0xFFFDFFFD,
    0x00000001, 0x0000000E, 0x00000000, 0x00000002, (u32)&PointsNumberMover_Init, 0x00000003,
    (u32)&PointsNumberMover_LoopNumberEmerge, 0x00000003, (u32)&PointsNumberMover_LoopMoveToPointsBox, 0x00000002, (u32)&PointsNumberMover_InitScoreChange, 0x00000003,
    (u32)&PointsNumberMover_TickScore, 0x00000003, (u32)&PointsNumberMover_AwaitEnd, 0x00000000, 0x00000000, 0x0000000E,
    0x00000000, 0x00000002, (u32)&sub_8049C94, 0x00000003, (u32)&PointsSpriteText_LoopIn, 0x00000003,
    (u32)&PointsSpriteText_LoopOut, 0x00000000, 0x00000000, 0x01000203, 0x01130E0E, 0x02000D0D,
    0x03010C0C, 0x04020B0B, 0x05030A0A, 0x13130406, 0x12120507, 0x11110608,
    0x10100709, 0x0F0F080A, 0x090B0404, 0x0A0C0303, 0x0B0D0202, 0x0C0E0101,
    0x0D0F0000, 0x0909100E, 0x0808110F, 0x07071210, 0x06061311, 0x05050012,
    0x0000000B, 0x00000000, 0x00000008, (u32)&gProcScr_BKSEL, 0x0001000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_ForecastMenu_Init, 0x00000003, (u32)&LABattleMap_ForecastMenu_Loop, 0x00000002, (u32)&LABattleMap_DetermineAttackRange,
    0x00000003, (u32)&LABattleMap_GenerateForecast, 0x00000003, (u32)&LABattleMap_ForecastConfirm_Loop, 0x0001000B, 0x00000000,
    0x00000000, 0x00000000, 0x00000005, 0x03001848, 0x00000001, 0x00000003,
    0x00000004, 0x000006E3, 0x00000000, 0x00000000, 0x00000004, 0x000006E4,
    0x00000000, 0x00000000, 0x00000000, 0x01000000, 0x02020201, 0x03030303,
    0x04040404, 0x03040404, 0x02020203, 0x01010101,
};
u32 frontier_df3_data_5aa96c_002_5D4358[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap2"))) = {
    0x00010E20, 0x00070228, 0x00041020, (u32)&DirectSoundData_k_brasstrm2_c4_13k + 0x748, 0x00001D20, 0x00001B22,
    0x00000D40, (u32)&LinkArena_StoreTalkChoice, 0x00000120, 0x00010E20, 0x00070228, 0x00041020,
    (u32)&DirectSoundData_kansei1_e5l_13k8b + 0x2dc0, 0x00001D20, 0x00001B22, 0x00000D40, (u32)&LinkArena_StoreTalkChoice, 0x00000120,
    0x0000000B, 0x00000000, 0x00000003, (u32)&LABattleMap_CheckNoDamageStall_Loop, 0x00000002, (u32)&LABattleMap_StartPointsBox,
    0x0001000B, 0x00000000, 0x00000003, (u32)&LABattleMap_WaitSioSendDrain_Loop, 0x00000003, (u32)&LABattleMap_SelectAttacker_Loop,
    0x0004000B, 0x00000000, 0x00000002, (u32)&EndLinkArenaPointsBox, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_StartStatScreen, 0x0000000E, 0x00000000, 0x00000002, (u32)&LinkArenaBattleMap_InitDisplay,
    0x00000002, (u32)&RefreshBMapGraphics, 0x0000000C, 0x00000000, 0x0002000B, 0x00000000,
    0x0001000E, 0x00000000, 0x00000002, (u32)&LABattleMap_StartSurrenderPrompt, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_HandleSurrenderPrompt, 0x00010006, (u32)&ProcScr_LASurrender_HandleUnitDeaths, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_RecordSurrenderRanking, 0x0003000B, 0x00000000, 0x0001000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_StartNoDamagePrompt, 0x0000000E, 0x00000000, 0x00000002, (u32)&LABattleMap_HandleNoDamagePrompt,
    0x00000002, (u32)&LABattleMap_SetQuitEndState, 0x0005000B, 0x00000000, 0x00000003, (u32)&LABattleMap_WaitSioSendDrain_Loop,
    0x00000003, (u32)&LABattleMap_SelectTarget_Loop, 0x0006000B, 0x00000000, 0x00000002, (u32)&EndLinkArenaPointsBox,
    0x0000000E, 0x00000000, 0x00000002, (u32)&LABattleMap_StartStatScreen, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LinkArenaBattleMap_InitDisplay, 0x00000002, (u32)&RefreshBMapGraphics, 0x00000002, (u32)&LABattleMap_StartPointsBox,
    0x00000002, (u32)&LinkArenaBattleMap_StartSelectedUnitMu, 0x0005000C, 0x00000000, 0x0007000B, 0x00000000,
    0x00000003, (u32)&LABattleMap_StartForecast, 0x00000002, (u32)&EndLinkArenaPointsBox, 0x00000002, (u32)&LABattleMap_ConfirmTarget,
    0x00000002, (u32)&LABattleMap_StartCombatantWarpFx, 0x0000000E, 0x00000000, 0x00000002, (u32)&LABattleMap_PrepareCombatantSprites,
    0x00000003, (u32)&LABattleMap_StartCombat, 0x00000003, (u32)&LABattleMap_ApplyCombatResults, 0x00000002, (u32)&StartLinkArenaShowPointsAnimated,
    0x0000000E, 0x00000000, 0x00000002, (u32)&EndLinkArenaPointsBox, 0x00000003, (u32)&LABattleMap_WarpCombatantsToRoster,
    0x00000003, (u32)&LABattleMap_RecordEliminationAndAdvance, 0x00000002, (u32)&LABattleMap_RefreshAfterCombat, 0x0008000B, 0x00000000,
    0x00000000, 0x00000000, 0x0000000B, 0x00000000, 0x00000002, (u32)&LABattleMap_StartPointsBox,
    0x00000003, (u32)&LABattleMap_ReceiveAttackDeclaration, 0x0001000B, 0x00000000, 0x00000003, (u32)&LABattleMap_ReceiveTargetSelection,
    0x0002000C, 0x00000000, 0x0003000B, 0x00000000, 0x00010006, (u32)&ProcScr_LASurrender_HandleUnitDeaths,
    0x0000000E, 0x00000000, 0x00000008, (u32)&ProcScr_Popup, 0x00000002, (u32)&LABattleMap_Remote_RecordSurrenderRanking,
    0x0004000B, 0x00000000, 0x00000008, (u32)&ProcScr_Popup, 0x00000002, (u32)&LABattleMap_Remote_SetQuitEndState,
    0x0002000B, 0x00000000, 0x00000003, (u32)&LABattleMap_ReceiveForecastResponse, 0x00000002, (u32)&EndLinkArenaPointsBox,
    0x00000002, (u32)&LABattleMap_StartCombatantWarpFx, 0x0000000E, 0x00000000, 0x00000002, (u32)&LABattleMap_PrepareCombatantSprites,
    0x00000003, (u32)&LABattleMap_StartCombat, 0x00000003, (u32)&LABattleMap_ApplyCombatResults, 0x00000002, (u32)&StartLinkArenaShowPointsAnimated,
    0x0000000E, 0x00000000, 0x00000002, (u32)&EndLinkArenaPointsBox, 0x00000003, (u32)&LABattleMap_WarpCombatantsToRoster,
    0x00000003, (u32)&LABattleMap_RecordEliminationAndAdvance, 0x00000002, (u32)&LABattleMap_RefreshAfterCombat, 0x0005000B, 0x00000000,
    0x00000000, 0x00000000, 0x00000002, (u32)&LABattleMap_StartPointsBox, 0x0000000E, 0x00000000,
    0x0000000B, 0x00000000, 0x00000003, (u32)&LABattleMap_AiPickWeakestTeam, 0x0001000B, 0x00000000,
    0x00000003, (u32)&LABattleMap_AiPickBestAttack, 0x00000002, (u32)&LABattleMap_Ai_StartTargetCursor, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_Ai_PrepareCombatants, 0x0002000B, 0x00000000, 0x00000003, (u32)&LABattleMap_Ai_WaitCombatantMu,
    0x00000002, (u32)&EndLinkArenaPointsBox, 0x0004000C, 0x00000000, 0x0003000B, 0x00000000,
    0x0001000E, 0x00000000, 0x00000002, (u32)&LABattleMap_StartSurrenderPrompt, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LABattleMap_Ai_HandleSurrender, 0x0004000B, 0x00000000, 0x00000002, (u32)&LABattleMap_StartCombatantWarpFx,
    0x0000000E, 0x00000000, 0x00000002, (u32)&LABattleMap_PrepareCombatantSprites, 0x00000003, (u32)&LABattleMap_StartCombat,
    0x00000003, (u32)&LABattleMap_ApplyCombatResults, 0x00000002, (u32)&StartLinkArenaShowPointsAnimated, 0x0000000E, 0x00000000,
    0x00000002, (u32)&EndLinkArenaPointsBox, 0x00000003, (u32)&LABattleMap_WarpCombatantsToRoster, 0x00000003, (u32)&LABattleMap_RecordEliminationAndAdvance,
    0x00000002, (u32)&LABattleMap_RefreshAfterCombat, 0x0005000B, 0x00000000, 0x00000000, 0x00000000,
};
u32 data_085D4760[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap2"))) = {
    0x00000015, 0x00000000, 0x00000001, (u32)&data_080DEF7C + 0x2C, 0x0000000E, 0x00000000,
    0x00000002, (u32)&LinkArenaBattleMap_Init, 0x00000002, (u32)&FadeInBlackSpeed20, 0x0000000E, 0x00000000,
    0x00000002, (u32)&Clear_UnkData_0, 0x0000000B, 0x00000000, 0x00000002, (u32)&LABattleMap_BeginTurn,
    0x0001000E, 0x00000000, 0x00010006, (u32)&ProcScr_LinkArenaPhaseIntro, 0x0000000E, 0x00000000,
    0x00000003, (u32)&LABattleMap_StartFactionTurn, 0x0000000C, 0x00000000, 0x0002000B, 0x00000000,
    0x00000002, (u32)&LABattleMap_StartBonusPointsHelp, 0x00000003, (u32)&LABattleMap_AwardBonusPoints, 0x0003000B, 0x00000000,
    0x00000002, (u32)&LABattleMap_End, 0x00000000, 0x00000000, 0x00000002, (u32)&LABattle_BeginAnims,
    0x0001000E, 0x00000000, 0x00000002, (u32)&BattleApplyGameStateUpdates, 0x00000014, (u32)&DoesBMXFADEExist,
    0x00000002, (u32)&BATTLE_GOTO1_IfNobodyIsDead, 0x00000002, (u32)&LABattle_StartDeathFades, 0x0020000E, 0x00000000,
    0x00000002, (u32)&BATTLE_DeleteLinkedMOVEUNIT, 0x0001000B, 0x00000000, 0x00000002, (u32)&LABattle_MarkDeadCombatants,
    0x00000000, 0x00000000,
};
u32 data_085D4858[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap2"))) = {
    0x0000000E, 0x00000000, 0x00000002, (u32)&Sio_BoxTransition_Init, 0x00000003, (u32)&Sio_BoxTransitionOpen_Loop,
    0x0001000E, 0x00000000, 0x00000002, (u32)&Sio_BoxTransitionOpen_End, 0x0001000E, 0x00000000,
    0x00000000, 0x00000000,
};
u32 data_085D4890[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap2"))) = {
    0x0000000E, 0x00000000, 0x00000002, (u32)&Sio_BoxTransition_Init, 0x00000003, (u32)&Sio_BoxTransitionClose_Loop,
    0x0001000E, 0x00000000, 0x00000002, (u32)&Sio_BoxTransitionClose_End, 0x0001000E, 0x00000000,
    0x00000000, 0x00000000,
};
u32 frontier_df3_data_5aa96c_003_5D48E0[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3"))) = {
    0x03020100, 0x03030303, 0x03030303, 0x04030303, 0x08070605, 0x0000FF09,
};
u32 frontier_df3_data_5aa96c_003b_5D4A10[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3b"))) = {
    0x40000003, 0x86008000, 0x80204000, 0x00008604, 0x86084040,
};
u32 frontier_df3_data_5aa96c_003c_5D4A44[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3c"))) = {
    (u32)&Sprite_LinkArenaBButton + 0x26, (u32)&Sprite_LinkArenaBButton + 0x46, (u32)&Sprite_LinkArenaBButton + 0x66, (u32)&Sprite_LinkArenaBButton + 0x86, (u32)&Sprite_LinkArenaBButton + 0xA6, (u32)&gSioUiutils_0 + 0x8,
    (u32)&gSioUiutils_0 + 0x16, (u32)&gSioUiutils_0 + 0x2A,
};
u32 frontier_df3_data_5aa96c_003d_5D4A7C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3d"))) = {
    0x40000002, 0x82B84000, 0x40204000, 0x000382BC, 0x40004000, 0x4000867B,
    0x867B4020, 0x00400000, 0x0003867F, 0x40004000, 0x4000869B, 0x869B4020,
    0x00400000, 0x0009869F, 0x00004000, 0x40003277, 0x32780010, 0x00204000,
    0x40003278, 0x32780030, 0x00404000, 0x40003278, 0x32780050, 0x00604000,
    0x40003278, 0x32780070, 0x00804000, 0x00003279, (u32)&Sprite_LinkArena_TeamName + 0xE, (u32)&Sprite_LinkArena_TeamName + 0x22,
    0x40000002, 0x3240C000, 0x80400000, 0x00043248, 0x80000000, 0x4000324C,
    0x32904020, 0x40204018, 0x000032AD, 0x324C9040,
};
u32 frontier_df3_data_5aa96c_003e_5D4B4C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3e"))) = {
    (u32)&Sprite_LinkArena_PressStart + 0x28, (u32)&Sprite_LinkArena_PressStart + 0x30, (u32)&Sprite_NameEntry_PositionIndicator + 0x20, (u32)&Sprite_NameEntry_PositionIndicator + 0x18, (u32)&Sprite_NameEntry_PositionIndicator + 0x28, (u32)&Sprite_NameEntry_PositionIndicator + 0x10,
    (u32)&Sprite_NameEntry_PositionIndicator + 0x8,
};
u32 frontier_df3_data_5aa96c_003f_5D4B80[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3f"))) = {
    (u32)&Sprite_NameEntry_PositionIndicator + 0x30, (u32)&Sprite_NameEntry_PositionIndicator + 0x38, (u32)&Sprite_NameEntry_PositionIndicator + 0x40,
};
u32 frontier_df3_data_5aa96c_003g_5D4BD4[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap3g"))) = {
    0x00000001, 0x86570000, 0x00000001, 0x86572000, 0x00000001, 0x865D0000,
};
u32 frontier_df3_data_5aa96c_004_5D4C5C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap4"))) = {
    (u32)&data_080DF228, (u32)&data_080DF228 + 0x8, (u32)&data_080DF228 + 0x10, (u32)&data_080DF228 + 0x18,
};
u32 frontier_df3_data_5aa96c_005_5D4DD8[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap5"))) = {
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00080210, 0x00000000, (u32)&MenuItems_SioMenudef_0, 0x00000000, 0x00000000, 0x00000000,
    (u32)&SioMenu_OnBPress, 0x00000000, 0x00000000, 0x000E0101, 0x00000000, (u32)&MenuItems_SioMenudef_1,
    0x00000000, 0x00000000, 0x00000000, (u32)&SioMenu_OnBPress, 0x00000000, 0x00000000,
    0x000C0201, 0x00000000, (u32)&frontier_df3_data_5aa96c_005_5D4DD8, 0x00000000, 0x00000000, 0x00000000,
    (u32)&MenuCancelSelect, 0x00000000, 0x00000000, 0x00160201, 0x00000000, (u32)&frontier_df3_data_5aa96c_005_5D4DD8 + 0x24,
    0x00000000, 0x00000000, 0x00000000, (u32)&MenuCancelSelect, 0x00000000, 0x00000000,
};
u8 frontier_df3_data_5aa96c_006_5D53FC[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap6"))) = INCBIN_U8("graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_006_5D53FC_0.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_006_5D53FC_1.4bpp.lz");
u8 frontier_df3_data_5aa96c_007_5D737C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap7"))) = INCBIN_U8("graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_007_5D737C_0.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_007_5D737C_1.4bpp.lz");
u8 frontier_df3_data_5aa96c_008_5D8048[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap8"))) = INCBIN_U8("graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_008_5D8048.gbapal");
u8 frontier_df3_data_5aa96c_009_5D8A8C[] __attribute__((section(".data.frontier_df3_data_5aa96c.gap9"))) = INCBIN_U8("graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C_0.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C_1.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C_2.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C_3.4bpp.lz", "graphics/frontier_df3_data_5aa96c/frontier_df3_data_5aa96c_009_5D8A8C_4.4bpp.lz");
