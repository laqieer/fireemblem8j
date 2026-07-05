#include "global.h"
#include "proc.h"

/* #148 proc-script externs (batch2 gap14): referenced code/data symbols so the
 * carved struct ProcCmd tables compile (bytes unchanged -- same R_ARM_ABS32). */
extern void BoxDialogue_OnClose();
extern void BoxDialogue_OnIdle();
extern void BoxDialogue_OnInit();
extern void HelpBoxDrawstring();
extern void HelpBoxIntroDrawTexts();
extern void HelpBoxIntro_bug_0();
extern void HelpBoxIntro_bug_OnClose();
extern void HelpBoxIntro_bug_WaitClose();
extern void HelpBoxSetupstringLines();
extern void HelpBoxTextScroll_OnLoop();
extern void MergeBoxDialogue1();
extern void MergeBoxDialogue2();
extern void MergeBoxDialogue3();

/* #148 proc-script externs (batch1 gap0+gap13): referenced code/data symbols so the
 * carved struct ProcCmd tables compile (bytes unchanged -- same R_ARM_ABS32). */
extern void BackgroundSlide_Loop();
extern void ClearSlide();
extern void EndGlowBlendCtrl();
extern void GlowCrossExit_Init();
extern void GlowCrossExit_Loop();
extern void GlowingCross_Init();
extern void GlowingCross_Loop();
extern void GlowingCross_OnEnd();
extern void MapEventcallFx1_ClearBgs();
extern void MapEventcallFx1_FadeWhiteDown();
extern void MapEventcallFx1_Init();
extern void MapEventcallFx1_PlayFadeAnim();
extern void MapEventcallFx2_ClearBgs();
extern void MapEventcallFx2_FadeOutBlend();
extern void MapEventcallFx2_Init();
extern void MapEventcallFx2_OnEnd();
extern void MapEventcallFx2_PlayAnim();
extern void MapEventcallFx2_RampToWhite();
extern void MapSpellAnim_CommonEnd();
extern void MapanimEventcall_VsyncWaveLoop();
extern void PageSlide_OnEnd();
extern void PageSlide_OnLoop();
extern void StartGlowBlendCtrl();
extern void UnitSlide_FadeInLoop();
extern void UnitSlide_FadeOutLoop();
extern void UnitSlide_InitFadeIn();
extern void UnitSlide_InitFadeOut();
extern void UnitSlide_SetNewUnit();
extern void gap_0008359C();
extern void sub_8088E30();
#define PROC_WORDS(op, pa, p) { (op), (pa), (void *)(p) }

/* #143 shiftability: the config help-text + UI-sprite proc scripts at the head of
 * frontier_df4_menu_034_AAF9EC[] held raw-hex interior code/name pointers. Carved
 * into named struct ProcCmd[] arrays so those pointers become R_ARM_ABS32
 * relocations instead of raw un-relocatable words on the +0x40000 shifted ROM. */
extern u8 frontier_df4_voice_000a2_1F5840[];
extern void DrawGameOptionHelpText(void);
extern void ConfigSprites_Init(ProcPtr proc);
extern void DrawConfigUiSprites(ProcPtr proc);

/* #143 shiftability: gProcScr_opinfo (the class-reel intro script) carved from the
 * tail of frontier_df4_menu_034c_AAFA44[] so its name + 3 code pointers relocate. */
extern u8 frontier_df4_voice_000b_1F5898[];

/* #143 shiftability: symbolize raw-hex ProcCmd interior code pointers so they
 * emit R_ARM_ABS32 relocations (shiftable) instead of hardcoded ROM words. */
extern void BMapDispResume();
extern void BMapDispSuspend();
extern void ColFadeIn_Loop();
extern void ColFadeOut_Init();
extern void ColFadeOut_Loop();
extern void Config_HandleExit();
extern void Config_Init();
extern void Config_Loop_KeyHandler();
extern void Config_SetSourceFromPrep();
extern void Config_SetSourceFromWorldMap();
extern void EndHelpBox();
extern void FadeInExists();
extern void FadeOutExists();
extern void LockGame();
extern void NewFadeIn();
extern void NewFadeOut();
extern void RefreshBMapGraphics();
extern void StartFastFadeFromBlack();
extern void StartFastFadeToBlack();
extern void UnlockGame();
extern void WaitForFade();
extern void nullsub_91();

extern void ClassReel_Init(ProcPtr proc);
extern void ClassReel_Loop(ProcPtr proc);
extern void ClassReel_FadeOutBGM(void);
extern void ClassReel_OnEnd(ProcPtr proc);
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

/* forward declarations for intra-file table cross-references (#145 shiftability) */
extern EventListScr frontier_df4_menu_006_A65504[];
extern EventListScr frontier_df4_menu_007_A657D4[];
extern EventListScr frontier_df4_menu_012_A71CC4[];
/* external data targets referenced as relocatable symbols (#145 shiftability) */
extern const u8 AutolevelSecondaryLord[];
extern const u8 CallRouteSplitMenu[];
extern const u8 EventScr_9EE84C[];
extern const u8 EventScr_9EEA58[];
extern const u8 EventScr_ConfigHardModeLoadUnitHard[];
extern const u8 EventScr_FloorClearInTower[];
extern const u8 EventScr_Ruin_60[];
extern const u8 EventScr_Ruin_61[];
extern const u8 EventScr_Ruin_62[];
extern const u8 EventScr_Ruin_63[];
extern const u8 EventScr_Ruin_64[];
extern const u8 EventScr_Ruin_65[];
extern const u8 EventScr_Ruin_66[];
extern const u8 EventScr_Ruin_67[];
extern const u8 EventScr_Ruin_68[];
extern const u8 EventScr_Ruin_69[];
extern const u8 EventScr_Ruin_70[];
extern const u8 EventScr_Ruin_71[];
extern const u8 EventScr_Ruin_72[];
extern const u8 EventScr_Ruin_73[];
extern const u8 EventScr_Ruin_74[];
extern const u8 EventScr_Ruin_75[];
extern const u8 EventScr_Ruin_76[];
extern const u8 EventScr_SetFlagIfPlayedThrough[];
extern const u8 EventScr_StrictLoadUniqueAlly[];
extern const u8 EventScr_UnitWarpIN[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 EventScr_WholeTowerClear[];
extern const u8 MenuItemDef_RouteSplit[];
extern const u8 UnitDef_Ch11AEnemy_2[];
extern const u8 UnitDef_Ch11AEnemy_3[];
extern const u8 UnitDef_Ch11AEnemy_4[];
extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 UnitDef_Ch8Enemy_8[];
extern const u8 UnitDef_Ch8Mixed[];
extern const u8 UnitDef_MelkaenCoastMixed[];
extern const u8 UnitDef_RuinEnemy_37[];
extern const u8 UnitDef_UnusedAlly[];
extern const u8 UnitDef_UnusedMixed_0[];
extern const u8 UnitDef_UnusedMixed_1[];
extern const u8 data_085B9BBC[];
extern const u8 data_08908958[];
extern const u8 data_0890BDC4[];
extern const u8 data_0890EB30[];
extern const u8 data_0890F470[];
extern const u8 data_08A60354[];
extern const u8 data_08A60BE4[];
extern const u8 frontier_df3_unitdef_b_000_90F678_residue_p1[];
extern const u8 frontier_df3_unitdef_b_000_90F678_residue_p4[];
extern const u8 frontier_df3_unitdef_b_004_91075C[];
extern const u8 frontier_df3_unitdef_b_005_9109A8[];
extern const u8 frontier_df3_unitdef_b_005_9109A8_residue_p5[];
extern const u8 frontier_df3_unitdef_b_072_923AD8[];
extern const u8 frontier_df3_unitdef_b_073_923F38[];
extern const u8 frontier_df4_banim_b_077_90DB94[];
extern const u8 frontier_df4_banim_b_078_90E58C[];
extern const u8 frontier_df4_banim_b_079_90EFAC[];
extern const u8 frontier_df4_menu_013_A72408[];

/* Migrated from asm/frontier_df4_menu.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap0, \"aw\", %progbits\n"
"	.global frontier_df4_menu_000_A149D4\n"
"frontier_df4_menu_000_A149D4:\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, MapEventcallFx0_Init + 0x1, 0x00000003, MapEventcallFx0_PlayIntroAnim + 0x1\n"
"	.4byte 0x001E000E, 0x00000000, 0x00000003, MapEventcallFx0_PlayMainAnim + 0x1, 0x00000003, MapEventcallFx0_FillWhiteTile + 0x1\n"
"	.4byte 0x00000003, MapEventcallFx0_RampToWhite + 0x1, 0x00000002, MapEventcallFx0_ClearBg2 + 0x1, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_MapanimEventcall_1[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)MapEventcallFx1_Init + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx1_FadeWhiteDown + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx1_PlayFadeAnim + 0x1)),
    PROC_CALL((void*)((u8*)MapEventcallFx1_ClearBgs + 0x1)), PROC_SLEEP(0x3C), PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap0, \"aw\", %progbits\n"
"	.4byte gMapanimEventcall_191, gMapanimEventcall_199, gMapanimEventcall_207, gMapanimEventcall_192, gMapanimEventcall_200, gMapanimEventcall_208\n"
"	.4byte gMapanimEventcall_193, gMapanimEventcall_201, gMapanimEventcall_209, gMapanimEventcall_194, gMapanimEventcall_202, gMapanimEventcall_210\n"
"	.4byte gMapanimEventcall_195, gMapanimEventcall_203, gMapanimEventcall_211, gMapanimEventcall_196, gMapanimEventcall_204, gMapanimEventcall_212\n"
"	.4byte gMapanimEventcall_197, gMapanimEventcall_205, gMapanimEventcall_213, gMapanimEventcall_198, gMapanimEventcall_206, gMapanimEventcall_214\n"
);
struct ProcCmd ProcScr_MapanimEventcall_2[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SET_END_CB((void*)((u8*)MapEventcallFx2_OnEnd + 0x1)), PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)MapEventcallFx2_Init + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx2_PlayAnim + 0x1)),
    PROC_REPEAT((void*)((u8*)MapEventcallFx2_RampToWhite + 0x1)), PROC_SLEEP(0x1E), PROC_REPEAT((void*)((u8*)MapEventcallFx2_FadeOutBlend + 0x1)), PROC_CALL((void*)((u8*)MapEventcallFx2_ClearBgs + 0x1)),
    PROC_SLEEP(0x3C), PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
struct ProcCmd ProcScr_MapanimEventcall_3[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x0), PROC_REPEAT((void*)((u8*)MapanimEventcall_VsyncWaveLoop + 0x1)), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap0, \"aw\", %progbits\n"
"	.4byte gMapanimEventcall_215, gMapanimEventcall_241, gMapanimEventcall_267, gMapanimEventcall_216, gMapanimEventcall_242, gMapanimEventcall_268\n"
"	.4byte gMapanimEventcall_217, gMapanimEventcall_243, gMapanimEventcall_269, gMapanimEventcall_218, gMapanimEventcall_244, gMapanimEventcall_270\n"
"	.4byte gMapanimEventcall_219, gMapanimEventcall_245, gMapanimEventcall_271, gMapanimEventcall_220, gMapanimEventcall_246, gMapanimEventcall_272\n"
"	.4byte gMapanimEventcall_221, gMapanimEventcall_247, gMapanimEventcall_273, gMapanimEventcall_222, gMapanimEventcall_248, gMapanimEventcall_274\n"
"	.4byte gMapanimEventcall_223, gMapanimEventcall_249, gMapanimEventcall_275, gMapanimEventcall_224, gMapanimEventcall_250, gMapanimEventcall_276\n"
"	.4byte gMapanimEventcall_225, gMapanimEventcall_251, gMapanimEventcall_277, gMapanimEventcall_226, gMapanimEventcall_252, gMapanimEventcall_278\n"
"	.4byte gMapanimEventcall_227, gMapanimEventcall_253, gMapanimEventcall_279, gMapanimEventcall_228, gMapanimEventcall_254, gMapanimEventcall_280\n"
"	.4byte gMapanimEventcall_229, gMapanimEventcall_255, gMapanimEventcall_281, gMapanimEventcall_230, gMapanimEventcall_256, gMapanimEventcall_282\n"
"	.4byte gMapanimEventcall_231, gMapanimEventcall_257, gMapanimEventcall_283, gMapanimEventcall_232, gMapanimEventcall_258, gMapanimEventcall_284\n"
"	.4byte gMapanimEventcall_233, gMapanimEventcall_259, gMapanimEventcall_285, gMapanimEventcall_234, gMapanimEventcall_260, gMapanimEventcall_286\n"
"	.4byte gMapanimEventcall_235, gMapanimEventcall_261, gMapanimEventcall_287, gMapanimEventcall_236, gMapanimEventcall_262, gMapanimEventcall_288\n"
"	.4byte gMapanimEventcall_237, gMapanimEventcall_263, gMapanimEventcall_289, gMapanimEventcall_238, gMapanimEventcall_264, gMapanimEventcall_290\n"
"	.4byte gMapanimEventcall_239, gMapanimEventcall_265, gMapanimEventcall_291, gMapanimEventcall_240, gMapanimEventcall_266, gMapanimEventcall_292\n"
"	.4byte 0x00000004, DemonKingSummonAnim_OnEnd + 0x1, 0x0001000E, 0x00000000, 0x00000002, DemonKingSummonAnim_Init + 0x1\n"
"	.4byte 0x00000003, DemonKingSummonAnim_PhaseIntro + 0x1, 0x00000003, DemonKingSummonAnim_PhaseShakeRamp + 0x1, 0x00000003, DemonKingSummonAnim_PhaseBurst + 0x1\n"
"	.4byte 0x00000003, DemonKingSummonAnim_PhaseFlashWhite + 0x1, 0x00000003, DemonKingSummonAnim_PhaseDissolve + 0x1, 0x00000003, DemonKingSummonAnim_PhaseOutro + 0x1\n"
"	.4byte 0x00000002, DemonKingSummonAnim_Cleanup + 0x1, 0x003C000E, 0x00000000, 0x00000002, MapSpellAnim_CommonEnd + 0x1\n"
"	.4byte 0x00000000, 0x00000000, 0x00000002, DemonKingSummonShake_Init + 0x1, 0x0000000E, 0x00000000\n"
"	.4byte 0x00000003, DemonKingSummonShake_Loop + 0x1, 0x00000000, 0x00000000, Tsa_Mapeventcall_0, Tsa_Mapeventcall_1\n"
"	.4byte Tsa_Mapeventcall_2, Tsa_Mapeventcall_3, Tsa_Mapeventcall_4, Tsa_Mapeventcall_5, Tsa_Mapeventcall_6, Tsa_Mapeventcall_7\n"
"	.4byte Tsa_Mapeventcall_8, Tsa_Mapeventcall_9, Tsa_Mapeventcall_10, Tsa_Mapeventcall_11, Tsa_Mapeventcall_12, Tsa_Mapeventcall_13\n"
"	.4byte Tsa_Mapeventcall_14, Tsa_Mapeventcall_15, Tsa_Mapeventcall_16, Tsa_Mapeventcall_17, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, MapAnimMonsterStone_Init + 0x1, 0x00000003, SummonGfxAnim_Loop + 0x1, 0x00000002, sub_80831C4 + 0x1\n"
"	.4byte 0x00000002, MapSpellAnim_CommonEnd + 0x1, 0x00000000, 0x00000000, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, SummonGfxAnim_Init + 0x1, 0x00000003, SummonUnitGfx_Loop + 0x1, 0x00000002, SummonUnitGfx_End + 0x1\n"
"	.4byte 0x00000002, MapSpellAnim_CommonEnd + 0x1, 0x00000000, 0x00000000\n"
"	.global data_08A14D94\n"
"data_08A14D94:\n"
);
struct ProcCmd ProcScr_GlowingCross[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_SET_END_CB((void*)((u8*)GlowingCross_OnEnd + 0x1)), PROC_CALL((void*)((u8*)GlowingCross_Init + 0x1)), PROC_REPEAT((void*)((u8*)GlowingCross_Loop + 0x1)),
    PROC_END,
};
struct ProcCmd ProcScr_GlowCrossExit[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)GlowCrossExit_Init + 0x1)), PROC_REPEAT((void*)((u8*)GlowCrossExit_Loop + 0x1)), PROC_CALL((void*)((u8*)gap_0008359C + 0x1)),
    PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
u8 frontier_df4_menu_001_A588C0[] __attribute__((section(".data.frontier_df4_menu.gap1"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin");
/* frontier_df4_menu_002_A5D648: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap2, \"aw\", %progbits\n"
"	.global frontier_df4_menu_002_A5D648\n"
"frontier_df4_menu_002_A5D648:\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000A, gUidebug_0 + 0x308, 0x00161100, 0x0000000A\n"
"	.4byte gUidebug_0 + 0x30C, 0x00171101, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x54, 0x00000006\n"
"	.4byte 0x00000001, EventScr_GameOver, 0x00000065, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, frontier_df4_menu_002_A5D648, frontier_df4_menu_002_A5D648 + 0x4, frontier_df4_menu_002_A5D648 + 0x8, frontier_df4_menu_002_A5D648 + 0x24\n"
"	.4byte frontier_df4_menu_002_A5D648 + 0x40, frontier_df4_menu_002_A5D648 + 0x44, frontier_df4_menu_002_A5D648 + 0x48, frontier_df4_menu_002_A5D648 + 0x4C, gUidebug_0 + 0x64C, frontier_df4_menu_005_A5FFAD + 0x6C\n"
"	.4byte UnitDef_Tower1Ally, UnitDef_Tower1Ally, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, EventScr_Ch21b_BeginningScene + 0x1C, frontier_df3_eventscr_ch_021_A6FC48 + 0x54, 0x00080002, frontier_df3_eventscr_ch_021_A6FC48 + 0x168\n"
"	.4byte 0x0000FF01, 0x00000000, 0x00000000, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x100\n"
"	.4byte 0x00000006, 0x0007000B, frontier_df3_eventscr_ch_021_A6FC48 + 0x134, 0x11130111, 0x00000001, EventScr_GameOver\n"
"	.4byte 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gChDAsset_140 + 0x50, gChDAsset_140 + 0x60, gChDAsset_140 + 0x64, gChDAsset_140 + 0x68, gChDAsset_140 + 0x90, gChDAsset_140 + 0x94\n"
"	.4byte gChDAsset_140 + 0x98, gChDAsset_140 + 0x9C, gUidebug_0 + 0x64D, frontier_df4_menu_005_A5FFAD + 0x6D, UnitDef_Tower2Ally, UnitDef_Tower2Ally\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x88, frontier_df3_eventscr_ch_021_A6FC48 + 0x100, 0x00000000, 0x00000000, 0x00000007, 0x0BB80077\n"
"	.4byte 0x0014030A, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4, 0x00000006, 0x00000001\n"
"	.4byte EventScr_GameOver, 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, gChDAsset_143 + 0x50, gChDAsset_143 + 0x54, gChDAsset_143 + 0x58, gChDAsset_143 + 0x68, gChDAsset_143 + 0x84\n"
"	.4byte gChDAsset_143 + 0x88, gChDAsset_143 + 0x8C, gChDAsset_143 + 0x90, gUidebug_0 + 0x64E, frontier_df4_menu_005_A5FFAD + 0x6E, UnitDef_Tower3Ally\n"
"	.4byte UnitDef_Tower3Ally, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, frontier_df3_eventscr_ch_021_A6FC48 + 0x180, frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC, 0x00000006, 0x00000001, EventScr_GameOver, 0x00000065\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, gChDAsset_146 + 0x50\n"
"	.4byte gChDAsset_146 + 0x54, gChDAsset_146 + 0x58, gChDAsset_146 + 0x5C, gChDAsset_146 + 0x78, gChDAsset_146 + 0x7C, gChDAsset_146 + 0x80\n"
"	.4byte gChDAsset_146 + 0x84, gUidebug_0 + 0x64F, frontier_df4_menu_005_A5FFAD + 0x6F, UnitDef_Tower4Ally, UnitDef_Tower4Ally, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, frontier_df3_eventscr_ch_021_A6FC48 + 0x238\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC, 0x00000002, frontier_df3_eventscr_ch_021_A6FC48 + 0x388, 0x00000602, 0x00000000, 0x00000000\n"
"	.4byte 0x00000005, gUidebug_0 + 0x60, 0x00140906, 0x00000005, gUidebug_0 + 0x6E, 0x00140E0E\n"
"	.4byte 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x354, 0x00000006, 0x00000001, EventScr_GameOver\n"
"	.4byte 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gChDAsset_149 + 0x50, gChDAsset_149 + 0x60, gChDAsset_149 + 0x64, gChDAsset_149 + 0x80, gChDAsset_149 + 0x9C, gChDAsset_149 + 0xA0\n"
"	.4byte gChDAsset_149 + 0xA4, gChDAsset_149 + 0xA8, gUidebug_0 + 0x650, frontier_df4_menu_005_A5FFAD + 0x70, UnitDef_Tower5Ally, UnitDef_Tower5Ally\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x2E0, frontier_df3_eventscr_ch_021_A6FC48 + 0x354, 0x00000000, 0x00000000, 0x00000005, gUidebug_0 + 0x7C\n"
"	.4byte 0x00141202, 0x00000005, gUidebug_0 + 0x86, 0x0014010C, 0x00000005, gUidebug_0 + 0x9A\n"
"	.4byte 0x0014010A, 0x00000007, 0x13880077, 0x00140113, 0x00000000, 0x00000001\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x414, 0x00000006, 0x00000001, EventScr_GameOver, 0x00000065, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap3, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_003_A5E6CC\n"
"frontier_df4_menu_003_A5E6CC:\n"
"\t.4byte MelkaenCoastMapChanges + 0x50\n"
"\t.4byte MelkaenCoastMapChanges + 0x144\n"
"\t.4byte MelkaenCoastMapChanges + 0x148\n"
"\t.4byte MelkaenCoastMapChanges + 0x14C\n"
"\t.4byte MelkaenCoastMapChanges + 0x15C\n"
"\t.4byte MelkaenCoastMapChanges + 0x160\n"
"\t.4byte MelkaenCoastMapChanges + 0x164\n"
"\t.4byte MelkaenCoastMapChanges + 0x168\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0x3\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0xF8\n"
"\t.4byte UnitDef_MelkaenCoastMixed\n"
"\t.4byte UnitDef_MelkaenCoastMixed\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte frontier_df4_menu_011_A71268 + 0x2A8\n"
"\t.4byte frontier_df4_menu_011_A71268 + 0x2C8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000005\n"
"\t.4byte EventScr_Ruin_54\n"
"\t.4byte 0x00100101\n"
"\t.4byte 0x00000005\n"
"\t.4byte EventScr_Ruin_56\n"
"\t.4byte 0x00100103\n"
"\t.4byte 0x00000005\n"
"\t.4byte EventScr_Ruin_58\n"
"\t.4byte 0x00100105\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte gAutoUdefJids + 0x64\n"
"\t.4byte 0x01010101\n"
"\t.4byte 0x0000000B\n"
"\t.4byte EventScr_Ruin_55\n"
"\t.4byte 0x01030103\n"
"\t.4byte 0x0000000B\n"
"\t.4byte EventScr_Ruin_57\n"
"\t.4byte 0x01050105\n"
"\t.4byte 0x00000001\n"
"\t.4byte data_085B9EE8\n"
"\t.4byte 0x00000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0x50\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0x54\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0x58\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0x80\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0xB4\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0xB8\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0xBC\n"
"\t.4byte frontier_df4_menu_003_A5E6CC + 0xC0\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0x4\n"
"\t.4byte frontier_df4_menu_005_A5FFAD + 0xF9\n"
"\t.4byte UnitDef_UnusedAlly\n"
"\t.4byte UnitDef_UnusedAlly\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte gAutoUdefJids + 0x38\n"
"\t.4byte gAutoUdefJids + 0x58\n"
"\t.4byte 0x00020045\n"
"\t.4byte 0x00000040\n"
"\t.4byte 0x000008CA\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00680000\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x000008D6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000068\n"
"\t.4byte 0x00010000\n"
"\t.4byte 0x000008D6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00460000\n"
"\t.4byte 0x00010001\n"
"\t.4byte 0x000008F5\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000046\n"
"\t.4byte 0x00010001\n"
"\t.4byte 0x000008F5\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00470000\n"
"\t.4byte 0x00010002\n"
"\t.4byte 0x00000920\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000047\n"
"\t.4byte 0x00010002\n"
"\t.4byte 0x00000920\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00480000\n"
"\t.4byte 0x00010003\n"
"\t.4byte 0x00000953\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000048\n"
"\t.4byte 0x00010003\n"
"\t.4byte 0x00000953\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004A0000\n"
"\t.4byte 0x00010006\n"
"\t.4byte 0x00000987\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004A\n"
"\t.4byte 0x00010006\n"
"\t.4byte 0x00000987\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006A0000\n"
"\t.4byte 0x00010005\n"
"\t.4byte 0x0000099F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006A\n"
"\t.4byte 0x00010005\n"
"\t.4byte 0x0000099F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004B0000\n"
"\t.4byte 0x00010007\n"
"\t.4byte 0x000009B0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004B\n"
"\t.4byte 0x00010007\n"
"\t.4byte 0x000009B0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004C0000\n"
"\t.4byte 0x00010008\n"
"\t.4byte 0x000009C3\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004C\n"
"\t.4byte 0x00010008\n"
"\t.4byte 0x000009C3\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004D0000\n"
"\t.4byte 0x00010009\n"
"\t.4byte 0x000009CF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004D\n"
"\t.4byte 0x00010009\n"
"\t.4byte 0x000009CF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004E0000\n"
"\t.4byte 0x0001000A\n"
"\t.4byte 0x000009E1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004E\n"
"\t.4byte 0x0001000A\n"
"\t.4byte 0x000009E1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x005A0012\n"
"\t.4byte 0x00090017\n"
"\t.4byte 0x00000A6A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x005A0000\n"
"\t.4byte 0x00010017\n"
"\t.4byte 0x00000A6B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000005A\n"
"\t.4byte 0x00010017\n"
"\t.4byte 0x00000A6B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004F000B\n"
"\t.4byte 0x000C000B\n"
"\t.4byte 0x000009F4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004F0000\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x000009F5\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004F\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x000009F5\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000E001D\n"
"\t.4byte 0x00090018\n"
"\t.4byte 0x00000A7E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x005B0000\n"
"\t.4byte 0x00010018\n"
"\t.4byte 0x00000A7F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000005B\n"
"\t.4byte 0x00010018\n"
"\t.4byte 0x00000A7F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00510001\n"
"\t.4byte 0x0009000D\n"
"\t.4byte 0x00000A31\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00510000\n"
"\t.4byte 0x000A000D\n"
"\t.4byte 0x00000A32\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000051\n"
"\t.4byte 0x000A000D\n"
"\t.4byte 0x00000A32\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x004F0000\n"
"\t.4byte 0x000B000D\n"
"\t.4byte 0x00000A34\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000004F\n"
"\t.4byte 0x000B000D\n"
"\t.4byte 0x00000A34\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00440000\n"
"\t.4byte 0x0001001A\n"
"\t.4byte 0x00000AB1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000044\n"
"\t.4byte 0x0001001A\n"
"\t.4byte 0x00000AB1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00520020\n"
"\t.4byte 0x0007000E\n"
"\t.4byte 0x00000A49\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00520000\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000A4A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000052\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000A4A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006B000F\n"
"\t.4byte 0x0007001B\n"
"\t.4byte 0x00000AC2\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006B001D\n"
"\t.4byte 0x0008001B\n"
"\t.4byte 0x00000AC3\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006B0000\n"
"\t.4byte 0x0001001B\n"
"\t.4byte 0x00000AC4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006B\n"
"\t.4byte 0x0001001B\n"
"\t.4byte 0x00000AC4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00430069\n"
"\t.4byte 0x00000041\n"
"\t.4byte 0x00000A12\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00430001\n"
"\t.4byte 0x0007000F\n"
"\t.4byte 0x00000ADE\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0043000F\n"
"\t.4byte 0x0008000F\n"
"\t.4byte 0x00000ADF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0043000E\n"
"\t.4byte 0x0009000F\n"
"\t.4byte 0x00000AE0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00530020\n"
"\t.4byte 0x000A000F\n"
"\t.4byte 0x00000AE2\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00430000\n"
"\t.4byte 0x000B000F\n"
"\t.4byte 0x00000AE4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000043\n"
"\t.4byte 0x000B000F\n"
"\t.4byte 0x00000AE4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00530000\n"
"\t.4byte 0x000C000F\n"
"\t.4byte 0x00000AE6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000053\n"
"\t.4byte 0x000C000F\n"
"\t.4byte 0x00000AE6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00430001\n"
"\t.4byte 0x0007001C\n"
"\t.4byte 0x00000ADE\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0043000F\n"
"\t.4byte 0x0008001C\n"
"\t.4byte 0x00000ADF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0043000E\n"
"\t.4byte 0x0009001C\n"
"\t.4byte 0x00000AE1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00530020\n"
"\t.4byte 0x000A001C\n"
"\t.4byte 0x00000AE3\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00430000\n"
"\t.4byte 0x000B001C\n"
"\t.4byte 0x00000AE4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000043\n"
"\t.4byte 0x000B001C\n"
"\t.4byte 0x00000AE4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00530000\n"
"\t.4byte 0x000C001C\n"
"\t.4byte 0x00000AE6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000053\n"
"\t.4byte 0x000C001C\n"
"\t.4byte 0x00000AE6\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0001\n"
"\t.4byte 0x00070010\n"
"\t.4byte 0x00000B02\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0002\n"
"\t.4byte 0x00080010\n"
"\t.4byte 0x00000B04\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0011\n"
"\t.4byte 0x00090010\n"
"\t.4byte 0x00000B05\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0010\n"
"\t.4byte 0x000A0010\n"
"\t.4byte 0x00000B06\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0000\n"
"\t.4byte 0x00010010\n"
"\t.4byte 0x00000B07\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006D\n"
"\t.4byte 0x00010010\n"
"\t.4byte 0x00000B07\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D000F\n"
"\t.4byte 0x0007001D\n"
"\t.4byte 0x00000B03\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0002\n"
"\t.4byte 0x0008001D\n"
"\t.4byte 0x00000B04\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0011\n"
"\t.4byte 0x0009001D\n"
"\t.4byte 0x00000B05\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0010\n"
"\t.4byte 0x000A001D\n"
"\t.4byte 0x00000B06\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006D0000\n"
"\t.4byte 0x0001001D\n"
"\t.4byte 0x00000B07\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006D\n"
"\t.4byte 0x0001001D\n"
"\t.4byte 0x00000B07\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00400001\n"
"\t.4byte 0x00070011\n"
"\t.4byte 0x00000B28\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0040000F\n"
"\t.4byte 0x00080011\n"
"\t.4byte 0x00000B29\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00400000\n"
"\t.4byte 0x00010011\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000040\n"
"\t.4byte 0x00010011\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00400001\n"
"\t.4byte 0x0007001E\n"
"\t.4byte 0x00000B2A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0040000F\n"
"\t.4byte 0x0008001E\n"
"\t.4byte 0x00000B2B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00400000\n"
"\t.4byte 0x0001001E\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000040\n"
"\t.4byte 0x0001001E\n"
"\t.4byte 0x00000B2C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570000\n"
"\t.4byte 0x00010013\n"
"\t.4byte 0x00000B5A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000057\n"
"\t.4byte 0x00010013\n"
"\t.4byte 0x00000B5A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570000\n"
"\t.4byte 0x00010020\n"
"\t.4byte 0x00000B5A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000057\n"
"\t.4byte 0x00010020\n"
"\t.4byte 0x00000B5A\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0041001E\n"
"\t.4byte 0x00070014\n"
"\t.4byte 0x00000B6F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570019\n"
"\t.4byte 0x00080014\n"
"\t.4byte 0x00000B70\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570000\n"
"\t.4byte 0x00010014\n"
"\t.4byte 0x00000B71\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000057\n"
"\t.4byte 0x00010014\n"
"\t.4byte 0x00000B71\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0041001E\n"
"\t.4byte 0x00070021\n"
"\t.4byte 0x00000B6F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570019\n"
"\t.4byte 0x00080021\n"
"\t.4byte 0x00000B70\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00570000\n"
"\t.4byte 0x00010021\n"
"\t.4byte 0x00000B71\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000057\n"
"\t.4byte 0x00010021\n"
"\t.4byte 0x00000B71\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006C0001\n"
"\t.4byte 0x00070015\n"
"\t.4byte 0x00000B7F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006C0000\n"
"\t.4byte 0x00010015\n"
"\t.4byte 0x00000B81\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006C\n"
"\t.4byte 0x00010015\n"
"\t.4byte 0x00000B81\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006C000F\n"
"\t.4byte 0x00070022\n"
"\t.4byte 0x00000B80\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x006C0000\n"
"\t.4byte 0x00010022\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000006C\n"
"\t.4byte 0x00010022\n"
"\t.4byte 0x00000B83\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00BE0001\n"
"\t.4byte 0x00070016\n"
"\t.4byte 0x00000BB3\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00BE000F\n"
"\t.4byte 0x00070023\n"
"\t.4byte 0x00000BB4\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000006\n"
"\t.4byte 0x007F00FE\n"
"\t.4byte 0x000008C0\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000022\n"
"\t.4byte 0x008000FE\n"
"\t.4byte 0x000008C1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000021\n"
"\t.4byte 0x008100FE\n"
"\t.4byte 0x000008C2\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00FF0068\n"
"\t.4byte banim_drum_mg1_sheet_0 + 0x996\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x01FF0046\n"
"\t.4byte pad_F2F5C0 + 0x30A42\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x02FF0047\n"
"\t.4byte 0x09210002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x03FF0048\n"
"\t.4byte 0x09540002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x04FF0049\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x06FF000D\n"
"\t.4byte 0x09860000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x06FF004A\n"
"\t.4byte 0x09880002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x05FF006A\n"
"\t.4byte 0x09A00002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x05FF0010\n"
"\t.4byte 0x099C0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x05FF0011\n"
"\t.4byte 0x099D0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x05FF0042\n"
"\t.4byte 0x099E0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x07FF004B\n"
"\t.4byte 0x09B10002\n"
"\t.4byte 0x00000000\n"
"\t.4byte pad_FE4000 + 0xC04C\n"
"\t.4byte 0x09C40002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x09FF004D\n"
"\t.4byte 0x09D00002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0AFF004E\n"
"\t.4byte 0x09E20002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x17FF005A\n"
"\t.4byte 0x0A6C0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0BFF004F\n"
"\t.4byte 0x09F60002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x18FF001D\n"
"\t.4byte 0x0C000065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x18FF005B\n"
"\t.4byte 0x0A800002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x19FF005C\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0DFF0051\n"
"\t.4byte 0x0A330002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0DFF004F\n"
"\t.4byte 0x0A350000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1AFF0044\n"
"\t.4byte 0x0AB20002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0EFF0052\n"
"\t.4byte 0x0A4B0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1BFF006B\n"
"\t.4byte 0x0AC50002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0FFF0043\n"
"\t.4byte 0x0AE50000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0FFF0053\n"
"\t.4byte 0x0AE70000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1CFF0043\n"
"\t.4byte 0x0AE50000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1CFF0053\n"
"\t.4byte 0x0AE70000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x10FF006D\n"
"\t.4byte 0x0B080002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1DFF006D\n"
"\t.4byte 0x0B080002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x11FF0040\n"
"\t.4byte 0x0B2D0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1EFF0040\n"
"\t.4byte 0x0B2D0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x12FF0056\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x1FFF0056\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x13FF00C8\n"
"\t.4byte 0x0B590065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x13FF0057\n"
"\t.4byte 0x0B5B0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x20FF0022\n"
"\t.4byte 0x0BF40007\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x20FF00C8\n"
"\t.4byte 0x0B590065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x20FF0057\n"
"\t.4byte 0x0B5B0002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x14FF0057\n"
"\t.4byte 0x0B720000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x21FF0057\n"
"\t.4byte 0x0B720000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x15FF006C\n"
"\t.4byte 0x0B820002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x22FF006C\n"
"\t.4byte 0x0B840002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x16FF00BE\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x23FF00BE\n"
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0001\n"
"\t.4byte 0x0BE30065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000F\n"
"\t.4byte 0x0BE40065\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0002\n"
"\t.4byte 0x0BE50000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0004\n"
"\t.4byte 0x0BE60000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0003\n"
"\t.4byte 0x0BE70000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0005\n"
"\t.4byte 0x0BE80000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0006\n"
"\t.4byte 0x0BE90000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000A\n"
"\t.4byte 0x0BEA0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0007\n"
"\t.4byte 0x0BEB0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0009\n"
"\t.4byte 0x0BEC0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0008\n"
"\t.4byte 0x0BED0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0013\n"
"\t.4byte 0x0BEE0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000C\n"
"\t.4byte 0x0BEF0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000D\n"
"\t.4byte 0x0BF00000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0020\n"
"\t.4byte 0x0BF10000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0011\n"
"\t.4byte 0x0BF20000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0010\n"
"\t.4byte 0x0BF30000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0022\n"
"\t.4byte 0x0BF40000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000B\n"
"\t.4byte 0x0BF50000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0014\n"
"\t.4byte 0x0BF60000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0015\n"
"\t.4byte 0x0BF70000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0016\n"
"\t.4byte 0x0BF80000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0017\n"
"\t.4byte 0x0BF90000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0018\n"
"\t.4byte 0x0BFA0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0019\n"
"\t.4byte 0x0BFB0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF001A\n"
"\t.4byte 0x0BFC0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF000E\n"
"\t.4byte 0x0BFD0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0012\n"
"\t.4byte 0x0BFE0086\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF001C\n"
"\t.4byte 0x0BFF0000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF001D\n"
"\t.4byte 0x0C000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF001E\n"
"\t.4byte 0x0C010000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF001F\n"
"\t.4byte 0x0C020000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0xFFFF0021\n"
"\t.4byte 0x0C030000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap4, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_004_A5F770\n"
"frontier_df4_menu_004_A5F770:\n"
"\t.4byte 0xFF010001\n"
"\t.4byte 0xFF020001\n"
"\t.4byte 0xFF03000F\n"
"\t.4byte 0x04FF0013\n"
"\t.4byte 0x06FF000D\n"
"\t.4byte 0x0AFF0022\n"
"\t.4byte 0x0CFF0017\n"
"\t.4byte 0x1502000F\n"
"\t.4byte 0x22030001\n"
"\t.4byte 0x0000FFFF\n"
"\t.4byte 0x1E0B1902\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x161A160D\n"
"\t.4byte 0x16311624\n"
"\t.4byte Img_GespenstBg4 + 0xF1\n"
"\t.4byte 0x16390000\n"
"\t.4byte 0x16461640\n"
"\t.4byte 0x0475164D\n"
"\t.4byte 0x00000876\n"
"\t.4byte 0x144F284E\n"
"\t.4byte 0x14501451\n"
"\t.4byte 0x0A030000\n"
"\t.4byte 0x050B0A06\n"
"\t.4byte 0x05191416\n"
"\t.4byte 0x05231420\n"
"\t.4byte 0x0532142E\n"
"\t.4byte 0x193A0000\n"
"\t.4byte 0x1941093B\n"
"\t.4byte 0x19470842\n"
"\t.4byte 0x00000848\n"
"\t.4byte 0x1C411B3A\n"
"\t.4byte 0x02741C47\n"
"\t.4byte 0x0A760575\n"
"\t.4byte 0x17060000\n"
"\t.4byte 0x14201416\n"
"\t.4byte 0x0274142E\n"
"\t.4byte 0x0A760575\n"
"\t.4byte 0x190D0000\n"
"\t.4byte 0x1924191A\n"
"\t.4byte 0x00001931\n"
"\t.4byte 0x0A0F0A0E\n"
"\t.4byte 0x0A950A13\n"
"\t.4byte 0x0A1B0A8D\n"
"\t.4byte 0x0A250A2B\n"
"\t.4byte 0x0A340A5A\n"
"\t.4byte 0x19040000\n"
"\t.4byte 0x19211917\n"
"\t.4byte 0x0000192F\n"
"\t.4byte 0x14511450\n"
"\t.4byte 0x144F144E\n"
"\t.4byte 0x0000144C\n"
"\t.4byte 0x093C193A\n"
"\t.4byte DirectSoundData_btl_mon_magic1_13k + 0xA15\n"
"\t.4byte DirectSoundData_sys_chapter_start3_13k + 0x2FA7\n"
"\t.4byte 0x14740000\n"
"\t.4byte 0x1E763275\n"
"\t.4byte 0x1E0F0000\n"
"\t.4byte 0x285A1E8D\n"
"\t.4byte 0x5A740000\n"
"\t.4byte 0x00000A72\n"
"\t.4byte 0x00020001\n"
"\t.4byte 0x00150014\n"
"\t.4byte 0x0000001F\n"
"\t.4byte 0x00020001\n"
"\t.4byte 0x00140003\n"
"\t.4byte 0x00160015\n"
"\t.4byte 0x0020001F\n"
"\t.4byte 0x002E002D\n"
"\t.4byte 0x004B0000\n"
"\t.4byte 0x006C0056\n"
"\t.4byte 0x003F0038\n"
"\t.4byte 0x00380000\n"
"\t.4byte 0x003F0039\n"
"\t.4byte 0x004B0040\n"
"\t.4byte 0x0058004C\n"
"\t.4byte 0x006D006C\n"
"\t.4byte 0x0070006F\n"
"\t.4byte 0x00030000\n"
"\t.4byte 0x00140005\n"
"\t.4byte 0x001F0016\n"
"\t.4byte 0x00260020\n"
"\t.4byte 0x002D0028\n"
"\t.4byte 0x0033002E\n"
"\t.4byte 0x00390000\n"
"\t.4byte 0x0040003A\n"
"\t.4byte 0x004C004B\n"
"\t.4byte 0x006C0050\n"
"\t.4byte 0x006E006D\n"
"\t.4byte 0x0000006F\n"
"\t.4byte 0x002A0012\n"
"\t.4byte 0x0031001E\n"
"\t.4byte 0x003B0042\n"
"\t.4byte 0x005B004D\n"
"\t.4byte 0x006B005C\n"
"\t.4byte 0x00650064\n"
"\t.4byte 0x00670066\n"
"\t.4byte 0x00970068\n"
"\t.4byte 0x00390000\n"
"\t.4byte 0x003F003A\n"
"\t.4byte 0x00410040\n"
"\t.4byte 0x00460045\n"
"\t.4byte 0x0050004C\n"
"\t.4byte 0x006C0059\n"
"\t.4byte 0x006E006D\n"
"\t.4byte 0x0000006F\n"
"\t.4byte 0x003A0039\n"
"\t.4byte 0x00410040\n"
"\t.4byte 0x00460045\n"
"\t.4byte 0x004D004C\n"
"\t.4byte 0x006D0050\n"
"\t.4byte 0x006F006E\n"
"\t.4byte 0x00020000\n"
"\t.4byte 0x000D0003\n"
"\t.4byte 0x00160015\n"
"\t.4byte 0x0020001A\n"
"\t.4byte 0x00240028\n"
"\t.4byte 0x0034002E\n"
"\t.4byte 0x00000031\n"
"\t.4byte 0x001D000C\n"
"\t.4byte 0x004E0086\n"
"\t.4byte 0x005C005B\n"
"\t.4byte 0x005E005D\n"
"\t.4byte 0x0060005F\n"
"\t.4byte 0x00650064\n"
"\t.4byte 0x00670066\n"
"\t.4byte 0x00970068\n"
"\t.4byte 0x00030000\n"
"\t.4byte 0x00150005\n"
"\t.4byte 0x001F0016\n"
"\t.4byte 0x00260020\n"
"\t.4byte 0x002D0028\n"
"\t.4byte 0x0033002E\n"
"\t.4byte 0x00380000\n"
"\t.4byte 0x003F0039\n"
"\t.4byte 0x004B0040\n"
"\t.4byte 0x0050004C\n"
"\t.4byte 0x006C0058\n"
"\t.4byte 0x006F006D\n"
"\t.4byte 0x00000070\n"
"\t.4byte 0x003A0039\n"
"\t.4byte 0x004B0040\n"
"\t.4byte 0x0050004C\n"
"\t.4byte 0x006D006C\n"
"\t.4byte 0x006F006E\n"
"\t.4byte 0x00120000\n"
"\t.4byte 0x001E002A\n"
"\t.4byte 0x00420031\n"
"\t.4byte 0x004D003B\n"
"\t.4byte 0x005C005B\n"
"\t.4byte 0x0064006B\n"
"\t.4byte 0x00660065\n"
"\t.4byte 0x00680067\n"
"\t.4byte 0x00000097\n"
"\t.4byte 0x003A0039\n"
"\t.4byte 0x0040003F\n"
"\t.4byte 0x00450041\n"
"\t.4byte 0x004C0046\n"
"\t.4byte 0x00590050\n"
"\t.4byte 0x006D006C\n"
"\t.4byte 0x006F006E\n"
"\t.4byte 0x00390000\n"
"\t.4byte 0x0040003A\n"
"\t.4byte 0x00450041\n"
"\t.4byte 0x004C0046\n"
"\t.4byte 0x0050004D\n"
"\t.4byte 0x006E006D\n"
"\t.4byte 0x0000006F\n"
"\t.4byte 0x00030002\n"
"\t.4byte 0x0015000D\n"
"\t.4byte 0x001A0016\n"
"\t.4byte 0x00280020\n"
"\t.4byte 0x002E0024\n"
"\t.4byte 0x00310034\n"
"\t.4byte 0x000C0000\n"
"\t.4byte 0x0086001D\n"
"\t.4byte 0x005B004E\n"
"\t.4byte 0x005D005C\n"
"\t.4byte 0x005F005E\n"
"\t.4byte 0x00640060\n"
"\t.4byte 0x00660065\n"
"\t.4byte 0x00680067\n"
"\t.4byte 0x00000097\n"
"\t.4byte 0x000000A1\n"
"\t.4byte 0x00000097\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x01000000\n"
"\t.4byte 0x00350811\n"
"\t.4byte 0x0A020100\n"
"\t.4byte 0x00000035\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x01000000\n"
"\t.4byte 0x0035030E\n"
"\t.4byte 0x03100100\n"
"\t.4byte 0x01000035\n"
"\t.4byte 0x00351704\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0B010000\n"
"\t.4byte 0x0000350D\n"
"\t.4byte 0x35071101\n"
"\t.4byte 0x0C010000\n"
"\t.4byte 0x00003503\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000D070C\n"
"\t.4byte 0x070C0403\n"
"\t.4byte 0x05050000\n"
"\t.4byte 0x0001090C\n"
"\t.4byte 0x0A0C0506\n"
"\t.4byte 0x05050000\n"
"\t.4byte 0x0008060C\n"
"\t.4byte 0x150C0504\n"
"\t.4byte 0x05060004\n"
"\t.4byte 0x0005160C\n"
"\t.4byte 0x160C0506\n"
"\t.4byte 0x05050008\n"
"\t.4byte 0x000E140C\n"
"\t.4byte 0x150C0503\n"
"\t.4byte 0x0504000F\n"
"\t.4byte 0x0010130C\n"
"\t.4byte 0x130C0504\n"
"\t.4byte 0x0504001A\n"
"\t.4byte 0x0011090C\n"
"\t.4byte WMLoc_GetChapterId + 0x20\n"
"\t.4byte 0x04010011\n"
"\t.4byte 0x0012080C\n"
"\t.4byte 0x0C0C0401\n"
"\t.4byte 0x04020012\n"
"\t.4byte 0x000A1304\n"
"\t.4byte 0x11040101\n"
"\t.4byte 0x0101000A\n"
"\t.4byte 0x000B1204\n"
"\t.4byte 0x13040101\n"
"\t.4byte 0x0101000E\n"
"\t.4byte 0x000F1304\n"
"\t.4byte 0x14040101\n"
"\t.4byte 0x0101000F\n"
"\t.4byte 0x00101404\n"
"\t.4byte 0x16040101\n"
"\t.4byte 0x01010015\n"
"\t.4byte 0x00161504\n"
"\t.4byte 0x16040101\n"
"\t.4byte 0x01010016\n"
"\t.4byte 0x00150F04\n"
"\t.4byte 0x10040101\n"
"\t.4byte 0x01010016\n"
"\t.4byte 0x00160E04\n"
"\t.4byte 0x0E040101\n"
"\t.4byte 0x01010017\n"
"\t.4byte 0x000C0904\n"
"\t.4byte AiStaffRestore + 0x1C\n"
"\t.4byte 0x0101000A\n"
"\t.4byte 0x000A0704\n"
"\t.4byte 0x07040101\n"
"\t.4byte 0x01010009\n"
"\t.4byte 0x00090604\n"
"\t.4byte AiStaffRestore + 0x1C\n"
"\t.4byte 0x01010008\n"
"\t.4byte 0x00070704\n"
"\t.4byte 0x140C0101\n"
"\t.4byte 0x05050019\n"
"\t.4byte 0x00081504\n"
"\t.4byte 0x14040101\n"
"\t.4byte 0x01010007\n"
"\t.4byte 0x00061204\n"
"\t.4byte 0x0E040101\n"
"\t.4byte 0x01010014\n"
"\t.4byte 0x00170F04\n"
"\t.4byte 0x11040101\n"
"\t.4byte 0x01010017\n"
"\t.4byte 0x00181004\n"
"\t.4byte 0x15040101\n"
"\t.4byte 0x01010017\n"
"\t.4byte 0x00131604\n"
"\t.4byte 0x15040101\n"
"\t.4byte 0x01010014\n"
"\t.4byte 0x000B0904\n"
"\t.4byte 0x12040101\n"
"\t.4byte 0x01010009\n"
"\t.4byte 0x00071204\n"
"\t.4byte 0x13040101\n"
"\t.4byte 0x01010008\n"
"\t.4byte 0x0002070C\n"
"\t.4byte 0x0D0C0505\n"
"\t.4byte 0x05050003\n"
"\t.4byte 0x0001040C\n"
"\t.4byte 0x0D0C0505\n"
"\t.4byte 0x07050005\n"
"\t.4byte 0x001A140C\n"
"\t.4byte GetNodeAtPosition + 0xAC\n"
"\t.4byte 0x05050007\n"
"\t.4byte 0x0005150C\n"
"\t.4byte 0x00000505\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0D070C00\n"
"\t.4byte 0x0C040300\n"
"\t.4byte 0x05000007\n"
"\t.4byte 0x01090C05\n"
"\t.4byte 0x0C050600\n"
"\t.4byte 0x0500000A\n"
"\t.4byte StartSpellAnimPurge + 0x24\n"
"\t.4byte 0x0C050400\n"
"\t.4byte 0x06000415\n"
"\t.4byte 0x05160C05\n"
"\t.4byte 0x0C050600\n"
"\t.4byte 0x05000816\n"
"\t.4byte 0x0E140C05\n"
"\t.4byte 0x0C050300\n"
"\t.4byte 0x04000F15\n"
"\t.4byte 0x10130C05\n"
"\t.4byte 0x0C050400\n"
"\t.4byte 0x04001A13\n"
"\t.4byte 0x11090C05\n"
"\t.4byte 0x0C040100\n"
"\t.4byte 0x01001108\n"
"\t.4byte 0x12080C04\n"
"\t.4byte 0x0C040100\n"
"\t.4byte 0x0200120C\n"
"\t.4byte 0x0A130404\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000A11\n"
"\t.4byte 0x0B120401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000E13\n"
"\t.4byte 0x0F130401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000F14\n"
"\t.4byte 0x10140401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001516\n"
"\t.4byte 0x16150401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001616\n"
"\t.4byte 0x150F0401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001610\n"
"\t.4byte 0x160E0401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x0100170E\n"
"\t.4byte 0x0C090401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000A08\n"
"\t.4byte 0x0A070401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000907\n"
"\t.4byte 0x09060401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000808\n"
"\t.4byte 0x07070401\n"
"\t.4byte 0x0C010100\n"
"\t.4byte 0x05001914\n"
"\t.4byte gMsgTable + 0x3379\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000714\n"
"\t.4byte 0x06120401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x0100140E\n"
"\t.4byte 0x170F0401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001711\n"
"\t.4byte 0x18100401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001715\n"
"\t.4byte 0x13160401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01001415\n"
"\t.4byte 0x0B090401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000912\n"
"\t.4byte 0x07120401\n"
"\t.4byte 0x04010100\n"
"\t.4byte 0x01000813\n"
"\t.4byte 0x02070C01\n"
"\t.4byte 0x0C050500\n"
"\t.4byte 0x0500030D\n"
"\t.4byte 0x01040C05\n"
"\t.4byte 0x0C050500\n"
"\t.4byte 0x0500050D\n"
"\t.4byte 0x1A140C07\n"
"\t.4byte 0x0C050500\n"
"\t.4byte 0x05000708\n"
"\t.4byte 0x05150C05\n"
"\t.4byte 0x00050500\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x07000000\n"
"\t.4byte 0x03000003\n"
"\t.4byte 0x00130702\n"
"\t.4byte 0x00020200\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x030A0905\n"
"\t.4byte 0x07050101\n"
"\t.4byte 0x0101020F\n"
"\t.4byte 0x020B0405\n"
"\t.4byte ProcessMenuSelectInput + 0x18\n"
"\t.4byte 0x0101020A\n"
"\t.4byte 0x02050705\n"
"\t.4byte 0x10050101\n"
"\t.4byte 0x0101010C\n"
"\t.4byte 0x01081005\n"
"\t.4byte 0x12050101\n"
"\t.4byte 0x0101000A\n"
"\t.4byte 0x00101305\n"
"\t.4byte 0x00050101\n"
"\t.4byte 0x0101010A\n"
"\t.4byte 0x03100D05\n"
"\t.4byte 0x0E050101\n"
"\t.4byte 0x01010213\n"
"\t.4byte 0x010C0005\n"
"\t.4byte 0x0A050101\n"
"\t.4byte 0x01010009\n"
"\t.4byte 0x03160C05\n"
"\t.4byte 0x07050101\n"
"\t.4byte 0x01010201\n"
"\t.4byte 0x00040905\n"
"\t.4byte 0x02050101\n"
"\t.4byte 0x01010206\n"
"\t.4byte 0x02030A05\n"
"\t.4byte 0x0C050101\n"
"\t.4byte 0x01010203\n"
"\t.4byte 0x02030E05\n"
"\t.4byte 0x00000101\n"
"\t.byte 0x00\n"
"\t.byte 0x00\n"
);
u8 frontier_df4_menu_005_A5FFAD[] __attribute__((section(".data.frontier_df4_menu.gap5"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x0, 0x103);
__asm__(
"\t.section .data.frontier_df4_menu.gap5, \"aw\", %progbits\n"
"\t.global data_08A600B0\n"
"data_08A600B0:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x103, 0xC\n"
"	.4byte GameOver_FadeOutCurrentBgm\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x113, 0xC\n"
"	.4byte StartSlowFadeToBlack\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x123, 0xC\n"
"	.4byte EndAllMus\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x133, 0x4\n"
"	.4byte SkilGameOverForToturialExtraMap\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x13B, 0x4\n"
"	.4byte sub_8021210\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x143, 0x14\n"
"	.4byte PostGameOverHandler\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x15B, 0x14\n"
"	.4byte AsnycKeyStatus_ButtonB\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x173, 0xC\n"
"	.4byte UnsetKeyIgnoreMask\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x183, 0x1C\n"
"	.4byte EventQuakefxHorizon_ViolentLoop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x1A3, 0xC\n"
"	.4byte EventQuakefxHorizon_SlightLoop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x1B3, 0x14\n"
"	.4byte EventQuakefxVeritical_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x1CB, 0x14\n"
"	.4byte EventQuakefx_Init\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x1E3, 0x4\n"
"	.4byte EventQuakefx_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x1EB, 0x14\n"
"	.4byte UnitTornOut_Init\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x203, 0x4\n"
"	.4byte UnitTornOut_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x20B, 0x14\n"
"	.4byte WorldFlushCallBack\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x223, 0x4\n"
"	.4byte WorldFlushInit\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x22B, 0x4\n"
"	.4byte WorldFlushOut\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x233, 0x4\n"
"	.4byte WorldFlushReload\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x23B, 0x4\n"
"	.4byte WorldFlushIn\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin\", 0x243, 0x8\n"
);
EventListScr frontier_df4_menu_006_A65504[] __attribute__((section(".data.frontier_df4_menu.gap6"))) = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBC6)
    TEXTEND
    FADI(0x10)
    REMA
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBC7)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBC8)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    STAL(0x1E)
    MUSC(0x2B)
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBC9)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    FADI(0x10)
    REMA
    CALL((u8 *)frontier_df4_menu_007_A657D4 + 0x24)
    REMOVEPORTRAITS
    BACG(0x13)
    FADU(4)
    TEXTSHOW(0xBCD)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBCE)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSC(0x29)
    TEXTSHOW(0xBCF)
    TEXTEND
    REMA
    CALL((u8 *)data_085B9BBC + 0x168)
    EVBIT_MODIFY(4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xBD4)
    TEXTEND
    REMA
    LABEL(0)
    ASMC(CallRouteSplitMenu)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    EVBIT_MODIFY(0)
    MUSC(0x24)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(9, 0xC, 1)
    CHECK_ALIVE(0x10)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(0x11)
    BEQ(1, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBD0)
    TEXTEND
    GOTO(3)
    LABEL(1)
    CHECK_ALIVE(0x11)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBD1)
    TEXTEND
    GOTO(3)
    LABEL(2)
    CHECK_ALIVE(0x10)
    BEQ(3, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBD2)
    TEXTEND
    LABEL(3)
    REMA
    FADI(0x10)
    MNCH(0xA)
    ASMC(AutolevelSecondaryLord)
    REMU(0xF)
    ENDB
    LABEL(9)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xBD3)
    TEXTEND
    REMA
    FADI(0x10)
    MNCH(0x17)
    ASMC(AutolevelSecondaryLord)
    REMU(1)
    ENDB
};
EventListScr frontier_df4_menu_007_A657D4[] __attribute__((section(".data.frontier_df4_menu.gap7"))) = {
    EVENT_WORD(0x00120806)
    EVENT_WORD(0x00000001)
    EVENT_WORD(MenuItemDef_RouteSplit)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    SVAL(EVT_SLOT_B, 0x14000C)
    LOMA(0x2B)
    LOAD1(1, (u8 *)data_0890BDC4 + 0xB0)
    ENUN
    FADU(0x10)
    BROWNBOXTEXT(0x5FC, 8, 8)
    CALL((u8 *)frontier_df4_menu_007_A657D4 + 0x5C)
    CALL((u8 *)frontier_df4_menu_007_A657D4 + 0x1E0)
    ENDA
    LABEL(0x5F90)
    LOAD1(1, (u8 *)data_0890BDC4 + 0x128)
    ENUN
    SVAL(EVT_SLOT_B, 0x14000B)
    MOVE_1STEP(0, 0xFFFE, 2)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000B)
    FIGHT_MAP(0x53, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    SVAL(EVT_SLOT_B, 0x140009)
    MOVE(0, 0xFFFE, 9, 0x16)
    SVAL(EVT_SLOT_B, 0x14000D)
    MOVE(0x10, 0xFFFE, 0xD, 0x15)
    LOAD1(1, (u8 *)data_0890BDC4 + 0x150)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x501)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x160009)
    FIGHT_MAP(0x80, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000D)
    FIGHT_MAP(0x81, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    MOVE(0, 0x80, 0xA, 0x14)
    MOVE(0, 0x81, 0xD, 0x12)
    SVAL(EVT_SLOT_B, 0x130010)
    MOVE(0, 0xFFFE, 0x13, 0xE)
    LOAD1(1, UnitDef_Ch8Enemy_8)
    SVAL(EVT_SLOT_B, 0x130006)
    MOVE(0, 0xFFFE, 7, 0x18)
    LOAD1(1, (u8 *)data_0890BDC4 + 0x18C)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x180007)
    FIGHT_MAP(0x82, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    MOVE(0, 0x82, 5, 0x18)
    MOVE(0x10, 0x53, 9, 0x11)
    STAL2(0x1E)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
    LABEL(0x5F90)
    CAMERA2(0xB, 4)
    MUSS(0x2E)
    STAL(0x21)
    LOAD1(1, UnitDef_Ch8Mixed)
    ENUN
    FADU(0x10)
    SVAL(EVT_SLOT_2, 0x53)
    CALL((u8 *)data_08A60BE4 + 0x10C)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCA)
    TEXTEND
    REMA
    MOVE(2, 0xC0, 0xA, 4)
    ENUN
    MOVE(0x10, 0x53, 0xB, 4)
    ENUN
    CURSOR_CHAR(0xC0)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCB)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_1, 3)
    SET_HP(0xC0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    FIGHT_MAP(0x53, 0xC0, 0, 0)
    DISA(0xC0)
    MOVE_1STEP(0, 0x44, 2)
    ENUN
    CURSOR_CHAR(0x44)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCC)
    TEXTEND
    REMA
    MURE(4)
    FADI(4)
    CLEA
    CLEE
    CLEN
    ENDA
};
EventListScr frontier_df4_menu_008_A66F88[] __attribute__((section(".data.frontier_df4_menu.gap8"))) = {
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA15)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x19)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA16)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1A)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, (u8 *)frontier_df4_banim_b_077_90DB94 + 0x6E8)
    CALL((u8 *)data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB4)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10500)
    CHAI(0xAF)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xBC)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xB8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xAE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11AEnemy_2)
    CALL((u8 *)data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11AEnemy_3)
    CALL((u8 *)data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11AEnemy_4)
    CALL((u8 *)data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    MUSC(0x47)
    LOAD2(1, (u8 *)data_0890EB30 + 0x28)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA17)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 6)
    TEXTCONT
    TEXTEND
    REMA
    CAMERA2(0xA, 0x14)
    LOAD1(1, (u8 *)frontier_df4_banim_b_078_90E58C + 0x248)
    ENUN
    SVAL(EVT_SLOT_2, (u8 *)data_0890EB30 + 0xDC)
    SVAL(EVT_SLOT_3, 1)
    CALL((u8 *)data_08A60354 + 0x2C)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0xA18)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(0, (u8 *)frontier_df4_banim_b_078_90E58C + 0x158)
    ENUN
    CALL((u8 *)data_085B9BBC + 0x200)
    EvtBgmFadeIn(0x7FFF, 4)
    CAMERA2(7, 0x15)
    FADU(0x10)
    CURSOR_CHAR(0x17)
    STAL(0x3C)
    CURE
    MUSC(0xA)
    TEXTSTART
    TEXTSHOW(0xA19)
    TEXTEND
    REMA
    CAMERA2(9, 0xB)
    LOAD2(1, (u8 *)data_0890EB30 + 0xA0)
    ENUN
    CURSOR_CHAR(0x18)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA1A)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x2C9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x305)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x18)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x2CB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2C9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x306)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0xC5)
    ENUN
    DISA(0x18)
    STAL(0x1E)
    MOVE(8, 0xC5, 7, 0xC)
    ENUN
    CURSOR_AT(5, 0xC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSI
    TEXTSHOW(0xA1B)
    TEXTEND
    REMA
    MUNO
    FADI(0x10)
    CLEAN
    DISA(0xC5)
    LOAD1(1, (u8 *)frontier_df4_banim_b_078_90E58C + 0x4C8)
    ENUN
    ENUT(7)
    ENUT(8)
    EVBIT_T(7)
    ENDA
    MUSC(0x31)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CHECK_EXISTS(0x18)
    BNE(2, 0xC, 0)
    CHECK_ALIVE(0x17)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA1C)
    TEXTEND
    GOTO(1)
    LABEL(0)
    CHECK_ALIVE(0x15)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA1D)
    TEXTEND
    LABEL(1)
    FADI(0x10)
    LOAD1(1, data_0890EB30)
    ENUN
    LABEL(2)
    CLEAN
    CAMERA2(0xC, 4)
    FADU(0x10)
    STAL(0xF)
    CURSOR_AT(0xC, 1)
    STAL(0x3C)
    CURE
    CHECK_ALIVE(0x17)
    BEQ(0xA, 0xC, 0)
    SVAL(EVT_SLOT_2, 6)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA1E)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSC(0x2B)
    TEXTSHOW(0xA1F)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    STAL3(0x20)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 4)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA20)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 4)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA21)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSC(0x2B)
    TEXTSHOW(0xA22)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    STAL3(0x20)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 4)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA23)
    TEXTEND
    REMA
    LABEL(0xB)
    ENUT(0x74)
    MNCH(0xD)
    ENDA
};
EventListScr frontier_df4_menu_009_A67660[] __attribute__((section(".data.frontier_df4_menu.gap9"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_9EEA58)
    SVAL(EVT_SLOT_2, 0x11)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA29)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x3F)
    FADU(0x10)
    LOAD1(1, (u8 *)frontier_df3_unitdef_b_000_90F678_residue_p1 + 0x14)
    ENUN
    CLEE
    CURSOR_AT(0xA, 4)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA2A)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x49)
    EvtSetLoadUnitNoREDA
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_000_90F678_residue_p4 + 0x14)
    ENUN
    DISA(0xCC)
    FADU(0x10)
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_000_90F678_residue_p4 + 0x14)
    ENUN
    CURSOR_CHAR(0xCC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSC(0x25)
    TEXTSHOW(0xA2B)
    TEXTEND
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x25)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA2C)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0x90012)
    LOMA(0xD)
    LOAD1(1, (u8 *)frontier_df4_banim_b_079_90EFAC + 0x28)
    ENUN
    SVAL(EVT_SLOT_2, (u8 *)frontier_df4_banim_b_079_90EFAC + 0x1CC)
    SVAL(EVT_SLOT_3, 1)
    CALL((u8 *)data_08A60354 + 0x2C)
    CHECK_EVENTID(0x86)
    BNE(0, 0xC, 0)
    CHECK_EXISTS(0x12)
    BNE(0, 0xC, 0)
    LOAD1(1, data_0890F470)
    ENUN
    GOTO(1)
    LABEL(0)
    ENUT(7)
    LABEL(1)
    FADU(0x10)
    CURSOR_AT(0x17, 0xB)
    STAL(0x3C)
    CURE
    MUSS(0x2E)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0x39)
    SVAL(EVT_SLOT_3, 0xA2D)
    CALL((u8 *)data_08A60354 + 0xF4)
    LOAD1(1, (u8 *)data_0890F470 + 0x28)
    ENUN
    LOAD1(1, frontier_df4_banim_b_079_90EFAC)
    ENUN
    DISA(0x53)
    CAMERA2(0xD, 9)
    LOAD2(1, (u8 *)data_0890F470 + 0x50)
    ENUN
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xB)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, (u8 *)data_0890F470 + 0xB4)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xB)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x23)
    CALL((u8 *)data_08A60354 + 0xCC)
    MURE(2)
    TEXTSHOW(0xA2E)
    TEXTEND
    REMA
    CALL((u8 *)data_085B9BBC + 0x200)
    ENDA
};
EventListScr frontier_df4_menu_010_A67EEC[] __attribute__((section(".data.frontier_df4_menu.gap10"))) = {
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x1C)
    CALL(EventScr_StrictLoadUniqueAlly)
    MUSC(0x26)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x4A)
    FADU(0x10)
    LOAD1(1, (u8 *)frontier_df3_unitdef_b_005_9109A8 + 0x14)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    SVAL(EVT_SLOT_3, 0xA4C)
    CALL((u8 *)data_08A60354 + 0xF4)
    MOVE_1STEP(0x10, 0x53, 3)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    FIGHT_MAP(0x53, 0xCB, 0, 0)
    DISA(0xC0)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA4D)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x53)
    CALL((u8 *)data_08A60BE4 + 0x10C)
    MOVE(0x30, 0x40, 6, 3)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA4E)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0x7000A)
    LOMA(0xE)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_004_91075C)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA4F)
    TEXTEND
    REMA
    LOAD2(1, frontier_df3_unitdef_b_004_91075C)
    ENUN
    SPAWN_ENEMY(0x40, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 9, 8)
    CALL(EventScr_UnitWarpIN)
    STAL(0xF)
    MOVE_1STEP(0, 0x40, 2)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    MUSC(0x2C)
    TEXTSTART
    TEXTSHOW(0xA50)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    EvtBgmFadeIn(0x7FFF, 4)
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_004_91075C + 0x50)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA51)
    TEXTEND
    REMA
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_004_91075C + 0x78)
    STAL2(0x1E)
    FADI(0x10)
    ENUN
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    CHECK_ALIVE(0x20)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xA52)
    TEXTEND
    EvtBgmFadeIn(0x29, 6)
    TEXTCONT
    TEXTEND
    REMA
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(0x20)
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x3E)
    GIVEITEMTO(0x20)
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xA55)
    TEXTEND
    EvtBgmFadeIn(0x29, 6)
    TEXTCONT
    TEXTEND
    REMA
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(1)
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x3E)
    GIVEITEMTO(1)
    LABEL(1)
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(0x10)
    TILECHANGE(2)
    CLEAN
    CAMERA(0x18, 0)
    EvtSetLoadUnitNoREDA
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_004_91075C + 0xB4)
    ENUN
    DISA(0xCD)
    CHECK_ALIVE(0x20)
    BEQ(2, 0xC, 0)
    FADU(0x10)
    CURSOR_CHAR(0x20)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3F)
    CALL((u8 *)data_08A60354 + 0xCC)
    MUSC(0x32)
    TEXTSHOW(0xA53)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LABEL(2)
    FADU(0x10)
    STAL(0xF)
    LOAD2(1, (u8 *)frontier_df3_unitdef_b_004_91075C + 0xB4)
    ENUN
    CURSOR_CHAR(0xCD)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3F)
    CALL((u8 *)data_08A60354 + 0xCC)
    CHECK_ALIVE(0x20)
    BEQ(0xA, 0xC, 0)
    MUSC(0x26)
    TEXTSHOW(0xA54)
    TEXTEND
    GOTO(0xB)
    LABEL(0xA)
    MUSC(0x26)
    TEXTSHOW(0xA56)
    TEXTEND
    LABEL(0xB)
    EVENT_WORD(0x00422141)
    EVENT_WORD(0x00040001)
    REMOVEPORTRAITS
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0xF)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_005_9109A8_residue_p5)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    CALL((u8 *)data_08A60354 + 0xCC)
    TEXTSHOW(0xA57)
    TEXTEND
    FADI(0x10)
    REMA
    ENUT(0x76)
    MNCH(0xF)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA58)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1C)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df4_menu_011_A71268[] __attribute__((section(".data.frontier_df4_menu.gap11"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_072_923AD8)
    ENUN
    CALL((u8 *)data_085B9BBC + 0x200)
    ENUT(8)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x37)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xBD)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(7, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_37)
    CALL((u8 *)data_08A60354 + 0x58)
    COUNTER_DEC(7)
    ENUF(8)
    COUNTER_CHECK(7)
    BNE(0, 0xC, 0)
    ENUT(8)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_073_923F38)
    ENUN
    CALL((u8 *)data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x6D)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2E)
    CALL(EventScr_WholeTowerClear)
    ENDA
    CHECK_EVENTID(0x88)
    BEQ(0x801C, 0xC, 0)
    CALL(frontier_df4_menu_006_A65504)
    LABEL(0x801C)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)data_08A60354 + 0xCC)
    CHECK_ALIVE(3)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xBBF)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xBC0)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    LABEL(1)
    REMA
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(0)
    FADI(4)
    REMOVEPORTRAITS
    BACG(0x15)
    MUSC(0x32)
    FADU(4)
    TEXTSHOW(0xBC1)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(1, data_08908958)
    ENUN
    ENUT(0x8A)
    MNCH(2)
    ENDA
    ENDA
    LOAD1(1, (u8 *)frontier_df3_unitdef_b_073_923F38 + 0x1E0)
    ENUN
    CALL((u8 *)data_085B9BBC + 0x200)
    EVBIT_T(7)
    ENDA
    MNCH(0)
    ENDA
    LOAD1(1, UnitDef_MelkaenCoastMixed)
    ENUN
    LOAD1(1, UnitDef_UnusedMixed_0)
    ENUN
    ENDA
    ENDA
    MNCH(0x3B)
    ENDA
    EVENT_WORD(0x615F5B58)
    EVENT_WORD(0x00000000)
    LABEL(0)
    STAL1(0xFFFF)
    CLEA
    CLEE
    CLEN
    ASMC(SetupAutoGeneratedUnitdefs)
    LOAD2(1, 0x3001CE0)
    ENUN
    GOTO(0)
    ENDA
    LOAD1(0, UnitDef_UnusedAlly)
    ENUN
    LOAD1(1, UnitDef_UnusedMixed_1)
    ENUN
    EVBIT_T(7)
    ENDA
    MNCH(0x3C)
    EVBIT_T(7)
    ENDA
    BROWNBOXTEXT(6, 0x10, 0x10)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df4_menu_012_A71CC4[] __attribute__((section(".data.frontier_df4_menu.gap12"))) = {
    CHECK_CHAPTER_NUMBER
    LABEL(0)
    SDEQUEUE(7)
    SDEQUEUE(2)
    BNE(0, 7, 0xC)
    CALL(0xFFFFFFFF)
    ENDA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_60)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_62)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_64)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xD)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_66)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_68)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_70)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_72)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1A)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_74)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_68)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_70)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_76)
    SENQUEUE1
    CALL(frontier_df4_menu_012_A71CC4)
    TILECHANGE(0xFFFD)
    LOAD4(1, 0)
    ENUN
    CALL((u8 *)data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_61)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_63)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_65)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xD)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_67)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_69)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_71)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_73)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1A)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_75)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_69)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, EventScr_Ruin_71)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, frontier_df4_menu_013_A72408)
    SENQUEUE1
    CALL(frontier_df4_menu_012_A71CC4)
    MNCH(0xFFFF)
    ENDA
};
__asm__(
"	.section .data.frontier_df4_menu.gap13, \"aw\", %progbits\n"
"	.global frontier_df4_menu_013_A72408\n"
"frontier_df4_menu_013_A72408:\n"
"	.4byte 0x00020540, 0x00000004, 0x00000120, 0x00070228, 0x00000120, 0x00070228\n"
"	.4byte 0x00000120, 0x00000d40, StartBonusClaimScreen, 0x00010e20, 0x00000120, 0x00021020\n"
"	.4byte 0x00331220, 0x00020540, UnitDef_UnusedAlly_1, 0x00030540, 0x00000bd9, 0x00000a40\n"
"	.4byte EventScr_EphraimModeGameEnd + 0xb8, 0x00203322, 0x00000c40, 0x0000000c, 0x00012c41, UnitDef_UnusedAlly_3\n"
"	.4byte 0x00003020, 0x000b0540, 0x00000017, 0x000f2520, 0x00101720, 0x05ef3a41\n"
"	.4byte 0x00080008, 0x00082f42, 0x00020020, 0x00003020, 0x00203b21, 0x003c0e20\n"
"	.4byte 0x00003b22, 0x0bda1b20, 0x00001d20, 0x00010920, 0x00000820, 0x00012c41\n"
"	.4byte UnitDef_UnusedAlly_4, 0x00003020, 0x000b0540, 0x00000017, 0x000f2520, 0x00101720\n"
"	.4byte 0x05ef3a41, 0x00080008, 0x00082f42, 0x0002001e, 0x00003020, 0x001e3b21\n"
"	.4byte 0x003c0e20, 0x00003b22, 0x0bdb1b20, 0x00001d20, 0x00010820, 0x00041721\n"
"	.4byte 0x00001b22, 0x0000342a, 0x0000342c, 0x0000342b, 0x00020540, UnitDef_UnusedAlly_19\n"
"	.4byte 0x00030540, 0x00000bdc, 0x00000a40, EventScr_EphraimModeGameEnd + 0x128, 0x00020540, data_08926134 + 0x58\n"
"	.4byte 0x00030540, 0x00000bdd, 0x00000a40, EventScr_EphraimModeGameEnd + 0x1a0, 0x00000a40, EventScr_EphraimModeGameEnd + 0x1f4\n"
"	.4byte 0x00000120, 0x00021020, 0x00331220, 0x00020540, UnitDef_UnusedAlly_2, 0x00030540\n"
"	.4byte 0x00000bde, 0x00000a40, EventScr_EphraimModeGameEnd + 0xb8, 0x00012c41, UnitDef_UnusedAlly_5, 0x00003020\n"
"	.4byte 0x000b0540, 0x0008000c, 0x000c2520, 0x00101720, 0x05ed3a41, 0x00080008\n"
"	.4byte 0x00001a20, 0x00082f42, 0x0002001e, 0x00003020, 0x001e3b21, 0x003c0e20\n"
"	.4byte 0x00003b22, 0x0bdf1b20, 0x00001d20, 0x00041721, 0x00001b22, 0x0000342a\n"
"	.4byte 0x0000342c, 0x0000342b, 0x00020540, UnitDef_UnusedAlly_20, 0x00030540, 0x00000be0\n"
"	.4byte 0x00000a40, EventScr_EphraimModeGameEnd + 0x128, 0x00020540, data_08926134 + 0x94, 0x00030540, 0x00000be1\n"
"	.4byte 0x00000a40, EventScr_EphraimModeGameEnd + 0x1a0, 0x00000a40, EventScr_EphraimModeGameEnd + 0x1f4, 0x00000120, 0x00012c41\n"
"	.4byte UnitDef_UnusedMixed, 0x00003020, 0x00012c41, 0xffffffff, 0x00003020, 0x000b0540\n"
"	.4byte 0x000c0011, 0x00132520, 0x00101720, 0x05f93a41, 0x00080008, 0x00082f42\n"
"	.4byte 0x00020019, 0x00003020, 0x00193b21, 0x003c0e20, 0x00003b22, 0x00001a20\n"
"	.4byte 0x00320620, 0xffff1b20, 0x00001d20, 0x00041721, 0x00001b22, 0x0000342a\n"
"	.4byte 0x0000342c, 0x0000342b, 0x00000120, 0x00002b22, 0x00012c41, data_08925F90 + 0x64\n"
"	.4byte 0x00003020, 0x00012c41, 0xffffffff, 0x00003020, 0x000b0540, 0x00000000\n"
"	.4byte 0x00402520, 0x00101720, 0x05f63a41, 0x00080008, 0x000b3b21, 0x003c0e20\n"
"	.4byte 0x00003b22, 0x00320620, 0x00001a20, 0xffff1b20, 0x00001d20, 0x00001b22\n"
"	.4byte 0x00012c41, data_08925F90 + 0x64, 0x00200e22, 0x00041721, 0x00003020, 0x0000342a\n"
"	.4byte 0x0000342c, 0x0000342b, 0x00000120, 0x000b0540, 0x0005000e, 0x00102520\n"
"	.4byte 0x00041720, 0x00012c41, 0xffffffff, 0x00003020, 0x00013b21, 0x003c0e20\n"
"	.4byte 0x00003b22, 0x00001a20, 0x00320620, 0xffff1b20, 0x00001d20, 0x7fff1328\n"
"	.4byte 0x00021721, 0x00001b22, 0x0000342a, 0x0000342c, 0x0000342b, 0x00000120\n"
"	.4byte 0x00020220, 0x00000d40, BMapDispSuspend, 0x00421220, 0x00000d40, StartEndingCredits\n"
"	.4byte 0x005a0e20, 0x00001a22, 0x00002142, 0x00020000, 0x0be21b20, 0x00001d20\n"
"	.4byte 0x7fff1328, 0x00021721, 0x00001b22, 0x00020220, 0x00780e20, 0x00000d40\n"
"	.4byte StartEndingTurnRecordScreen, 0x00010e20, 0x00000a40, EventScr_Ruin_84 + 0x8, 0x005a0e20, 0x00002a20\n"
"	.4byte 0x00000120\n"
);
struct ProcCmd ProcScr_SlidingWallBg[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_CALL(sub_8088E30), PROC_REPEAT(BackgroundSlide_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap13, \"aw\", %progbits\n"
"	.4byte 0x02003c14, 0x00000007, 0x02003c1c, 0x00000007, 0x02003c24, 0x00000003\n"
"	.4byte 0x02003c2c, 0x00000003, 0x02003c34, 0x00000003, 0x02003c3c, 0x00000003\n"
"	.4byte 0x02003c44, 0x00000003, 0x02003c4c, 0x00000003, 0x02003c54, 0x00000003\n"
"	.4byte 0x02003c5c, 0x00000003, 0x02003c64, 0x00000003, 0x02003c6c, 0x00000003\n"
"	.4byte 0x02003c74, 0x00000009, 0x02003c7c, 0x00000007, 0x02003c84, 0x00000009\n"
"	.4byte 0x02003c8c, 0x00000007, 0x02003c94, 0x00000007, 0x02003c9c, 0x00000007\n"
"	.4byte 0x02003ca4, 0x00000007, 0x02003cac, 0x00000007, 0x02003cb4, 0x00000007\n"
"	.4byte 0x02003cbc, 0x00000003, 0x02003cc4, 0x00000003, 0x02003ccc, 0x00000003\n"
"	.4byte 0x02003cd4, 0x00000003, 0x02003cdc, 0x00000002, 0x02003ce4, 0x00000002\n"
"	.4byte 0x02003cec, 0x00000002, 0x02003cf4, 0x00000002, 0x02003cfc, 0x00000007\n"
"	.4byte 0x02003d04, 0x00000007, 0x02003d0c, 0x00000007, 0x02003d14, 0x00000007\n"
"	.4byte 0x02003d1c, 0x00000007, 0x02003d24, 0x00000010, 0x00000000, 0x00000000\n"
"	.4byte 0xf4f6f9fc, 0x090d7ff2, 0x02030507, 0x00800001\n"
);
struct ProcCmd gProcScr_SSPageSlide[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_REPEAT(PageSlide_OnLoop), PROC_CALL(PageSlide_OnEnd), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap13, \"aw\", %progbits\n"
"	.4byte 0x0000000e, 0x00000000, 0x00000002, GlowBlendCtrl_OnInit, 0x00000003, GlowBlendCtrl_OnLoop\n"
"	.4byte 0x00000000, 0x00000000\n"
);
struct ProcCmd gProcScr_SSUnitSlide[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_SLEEP(0x0), PROC_CALL(EndGlowBlendCtrl), PROC_CALL(UnitSlide_InitFadeOut), PROC_REPEAT(UnitSlide_FadeOutLoop),
    PROC_CALL(UnitSlide_SetNewUnit), PROC_CALL(UnitSlide_InitFadeIn), PROC_REPEAT(UnitSlide_FadeInLoop), PROC_SLEEP(0x0),
    PROC_CALL(StartGlowBlendCtrl), PROC_CALL(ClearSlide), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap13, \"aw\", %progbits\n"
"	.4byte 0x41040003, 0x00009008, 0x90284104, 0x41040004, 0x00089048, 0x41040002\n"
"	.4byte 0x0000901e, 0x903e4104, 0x00050004, 0x90044108, 0x41080006, 0x000a9024\n"
"	.4byte 0x90444108, 0x4100000e, 0x00009000, 0x50200100, 0x00060004, 0x80004002\n"
"	.4byte 0x00020000, 0x00044020, 0x00308002, 0x80020006, 0x00061032, 0x503a0002\n"
"	.4byte 0x40020004, 0x0000904a, gProcScr_SSUnitSlide + 0x58, gProcScr_SSUnitSlide + 0x6c, gProcScr_SSUnitSlide + 0x7a, 0x00400000\n"
"	.4byte 0x0000000e\n"
);
/* frontier_df4_menu_014_A72BF0: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap14, \"aw\", %progbits\n"
"	.global frontier_df4_menu_014_A72BF0\n"
"frontier_df4_menu_014_A72BF0:\n"
"	.4byte 0x00000000, frontier_df4_menu_014_A72BF0 + 0x1C, 0x00000000, gHelpInfo_Ss0Pow + 0x54, 0x00005018, 0x00000000\n"
"	.4byte HbPopulate_SSCharacter + 0x1, frontier_df4_menu_014_A72BF0, frontier_df4_menu_014_A72BF0 + 0x38, 0x00000000, gHelpInfo_Ss0Pow + 0x8C, 0x066B6806\n"
"	.4byte 0x00000000, HbPopulate_SSClass + 0x1, frontier_df4_menu_014_A72BF0 + 0x1C, frontier_df4_menu_014_A72BF0 + 0x70, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x54\n"
"	.4byte 0x04D77806, 0x00000000, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x1C, frontier_df4_menu_014_A72BF0 + 0x70, frontier_df4_menu_014_A72BF0 + 0x38\n"
"	.4byte gHelpInfo_Ss0Pow + 0x8C, 0x04D87826, 0x00000000, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x38, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0x8C, 0x04D98806, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x1C, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xA8, 0x04DB1866, 0x00000000, HbPopulate_SSPower + 0x1\n"
"	.4byte gHelpInfo_Ss0Pow, gHelpInfo_Ss0Pow + 0x38, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xC4, 0x04DD2869, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0x1C, gHelpInfo_Ss0Pow + 0x54, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xE0, 0x04DE3866\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x38, gHelpInfo_Ss0Pow + 0x70, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xFC\n"
"	.4byte 0x04DF4866, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x54, gHelpInfo_Ss0Pow + 0x8C, frontier_df4_menu_014_A72BF0\n"
"	.4byte gHelpInfo_Ss0Pow + 0x118, 0x04E05866, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x70, 0x00000000\n"
"	.4byte frontier_df4_menu_014_A72BF0 + 0x1C, gHelpInfo_Ss0Pow + 0x134, 0x04E16866, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0xC4, gHelpInfo_Ss0Pow, 0x00000000, 0x04E218A6, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0xA8, gHelpInfo_Ss0Pow + 0xE0, gHelpInfo_Ss0Pow + 0x1C, 0x00000000, 0x04E328A6, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0xC4, gHelpInfo_Ss0Pow + 0xFC, gHelpInfo_Ss0Pow + 0x38, 0x00000000, 0x04E438A6\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0xE0, gHelpInfo_Ss0Pow + 0x118, gHelpInfo_Ss0Pow + 0x54, 0x00000000\n"
"	.4byte 0x04E548A6, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0xFC, gHelpInfo_Ss0Pow + 0x134, gHelpInfo_Ss0Pow + 0x70\n"
"	.4byte 0x00000000, 0x04E658A6, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x118, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x8C, 0x00000000, 0x000068A6, 0x00000000, HbPopulate_SSStatus + 0x1, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x16C, 0x00000000, gHelpInfo_Ss1Item0 + 0x54, 0x00005018, 0x00000000, HbPopulate_SSCharacter + 0x1\n"
"	.4byte gHelpInfo_Ss0Pow + 0x150, gHelpInfo_Ss0Pow + 0x188, 0x00000000, gHelpInfo_Ss1Item0 + 0x8C, 0x066B6806, 0x00000000\n"
"	.4byte HbPopulate_SSClass + 0x1, gHelpInfo_Ss0Pow + 0x16C, gHelpInfo_Ss0Pow + 0x1C0, 0x00000000, gHelpInfo_Ss0Pow + 0x1A4, 0x04D77806\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x16C, gHelpInfo_Ss0Pow + 0x1C0, gHelpInfo_Ss0Pow + 0x188, gHelpInfo_Ss1Item0 + 0x8C\n"
"	.4byte 0x04D87826, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x188, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xA8, 0x04D98806, 0x00000000, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x1C\n"
"	.4byte gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00001868, HbRedirect_SSItem + 0x1, HbPopulate_SSItem + 0x1, gHelpInfo_Ss1Item0\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x38, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00012868, HbRedirect_SSItem + 0x1, HbPopulate_SSItem + 0x1\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x1C, gHelpInfo_Ss1Item0 + 0x54, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00023868, HbRedirect_SSItem + 0x1\n"
"	.4byte HbPopulate_SSItem + 0x1, gHelpInfo_Ss1Item0 + 0x38, gHelpInfo_Ss1Item0 + 0x70, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00034868\n"
"	.4byte HbRedirect_SSItem + 0x1, HbPopulate_SSItem + 0x1, gHelpInfo_Ss1Item0 + 0x54, gHelpInfo_Ss1Item0 + 0x8C, gHelpInfo_Ss0Pow + 0x150, gHelpInfo_Ss1Item0 + 0xC4\n"
"	.4byte 0x00045868, HbRedirect_SSItem + 0x1, HbPopulate_SSItem + 0x1, gHelpInfo_Ss1Item0 + 0x70, gHelpInfo_Ss1Item0 + 0xA8, gHelpInfo_Ss0Pow + 0x1A4\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xE0, 0x04F17876, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x1C0, gHelpInfo_Ss1Item0 + 0xFC, 0x04F28876, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x70\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xE0, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000, 0x04F368AE, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xC4, gHelpInfo_Ss1Item0 + 0xFC, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000, 0x04F478AE, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss1Item0 + 0xE0, 0x00000000, gHelpInfo_Ss1Item0 + 0xA8, 0x00000000, 0x04F588AE\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x134, 0x00000000, gHelpInfo_Ss2Rank0 + 0x70\n"
"	.4byte 0x00005018, 0x00000000, HbPopulate_SSCharacter + 0x1, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss1Item0 + 0x150, 0x00000000\n"
"	.4byte gHelpInfo_Ss2Rank0 + 0x70, 0x066B6806, 0x00000000, HbPopulate_SSClass + 0x1, gHelpInfo_Ss1Item0 + 0x134, gHelpInfo_Ss1Item0 + 0x188\n"
"	.4byte 0x00000000, gHelpInfo_Ss1Item0 + 0x16C, 0x04D77806, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x134\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x188, gHelpInfo_Ss1Item0 + 0x150, gHelpInfo_Ss2Rank0 + 0x70, 0x04D87826, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x150, 0x00000000, 0x00000000, gHelpInfo_Ss2Rank0 + 0x70, 0x04D98806, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss2Rank0 + 0x1C, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss2Rank0 + 0x38, 0x00001868\n"
"	.4byte 0x00000000, HbPopulate_SSWExp + 0x1, gHelpInfo_Ss2Rank0, gHelpInfo_Ss2Rank0 + 0x70, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss2Rank0 + 0x54\n"
"	.4byte 0x00012868, 0x00000000, HbPopulate_SSWExp + 0x1, 0x00000000, gHelpInfo_Ss2Rank0 + 0x54, gHelpInfo_Ss2Rank0\n"
"	.4byte 0x00000000, 0x000218A8, 0x00000000, HbPopulate_SSWExp + 0x1, gHelpInfo_Ss2Rank0 + 0x38, gHelpInfo_Ss2Rank0 + 0x70\n"
"	.4byte gHelpInfo_Ss2Rank0 + 0x1C, 0x00000000, 0x000328A8, 0x00000000, HbPopulate_SSWExp + 0x1, gHelpInfo_Ss2Rank0 + 0x1C\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss1Item0 + 0x118, 0x00000000, 0x04FE4080, HbRedirect_SSSupports + 0x1, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_MbpHp, 0x00000000, 0x00000000, 0x00000808, 0x00000000\n"
"	.4byte HbPopulate_BkselWTriEffA + 0x1, gHelpInfo_Ss2Rank0 + 0x8C, gHelpInfo_MbpHp + 0x1C, 0x00000000, 0x00000000, 0x04D9181C\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_MbpHp, gHelpInfo_MbpHp + 0x38, 0x00000000, 0x00000000\n"
"	.4byte 0x0506281C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x1C, gHelpInfo_MbpHp + 0x54, 0x00000000\n"
"	.4byte 0x00000000, 0x04F2381C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x38, gHelpInfo_MbpHp + 0x70\n"
"	.4byte 0x00000000, 0x00000000, 0x04F4481C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x54\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00005838, 0x00000000, HbPopulate_BkselWTriEffB + 0x1\n"
"	.4byte 0x00000000, gHelpInfo_CbpHp, 0x00000000, 0x00000000, 0x00000808, 0x00000000\n"
"	.4byte HbPopulate_BkselWTriEffA + 0x1, gHelpInfo_MbpHp + 0x8C, gHelpInfo_CbpHp + 0x1C, 0x00000000, 0x00000000, 0x04D9181C\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_CbpHp, gHelpInfo_CbpHp + 0x38, 0x00000000, 0x00000000\n"
"	.4byte 0x04F1281C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x1C, gHelpInfo_CbpHp + 0x54, 0x00000000\n"
"	.4byte 0x00000000, 0x0508381C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x38, gHelpInfo_CbpHp + 0x70\n"
"	.4byte 0x00000000, 0x00000000, 0x04F2481C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x54\n"
"	.4byte gHelpInfo_CbpHp + 0x8C, 0x00000000, 0x00000000, 0x04F4581C, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_CbpHp + 0x70, gHelpInfo_CbpHp + 0xA8, 0x00000000, 0x00000000, 0x0507681C, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_CbpHp + 0x8C, 0x00000000, 0x00000000, 0x00000000, 0x00007838\n"
"	.4byte 0x00000000, HbPopulate_BkselWTriEffB + 0x1, 0x00000476, 0x00000477, 0x00000478, 0x0000048D\n"
"	.4byte 0x0000048E, 0x0000047B, 0x0000047C, 0x0000047E, 0x0000047F, 0x0000047D\n"
"	.4byte 0x00000486, 0x00000487, 0x00000485, 0x00000488, 0x00000480, 0x0000048F\n"
"	.4byte 0x00000482, 0x00000483, 0x00000490, 0x00000484, 0x00000489, 0x00000492\n"
"	.4byte 0x00000491, 0x000004AE, 0x000004AF, 0x000004B0, 0x000004B1, 0x000004B2\n"
"	.4byte 0x000004B3, 0x000004B4, 0x000004B5, 0x000004C6, 0x000004A3, 0x000004A4\n"
"	.4byte 0x000004A5, 0x000004A6, 0x00000494, 0x00000495, 0x00000496, 0x00000497\n"
"	.4byte 0x00000498, 0x0000049D, 0x0000049E, 0x0000049F, frontier_chap_title_000_A7E188, frontier_chap_title_064_A8BFB0\n"
"	.4byte frontier_chap_title_087_A8DBFC, frontier_chap_title_001_A7E504, frontier_chap_title_065_A8C0EC, frontier_chap_title_088_A8DE6C, frontier_chap_title_002_A7E800, frontier_chap_title_066_A8C1E4\n"
"	.4byte frontier_chap_title_089_A8E080, frontier_chap_title_003_A7EB7C, frontier_chap_title_067_A8C308, frontier_chap_title_090_A8E2EC, frontier_chap_title_004_A7EF88, frontier_chap_title_068_A8C424\n"
"	.4byte frontier_chap_title_091_A8E600, frontier_chap_title_005_A7F360, frontier_chap_title_069_A8C534, frontier_chap_title_092_A8E8C8, frontier_chap_title_006_A7F754, frontier_chap_title_070_A8C734\n"
"	.4byte frontier_chap_title_093_A8EAF8, frontier_chap_title_007_A7FAA4, frontier_chap_title_071_A8C854, frontier_chap_title_094_A8ED30, frontier_chap_title_008_A7FE84, frontier_chap_title_072_A8C974\n"
"	.4byte frontier_chap_title_095_A8EFFC, frontier_chap_title_009_A8021C, frontier_chap_title_073_A8CA74, frontier_chap_title_096_A8F28C, frontier_chap_title_010_A80584, frontier_chap_title_074_A8CB94\n"
"	.4byte frontier_chap_title_097_A8F4CC, frontier_chap_title_011_A808BC, frontier_chap_title_075_A8CCAC, frontier_chap_title_098_A8F6F8, frontier_chap_title_013_A81068, frontier_chap_title_077_A8CF14\n"
"	.4byte frontier_chap_title_100_A8FC68, frontier_chap_title_014_A813F8, frontier_chap_title_078_A8D064, frontier_chap_title_101_A8FEC0, frontier_chap_title_015_A81774, frontier_chap_title_079_A8D1B0\n"
"	.4byte frontier_chap_title_102_A900FC, frontier_chap_title_022_A8306C, frontier_chap_title_080_A8D2F4, frontier_chap_title_109_A911D0, frontier_chap_title_023_A833D4, frontier_chap_title_081_A8D430\n"
"	.4byte frontier_chap_title_110_A91418, frontier_chap_title_024_A8383C, frontier_chap_title_082_A8D574, frontier_chap_title_111_A91760, frontier_chap_title_025_A83C0C, frontier_chap_title_083_A8D6AC\n"
"	.4byte frontier_chap_title_112_A919F8, frontier_chap_title_026_A83F64, frontier_chap_title_084_A8D7F4, frontier_chap_title_113_A91C28, frontier_chap_title_027_A8436C, frontier_chap_title_085_A8D948\n"
"	.4byte frontier_chap_title_114_A91F08, frontier_chap_title_028_A84720, frontier_chap_title_086_A8DAB0, frontier_chap_title_115_A92170, frontier_chap_title_028_A84720, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_016_A81B1C, frontier_chap_title_074_A8CB94, frontier_chap_title_103_A90378, frontier_chap_title_017_A81F28, frontier_chap_title_075_A8CCAC\n"
"	.4byte frontier_chap_title_104_A9065C, frontier_chap_title_019_A8258C, frontier_chap_title_077_A8CF14, frontier_chap_title_106_A90A98, frontier_chap_title_020_A829B4, frontier_chap_title_078_A8D064\n"
"	.4byte frontier_chap_title_107_A90D84, frontier_chap_title_021_A82D58, frontier_chap_title_079_A8D1B0, frontier_chap_title_108_A90FF0, frontier_chap_title_022_A8306C, frontier_chap_title_080_A8D2F4\n"
"	.4byte frontier_chap_title_109_A911D0, frontier_chap_title_023_A833D4, frontier_chap_title_081_A8D430, frontier_chap_title_110_A91418, frontier_chap_title_024_A8383C, frontier_chap_title_082_A8D574\n"
"	.4byte frontier_chap_title_111_A91760, frontier_chap_title_025_A83C0C, frontier_chap_title_083_A8D6AC, frontier_chap_title_112_A919F8, frontier_chap_title_026_A83F64, frontier_chap_title_084_A8D7F4\n"
"	.4byte frontier_chap_title_113_A91C28, frontier_chap_title_027_A8436C, frontier_chap_title_085_A8D948, frontier_chap_title_114_A91F08, frontier_chap_title_028_A84720, frontier_chap_title_086_A8DAB0\n"
"	.4byte frontier_chap_title_115_A92170, frontier_chap_title_028_A84720, 0x00000000, 0x00000000, frontier_chap_title_029_A84BFC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_030_A84F64, 0x00000000, 0x00000000, frontier_chap_title_031_A852E8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_032_A85670, 0x00000000, 0x00000000, frontier_chap_title_033_A859E4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_034_A85D6C, 0x00000000, 0x00000000, frontier_chap_title_035_A860F4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_036_A86460, 0x00000000, 0x00000000, frontier_chap_title_037_A867E4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_038_A86B60, 0x00000000, 0x00000000, frontier_chap_title_039_A86EF8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_040_A8729C, 0x00000000, 0x00000000, frontier_chap_title_041_A8765C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_042_A87A14, 0x00000000, 0x00000000, frontier_chap_title_043_A87DBC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_044_A88174, 0x00000000, 0x00000000, frontier_chap_title_045_A88530, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_046_A888D0, 0x00000000, 0x00000000, frontier_chap_title_047_A88C8C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_048_A89048, 0x00000000, 0x00000000, frontier_chap_title_062_A8B7F0, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_012_A80CA0, frontier_chap_title_076_A8CDF8, frontier_chap_title_099_A8F9C0, frontier_chap_title_018_A82294, frontier_chap_title_076_A8CDF8\n"
"	.4byte frontier_chap_title_105_A90898, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_049_A89428, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_050_A89710, 0x00000000, 0x00000000, frontier_chap_title_051_A899E8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_052_A89CD8, 0x00000000, 0x00000000, frontier_chap_title_053_A89F80, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_054_A8A260, 0x00000000, 0x00000000, frontier_chap_title_055_A8A5A0, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_056_A8A85C, 0x00000000, 0x00000000, frontier_chap_title_057_A8AB8C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_058_A8AE74, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_059_A8B168, 0x00000000, 0x00000000, frontier_chap_title_060_A8B39C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_063_A8BB88, 0x00000000, 0x00000000\n"
);
struct ProcCmd gProcScr_HelpBoxTextScroll[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)HelpBoxTextScroll_OnLoop + 0x1)), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap14, \"aw\", %progbits\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, HelpBoxDrawOneLineExt + 0x1, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_HelpBoxIntro[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_SLEEP(0x6), PROC_REPEAT((void*)((u8*)HelpBoxSetupstringLines + 0x1)), PROC_REPEAT((void*)((u8*)HelpBoxDrawstring + 0x1)), PROC_CALL((void*)((u8*)HelpBoxIntroDrawTexts + 0x1)),
    PROC_END,
};
struct ProcCmd ProcScr_Helpbox_bug_0[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)HelpBoxIntro_bug_0 + 0x1)), PROC_CALL((void*)((u8*)HelpBoxIntro_bug_OnClose + 0x1)), PROC_REPEAT((void*)((u8*)HelpBoxIntro_bug_WaitClose + 0x1)), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap14, \"aw\", %progbits\n"
"	.4byte 0x0001000E, 0x00000000, 0x0000000B, 0x00000000, 0x00000002, HelpBoxMoveCtrl_OnInitBox + 0x1\n"
"	.4byte 0x00000003, HelpBoxMoveCtrl_OnIdle + 0x1, 0x00000002, CloseHelpBox_bug + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000003, HelpBoxLock_OnIdle + 0x1, 0x00000000, 0x00000000, 0x000007BB, 0x000007BC\n"
);
struct ProcCmd gProcScr_BoxDialogue[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)BoxDialogue_OnInit + 0x1)), PROC_LABEL(0x0), PROC_REPEAT((void*)((u8*)BoxDialogue_OnIdle + 0x1)),
    PROC_LABEL(0x1), PROC_BLOCK, PROC_LABEL(0x3), PROC_SLEEP(0x6),
    PROC_LABEL(0x2), PROC_CALL((void*)((u8*)BoxDialogue_OnClose + 0x1)), PROC_SLEEP(0xA), PROC_END,
};
struct ProcCmd ProcScr_MergeBoxDialogue[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)MergeBoxDialogue1 + 0x1)), PROC_CALL((void*)((u8*)MergeBoxDialogue2 + 0x1)), PROC_REPEAT((void*)((u8*)MergeBoxDialogue3 + 0x1)), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_menu.gap14, \"aw\", %progbits\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, BoxDialogueDrawText_Init + 0x1, 0x0000000B, 0x00000000\n"
"	.4byte 0x00000003, BoxDialogueInterpreter_Main + 0x1, 0x0002000C, 0x00000000, 0x0001000B, 0x00000000\n"
"	.4byte 0x00000003, BoxDialogueDrawText_WaitIdle + 0x1, 0x0004000B, 0x00000000, 0x00000003, BoxDialogueDrawText_ScrollLines + 0x1\n"
"	.4byte 0x0000000C, 0x00000000, 0x0005000B, 0x00000000, 0x00000003, BoxDialogueDrawText_ScrollLines + 0x1\n"
"	.4byte 0x00000002, BoxDialogueDrawText_AfterScroll + 0x1, 0x0000000C, 0x00000000, 0x0006000B, 0x00000000\n"
"	.4byte 0x00000003, BoxDialogueDrawText_ResizeBox + 0x1, 0x0000000C, 0x00000000, 0x0002000B, 0x00000000\n"
"	.4byte 0x00000002, BoxDialogueDrawText_Finish + 0x1, 0x00000000, 0x00000000, 0x0006000E, 0x00000000\n"
"	.4byte 0x00000002, BoxDialogueDrawTextProc_Init + 0x1, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_TalkBoxIdle[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_BLOCK, PROC_END,
};
__asm__(
    ".section .data.frontier_df4_menu.gap15, \"aw\", %progbits\n"
    ".global frontier_df4_menu_015_A73900\n"
    "frontier_df4_menu_015_A73900:\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x03030101\n"
    ".4byte 0x03030303\n"
    ".4byte 0x00faff00\n"
    ".4byte 0xfafafaff\n"
    ".4byte 0x030303fa\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_51\n"
    ".4byte gUnkData_52\n"
    ".4byte gUnkData_53\n"
    ".4byte gUnkData_55\n"
    ".4byte gUnkData_56\n"
    ".4byte gUnkData_57\n"
    ".4byte gUnkData_58\n"
    ".4byte gUnkData_58\n"
    ".4byte gUnkData_58\n"
    ".4byte 0x0d0b0905\n"
    ".4byte 0x0400070b\n"
    ".4byte 0x04050605\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x90\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte TerrainDisplay_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_SlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x94\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MMB_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_SlideIn\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_Display\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MMB_CheckForUnit\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x98\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BurstDisplay_Init\n"
    ".4byte 0x00000003\n"
    ".4byte BurstDisplay_Loop_Display\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte DoesBMXFADEExist\n"
    ".4byte 0x00000002\n"
    ".4byte InitPlayerPhaseInterface\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x05040301\n"
    ".4byte 0x00010306\n"
    ".4byte 0x00000001\n"
    ".4byte GoalString_Turn + 0x8\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte GoalDisplay_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_SlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MenuButtonDisp_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000014\n"
    ".4byte IsAnyPlayerSideWindowRetracting\n"
    ".4byte 0x00000002\n"
    ".4byte MenuButtonDisp_UpdateCursorPos\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_OnSlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_OnSlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x47404000\n"
    ".4byte 0x40000002\n"
    ".4byte 0x47544000\n"
    ".4byte 0x00204000\n"
    ".4byte 0x00024758\n"
    ".4byte 0x40004000\n"
    ".4byte 0x4000475a\n"
    ".4byte 0x475e0020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x47438000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x00014747\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0001474b\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0008474f\n"
    ".4byte 0x00004000\n"
    ".4byte 0x40000018\n"
    ".4byte 0x00190010\n"
    ".4byte 0x00204000\n"
    ".4byte 0x40000019\n"
    ".4byte 0x00181030\n"
    ".4byte 0x20004008\n"
    ".4byte 0x40080018\n"
    ".4byte 0x00192010\n"
    ".4byte 0x20204008\n"
    ".4byte 0x40080019\n"
    ".4byte 0x00183030\n"
    ".4byte 0x40000003\n"
    ".4byte 0x0000c000\n"
    ".4byte 0xc0404000\n"
    ".4byte 0x40000008\n"
    ".4byte 0x0010c080\n"
    ".4byte 0x40000002\n"
    ".4byte 0x0090c000\n"
    ".4byte 0x80408000\n"
    ".4byte 0x00000098\n"
    ".4byte 0x02004bac\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x02004bb4\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispSuspend\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_DrawText\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_ShowAllLayers\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte ChapterStatus_LoopKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte FadeOutBlackSpeed40Locking\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndMuralBackground\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispResume\n"
    ".4byte 0x00000002\n"
    ".4byte RefreshBMapGraphics\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_FocusLeaderUnit\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_DrawText\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_ShowAllLayers\n"
    ".4byte 0x00000002\n"
    ".4byte FadeInBlackSpeed40\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte ChapterStatus_LoopKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte FadeOutBlackSpeed40Locking\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndMuralBackground\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x40000006\n"
    ".4byte 0x00008000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x40000004\n"
    ".4byte 0x00088040\n"
    ".4byte 0x80604000\n"
    ".4byte 0x4000000c\n"
    ".4byte 0x00108080\n"
    ".4byte 0x80a04000\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StatusScreenSpriteDraw_Init\n"
    ".4byte 0x00000003\n"
    ".4byte StatusScreenSpriteDraw_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte sHelpInfo_ChapterStatus_TurnCount\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte 0x06744424\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte 0x06757410\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TurnCount\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte 0x06768410\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_EnemyUnits\n"
    ".4byte 0x06702b14\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte 0x06712b4c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte 0x00000000\n"
    ".4byte 0x06723e88\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte 0x00000000\n"
    ".4byte 0x06737f98\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x44000006\n"
    ".4byte 0x00004000\n"
    ".4byte 0x40204400\n"
    ".4byte 0x44080004\n"
    ".4byte 0x00084000\n"
    ".4byte 0x40204408\n"
    ".4byte 0x4410000c\n"
    ".4byte 0x00104000\n"
    ".4byte 0x40204410\n"
    ".4byte 0x00020014\n"
    ".4byte 0x80004400\n"
    ".4byte 0x44000000\n"
    ".4byte 0x00048020\n"
    ".4byte 0x00000004\n"
    ".4byte CgText_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_Init\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_InitBlendAmt\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_LoopFadeIn\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_2\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_0\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_InitFadeOut\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_LoopFadeOut\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_1\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000007bf\n"
    ".4byte 0x000007c0\n"
    ".4byte 0x000007bb\n"
    ".4byte 0x000007bc\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte CgTextInterpreter_Loop_Main\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BackgroundSlide_Init\n"
    ".4byte 0x00000003\n"
    ".4byte CgTextInterpreter_1\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgTextInterpreter_2\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0063000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte YesNoChoice_Loop_KeyHandler\n"
    ".4byte 0x0005000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_016_A74CEC[] __attribute__((section(".data.frontier_df4_menu.gap16"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.bin");
u8 frontier_df4_menu_017_A79E90[] __attribute__((section(".data.frontier_df4_menu.gap17"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.bin");
u8 frontier_df4_menu_018_A92B38[] __attribute__((section(".data.frontier_df4_menu.gap18"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.bin");
__asm__(
    ".section .data.frontier_df4_menu.gap19, \"aw\", %progbits\n"
    ".global frontier_df4_menu_019_A934EC\n"
    "frontier_df4_menu_019_A934EC:\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x0008000f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispSuspend\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispResume\n"
    ".4byte 0x00000002\n"
    ".4byte RefreshBMapGraphics\n"
    ".4byte 0x00000002\n"
    ".4byte EndAllMus\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0xc\n"
    ".4byte 0x00000002\n"
    ".4byte UnitListScreenSprites_Init\n"
    ".4byte 0x00000003\n"
    ".4byte UnitListScreenSprites_Main\n"
    ".4byte 0x00000002\n"
    ".4byte nullsub_76\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x03040405\n"
    ".4byte 0x04050203\n"
    ".4byte 0x02020203\n"
    ".4byte 0x00010101\n"
    ".4byte 0x80000001\n"
    ".4byte 0x025c0000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x025d4000\n"
    ".4byte 0x80000001\n"
    ".4byte 0x025f0000\n"
    ".4byte gUnitlistscreen_11 + 0xa\n"
    ".4byte gUnitlistscreen_11 + 0x12\n"
    ".4byte gUnitlistscreen_11 + 0x1a\n"
    ".4byte 0x80000001\n"
    ".4byte 0x02df0000\n"
    ".4byte 0x40000007\n"
    ".4byte 0x0a4b4000\n"
    ".4byte 0x40204000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4c4040\n"
    ".4byte 0x40604000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4c4080\n"
    ".4byte 0x40a04000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4b50c0\n"
    ".4byte 0x40000002\n"
    ".4byte 0x02c08010\n"
    ".4byte 0x80304000\n"
    ".4byte 0x000302c4\n"
    ".4byte 0x80084000\n"
    ".4byte 0x400002ca\n"
    ".4byte 0x02ce8028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x000302d2\n"
    ".4byte 0x800c4000\n"
    ".4byte 0x400002d4\n"
    ".4byte 0x02d8802c\n"
    ".4byte 0x404c0000\n"
    ".4byte 0x000302dc\n"
    ".4byte 0x80084000\n"
    ".4byte 0x40000300\n"
    ".4byte 0x03048028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x00030308\n"
    ".4byte 0x80084000\n"
    ".4byte 0x4000030a\n"
    ".4byte 0x030e8028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x00030312\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000314\n"
    ".4byte 0x03188020\n"
    ".4byte 0x80404000\n"
    ".4byte 0x0003031c\n"
    ".4byte 0x800c4000\n"
    ".4byte 0x400002c0\n"
    ".4byte 0x02c4802c\n"
    ".4byte 0x004c8000\n"
    ".4byte 0x000002c8\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x9e\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x2c\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x3a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x4e\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x62\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x76\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000002\n"
    ".4byte 0x00000475\n"
    ".4byte 0x00000040\n"
    ".4byte 0x0000066b\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000481\n"
    ".4byte 0x00000088\n"
    ".4byte 0x0000066e\n"
    ".4byte 0x00000020\n"
    ".4byte 0x0000048b\n"
    ".4byte 0x000000c0\n"
    ".4byte 0x00000677\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000002\n"
    ".4byte 0x00000475\n"
    ".4byte 0x00000044\n"
    ".4byte 0x0000066b\n"
    ".4byte 0x00000003\n"
    ".4byte 0x00000476\n"
    ".4byte 0x00000081\n"
    ".4byte 0x000004d7\n"
    ".4byte 0x00000004\n"
    ".4byte 0x00000477\n"
    ".4byte 0x00000098\n"
    ".4byte 0x000004d8\n"
    ".4byte 0x00000005\n"
    ".4byte 0x00000478\n"
    ".4byte 0x000000b0\n"
    ".4byte 0x000004d9\n"
    ".4byte 0x00000006\n"
    ".4byte 0x00000479\n"
    ".4byte 0x000000c4\n"
    ".4byte 0x0000066c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000007\n"
    ".4byte 0x0000047a\n"
    ".4byte 0x00000040\n"
    ".4byte 0x0000066d\n"
    ".4byte 0x00000008\n"
    ".4byte 0x0000047b\n"
    ".4byte 0x0000005f\n"
    ".4byte 0x000004dd\n"
    ".4byte 0x00000009\n"
    ".4byte 0x0000047c\n"
    ".4byte 0x00000071\n"
    ".4byte 0x000004de\n"
    ".4byte 0x0000000a\n"
    ".4byte 0x0000047d\n"
    ".4byte 0x00000088\n"
    ".4byte 0x000004df\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x0000047e\n"
    ".4byte 0x000000a1\n"
    ".4byte 0x000004e0\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x0000047f\n"
    ".4byte 0x000000b8\n"
    ".4byte 0x000004e1\n"
    ".4byte 0x0000000d\n"
    ".4byte 0x00000480\n"
    ".4byte 0x000000ce\n"
    ".4byte 0x000004e6\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000481\n"
    ".4byte 0x00000050\n"
    ".4byte 0x0000066e\n"
    ".4byte 0x0000000f\n"
    ".4byte 0x00000482\n"
    ".4byte 0x00000087\n"
    ".4byte 0x000004f1\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000483\n"
    ".4byte 0x000000a6\n"
    ".4byte 0x000004f2\n"
    ".4byte 0x00000011\n"
    ".4byte 0x00000484\n"
    ".4byte 0x000000c8\n"
    ".4byte 0x000004f5\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000012\n"
    ".4byte 0x00000485\n"
    ".4byte 0x00000047\n"
    ".4byte 0x000004e2\n"
    ".4byte 0x00000013\n"
    ".4byte 0x00000486\n"
    ".4byte 0x0000005f\n"
    ".4byte 0x000004e3\n"
    ".4byte 0x00000014\n"
    ".4byte 0x00000487\n"
    ".4byte 0x00000078\n"
    ".4byte 0x000004e4\n"
    ".4byte 0x00000016\n"
    ".4byte 0x00000488\n"
    ".4byte 0x00000093\n"
    ".4byte 0x000004e5\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000489\n"
    ".4byte 0x000000ba\n"
    ".4byte 0x0000066f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000017\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000004c\n"
    ".4byte 0x000004f6\n"
    ".4byte 0x00000018\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000005c\n"
    ".4byte 0x000004f7\n"
    ".4byte 0x00000019\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000006c\n"
    ".4byte 0x000004f8\n"
    ".4byte 0x0000001a\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000007c\n"
    ".4byte 0x000004f9\n"
    ".4byte 0x0000001b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000008c\n"
    ".4byte 0x000004fd\n"
    ".4byte 0x0000001c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000009c\n"
    ".4byte 0x000004fa\n"
    ".4byte 0x0000001d\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000000ac\n"
    ".4byte 0x000004fb\n"
    ".4byte 0x0000001e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000000bc\n"
    ".4byte 0x000004fc\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0xe0000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000e800\n"
    ".4byte 0xf0000000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x0000f800\n"
    ".4byte 0x00000539\n"
    ".4byte 0x00000539\n"
    ".4byte 0x000006f1\n"
    ".4byte 0x0000053a\n"
    ".4byte 0x0000053b\n"
    ".4byte 0x000006f2\n"
    ".4byte 0x0000053c\n"
    ".4byte 0x0000053f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000006f3\n"
    ".4byte 0x0000053c\n"
    ".4byte 0x0000054c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000053e\n"
    ".4byte 0x0000053e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000006ee\n"
    ".4byte 0x000006ef\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnInit\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnParse\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnDraw\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_misc_lo_021bt_1F5598 + 0x10\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte EndPrepAtMenuIfNoUnitAvailable\n"
    ".4byte 0x00000002\n"
    ".4byte PrepAtMenu_OnInit\n"
    ".4byte 0x0002000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x0002000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnablePrepScreenMenu\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_UpdateDescLoop\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000c000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_InitSubmenuCursor\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_CtrlLoop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000d000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_InitSubmenuCursor\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_CtrlLoop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_StartSubmenu\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_OnSubmenuEnd\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00100018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0009000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00100018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0007000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000b000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenuSetUnitStateAndEndFlag\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenuSetUnitStateAndEndFlag\n"
    ".4byte 0x000a000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_ResetScreenEffect\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_ResetBmUiEffect\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndAllMus\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000002\n"
    ".4byte DoPromoteAnimForChar100\n"
    ".4byte 0x00000003\n"
    ".4byte IsGameLockLevelReserved\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte NullExpForChar100AndResetScreen\n"
    ".4byte 0x001e000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartTraineePromoScreen\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00c8000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte TraineePromo_ResetScreenEffect\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x40000001\n"
    ".4byte 0x77808000\n"
    ".4byte 0x40000002\n"
    ".4byte 0x77c08000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x000277c4\n"
    ".4byte 0x60004000\n"
    ".4byte 0x40006798\n"
    ".4byte 0x679ca020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x67985020\n"
    ".4byte 0x90004000\n"
    ".4byte 0x0001679c\n"
    ".4byte 0x80004000\n"
    ".4byte 0x00016798\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0003679c\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000412\n"
    ".4byte 0x04168020\n"
    ".4byte 0x40400000\n"
    ".4byte 0x0002041a\n"
    ".4byte 0x80004000\n"
    ".4byte 0x00000400\n"
    ".4byte 0x04044020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x04408000\n"
    ".4byte 0x40200000\n"
    ".4byte 0x00020444\n"
    ".4byte 0x80004000\n"
    ".4byte 0x80000446\n"
    ".4byte 0x044a0020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x044b8000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x0001044f\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010406\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010407\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010408\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010409\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040a\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040b\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040c\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040d\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040e\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040f\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00000410\n"
    ".4byte Sprite_PrepExMap + 0xe\n"
    ".4byte Sprite_PrepExMap + 0x16\n"
    ".4byte Sprite_PrepExMap + 0x1e\n"
    ".4byte Sprite_PrepExMap + 0x26\n"
    ".4byte Sprite_PrepExMap + 0x2e\n"
    ".4byte Sprite_PrepExMap + 0x36\n"
    ".4byte Sprite_PrepExMap + 0x3e\n"
    ".4byte Sprite_PrepExMap + 0x46\n"
    ".4byte Sprite_PrepExMap + 0x4e\n"
    ".4byte Sprite_PrepExMap + 0x56\n"
    ".4byte Sprite_PrepExMap + 0x5e\n"
    ".4byte Sprite_PrepExMap + 0xe\n"
    ".4byte 0x04000001\n"
    ".4byte 0x0c808000\n"
    ".4byte 0x44000003\n"
    ".4byte 0x0c948020\n"
    ".4byte 0x80484400\n"
    ".4byte 0x04000c98\n"
    ".4byte 0x0c9c4068\n"
    ".4byte 0x44000004\n"
    ".4byte 0x0c948008\n"
    ".4byte 0x80304400\n"
    ".4byte 0x44000cc4\n"
    ".4byte 0x0cc88050\n"
    ".4byte 0x40700400\n"
    ".4byte 0x00040ccc\n"
    ".4byte 0x80004400\n"
    ".4byte 0x44000c84\n"
    ".4byte 0x0c888020\n"
    ".4byte 0x80404400\n"
    ".4byte 0x44000c8c\n"
    ".4byte 0x0c908060\n"
    ".4byte 0x44000002\n"
    ".4byte 0x0c948030\n"
    ".4byte 0x80584400\n"
    ".4byte 0x00000cce\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x38\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x4c\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x66\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x80\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepSpriteDraw_Init\n"
    ".4byte 0x00000004\n"
    ".4byte PrepSpriteDraw_OnEnd\n"
    ".4byte 0x00000003\n"
    ".4byte PrepSpriteDraw_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap19, \"aw\", %progbits\n"
    ".global data_08A94430\n"
    "data_08A94430:\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenu_OnInit\n"
    ".4byte 0x00000004\n"
    ".4byte PrepMenu_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_ShowActiveHand\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_CtrlLoop\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_ShowFrozenHand\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap20, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_020_A9454C\n"
"frontier_df4_menu_020_A9454C:\n"
"\t.4byte 0x00000001\n"
"\t.4byte frontier_df4_misc_lo_021bt_1F5598 + 0x18\n"
"\t.4byte 0x00000002\n"
"\t.4byte MenuScroll_Init\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte MenuScroll_Loop\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000010\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.global data_08A94584\n"
"data_08A94584:\n"
"\t.4byte 0x00000001\n"
"\t.4byte frontier_df4_misc_lo_021bt_1F5598 + 0x24\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte SallyCir_Init\n"
"\t.4byte 0x00000003\n"
"\t.4byte SallyCir_Loop\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_8099D78\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte frontier_df4_misc_lo_021bt_1F5598 + 0x30\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte ViewCounter_Loop\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepHbKeyListener_Loop\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000101\n"
"\t.4byte 0x00000202\n"
"\t.4byte 0x00000303\n"
"\t.4byte 0x00000404\n"
"\t.4byte 0x00000505\n"
"\t.4byte 0x00000606\n"
"\t.4byte 0x00000707\n"
"\t.4byte 0x00000C09\n"
"\t.4byte 0x00140001\n"
"\t.4byte 0x002D001F\n"
"\t.4byte 0x00450038\n"
"\t.4byte 0x004B003F\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000540\n"
"\t.4byte 0x00000544\n"
"\t.4byte 0x00000541\n"
"\t.4byte 0x00000546\n"
"\t.4byte 0x00000542\n"
"\t.4byte 0x00000543\n"
"\t.4byte 0x00000540\n"
"\t.4byte 0x00000544\n"
"\t.4byte 0x00000541\n"
"\t.4byte 0x00000546\n"
"\t.4byte 0x00000542\n"
"\t.4byte 0x00000545\n"
"\t.4byte 0x40000004\n"
"\t.4byte 0x00508000\n"
"\t.4byte 0x80204000\n"
"\t.4byte 0x40100054\n"
"\t.4byte 0x00588000\n"
"\t.4byte 0x80204010\n"
"\t.4byte 0x0000005C\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte DrawFundsSprite_Init\n"
"\t.4byte 0x00000003\n"
"\t.4byte DrawFundsSprite_Loop\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x40000006\n"
"\t.4byte 0x0000C000\n"
"\t.4byte 0xC0404000\n"
"\t.4byte 0x40200008\n"
"\t.4byte 0x00108000\n"
"\t.4byte 0x80204020\n"
"\t.4byte 0x40200014\n"
"\t.4byte 0x00188040\n"
"\t.4byte 0x80604020\n"
"\t.4byte 0x0000001C\n"
"\t.4byte 0x00000002\n"
"\t.4byte DrawUnitInfoBg_Init\n"
"\t.4byte 0x00000003\n"
"\t.4byte DrawUnitInfoBg_Loop\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_Init\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawUnitGridScreen\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawUnitGridScreen\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItem_GridSelectLoop\n"
"\t.4byte 0x00000002\n"
"\t.4byte DisableAllDisplay\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_StartStatScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_ResumeFromStatScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawUnitGridScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte EnableAllGfx\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItem_CommandMenuLoop\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_HideFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitTradeScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_EndPopupBoxesAndSync\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemScreen_Loop_MainKeyHandler\n"
"\t.4byte 0x00000002\n"
"\t.4byte DisableAllDisplay\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_StartStatScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_ResumeFromStatScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitTradeScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_EndPopupBoxesAndSync\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte EnableAllGfx\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0006000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepItemTradeScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitTradeScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_EndPopupBoxesAndSync\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0008000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepItemListScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepScreenProc_UpdateBgm\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_RefreshSelectedUnitItems\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepItemUse\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepScreenProc_UpdateBgm\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_RefreshSelectedUnitItems\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepItemSupply\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepScreenProc_UpdateBgm\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_RefreshSelectedUnitItems\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000B000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepSell\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepScreenProc_UpdateBgm\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_RefreshSelectedUnitItems\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000C000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepArmory\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_SetupGfx\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepScreenProc_UpdateBgm\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_RefreshSelectedUnitItems\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_DrawSelectedUnitScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_DrawFunds\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_InitCommandMenu\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0003000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000D000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemScreen_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItem_ClearGMapMenuOnCancel\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x40000003\n"
"\t.4byte Init\n"
"\t.4byte 0x00004008\n"
"\t.4byte 0x40100806\n"
"\t.4byte 0x080C0000\n"
"\t.4byte 0x02040200\n"
"\t.4byte 0x40000004\n"
"\t.4byte 0x90008000\n"
"\t.4byte 0x80204000\n"
"\t.4byte 0x00009004\n"
"\t.4byte 0x90084040\n"
"\t.4byte 0x00508000\n"
"\t.4byte 0x0003900A\n"
"\t.4byte 0x80004000\n"
"\t.4byte 0x4000900B\n"
"\t.4byte 0x900F8020\n"
"\t.4byte 0x00408000\n"
"\t.4byte 0x00039013\n"
"\t.4byte 0x80004000\n"
"\t.4byte 0x4000900B\n"
"\t.4byte 0x90148020\n"
"\t.4byte 0x00408000\n"
"\t.4byte 0x00039018\n"
"\t.4byte 0x80004000\n"
"\t.4byte 0x00009019\n"
"\t.4byte 0x901D4020\n"
"\t.4byte 0x00308000\n"
"\t.4byte 0x0000901F\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000004\n"
"\t.4byte ProcPrepUnit_OnEnd\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepUnit_OnInit\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepUnit_InitScreen\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte ProcPrepUnit_Idle\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_ParkCursorOffList\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepUnit_ScrollDownLoop\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepUnit_WaitDpadUpLoop\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepUnit_ScrollUpLoop\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_RestoreCursorToList\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_EndScreenGfx\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_StartUnitListScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_RecountSelectedUnits\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepUnit_InitScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnitDisableDisp\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_EndScreenGfx\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_StartStatScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnit_RestoreListAfterStatScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepUnit_InitScreen\n"
"\t.4byte 0x0002000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepUnitEnableDisp\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0063000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepUnit_OnGameStart\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0064000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x000A000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0064000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemTrade_Init\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemTrade_Loop_MainKeyHandler\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemTrade_OnEnd\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_OnInit\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_InitDisplay\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemUse_CtrlLoop\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_ConfirmWindowInit\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemUse_ConfirmWindowCtrlLoop\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_HandleItemEffect\n"
"\t.4byte 0x00010006\n"
"\t.4byte ProcScr_PrepItemUseScreen + 0x140\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00010006\n"
"\t.4byte ProcScr_PrepItemUseScreen + 0x160\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMidFadeToBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartPrepScreenPromotion\n"
"\t.4byte 0x0008000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_ResetBgmAfterPromo\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_PostPromotion\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUse_InitDisplay\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x00000014\n"
"\t.4byte MusicProc4Exists\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0006000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcPrepItemUse_OnEnd\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000004\n"
"\t.4byte PrepItemUseBooster_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUseBooster_OnInit\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemUseBooster_IDLE\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000004\n"
"\t.4byte PrepItemUseJuna_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemUseJuna_OnInit\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemUseJuna_IDLE\n"
"\t.4byte 0x00000002\n"
"\t.4byte EndManimLevelUpStatGainLabels\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000530\n"
"\t.4byte 0x00000531\n"
"\t.4byte 0x00000532\n"
"\t.4byte 0x0200F17C\n"
"\t.4byte 0x00000547\n"
"\t.4byte 0x00000548\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_Init\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_ResetBackgrounds\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_InitGfx\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_EnterGiveTakeMenu\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_GiveTakeKeyHandler\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_AdjustCursorAndScroll\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_ItemListKeyHandler\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_SwitchPageLeft\n"
"\t.4byte 0x0006000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_SwitchPageRight\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_SwitchToUnitInventory\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_UnitInvKeyHandler\n"
"\t.4byte 0x0008000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_OnEnd\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte LockGame\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartFastFadeToBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x00000002\n"
"\t.4byte BMapDispSuspend\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_ShowActiveUnitOnEnter\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_Init\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_ResetBackgrounds\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_InitGfx\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_EnterGiveTakeMenu\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_GiveTakeKeyHandler\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_AdjustCursorAndScroll\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_ItemListKeyHandler\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_SwitchPageLeft\n"
"\t.4byte 0x0006000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_SwitchPageRight\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_SwitchToUnitInventory\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemSupply_Loop_UnitInvKeyHandler\n"
"\t.4byte 0x0008000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte BMapDispResume\n"
"\t.4byte 0x00000002\n"
"\t.4byte RefreshBMapGraphics\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemSupply_StartActiveUnitMuOnExit\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartFastFadeFromBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte UnlockGame\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_Init\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_InitGfx\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_SnapCursorIntoView\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemList_Loop_MainKeyHandler\n"
"\t.4byte 0x0006000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_OnEnd\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_StartTradeScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0007000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_SwitchToUnitInventory\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemList_Loop_UnitInvKeyHandler\n"
"\t.4byte 0x0001000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemList_SwitchPageLeft\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PrepItemList_SwitchPageRight\n"
"\t.4byte 0x0008000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x0009000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PrepItemList_OnEnd\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000052E\n"
"\t.4byte 0x0000052F\n"
"\t.4byte 0x0200F17C\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte WmSell_Init\n"
"\t.4byte 0x00000002\n"
"\t.4byte WmSell_Setup\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte WmSell_OnInit_ItemSelect\n"
"\t.4byte 0x00000003\n"
"\t.4byte WmSell_OnLoop_MainKeyHandler\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte WmSell_OnInit_ConfirmSell\n"
"\t.4byte 0x00000003\n"
"\t.4byte WmSell_OnLoop_ConfirmSellKeyHandler\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00100018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte WmSell_OnEnd\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04064000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04084000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x040A4000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x040C4000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x040E4000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04104000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04124000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04144000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x04164000\n"
"\t.4byte 0x40000002\n"
"\t.4byte 0x04008000\n"
"\t.4byte 0x00004010\n"
"\t.4byte 0x00000404\n"
"\t.4byte gProcScr_PrepWMShopSell + 0x88\n"
"\t.4byte gProcScr_PrepWMShopSell + 0x90\n"
"\t.4byte gProcScr_PrepWMShopSell + 0x98\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xA0\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xA8\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xB0\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xB8\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xC0\n"
"\t.4byte gProcScr_PrepWMShopSell + 0xC8\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte nullsub_80\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte FortuneSubMenu_HandleOptionSwitch\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte FortuneSubMenu_OnOptionSelected\n"
"\t.4byte 0x00010006\n"
"\t.4byte data_08A9548C + 0x20\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte FortuneSubMenu_OnOptionSelected\n"
"\t.4byte 0x00010006\n"
"\t.4byte gDivinationDataTable + 0x2D0\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte FortuneSubMenu_OnOptionSelected\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartSupportScreenFromPrepScreen\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000510\n"
"\t.4byte 0x00000511\n"
"\t.4byte 0x00000512\n"
"\t.4byte 0x00000513\n"
"\t.4byte 0x00000514\n"
"\t.4byte 0x00000510\n"
"\t.4byte 0x00000511\n"
"\t.4byte 0x00000512\n"
"\t.4byte 0x00000513\n"
"\t.4byte 0x00000514\n"
"\t.4byte 0x00000515\n"
"\t.4byte 0x00000516\n"
"\t.4byte 0x00000517\n"
"\t.4byte 0x00000518\n"
"\t.4byte 0x00000519\n"
"\t.4byte 0x0000051A\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08044000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08024000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08024000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08024000\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x08004000\n"
"\t.4byte gPrepItemTextMsgIds + 0x38\n"
"\t.4byte gPrepItemTextMsgIds + 0x38\n"
"\t.4byte gPrepItemTextMsgIds + 0x38\n"
"\t.4byte gPrepItemTextMsgIds + 0x38\n"
"\t.4byte gPrepItemTextMsgIds + 0x38\n"
"\t.global data_08A9548C\n"
"data_08A9548C:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte CgTextInterpreter_0\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A2DF8\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3074\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3118\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3228\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A32C0\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A3274\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3250\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000001D\n"
"\t.4byte 0x0000001C\n"
"\t.4byte 0x0000001B\n"
"\t.4byte 0x0000001A\n"
"\t.4byte 0x00000019\n"
"\t.4byte 0x00000018\n"
"\t.4byte frontier_df4_misc_lo_021cb_1F5664 + 0x2C\n"
"\t.4byte frontier_df4_misc_lo_021cb_1F5664 + 0x1C\n"
"\t.4byte frontier_df4_misc_lo_021cb_1F5664 + 0x10\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3458\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3898\n"
"\t.4byte 0x00000002\n"
"\t.4byte Augury_InitResultScreen\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMidFadeFromBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x00000014\n"
"\t.4byte MusicProc4Exists\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte SaveMenuExtrasMenuLoop\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3C64\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x0004000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3CEC\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A3E24\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3EF8\n"
"\t.4byte 0x00000002\n"
"\t.4byte Augury_InitResultScreen\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A3F68\n"
"\t.4byte 0x0004000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMidFadeToBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3250\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A4088\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0004000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartMidFadeToBlack\n"
"\t.4byte 0x00000003\n"
"\t.4byte WaitForFade\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A3250\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000100\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x000007B1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A421C\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A43A0\n"
"\t.4byte 0x00000014\n"
"\t.4byte IsCgTextBlocking\n"
"\t.4byte 0x00000014\n"
"\t.4byte MusicProc4Exists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A45AC\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ShowPrepScreenMenuActiveHand\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A46C0\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x00010006\n"
"\t.4byte data_08A95AD8\n"
"\t.4byte 0x0010000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000014\n"
"\t.4byte MusicProc4Exists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A43E4\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A4568\n"
"\t.4byte 0x00000014\n"
"\t.4byte IsCgTextBlocking\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A4608\n"
"\t.4byte 0x0002000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ShowPrepScreenMenuActiveHand\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A467C\n"
"\t.4byte 0x00000014\n"
"\t.4byte IsCgTextBlocking\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ShowPrepScreenMenuActiveHand\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A462C\n"
"\t.4byte 0x00000014\n"
"\t.4byte IsCgTextBlocking\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0003000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A4428\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0004000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeIn\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeInExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A447C\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A44D0\n"
"\t.4byte 0x0008000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A44F0\n"
"\t.4byte 0x00000014\n"
"\t.4byte CgTextExists\n"
"\t.4byte 0x0005000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0005000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A46DC\n"
"\t.4byte 0x00080018\n"
"\t.4byte NewFadeOut\n"
"\t.4byte 0x00000014\n"
"\t.4byte FadeOutExists\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A4544\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.global data_08A95AD8\n"
"data_08A95AD8:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte sub_80A46F8\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A4738\n"
"\t.4byte 0x0010000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte sub_80A47D0\n"
"\t.4byte 0x001E000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0200F17C\n"
);
/* #143 shiftability: the 0x90E B gap21 blob embedded two proc-script tables
 * (gProcScr_SupportScreen @A95B70, gProcScr_SupportUnitSubScreen @A95C94) whose
 * interior pointers were raw un-relocatable words. The two tables are carved into
 * src/data/ProcScr_uisupport_ref/dat_ProcScr_uisupport_ref.c (own 4-aligned .rodata
 * sections); the surrounding data stays here as three INCBIN slices. Byte-exact:
 * 0x22 + 0xE0 + 0x44 + 0x148 + 0x680 = 0x90E. */
__asm__(
"\t.section .data.frontier_df4_menu.gap21, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_021_A95B4E\n"
"frontier_df4_menu_021_A95B4E:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin\", 0x0, 0xE\n"
"	.4byte DrawSupportBannerSprites_Init\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin\", 0x12, 0x4\n"
"	.4byte DrawSupportBannerSprites_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin\", 0x1A, 0x8\n"
);
/* [0x22,0x102) -> gProcScr_SupportScreen (ref file) */
u8 frontier_df4_menu_021b_A95C50[] __attribute__((section(".data.frontier_df4_menu.gap21b"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x102, 0x44);
/* [0x146,0x28E) -> gProcScr_SupportUnitSubScreen (ref file) */
u8 frontier_df4_menu_021c_A95DDC[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x28E, 0x680);
u8 frontier_df4_menu_022_A96D18[] __attribute__((section(".data.frontier_df4_menu.gap22"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18_0.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18_1.4bpp.lz");
u8 frontier_df4_menu_023_A99FA8[] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8.bin");
u8 frontier_df4_menu_024_A9AC28[] __attribute__((section(".data.frontier_df4_menu.gap24"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.bin", 0, 1020);
__asm__(
    ".section .data.frontier_df4_menu.gap26, \"aw\", %progbits\n"
    ".global frontier_df4_menu_026_A9CF7C\n"
    "frontier_df4_menu_026_A9CF7C:\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x70008000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuPopupHelpBox_Init\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuPopupHelpBox_WaitInput\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap26, \"aw\", %progbits\n"
    ".global data_08A9CFC4\n"
    "data_08A9CFC4:\n"
    ".4byte 0x00000002\n"
    ".4byte ExtraMapStartSomeBgm\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ExecExtraMap\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_voice_000_1F578C + 0x50\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_Init\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_LoadExtraMenuGraphics\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_JumpToTarget\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SameMenu_CtrlLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ResetLcdFormDifficulty\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte DisableAllDisplay\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B0E88\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ReloadScreenFormDifficulty\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ResetLcdFormDifficulty\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_PostDifficultHandler\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuSlotSelDrawSprite\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenu_SaveSlotSelectLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0007000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte _ExecSaveMenuMiscOption\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuRegisterSlotSelected\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuWaitSlotBoxScrolling\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollSlot\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_EndHelpPromptSprite\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollBackToMain\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtrasIn\n"
    ".4byte 0x0009000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtrasOut\n"
    ".4byte 0x000c000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuLoadExtraOptionGfx\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtraSlotIn\n"
    ".4byte 0x000d000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtraSlotOut\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte gap_000AE5A4 + 0x1\n"
    ".4byte 0x000b000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuStartBonusClaim\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuExtraSlotSelectLoop\n"
    ".4byte 0x000e000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000014\n"
    ".4byte IsMusicProc2Running\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80AEBAC\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_Init\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_LoadExtraMenuGraphics\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte IsMusicProc2Running\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuPostExtraMiscScreen\n"
    ".4byte 0x0015000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0012000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0011000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PostSaveMenuHandler\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_voice_000_1F578C + 0x50\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuInit\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_SetLcdChapterIdx\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuDirectlySelectSlotOnPrepScreen\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0014000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenu_SaveSlotSelectLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuRegisterSlotSelected\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuWaitSlotBoxScrolling\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0012000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0011000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PostSaveMenuHandler\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x02000968\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_Init\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_PromptSong4\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaimMenu_WaitInput\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_PromptSong3\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaimMenu_WaitInput\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_SaveData\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
/* #143: the 120 B block [0x08A9D5D4, 0x08A9D64C) that held ProcScr_savedraw,
 * gProcScr_SaveDrawCursor and gProcScr_Savedraw_0 is typed out as struct
 * ProcCmd[] in src/data/ProcScr_savedraw_ref so its interior code/name pointers
 * become R_ARM_ABS32 relocations. Keep only the 0x172 B head here; the tail
 * (0x1EA onward, incl. data_08A9D688) moves to a new gap27c section placed at
 * 0x08A9D64C, so the carved scripts can sit in their own 4-aligned section
 * without bumping this 2-aligned (base 0x08A9D462) blob's alignment. */
__asm__(
"\t.section .data.frontier_df4_menu.gap27, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_027_A9D462\n"
"frontier_df4_menu_027_A9D462:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x0, 0x11A\n"
"	.4byte Sprite_Savedraw_7 + 0xE\n"
"	.4byte Sprite_Savedraw_7 + 0x16\n"
"	.4byte Sprite_Savedraw_7 + 0x1E\n"
"	.4byte Sprite_Savedraw_7 + 0x26\n"
"	.4byte Sprite_Savedraw_7 + 0x2E\n"
"	.4byte Sprite_Savedraw_7 + 0x36\n"
"	.4byte Sprite_Savedraw_7 + 0x3E\n"
"	.4byte Sprite_Savedraw_7 + 0x46\n"
"	.4byte Sprite_Savedraw_7 + 0x4E\n"
"	.4byte Sprite_Savedraw_7 + 0x56\n"
"	.4byte Sprite_Savedraw_7 + 0x5E\n"
"	.4byte Sprite_Savedraw_7 + 0x66\n"
"	.4byte Sprite_Savedraw_7 + 0x6E\n"
"	.4byte Sprite_Savedraw_7 + 0x76\n"
"	.4byte Sprite_Savedraw_7 + 0x7E\n"
"	.4byte Sprite_Savedraw_7 + 0x86\n"
"	.4byte Sprite_Savedraw_7 + 0x8E\n"
"	.4byte Sprite_Savedraw_7 + 0x96\n"
"	.4byte Sprite_Savedraw_7 + 0x9E\n"
"	.4byte Sprite_Savedraw_7 + 0xA6\n"
"	.4byte Sprite_Savedraw_7 + 0xAE\n"
"	.4byte Sprite_Savedraw_7 + 0xB6\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap27c, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_027b_A9D64C\n"
"frontier_df4_menu_027b_A9D64C:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x1EA, 0x20\n"
"	.4byte SaveDrawCursorYOffsetLut + 0x1B\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x20E, 0xC\n"
"	.4byte SqMask_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x21E, 0x8\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap27c, \"aw\", %progbits\n"
"\t.global data_08A9D688\n"
"data_08A9D688:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x226, 0x4\n"
"	.4byte SaveDrawCursorYOffsetLut + 0x23\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x22E, 0xC\n"
"	.4byte SaveBgUp_Loop\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin\", 0x23E, 0x1B6\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global frontier_df4_menu_028_A9E244\n"
    "frontier_df4_menu_028_A9E244:\n"
    ".4byte 0x02021188\n"
    ".4byte 0x02021388\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomSongChange_FadeOutPrevious\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomSongChange_StartNext\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x03005400\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B3E40\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte nullsub_89\n"
    ".4byte 0x00000003\n"
    ".4byte VolumeGraphBuffer_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E2A0\n"
    "data_08A9E2A0:\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_Init\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_0\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideOut\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_1\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_2\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideIn\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_0\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideOut\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_3\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayUiSlideIn\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayKeyHandler\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayUiSlideOut\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_2\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideIn\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_RestartTitleMusic\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte 0x05504008\n"
    ".4byte 0x80204000\n"
    ".4byte 0x00020512\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000552\n"
    ".4byte 0x05168020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x05568000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x0005051a\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000500\n"
    ".4byte 0x05048020\n"
    ".4byte 0x80404000\n"
    ".4byte 0x40000508\n"
    ".4byte 0x050c8060\n"
    ".4byte 0x40800000\n"
    ".4byte 0x00030510\n"
    ".4byte 0x40004000\n"
    ".4byte 0x40000560\n"
    ".4byte 0x05644020\n"
    ".4byte 0x00400000\n"
    ".4byte 0x00010568\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014f\n"
    ".4byte 0x40004000\n"
    ".4byte 0x00010140\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010144\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010145\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010146\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010147\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010148\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010149\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014a\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000014d\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x8\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x10\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x18\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x20\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x28\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x30\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x38\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x40\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x48\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x50\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B4F34\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoom_DrawSprites_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x78008000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E4D0\n"
    "data_08A9E4D0:\n"
    ".4byte 0x00000002\n"
    ".4byte ExtramenuUnk_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ExtramenuUnk_LoadGfx\n"
    ".4byte 0x00000004\n"
    ".4byte nullsub_90\n"
    ".4byte 0x00000003\n"
    ".4byte ExtramenuUnk_DrawIconLoop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x02000968\n"
    ".4byte 0x02000d68\n"
    ".4byte 0x02001168\n"
    ".4byte 0x02001568\n"
    ".4byte 0x02001668\n"
    ".4byte 0x02001368\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E510\n"
    "data_08A9E510:\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_Init\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_MainKeyHandler\n"
    ".4byte 0x0064000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_StartSelectTargetSubMenu\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_SelectTargetKeyHandler\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_EndSelectTargetSubMenu\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_DrawItemSentPopup\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_PopupDisplayTimer\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_ClearItemSentPopup\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0064000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_029_AA3860[] __attribute__((section(".data.frontier_df4_menu.gap29"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin");
u8 frontier_df4_menu_030_AA71D4[] __attribute__((section(".data.frontier_df4_menu.gap30"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin");
/* Wave47: LZ-hybrid decomposed — 1044B JP-LZ 4bpp sheet (128 tiles, byte-exact
 * via gbagfx default) + 32B raw 16-color palette tail. */
u8 frontier_df4_menu_031_AA9F98[] __attribute__((section(".data.frontier_df4_menu.gap31"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98_pal.gbapal");
u8 frontier_df4_menu_032_AAAC4C[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x0, 0x7F4);
u8 data_08AAB440[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x7F4, 0x2818);
u8 frontier_df4_menu_033_AAEB40[] __attribute__((section(".data.frontier_df4_menu.gap33"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin");
struct ProcCmd gProcScr_RedrawConfigHelpText[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = { /* @0x08AAF9EC 32B */
    PROC_NAME(&frontier_df4_voice_000a2_1F5840[0x28]), /* 0x081F5868 "E_CfExplReWrite" */
    PROC_SLEEP(1),
    PROC_CALL(DrawGameOptionHelpText),                 /* 0x080B63A4 */
    PROC_END,
};
struct ProcCmd gProcScr_DrawConfigUiSprites[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = { /* @0x08AAFA0C 56B */
    PROC_NAME(&frontier_df4_voice_000a2_1F5840[0x38]), /* 0x081F5878 "E_cfObj" */
    PROC_CALL(ConfigSprites_Init),                     /* 0x080B6540 */
    PROC_LABEL(0),
    PROC_CALL(DrawConfigUiSprites),                    /* 0x080B6558 */
    PROC_YIELD,
    PROC_GOTO(0),
    PROC_END,
};
struct ProcCmd frontier_df4_menu_034c_AAFA44[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0x0]),
    PROC_CALL(LockGame),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(BMapDispSuspend),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL(Config_Init),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(UnlockGame),
    PROC_END,
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0x0]),
    PROC_CALL(LockGame),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL(Config_Init),
    PROC_CALL(Config_SetSourceFromPrep),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),
    PROC_CALL(UnlockGame),
    PROC_END,
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0x0]),
    PROC_CALL(LockGame),
    PROC_CALL(BMapDispSuspend),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL(Config_Init),
    PROC_CALL(Config_SetSourceFromWorldMap),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_REPEAT(Config_Loop_KeyHandler),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(EndHelpBox),
    PROC_CALL_2(Config_HandleExit),
    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(UnlockGame),
    PROC_END,
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0xC]),
    PROC_SLEEP(0x2),
    PROC_CALL(ColFadeOut_Init),
    PROC_SLEEP(0x0),
    PROC_REPEAT(ColFadeOut_Loop),
    PROC_END,
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0x18]),
    PROC_SLEEP(0x2),
    PROC_CALL(nullsub_91),
    PROC_SLEEP(0x0),
    PROC_REPEAT(ColFadeIn_Loop),
    PROC_END,
};
struct ProcCmd gProcScr_opinfo[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = { /* @0x08AAFC54 88B */
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0x24]), /* 0x081F58BC "opinfo" */
    PROC_SLEEP(0),
    PROC_CALL(ClassReel_Init),       /* 0x080B7430 */
    PROC_REPEAT(ClassReel_Loop),     /* 0x080B751C */
    PROC_LABEL(4),
    PROC_CALL(ClassReel_FadeOutBGM), /* 0x080B75EC */
    PROC_SLEEP(0x3C),
    PROC_LABEL(5),
    PROC_CALL(ClassReel_OnEnd),      /* 0x080B75F8 */
    PROC_SLEEP(0x1E),
    PROC_END,
};
/* data_08AAFCAC: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap34, \"aw\", %progbits\n"
"	.global data_08AAFCAC\n"
"data_08AAFCAC:\n"
"	.4byte 0x03000001, 0x04008000, 0x00000001, gUnkData_ClassIntroBgConfig + 0x18, 0x00100018, NewFadeIn + 0x1\n"
"	.4byte 0x00000014, FadeInExists + 0x1, 0x0001000E, 0x00000000, 0x00000002, ClassIntro_Init + 0x1\n"
"	.4byte 0x00000003, ClassIntro_LoopIn + 0x1, 0x003C000E, 0x00000000, 0x00000003, ClassIntro_LoopOut + 0x1\n"
"	.4byte 0x00000002, ClassIntro_DisableAllExceptBg1 + 0x1, 0x00000002, StartMidFadeToBlack + 0x1, 0x00000003, WaitForFade + 0x1\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000002, ClassIntro_OnEnd + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gUnkData_ClassIntroBgConfig + 0x24, 0x0001000E, 0x00000000, 0x00000002, ClassIntroLetter_Init + 0x1\n"
"	.4byte 0x00000003, ClassIntroLetter_LoopFadeIn + 0x1, 0x00000003, ClassIntroLetter_LoopDisplay + 0x1, 0x00000003, ClassIntroLetter_LoopFadeOut + 0x1\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gUnkData_ClassIntroBgConfig + 0x30, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, ClassIntroIcon_Init + 0x1, 0x00000003, ClassIntroIcon_LoopFadeIn + 0x1, 0x00000003, ClassIntroIcon_LoopDisplay + 0x1\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000003, ClassIntroIcon_LoopFadeOut + 0x1, 0x00000000, 0x00000000\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, ClassIntroFlare_Init + 0x1, 0x00000005, gProcScr_ClassIntro_FlareFX + 0x30\n"
"	.4byte 0x00000003, ClassIntroFlare_Loop + 0x1, 0x001E000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x001E000E, 0x00000000, 0x00000002, ClassIntroBurst_Init + 0x1, 0x00000003, ClassIntroBurst_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00080018, NewFadeOut + 0x1\n"
"	.4byte 0x00000014, FadeOutExists + 0x1, 0x00000002, ClassInfoDisplay_Init + 0x1, 0x00000004, ClassInfoDisplay_OnEnd + 0x1\n"
"	.4byte 0x0002000E, 0x00000000, 0x00000003, ClassInfoDisplay_LoopWindowIn + 0x1, 0x0009000B, 0x00000000\n"
"	.4byte 0x00000002, ClassInfoDisplay_ExecScript + 0x1, 0x00000003, ClassInfoDisplay_LoopScript + 0x1, 0x0009000C, 0x00000000\n"
"	.4byte 0x000A000B, 0x00000000, 0x00000010, 0x00000000, 0x0004000B, 0x00000000\n"
"	.4byte 0x00080018, NewFadeOut + 0x1, 0x00000014, FadeOutExists + 0x1, 0x0008000C, 0x00000000\n"
"	.4byte 0x0007000B, 0x00000000, 0x00020018, NewFadeOut + 0x1, 0x00000014, FadeOutExists + 0x1\n"
"	.4byte 0x0008000B, 0x00000000, 0x00000000, 0x00000000, 0x00000001, gOpinfo_0 + 0x30\n"
"	.4byte 0x0003000E, 0x00000000, 0x00000002, ClassStatsDisplay_Init + 0x1, 0x00000003, ClassStatsDisplay_Loop + 0x1\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, 0x093F0000, 0x00000001, 0x093E0000\n"
"	.4byte 0x00000001, 0x093D0000, 0x00000001, 0x093C0000, gProcScr_opinfogaugedraw + 0x28, gProcScr_opinfogaugedraw + 0x30\n"
"	.4byte gProcScr_opinfogaugedraw + 0x38, gProcScr_opinfogaugedraw + 0x40, 0x00000001, 0x07008000, 0x00000001, 0x07048000\n"
"	.4byte 0x00000001, 0x07088000, 0x00000001, 0x070C8000, 0x00000001, 0x07108000\n"
"	.4byte 0x00000001, 0x07148000, 0x00000001, 0x07188000, 0x00000001, 0x071C8000\n"
"	.4byte gProcScr_opinfogaugedraw + 0x58, gProcScr_opinfogaugedraw + 0x60, gProcScr_opinfogaugedraw + 0x68, gProcScr_opinfogaugedraw + 0x70, gProcScr_opinfogaugedraw + 0x78, gProcScr_opinfogaugedraw + 0x80\n"
"	.4byte gProcScr_opinfogaugedraw + 0x88, gProcScr_opinfogaugedraw + 0x90, 0x00000001, 0x07804000, 0x00011E05, 0x28050008\n"
"	.4byte 0x50050003, 0x00080001, 0x00032805, 0x28050000, 0x00080001, 0x00032805\n"
"	.4byte 0x00016405, 0x28050008, 0x00000003, 0x00012805, 0x5A050008, 0x00000003\n"
"	.4byte 0x00043C05, 0x46050008, 0x00000003, 0x00013C05, 0x28050008, 0x00000003\n"
"	.4byte 0x00042805, 0x28050008, 0x48050003, 0x00080004, 0x00032805, 0x28050000\n"
"	.4byte 0x00080004, 0x00032805, 0x50050000, 0x00080004, 0x00035A05, 0x50050000\n"
"	.4byte 0x00080004, 0x00035A05, 0x50050000, 0x00080001, 0x00036405, 0x78050000\n"
"	.4byte 0x00080001, 0x00032805, 0x28050000, 0x00080004, 0x0003AA05, 0x3C050000\n"
"	.4byte 0x00080004, 0x00036005, 0x28050000, 0x00080004, 0x0003C805, 0x00000000\n"
"	.4byte gUnkData_96 + 0x20, gUnkData_96 + 0xD4, gUnkData_96 + 0x144, gUnkData_96 + 0x1E4, gUnkData_96 + 0x28C, gUnkData_96 + 0x344\n"
"	.4byte gUnkData_96 + 0x404, gUnkData_96 + 0x4A8, gUnkData_96 + 0x560, gUnkData_96 + 0x610, gUnkData_96 + 0x6A4, gUnkData_96 + 0x72C\n"
"	.4byte gUnkData_96 + 0x7E4, gUnkData_96 + 0x884, gUnkData_96 + 0x944, gUnkData_96 + 0xA18, gUnkData_96 + 0xAD4, gUnkData_96 + 0xB70\n"
"	.4byte gUnkData_96 + 0xC18, gUnkData_96 + 0xCBC, gUnkData_96 + 0xD60, gUnkData_96 + 0xDF8, gUnkData_96 + 0xE80, gUnkData_96 + 0xF10\n"
"	.4byte gUnkData_96 + 0xFAC, gUnkData_96 + 0x1068, gUnkData_96 + 0x1110, gUnkData_96 + 0x11C8, gUnkData_96 + 0x1250, gUnkData_96 + 0x12FC\n"
"	.4byte gUnkData_96 + 0x1370, gUnkData_96 + 0x1448, gUnkData_96 + 0x1504, gUnkData_96 + 0x15C0, gUnkData_96 + 0x165C, gUnkData_96 + 0x170C\n"
"	.4byte gUnkData_96 + 0x17AC, gUnkData_96 + 0x1890, gUnkData_96 + 0x1924, gUnkData_96 + 0x19C4, gUnkData_96 + 0x1A7C, gUnkData_96 + 0x1B08\n"
"	.4byte gUnkData_96 + 0x1BB0, gUnkData_96 + 0x1C74, gUnkData_96 + 0x1D38, gUnkData_96 + 0x1DC8, gUnkData_96 + 0x1E88, gUnkData_96 + 0x1F2C\n"
"	.4byte gUnkData_96 + 0x1FB8, gUnkData_96 + 0x2068, gUnkData_96 + 0x20F4, gUnkData_96 + 0x2194, gUnkData_96 + 0x222C, gUnkData_96 + 0x22D4\n"
"	.4byte gUnkData_96 + 0x2398, gUnkData_96 + 0x242C, gUnkData_96 + 0x24BC, gUnkData_96 + 0x25F4, gUnkData_96 + 0x26DC, gUnkData_96 + 0x27E0\n"
"	.4byte gUnkData_96 + 0x28D4, gUnkData_96 + 0x29E4, gUnkData_96 + 0x2B24, gUnkData_96 + 0x2BD0, gUnkData_96 + 0x2C74, gUnkData_96 + 0x2DA4\n"
"	.4byte gUnkData_96 + 0x2EE0, gUnkData_96 + 0x2FEC, gUnkData_96 + 0x3090, gUnkData_96 + 0x31B4, gUnkData_96 + 0x32E0, gUnkData_96 + 0x33E4\n"
"	.4byte gUnkData_96 + 0x34D8, gUnkData_96 + 0x35A4, gUnkData_96 + 0x36C8, gUnkData_96 + 0x37D4, gUnkData_96 + 0x3900, gUnkData_96 + 0x39A0\n"
"	.4byte gUnkData_96 + 0x3A60, gUnkData_96 + 0x3B80, gUnkData_96 + 0x3C38, gUnkData_96 + 0x3D54, gUnkData_96 + 0x3E30, gUnkData_96 + 0x3F28\n"
"	.4byte gUnkData_96 + 0x4048, gUnkData_96 + 0x40E8, gUnkData_96 + 0x4220, gUnkData_96 + 0x42D8, gUnkData_96 + 0x43DC, gUnkData_96 + 0x44B4\n"
"	.4byte gUnkData_96 + 0x457C, gUnkData_96 + 0x4654, 0xFF020100, 0x01050403, 0xFF020100, 0x3AFF3938\n"
"	.4byte 0x433CFF3B, 0x020106FF, 0x01050403, 0xFF433DFF, 0x0A010908, 0x403EFF0B\n"
"	.4byte 0x0D010CFF, 0xFF010E01, 0x100F010B, 0x1104FF01, 0xFF011216, 0x04140913\n"
"	.4byte 0x15161115, 0x0B1706FF, 0x15161118, 0x1A1912FF, 0x0BFF211B, 0x11010301\n"
"	.4byte 0x1CFF1516, 0x18191E1D, 0x01141FFF, 0x15161115, 0x201902FF, 0x15161121\n"
"	.4byte 0x201902FF, 0x05040321, 0x1622FF01, 0x1121010C, 0x23FF1516, 0x11040D24\n"
"	.4byte 0x13FF1516, 0x21261825, 0xFF151611, 0xFF434241, 0x03FF3B44, 0x16111C01\n"
"	.4byte 0x1017FF15, 0xFF210301, 0x02161802, 0x11030DFF, 0x4245FF01, 0x4746FF43\n"
"	.4byte 0x050417FF, 0x4948FF01, 0x0C1815FF, 0xFF180102, 0x2B18252A, 0xFF0B0A2C\n"
"	.4byte 0x0BFF404A, 0xFF21170D, 0xFF1F0100, 0xFF4D4C4B, 0x101C1806, 0x404EFF01\n"
"	.4byte 0x002D1EFF, 0x010D2103, 0x012C17FF, 0x4FFF0105, 0xFF433D50, 0xFF27212E\n"
"	.4byte 0xFF012F03, 0x15183004, 0x1831FF21, 0xFF210151, 0xFF18010C, 0x0C351836\n"
"	.4byte 0x0DFF1801, 0x29002D16, 0x0132FF04, 0x0133020D, 0x1830FF1F, 0xFF040034\n"
"	.4byte 0x092A1805, 0x1F03FF04, 0xFF181635, 0xFF181F27, 0x272D010B, 0x20FF181F\n"
"	.4byte 0xFF212001, 0x21200120, 0xFF1F3736, 0x16200124, 0x041AFF18, 0x16200124\n"
"	.4byte 0x1902FF18, 0x212E2120, 0x3F41FF27, 0x2D0703FF, 0x58FF1501, 0x3D5B5A59\n"
"	.4byte 0x4241FF43, 0x54535243, 0x575655FF, 0x0000FF43\n"
);
/* frontier_df4_menu_035_AB0830: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap35, \"aw\", %progbits\n"
"	.global frontier_df4_menu_035_AB0830\n"
"frontier_df4_menu_035_AB0830:\n"
"	.4byte 0x012FFF04, 0x00000576, 0x15150000, sSprite_Opinfo_13 + 0xAA, gOpinfo_0 + 0x218, 0x0000067F\n"
"	.4byte gOpinfo_1 + 0x1CB, 0x010BFF05, 0x00000044, 0x02020000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x220\n"
"	.4byte 0x00000684, gOpinfo_1 + 0x185, 0x0015FF07, 0x00000014, 0x09090000, sSprite_Opinfo_13 + 0x34\n"
"	.4byte gOpinfo_0 + 0x22C, 0x0000068B, gOpinfo_1 + 0x1EA, 0x00236808, 0x00000061, 0x16160000\n"
"	.4byte sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x23C, 0x0000068F, gOpinfo_1 + 0x22E, 0x002B0D02, 0x00000481\n"
"	.4byte 0x14140000, sSprite_Opinfo_13 + 0x7A, gOpinfo_0 + 0x244, 0x0000068A, gOpinfo_1 + 0x1E1, 0x00211708\n"
"	.4byte 0x0000005C, 0x16160000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x254, 0x00000682, gOpinfo_1 + 0x17F\n"
"	.4byte 0x00116B02, 0x0000000D, 0x17170000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x25C, 0x000006A3\n"
"	.4byte gOpinfo_1 + 0x1FB, 0x00491C08, 0x00000067, 0x0D0D0000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x26C\n"
"	.4byte 0x000006B2, gOpinfo_1 + 0x284, 0x0159FF06, 0x000000AC, 0x04040000, sSprite_Opinfo_13 + 0x34\n"
"	.4byte gOpinfo_0 + 0x278, 0x000006B6, gOpinfo_1 + 0x2A0, 0x015DFF05, 0x000000B2, 0x01010000\n"
"	.4byte sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x280, 0x000006BD, gOpinfo_1 + 0x2CA, 0x0164FF07, 0x000000BE\n"
"	.4byte 0x16160000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x290, 0x000006B5, gOpinfo_1 + 0x29A, 0x015CFF05\n"
"	.4byte 0x000000B1, 0x13130000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x29C, 0x000006BA, gOpinfo_1 + 0x2B7\n"
"	.4byte 0x0161FF04, 0x000008BB, 0x01010000, sSprite_Opinfo_13 + 0xC2, gOpinfo_0 + 0x2A4, 0x000006AA\n"
"	.4byte gOpinfo_1 + 0x259, 0x014FFF07, 0x0000029C, 0x14140000, sSprite_Opinfo_13 + 0x7A, gOpinfo_0 + 0x2B0\n"
"	.4byte 0x0000069D, gOpinfo_1 + 0x21D, 0x01314F04, 0x0000057A, 0x15150000, sSprite_Opinfo_13 + 0xAA\n"
"	.4byte gOpinfo_0 + 0x2BC, 0x00000692, gOpinfo_1 + 0x2DD, 0x003CFF05, 0x000006C4, 0x10100000\n"
"	.4byte sSprite_Opinfo_13 + 0x9E, gOpinfo_0 + 0x2C4, 0x000006B9, gOpinfo_1 + 0x2B0, 0x0160FF06, 0x000007BA\n"
"	.4byte 0x06060000, sSprite_Opinfo_13 + 0xB6, gOpinfo_0 + 0x2D0, 0x00000689, gOpinfo_1 + 0x1D9, 0x001F1507\n"
"	.4byte 0x00000057, 0x04040000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x2E0, 0x000006A8, gOpinfo_1 + 0x250\n"
"	.4byte 0x014EFF05, 0x00000097, 0x14140000, sSprite_Opinfo_13 + 0x8, 0x23292F35, 0x0C12181D\n"
"	.4byte 0x00000006\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap36, \"aw\", %progbits\n"
    ".global frontier_df4_menu_036_AB0D18\n"
    "frontier_df4_menu_036_AB0D18:\n"
    ".4byte 0x00080001\n"
    ".4byte 0x0c784000\n"
    ".4byte 0x00000002\n"
    ".4byte 0x0cc24000\n"
    ".4byte 0x00004010\n"
    ".4byte 0x00010d02\n"
    ".4byte 0x00008008\n"
    ".4byte 0x00020c7a\n"
    ".4byte 0x40000000\n"
    ".4byte 0x40100cc4\n"
    ".4byte 0x0d040000\n"
    ".4byte 0x00080001\n"
    ".4byte 0x0c7b4000\n"
    ".4byte 0x80000002\n"
    ".4byte 0x0cc60000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00020d06\n"
    ".4byte 0x40000008\n"
    ".4byte 0x40180cc8\n"
    ".4byte 0x0d080000\n"
    ".4byte 0x00000002\n"
    ".4byte 0x0cca4000\n"
    ".4byte 0x00004010\n"
    ".4byte 0x00020d0a\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00100ccc\n"
    ".4byte 0x0d0c0000\n"
    ".4byte 0x80000002\n"
    ".4byte 0x0c7f0000\n"
    ".4byte 0x00008010\n"
    ".4byte 0x00020cbf\n"
    ".4byte 0x40000000\n"
    ".4byte 0x40100ccd\n"
    ".4byte 0x0d0d0000\n"
    ".4byte 0x80000002\n"
    ".4byte 0x0ccf0000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00010d0f\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00010c7d\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00010cb8\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00020cba\n"
    ".4byte 0x40000008\n"
    ".4byte 0x40180cd0\n"
    ".4byte 0x0d100000\n"
    ".4byte 0x00080002\n"
    ".4byte 0x0cd24000\n"
    ".4byte 0x00004018\n"
    ".4byte 0x00020d12\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00100cd4\n"
    ".4byte 0x0d140000\n"
    ".4byte 0x80080001\n"
    ".4byte 0x0cbc0000\n"
    ".4byte 0x80000002\n"
    ".4byte 0x0cd50000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00010d15\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00010cbd\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00020cf8\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00020cfa\n"
    ".4byte 0x40000008\n"
    ".4byte 0x00020cfc\n"
    ".4byte 0x40000008\n"
    ".4byte 0x40180cd6\n"
    ".4byte 0x0d160000\n"
    ".4byte 0x00080001\n"
    ".4byte 0x0cfe4000\n"
    ".4byte data_08AB0B48\n"
    ".4byte 0x00001900\n"
    ".4byte sSprite_ClassDisplay_B\n"
    ".4byte 0x00001100\n"
    ".4byte sSprite_ClassDisplay_C\n"
    ".4byte 0x00001200\n"
    ".4byte sSprite_ClassDisplay_D\n"
    ".4byte 0x00001400\n"
    ".4byte sSprite_ClassDisplay_E\n"
    ".4byte 0x00001000\n"
    ".4byte sSprite_ClassDisplay_F\n"
    ".4byte 0x00001000\n"
    ".4byte sSprite_ClassDisplay_G\n"
    ".4byte 0x00001200\n"
    ".4byte sSprite_ClassDisplay_H\n"
    ".4byte 0x00001400\n"
    ".4byte sSprite_ClassDisplay_I\n"
    ".4byte 0x00000f00\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sSprite_ClassDisplay_L\n"
    ".4byte 0x00001100\n"
    ".4byte sSprite_ClassDisplay_M\n"
    ".4byte 0x00001600\n"
    ".4byte sSprite_ClassDisplay_N\n"
    ".4byte 0x00001400\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sSprite_ClassDisplay_P\n"
    ".4byte 0x00001000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sSprite_ClassDisplay_R\n"
    ".4byte 0x00001500\n"
    ".4byte sSprite_ClassDisplay_S\n"
    ".4byte 0x00001700\n"
    ".4byte sSprite_ClassDisplay_T\n"
    ".4byte 0x00001100\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sSprite_ClassDisplay_V\n"
    ".4byte 0x00001300\n"
    ".4byte sSprite_ClassDisplay_W\n"
    ".4byte 0x00001800\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sSprite_ClassDisplay_Z\n"
    ".4byte 0x00001700\n"
    ".4byte frontier_df4_menu_036_AB0D18\n"
    ".4byte 0x00000800\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x8\n"
    ".4byte 0x00000900\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x16\n"
    ".4byte 0x00000600\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x1e\n"
    ".4byte 0x00000800\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x2c\n"
    ".4byte 0x00000800\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x34\n"
    ".4byte 0x00000700\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x42\n"
    ".4byte 0x00000b01\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x50\n"
    ".4byte 0x00000901\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x5e\n"
    ".4byte 0x00000600\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x6c\n"
    ".4byte 0x00000701\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x7a\n"
    ".4byte 0x00000901\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x88\n"
    ".4byte 0x00000601\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x96\n"
    ".4byte 0x00000d00\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x9e\n"
    ".4byte 0x00000900\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xa6\n"
    ".4byte 0x00000700\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xae\n"
    ".4byte 0x00000800\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xbc\n"
    ".4byte 0x00000a00\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xca\n"
    ".4byte 0x00000700\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xd8\n"
    ".4byte 0x00000700\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xe0\n"
    ".4byte 0x00000600\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xee\n"
    ".4byte 0x00000901\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xf6\n"
    ".4byte 0x00000801\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0xfe\n"
    ".4byte 0x00000c01\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x106\n"
    ".4byte 0x00000901\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x10e\n"
    ".4byte 0x00000a01\n"
    ".4byte frontier_df4_menu_036_AB0D18 + 0x11c\n"
    ".4byte 0x00000801\n"
);
/* multi-slice atomic relocation carve of frontier_df4_menu_037_AB7144 (embedded ProcScr @ 0x5650):
   the graphics prefix [0,0x5650) stays .incbin; the shop/menu ProcScr's 50 func pointers + 2
   self-ref child-ProcScr pointers (blob+0x5984) become .4byte Sym(+addend). The 11 coincidental
   ROM-range words in the prefix are NOT pointers (mid-func / mid-data offsets) and stay raw.
   byte-exact; make compare is the oracle. */
__asm__(
"\t.section .data.frontier_df4_menu.gap37, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_037_AB7144\n"
"frontier_df4_menu_037_AB7144:\n"
"\t.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin\", 0, 0x5650\n"
"\t.4byte LockGame + 0x1, 0x0001000E, 0x00000000, 0xFFFF0018, _FadeBgmOut + 0x1, 0x00000002\n"
"\t.4byte StartMidFadeToBlack + 0x1, 0x00000003, WaitForFade + 0x1, 0x00000002, BMapDispSuspend + 0x1, 0x00000000\n"
"\t.4byte 0x00000000, 0x00000002, ResetDialogueScreen + 0x1, 0x00000002, BMapDispResume + 0x1, 0x00000002\n"
"\t.4byte RefreshBMapGraphics + 0x1, 0x00000002, StartMapSongBgm + 0x1, 0x00000002, StartMidFadeFromBlack + 0x1, 0x00000003\n"
"\t.4byte WaitForFade + 0x1, 0x00000002, UnlockGame + 0x1, 0x00000000, 0x00000000, 0x00000002\n"
"\t.4byte StartShopFadeIn + 0x1, 0x0000000E, 0x00000000, 0x00000002, LockGame + 0x1, 0x00000002\n"
"\t.4byte Shop_Init + 0x1, 0x00000002, Shop_InitBuyState + 0x1, 0x00000005, frontier_df4_menu_037_AB7144 + 0x5984, 0x00000002\n"
"\t.4byte FadeInBlackSpeed20 + 0x1, 0x0001000E, 0x00000000, 0x00000002, Shop_EntryDialogue + 0x1, 0x0000000B\n"
"\t.4byte 0x00000000, 0x0001000E, 0x00000000, 0x00000003, Shop_HandleEntryDialoguePrompt + 0x1, 0x0001000B\n"
"\t.4byte 0x00000000, 0x00000002, Shop_BuyDialogue + 0x1, 0x0002000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_InitBuyState + 0x1, 0x0001000E, 0x00000000, 0x00000003, Shop_Loop_BuyKeyHandler + 0x1, 0x00000002\n"
"\t.4byte Shop_HandleBuyConfirmPrompt + 0x1, 0x0009000C, 0x00000000, 0x0003000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_AnythingElseDialogue + 0x1, 0x0002000C, 0x00000000, 0x0004000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_SellDialogue + 0x1, 0x0005000B, 0x00000000, 0x00000002, Shop_InitSellState + 0x1, 0x0001000E\n"
"\t.4byte 0x00000000, 0x00000003, Shop_Loop_SellKeyHandler + 0x1, 0x00000002, Shop_HandleSellConfirmPrompt + 0x1, 0x0002000E\n"
"\t.4byte 0x00000000, 0x00000002, Shop_SellAnythingElseDialogue + 0x1, 0x0005000C, 0x00000000, 0x0007000B\n"
"\t.4byte 0x00000000, 0x0002000E, 0x00000000, 0x00000002, Shop_AnythingElseRestartDialogue + 0x1, 0x0000000C\n"
"\t.4byte 0x00000000, 0x0008000B, 0x00000000, 0x0001000E, 0x00000000, 0x00000002\n"
"\t.4byte Shop_AnythingElseContinueDialogue + 0x1, 0x0000000C, 0x00000000, 0x0009000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_TryAddItemToInventory + 0x1, 0x0000000E, 0x00000000, 0x00000002, Shop_HandleSendToConvoyPrompt + 0x1, 0x0000000E\n"
"\t.4byte 0x00000000, 0x00000002, Shop_CheckIfConvoyFull + 0x1, 0x00000002, Shop_ConvoyFullDialogue + 0x1, 0x0000000E\n"
"\t.4byte 0x00000000, 0x0007000C, 0x00000000, 0x000A000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_AddItemToConvoy + 0x1, 0x0000000E, 0x00000000, 0x00000002, Shop_SendToConvoyDialogue + 0x1, 0x0000000E\n"
"\t.4byte 0x00000000, 0x0003000C, 0x00000000, 0x000B000B, 0x00000000, 0x0000000E\n"
"\t.4byte 0x00000000, 0x00000002, Shop_NoSendToConvoyDialogue + 0x1, 0x0000000E, 0x00000000, 0x0007000C\n"
"\t.4byte 0x00000000, 0x000D000B, 0x00000000, 0x00000002, Shop_PrepEntryDialogue + 0x1, 0x0000000E\n"
"\t.4byte 0x00000000, 0x00000003, Shop_Loop_UnkKeyHandler + 0x1, 0x000C000B, 0x00000000, 0x00000002\n"
"\t.4byte Shop_ExitShopDialogue + 0x1, 0x0001000E, 0x00000000, 0x00020018, _FadeBgmOut + 0x1, 0x00000002\n"
"\t.4byte FadeOutBlackSpeed20Locking + 0x1, 0x0001000E, 0x00000000, 0x00000002, Shop_OnExit + 0x1, 0x00000009\n"
"\t.4byte frontier_df4_menu_037_AB7144 + 0x5984, 0x00000002, StartShopFadeOut + 0x1, 0x0000000E, 0x00000000, 0x00000002\n"
"\t.4byte UnlockGame + 0x1, 0x00000000, 0x00000000, 0x00000003, InitShopBuyStatus + 0x1, 0x00000000\n"
"\t.4byte 0x00000000, 0x00000003, InitShopSellStatus + 0x1, 0x00000000, 0x00000000, 0x40000006\n"
"\t.4byte 0x04004000, 0x40204000, 0x40080402, 0x04064000, 0x40204008, 0x40100408\n"
"\t.4byte 0x040C4000, 0x40204010, 0x0000040E, 0x00000003, GoldBox_OnLoop + 0x1, 0x00000000\n"
"\t.4byte 0x00000000, 0x00000003, _DisplayShopUiArrows + 0x1\n"
);
/* frontier_df4_menu_038_ABCD24: the [0,0x20) arena ProcScr's 2 func pointers (Arena_PlayResultSong,
   Arena_PlayArenaSong) become .4byte Sym+0x1. The [0x20,end) descriptor table stays .incbin -- it
   interleaves u16 immediates with sparse pointers and contains PROVEN coincidental ROM-range words
   (adjacent u16 pairs read as 0x08xx1B20), so a typed extraction is deferred to a dedicated data
   task. Externally referenced by base+offset (dat_gProcScr_ArenaUiResults_ref, frontier_df4_banim_b);
   the .global symbol keeps the same address. byte-exact. */
__asm__(
"\t.section .data.frontier_df4_menu.gap38, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_038_ABCD24\n"
"frontier_df4_menu_038_ABCD24:\n"
"\t.4byte 0x00000002, Arena_PlayResultSong + 0x1, 0x00D2000E, 0x00000000, 0x00000002, Arena_PlayArenaSong + 0x1\n"
"\t.4byte 0x00000000, 0x00000000\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x20, 0x6D0\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x684\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x6F4, 0x4\n"
"	.4byte EventScr_CallOnTutorialMode\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x6FC, 0x10\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x710, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x734, 0x198\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x85C\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x8D0, 0x4\n"
"	.4byte EventScr_CallOnTutorialMode\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x8D8, 0x10\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x8EC, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x910, 0x160\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xA74, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xA98, 0xC4\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0xBC8\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xB60, 0x5C\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xBC0, 0x88\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0xE30\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xC4C, 0x24\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xC74, 0x218\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xE90, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xEB4, 0xC4\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xF7C, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0xFA0, 0x190\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x106C\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1134, 0x10\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1148, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x116C, 0x1D8\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1348, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x136C, 0x154\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x14C4, 0x5C\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1524, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1548, 0x150\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x169C, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x16C0, 0x1D8\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x17B8\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x189C, 0x10\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x18B0, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x18D4, 0x1B4\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1A8C, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1AB0, 0xBC\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1B70, 0x5C\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1BD0, 0xC\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1BE0, 0xD4\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1CB8, 0xC\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1CC8, 0x248\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x1F14, 0xE8\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2000, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2024, 0x168\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2190, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x21B4, 0x114\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x22CC, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x22F0, 0x154\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2448, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x246C, 0x1A4\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2614, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2638, 0x22C\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2868, 0xC\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2878, 0x1CC\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2A48, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2A6C, 0x168\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2BD8, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2BFC, 0x110\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2D10, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2D34, 0x154\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2E8C, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x2EB0, 0x1A4\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x3058, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin\", 0x307C, 0x244\n"
);
__asm__(
"\t.section .data.frontier_df4_menu.gap39, \"aw\", %progbits\n"
"\t.global frontier_df4_menu_039_AC00A8\n"
"frontier_df4_menu_039_AC00A8:\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0x0, 0x10\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x3210\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0x14, 0xC\n"
"	.4byte EventScrWM_MessedEventscr_52\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0x24, 0x78\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0xA0, 0x20\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0xC4, 0xF8\n"
"	.4byte gProcScr_85B9D0C + 0x18\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0x1C0, 0xC\n"
"	.4byte frontier_df4_menu_038_ABCD24 + 0x20\n"
"	.incbin \"graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin\", 0x1D0, 0x11C\n"
);
