#include "global.h"
#include "proc.h"


extern void CreditsBlendCG_0();
extern void CreditsBlendCG_1();
extern void CreditsBlendCG_2();
extern void CreditsBlendCG_3();
extern void CreditsBlendCG_Init();
extern void CreditsBlendCG_OnEnd();
extern void EndingCredits_0();
extern void EndingCredits_AwaitInputForEnd();
extern void EndingCredits_EndBlendCG();
extern void EndingCredits_Init();
extern void EndingCredits_Loop_Main();
extern void EndingCredits_OnEnd();
extern void EndingCredits_ShowCopyright();
extern void FadeInExists();
extern void FadeOutExists();
extern void NewFadeIn();
extern void NewFadeOut();
extern void OpSubtitle_AwaitTimer2a();
extern void OpSubtitle_BackupPalette();
extern void OpSubtitle_BlendFadeInSlide_Loop();
extern void OpSubtitle_BlendFadeOutSlide_Loop();
extern void OpSubtitle_ClearTileAndDisableTitleBg2();
extern void OpSubtitle_FadeInScrollTextPal_Loop();
extern void OpSubtitle_FadeInSlide_Loop();
extern void OpSubtitle_FadeOutBgm();
extern void OpSubtitle_FadeOutSlideAndAdvance_Loop();
extern void OpSubtitle_FadeOutSlideToTitle_Loop();
extern void OpSubtitle_FadeOutWholePalette_Loop();
extern void OpSubtitle_Init();
extern void OpSubtitle_LoadSlideToBg0();
extern void OpSubtitle_LoadSlideToBg0AndBg1();
extern void OpSubtitle_ReloadTitleSlide();
extern void OpSubtitle_ResetBg1Position();
extern void OpSubtitle_SetupScrollTextBgs();
extern void OpSubtitle_SetupTitleBgs();
extern void StartFastFadeToBlack();
extern void StartSlowFadeToBlack();
extern void Subtitle_LightFlareFx_End();
extern void Subtitle_LightFlareFx_Init();
extern void Subtitle_LightFlareFx_Loop();
extern void WaitForFade();

/* Migrated from asm/frontier_df4_ending.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* #148 proc-script decomp-completeness (gap1/gap2/gap17/gap21): carve the 8
 * opaque worldmap/gmap/opening-anim/class-change proc scripts out of the fully-
 * symbolized .4byte blob into typed struct ProcCmd[] in-place (byte-neutral:
 * each carved word is an existing .4byte Sym/immediate re-expressed as a
 * ProcCmd macro with the identical reloc). data_08BABA58 is preserved as a
 * byte-neutral alias for ProcScr_ClassChgMenuSel (referenced by src/sub_80D2AD8).
 * Baseline .set aliases dropped in layout/baseline_syms_drop.d/procscr_ending_148.tsv;
 * make compare (sha1) is the oracle. */

extern void ClassChgMenuExec();
extern void GmapScreen2_Destruct();
extern void GmapScreen2_Init();
extern void GmapScreen2_Loop();
extern void OpAnimAllBlack();
extern void OpAnimBldAlphaDelay();
extern void OpAnimBldAlphaMain();
extern void OpAnimBldAlphaUpdateBgPalette();
extern void OpAnimFadeInMain();
extern void OpAnimMergeBGProcInit();
extern void OpAnimMergeBGProcUpdateBgPalette();
extern void OpAnimfxTerminatorMain();
extern void Proc08AA6D04Main();
extern void WorldMapFaceHolder_Init();
extern void gap_000D2AD0();
extern void sub_80CBD20();
extern u8 data_081F611C[];
extern u8 data_081F6D7C[];

u8 frontier_df4_ending_000_AC059C[] __attribute__((section(".data.frontier_df4_ending.gap0"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_000_AC059C.bin");
__asm__(
"	.section .data.frontier_df4_ending.gap1, \"aw\", %progbits\n"
"	.global frontier_df4_ending_001_AC0B90\n"
"frontier_df4_ending_001_AC0B90:\n"
"	.4byte 0x020027A0, 0x0000000E, 0x00000000, 0x00000002, CharacterEnding_Init, 0x00000002\n"
"	.4byte LoadNextCharacterEnding, 0x0000000B, 0x00000000, 0x00000002, CharacterEnding_0, 0x00040018\n"
"	.4byte NewFadeIn, 0x00000014, FadeInExists, 0x00000002, CharacterEnding_StartBattleDisplay, 0x001E000E\n"
"	.4byte 0x00000000, 0x00000002, CharacterEnding_StartBattleDisplayText, 0x0072000E, 0x00000000, 0x0063000B\n"
"	.4byte 0x00000000, 0x00000002, LoadNextCharacterEnding, 0x00040018, NewFadeOut, 0x00000014\n"
"	.4byte FadeOutExists, 0x0000000C, 0x00000000, 0x0064000B, 0x00000000, 0x00070018\n"
"	.4byte _FadeBgmOut, 0x00020018, NewFadeOut, 0x00000014, FadeOutExists, 0x00000002\n"
"	.4byte CharacterEnding_End, 0x00000000, 0x00000000, 0x08060300, 0x100E0C0A, 0x16151412\n"
"	.4byte 0x1A191817, 0x1E1D1C1B, 0x0000000E, 0x00000000, 0x00000002, SoloEndingBattleDisp_Init\n"
"	.4byte 0x00000003, SoloEndingBattleDisp_Loop, 0x00000000, 0x00000000, 0x0000000E, 0x00000000\n"
"	.4byte 0x00000002, gap_000BBA3C + 0x1, 0x00000003, PairedEndingBattleDisp_Loop_SlideIn, 0x0010000E, 0x00000000\n"
"	.4byte 0x00000002, PairedEndingBattleDisp_InitBlend, 0x00000003, PairedEndingBattleDisp_Loop_Blend, 0x00000000, 0x00000000\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, EndingBattleInitText, 0x00000003, EndingBattleText_Loop\n"
"	.4byte 0x00000000, 0x00000000, 0x001E000E, 0x00000000, 0x00000002, Fin_Init\n"
"	.4byte 0x00040018, NewFadeIn, 0x00000014, FadeInExists, 0x0000000B, 0x00000000\n"
"	.4byte 0x00000003, Fin_Loop_KeyListener, 0x00040018, _FadeBgmOut, 0x00040018, NewFadeOut\n"
"	.4byte 0x00000014, FadeOutExists, 0x003C000E, 0x00000000, 0x0064000C, 0x00000000\n"
"	.4byte 0x0001000B, 0x00000000, 0x00040018, NewFadeIn, 0x00000014, FadeInExists\n"
"	.4byte 0x003C000E, 0x00000000, 0x00000002, Fin_InitBlend, 0x00000003, Fin_Loop_Blend\n"
"	.4byte 0x0000000C, 0x00000000, 0x0002000B, 0x00000000, 0x00040018, NewFadeOut\n"
"	.4byte 0x00000014, FadeOutExists, 0x00000002, StartFinScreen, 0x0000000E, 0x00000000\n"
"	.4byte 0x0064000C, 0x00000000, 0x0064000B, 0x00000000, 0x00000002, Fin_End\n"
"	.4byte 0x00000000, 0x00000000, 0x40000005, 0x00008000, 0x80204000, 0x40000004\n"
"	.4byte 0x00088040, 0x80604000, 0x8000000C, 0x00100080, 0x40000002, 0x00408000\n"
"	.4byte 0x80204000, 0x00020044, 0x80004000, 0x40000048, 0x004C8020, 0x40000002\n"
"	.4byte 0x00508000, 0x80204000, 0x00020054, 0x80004000, 0x40000058, 0x005C8020\n"
"	.4byte 0x40000002, 0x00888000, 0x80204000, 0x0002008C, 0x80004000, 0x40000080\n"
"	.4byte 0x00848020, 0x40000002, 0x001B4000, 0x00200000, 0x0001001F, 0x80000000\n"
"	.4byte 0x000100C0, 0x80000000, 0x000100C4, 0x80000000, 0x000100C8, 0x80000000\n"
"	.4byte 0x000100CC, 0x80000000, 0x000100D0, 0x80000000, 0x000100D4, 0x80000000\n"
"	.4byte 0x00010140, 0x80000000, 0x00010144, 0x80000000, 0x00010148, 0x80000000\n"
"	.4byte 0x0001014C, 0x80000000, 0x00010150, 0x80000000, 0x00000154, Sprite_EndingDetails_7 + 0x36\n"
"	.4byte Sprite_EndingDetails_7 + 0x2E, Sprite_EndingDetails_7 + 0x26, Sprite_EndingDetails_7 + 0x1E, Sprite_EndingDetails_7 + 0x16, Sprite_EndingDetails_7 + 0xE, Sprite_EndingDetails_7 + 0x66\n"
"	.4byte Sprite_EndingDetails_7 + 0x5E, Sprite_EndingDetails_7 + 0x56, Sprite_EndingDetails_7 + 0x4E, Sprite_EndingDetails_7 + 0x46, Sprite_EndingDetails_7 + 0x3E\n"
"	.global data_08AC0EBC\n"
"data_08AC0EBC:\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, EndingDetails_InitFog, 0x00000003, EndingDetails_LoopFog\n"
"	.4byte 0x00000000, 0x00000000, 0x020027A0\n"
"	.global data_08AC0EE0\n"
"data_08AC0EE0:\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, sub_80BCCF0, 0x00000014, MapPaletteBrightnessFadeExists\n"
"	.4byte 0x00000002, sub_80BCD2C, 0x00000014, MapPaletteBrightnessFadeExists, 0x00000000, 0x00000000\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000002, TurnRecord_Init, 0x00000002, sub_80BCA74\n"
"	.4byte 0x00000002, GameIntroHealthSafetyWaitButton, 0x00040018, NewFadeIn, 0x00000014, FadeInExists\n"
"	.4byte 0x00000002, GameControlHandlePostNormalOrExtraChapter, 0x0000000B, 0x00000000, 0x00000003, sub_80BCD74\n"
"	.4byte 0x0010000E, 0x00000000, 0x00000003, sub_80BCD74, 0x0010000E, 0x00000000\n"
"	.4byte 0x00000003, sub_80BCD74, 0x0010000E, 0x00000000, 0x00000003, sub_80BCD74\n"
"	.4byte 0x0010000E, 0x00000000, 0x00000003, sub_80BCD74, 0x0020000E, 0x00000000\n"
"	.4byte 0x00000003, sub_80BCD74, 0x0064000C, 0x00000000, 0x0001000B, 0x00000000\n"
"	.4byte 0x00000003, sub_80BCD74, 0x0010000E, 0x00000000, 0x00000003, sub_80BCD74\n"
"	.4byte 0x0010000E, 0x00000000, 0x00000003, sub_80BCD74, 0x0020000E, 0x00000000\n"
"	.4byte 0x00000003, sub_80BCD74, 0x0064000C, 0x00000000, 0x0064000B, 0x00000000\n"
"	.4byte 0x0020000E, 0x00000000, 0x00000003, sub_80BCE68, 0x00000002, sub_80BCE94\n"
"	.4byte 0x00040018, NewFadeOut, 0x00000014, FadeOutExists, 0x001E000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00000002, TurnRecord_Init\n"
"	.4byte 0x00000002, TurnRecord_SetupText, 0x00000002, TurnRecord_SetupGfx, 0x00040018, NewFadeIn\n"
"	.4byte 0x00000014, FadeInExists, 0x00000003, TurnRecord_Loop_Main, 0x0078000E, 0x00000000\n"
"	.4byte 0x00040018, NewFadeOut, 0x00000014, FadeOutExists, 0x00000002, TurnRecord_End\n"
"	.4byte 0x003C000E, 0x00000000, 0x00000000, 0x00000000\n"
);
struct ProcCmd ProcScr_WorldMapFaceHolder[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    PROC_MARK(0x8), PROC_CALL(WorldMapFaceHolder_Init), PROC_BLOCK, PROC_END,
};
__asm__(
"	.section .data.frontier_df4_ending.gap1, \"aw\", %progbits\n"
"	.4byte 0x0008000F, 0x00000000, 0x00000004, nullsub_94, 0x00000002, WMFaceCtrl_Init\n"
"	.4byte 0x00000003, WMFaceCtrl_Loop, 0x00000000, 0x00000000, 0x00006000, 0x00000007\n"
"	.4byte 0x00007000, 0x00000008, 0x00003000, 0x0000000F, 0x00002000, 0x0000000E\n"
);
__asm__(
"	.section .data.frontier_df4_ending.gap2, \"aw\", %progbits\n"
"	.global frontier_df4_ending_002_AC16C8\n"
"frontier_df4_ending_002_AC16C8:\n"
"	.4byte 0x0000000e, 0x00000000, 0x00000003, WorldMap_MergeFace_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x0000000e, 0x00000000, 0x00000003, WorldMap_FadeMapSpritePalOut_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x0000000e, 0x00000000, 0x00000003, WorldMap_FadeMapSpritePalIn_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x0001000e, 0x00000000, 0x00000002, NewWorldMap, 0x0000000e, 0x00000000\n"
"	.4byte 0x00000008, ProcScr_WorldMapMain, 0x00000009, ProcScr_BmFadeIN, 0x0000000e, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00040004, 0x00040004, 0x00040004, 0x00040004\n"
"	.4byte 0x00040004, 0x00040004, 0x00040004, 0x00040004, 0x00040004, 0x00050005\n"
"	.4byte 0x00050005, 0x00050005, 0x00050005, 0x00050005, 0x00060006, 0x00060006\n"
"	.4byte 0x00060006, 0x00060006, 0x00060006, 0x00060004, 0x00060005, 0x00070007\n"
"	.4byte 0x00070007, 0x00070007, 0x00070007, 0x002f002f, 0x00040004, 0x00000001\n"
"	.4byte data_081F5BF4 + 0x38, 0x0008000f, 0x00000000, 0x00000002, GMScreenVSync_Init, 0x00000003\n"
"	.4byte GMScreenVSync_Loop, 0x00000000, 0x00000000, 0x00780000, 0x012c00f0, 0x021c01a4\n"
"	.4byte 0x00000294, 0x00003000, 0x00003000, 0x0000e000, 0x00001000, 0x0000c600\n"
"	.4byte 0x00009800, 0x00009600, 0x00007400, 0x00002000, 0x0000a000, 0x00003000\n"
"	.4byte 0x00003000, 0x0000e000, 0x00001000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte data_081F5BF4 + 0x48, 0x0008000f, 0x00000000, 0x00000004, MapScreen_OnDelete, 0x00000002\n"
"	.4byte MapScreen_Init, 0x00000002, GMapScreen_LoadTileGfx, 0x00000002, GMapScreen_ApplyTilePalettes, 0x00000002\n"
"	.4byte sub_80BF950, 0x00000003, GMapScreen_Loop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapGmapunit_0 + 0x8, 0x0008000f, 0x00000000, 0x00000004, GmapUnit_Destruct, 0x00000002\n"
"	.4byte GmapUnit_Init, 0x00000003, GmapUnit_Loop, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapGmapunit_0 + 0x8, 0x0008000f, 0x00000000, 0x00000004, GmapUnitContainer_Destruct, 0x00000002\n"
"	.4byte GmapUnitContainer_Init, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000001\n"
"	.4byte gWorldmapGmapunit_0 + 0x14, 0x0008000f, 0x00000000, 0x00000004, GmapUnitFade_Destruct, 0x0000000e\n"
"	.4byte 0x00000000, 0x00000002, sub_80C0094, 0x00000003, GmapUnitFade_Loop, 0x00000000\n"
"	.4byte 0x00000000\n"
);
struct ProcCmd ProcScr_GmNodeIconDisplay[] __attribute__((section(".data.frontier_df4_ending.gap2"))) = {
    PROC_NAME((void*)((u8*)data_081F611C + 0x3c)), PROC_MARK(0x8), PROC_SET_END_CB(GmapScreen2_Destruct), PROC_CALL(GmapScreen2_Init),
    PROC_REPEAT(GmapScreen2_Loop), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_ending.gap2, \"aw\", %progbits\n"
"	.4byte 0x00000001, gWorldmapCursor_0 + 0x18, 0x0008000f, 0x00000000, 0x00000004, nullsub_96\n"
"	.4byte 0x00000002, GmapCursor_Init, 0x00000003, GmapCursor_Loop, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, data_081F64C0, 0x0008000f, 0x00000000, 0x00000004, nullsub_97\n"
"	.4byte 0x0000000e, 0x00000000, 0x00000002, MapRoute_Init, 0x0000000b, 0x00000000\n"
"	.4byte 0x00000003, MapRoute_Loop, 0x0002000c, 0x00000000, 0x0001000b, 0x00000000\n"
"	.4byte 0x00000016, MapRoute_StartTransition, 0x00000016, MapRoute_PrepareTransition, 0x00000016, MapRoute_EnableBGSyncs\n"
"	.4byte 0x00000003, MapRoute_TransitionLoop, 0x00000016, MapRoute_TransitionEnd, 0x0000000c, 0x00000000\n"
"	.4byte 0x0002000b, 0x00000000, 0x00000000, 0x00000000\n"
);
u8 frontier_df4_ending_003_AC718C[] __attribute__((section(".data.frontier_df4_ending.gap3"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_003_AC718C.bin");
u8 frontier_df4_ending_004_ACC378[] __attribute__((section(".data.frontier_df4_ending.gap4"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_004_ACC378.4bpp.lz");
u8 frontier_df4_ending_005_ACEB54[] __attribute__((section(".data.frontier_df4_ending.gap5"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_005_ACEB54_0.4bpp.lz", "graphics/frontier_df4_ending/frontier_df4_ending_005_ACEB54_1.4bpp.lz");
u8 frontier_df4_ending_006_AD02D4[] __attribute__((section(".data.frontier_df4_ending.gap6"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_0.bin.lz", "graphics/frontier_df4_ending/frontier_df4_ending_006_AD02D4_1.bin.lz");
u8 frontier_df4_ending_007_AD0CFC[] __attribute__((section(".data.frontier_df4_ending.gap7"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_007_AD0CFC.bin");
u8 frontier_df4_ending_008_AD1444[] __attribute__((section(".data.frontier_df4_ending.gap8"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_008_AD1444.bin");
u8 frontier_df4_ending_009_B1D954[] __attribute__((section(".data.frontier_df4_ending.gap9"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_009_B1D954.bin");
u8 frontier_df4_ending_010_B1E5FC[] __attribute__((section(".data.frontier_df4_ending.gap10"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_010_B1E5FC.bin");
u8 frontier_df4_ending_011_B24D0C[] __attribute__((section(".data.frontier_df4_ending.gap11"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_011_B24D0C.4bpp.lz");
u8 frontier_df4_ending_012_B25A78[] __attribute__((section(".data.frontier_df4_ending.gap12"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_012_B25A78.bin");
u8 frontier_df4_ending_013_B26374[] __attribute__((section(".data.frontier_df4_ending.gap13"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_013_B26374.bin");
u8 frontier_df4_ending_014_B26A6C[] __attribute__((section(".data.frontier_df4_ending.gap14"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_014_B26A6C.bin");
struct ProcCmd frontier_df4_ending_015_B3B3D4[] SECTION(".data.frontier_df4_ending.gap15") = {
    PROC_SLEEP(0),
    PROC_CALL(CreditsBlendCG_Init),
    PROC_REPEAT(CreditsBlendCG_0),
    PROC_REPEAT(CreditsBlendCG_1),
    PROC_REPEAT(CreditsBlendCG_2),
    PROC_REPEAT(CreditsBlendCG_3),
    PROC_CALL(CreditsBlendCG_OnEnd),
    PROC_END,
};

struct ProcCmd ProcScr_EndingCredits_Init_B3B3D4_0[] SECTION(".data.frontier_df4_ending.gap15") = {
    PROC_SLEEP(0),
    PROC_CALL(EndingCredits_Init),
    PROC_REPEAT(EndingCredits_Loop_Main),
    PROC_GOTO(1),
    PROC_LABEL(0),
    PROC_CALL(EndingCredits_EndBlendCG),
    PROC_SLEEP(1),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(EndingCredits_0),
    PROC_SLEEP(1),
    PROC_CALL(EndingCredits_ShowCopyright),
    PROC_SLEEP(1),
    PROC_CALL_ARG(NewFadeIn, 0x10),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(1),
    PROC_REPEAT(EndingCredits_AwaitInputForEnd),
    PROC_CALL(StartSlowFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_SLEEP(0x1E),
    PROC_CALL(EndingCredits_OnEnd),
    PROC_SLEEP(1),
    PROC_END,
};

__asm__(
    ".section .data.frontier_df4_ending.gap15, \"aw\", %progbits\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x70008000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
);

struct ProcCmd ProcScr_Subtitle_LightFlareFx_Init_B3B3D4_1[] SECTION(".data.frontier_df4_ending.gap15") = {
    PROC_SLEEP(1),
    PROC_CALL(Subtitle_LightFlareFx_Init),
    PROC_REPEAT(Subtitle_LightFlareFx_Loop),
    PROC_SLEEP(1),
    PROC_CALL(Subtitle_LightFlareFx_End),
    PROC_END,
};

struct ProcCmd ProcScr_OpSubtitle_ReloadTitleSlide_B3B3D4_2[] SECTION(".data.frontier_df4_ending.gap15") = {
    PROC_SLEEP(0),
    PROC_SLEEP(0x24),
    PROC_CALL(OpSubtitle_ReloadTitleSlide),
    PROC_END,
};

__asm__(
    ".section .data.frontier_df4_ending.gap15, \"aw\", %progbits\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x70000000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
);

struct ProcCmd ProcScr_OpSubtitle_Init_B3B3D4_3[] SECTION(".data.frontier_df4_ending.gap15") = {
    PROC_SLEEP(0),
    PROC_CALL(OpSubtitle_Init),
    PROC_SLEEP(1),
    PROC_CALL_ARG(NewFadeIn, 2),
    PROC_WHILE(FadeInExists),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_LABEL(0),
    PROC_CALL(OpSubtitle_LoadSlideToBg0),
    PROC_REPEAT(OpSubtitle_FadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_REPEAT(OpSubtitle_FadeOutSlideAndAdvance_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_GOTO(0),
    PROC_LABEL(1),
    PROC_START_CHILD(ProcScr_Subtitle_LightFlareFx_Init_B3B3D4_1),
    PROC_START_CHILD(ProcScr_OpSubtitle_ReloadTitleSlide_B3B3D4_2),
    PROC_CALL(OpSubtitle_SetupScrollTextBgs),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_REPEAT(OpSubtitle_FadeInScrollTextPal_Loop),
    PROC_CALL(OpSubtitle_SetupTitleBgs),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_REPEAT(OpSubtitle_BlendFadeOutSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_CALL(OpSubtitle_ClearTileAndDisableTitleBg2),
    PROC_LABEL(2),
    PROC_CALL(OpSubtitle_LoadSlideToBg0AndBg1),
    PROC_REPEAT(OpSubtitle_BlendFadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_REPEAT(OpSubtitle_BlendFadeOutSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_GOTO(2),
    PROC_LABEL(4),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_CALL(OpSubtitle_BackupPalette),
    PROC_REPEAT(OpSubtitle_FadeOutWholePalette_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_CALL(OpSubtitle_LoadSlideToBg0),
    PROC_REPEAT(OpSubtitle_FadeInSlide_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_REPEAT(OpSubtitle_FadeOutSlideToTitle_Loop),
    PROC_REPEAT(OpSubtitle_AwaitTimer2a),
    PROC_LABEL(5),
    PROC_END_EACH(ProcScr_Subtitle_LightFlareFx_Init_B3B3D4_1),
    PROC_END_EACH(ProcScr_OpSubtitle_ReloadTitleSlide_B3B3D4_2),
    PROC_CALL(OpSubtitle_FadeOutBgm),
    PROC_CALL(StartSlowFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_SLEEP(0x1E),
    PROC_GOTO(7),
    PROC_LABEL(6),
    PROC_END_EACH(ProcScr_Subtitle_LightFlareFx_Init_B3B3D4_1),
    PROC_END_EACH(ProcScr_OpSubtitle_ReloadTitleSlide_B3B3D4_2),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_SLEEP(0xA),
    PROC_GOTO(7),
    PROC_LABEL(7),
    PROC_CALL(OpSubtitle_ResetBg1Position),
    PROC_SLEEP(1),
    PROC_END,
};

__asm__(
    ".section .data.frontier_df4_ending.gap15, \"aw\", %progbits\n"
    ".4byte 0x7bff398a\n"
    ".4byte 0x6fbd77de\n"
    ".4byte 0x5f5b677c\n"
    ".4byte 0x52f95b3a\n"
    ".4byte 0x42b74ad8\n"
    ".4byte 0x36553e76\n"
    ".4byte 0x152c25d0\n"
    ".4byte 0x000008a7\n"
);

/* #143: tail 48 B (JP 0x08B3EDD0..0x08B3EE00) typed out as gProcScr_DrawTitleSprites +
 * gProcScr_SkipTitleFxKeyListener in src/data/gProcScr_DrawTitleSprites_ref; keep only
 * the 413 B head here so its interior code pointers become R_ARM_ABS32 relocations. */
u8 frontier_df4_ending_016_B3EC33[] __attribute__((section(".data.frontier_df4_ending.gap16"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_016_B3EC33.bin", 0, 413);
__asm__(
    ".section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
    ".global frontier_df4_ending_017b_B3F18C\n"
    "frontier_df4_ending_017b_B3F18C:\n"
    ".byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00\n"
    ".byte 0x00, 0x80, 0x10, 0x00, 0x04, 0x00, 0x06, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40\n"
    ".byte 0x20, 0x80, 0x08, 0x00, 0x00, 0x40, 0x40, 0x80, 0x10, 0x00, 0x00, 0x40, 0x60, 0x80, 0x18, 0x00\n"
    ".byte 0x00, 0x40, 0x80, 0x80, 0x20, 0x00, 0x00, 0x00, 0xa0, 0x40, 0x28, 0x00, 0x02, 0x00, 0x00, 0x40\n"
    ".byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x20, 0x40, 0x08, 0x00\n"
);
__asm__(
    ".section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
    ".global data_08B3F1CE\n"
    "data_08B3F1CE:\n"
    ".byte 0x02, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x20, 0x80, 0x08, 0x00\n"
);
__asm__(
    ".section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
    ".global data_08B3F1DC\n"
    "data_08B3F1DC:\n"
    ".4byte 0x40000003\n"
    ".4byte 0x00008000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x00000008\n"
    ".4byte 0x00104040\n"
);
__asm__(
    ".section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
    ".global data_08B3F1F0\n"
    "data_08B3F1F0:\n"
    ".4byte 0x40000003\n"
    ".4byte 0x00008000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x80000008\n"
    ".4byte 0x00100040\n"
);
__asm__(
"	.section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
"	.global data_08B3F204\n"
"data_08B3F204:\n"
"	.4byte 0x40000003, 0x00008000, 0x40200000, 0x80000008, 0x000c0030, 0x40000003\n"
"	.4byte 0x0000c000, 0x40004020, 0x40200020, 0x00244020, 0x40000003, 0x0000d000\n"
"	.4byte 0x50004020, 0x40200024, 0x00205020, 0x00000002, 0x00008000, 0x80208000\n"
"	.4byte 0x00020010, 0x90008000, 0x00000010, 0x00009010, 0x40000002, 0x00008000\n"
"	.4byte 0x40004010, 0x00020008, 0x90004000, 0x40100000, 0x00085000, 0x00000001\n"
"	.4byte 0x00004000, 0x00000001, 0x00005000, 0x40000001, 0x00000000, 0x40000001\n"
"	.4byte 0x00001000\n"
);
struct ProcCmd ProcScr_OpAnimfxTerminator[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_SLEEP(0x0), PROC_REPEAT(OpAnimfxTerminatorMain), PROC_END,
};
struct ProcCmd ProcScr_OpAnimFadeIn[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_SLEEP(0x0), PROC_CALL(OpAnimAllBlack), PROC_REPEAT(OpAnimFadeInMain), PROC_END,
};
struct ProcCmd ProcScr_OpAnimBLDALPHA[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_CALL(sub_80CBD20), PROC_REPEAT(OpAnimBldAlphaUpdateBgPalette), PROC_REPEAT(OpAnimBldAlphaDelay), PROC_REPEAT(OpAnimBldAlphaMain),
    PROC_END,
};
struct ProcCmd ProcScr_Opanim_0[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_REPEAT(Proc08AA6D04Main), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
"	.4byte img_opanim1, img_opanim2, img_opanim3, img_opanim4, img_opanim5, img_opanim6\n"
"	.4byte img_opanim7, img_opanim8, img_opanim9, img_opanim10, img_opanim11, img_opanim12\n"
"	.4byte img_opanim13, img_opanim14, img_opanim15, img_opanim16, img_opanim17, img_opanim18\n"
"	.4byte img_opanim19, img_opanim20, img_opanim21, img_opanim22, img_opanim23, img_opanim24\n"
"	.4byte img_opanim25, img_opanim26, img_opanim27, img_opanim28, img_opanim29, img_opanim30\n"
"	.4byte img_opanim31, img_opanim32, img_opanim33, img_opanim34, img_opanim35, img_opanim36\n"
"	.4byte img_opanim37, img_opanim38, img_opanim39, img_opanim40, img_opanim41, img_opanim42\n"
"	.4byte img_opanim43, img_opanim44, img_opanim45, img_opanim46, img_opanim47, img_opanim48\n"
"	.4byte img_opanim49, img_opanim50, img_opanim51, img_opanim52, img_opanim53, img_opanim54\n"
"	.4byte img_opanim55, img_opanim56, img_opanim57, img_opanim58, img_opanim59, img_opanim60\n"
"	.4byte img_opanim61, img_opanim62, img_opanim63, img_opanim64, img_opanim65, img_opanim66\n"
"	.4byte img_opanim67, img_opanim68, img_opanim69, img_opanim70, img_opanim71, img_opanim72\n"
"	.4byte img_opanim73, img_opanim74, img_opanim75, img_opanim76, img_opanim77, img_opanim78\n"
"	.4byte img_opanim79, img_opanim80, img_opanim81, img_opanim82, img_opanim83, img_opanim84\n"
"	.4byte img_opanim85, img_opanim86, img_opanim87, img_opanim88, img_opanim89, img_opanim90\n"
"	.4byte img_opanim91, img_opanim92, img_opanim93, img_opanim94, img_opanim95, img_opanim96\n"
"	.4byte img_opanim97, img_opanim98, img_opanim99, img_opanim100, tsa_opanim1, tsa_opanim2\n"
"	.4byte tsa_opanim3, tsa_opanim4, tsa_opanim5, tsa_opanim6, tsa_opanim7, tsa_opanim8\n"
"	.4byte tsa_opanim9, tsa_opanim10, tsa_opanim11, tsa_opanim12, tsa_opanim13, tsa_opanim14\n"
"	.4byte tsa_opanim15, tsa_opanim16, tsa_opanim17, tsa_opanim18, tsa_opanim19, tsa_opanim20\n"
"	.4byte tsa_opanim21, tsa_opanim22, tsa_opanim23, tsa_opanim24, tsa_opanim25, tsa_opanim26\n"
"	.4byte tsa_opanim27, tsa_opanim28, tsa_opanim29, tsa_opanim30, tsa_opanim31, tsa_opanim32\n"
"	.4byte tsa_opanim33, tsa_opanim34, tsa_opanim35, tsa_opanim36, tsa_opanim37, tsa_opanim38\n"
"	.4byte tsa_opanim39, tsa_opanim40, tsa_opanim41, tsa_opanim42, tsa_opanim43, tsa_opanim44\n"
"	.4byte tsa_opanim45, tsa_opanim46, tsa_opanim47, tsa_opanim48, tsa_opanim49, tsa_opanim50\n"
"	.4byte tsa_opanim51, tsa_opanim52, tsa_opanim53, tsa_opanim54, tsa_opanim55, tsa_opanim56\n"
"	.4byte tsa_opanim57, tsa_opanim58, tsa_opanim59, tsa_opanim60, tsa_opanim61, tsa_opanim62\n"
"	.4byte tsa_opanim63, tsa_opanim64, tsa_opanim65, tsa_opanim66, tsa_opanim67, tsa_opanim68\n"
"	.4byte tsa_opanim69, tsa_opanim70, tsa_opanim71, tsa_opanim72, tsa_opanim73, tsa_opanim74\n"
"	.4byte tsa_opanim75, tsa_opanim76, tsa_opanim77, tsa_opanim78, tsa_opanim79, tsa_opanim80\n"
"	.4byte tsa_opanim81, tsa_opanim82, tsa_opanim83, tsa_opanim84, tsa_opanim85, tsa_opanim86\n"
"	.4byte tsa_opanim87, tsa_opanim88, tsa_opanim89, tsa_opanim90, tsa_opanim91, tsa_opanim92\n"
"	.4byte tsa_opanim93, tsa_opanim94, tsa_opanim95, tsa_opanim96, tsa_opanim97, tsa_opanim98\n"
"	.4byte tsa_opanim99, tsa_opanim100\n"
);
struct ProcCmd ProcScr_OpAnimMergeBG[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_CALL(OpAnimMergeBGProcInit), PROC_REPEAT(OpAnimMergeBGProcUpdateBgPalette), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_ending.gap17, \"aw\", %progbits\n"
"	.4byte 0x00000003, OpAnimScrollBg3Loop, 0x00000000, 0x00000000, 0x00000004, OpAnimRestoreColorEffectsOnEnd\n"
"	.4byte 0x00000002, OpAnimDarkenBg2Init, 0x00000003, OpAnimDarkenBg2In, 0x00000000, 0x00000000\n"
"	.4byte 0x00000004, OpAnimRestoreColorEffectsOnEnd2, 0x00000002, OpAnimDarkenBg2OutInit, 0x00000003, OpAnimDarkenBg2Out\n"
"	.4byte 0x00000000, 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_ending.gap18, \"aw\", %progbits\n"
    ".global frontier_df4_ending_018_B3F7BC\n"
    "frontier_df4_ending_018_B3F7BC:\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimInit\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SetupOpAnimWorldMapfx\n"
    ".4byte 0x00000005\n"
    ".4byte ProcScr_OpAnimBLDALPHA\n"
    ".4byte 0x00000014\n"
    ".4byte OpAnimBldAlphaExists\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimUpdateScreen1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimWorldMapfxMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupCharacterScene\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimPreparefxEphraim\n"
    ".4byte 0x00000002\n"
    ".4byte NewProc08AA6D04\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEphraimfxFlyIn\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEphraimSetupSplitWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnim1AdvanceSplitLine\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEphraimMergeShadow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEphraimDisplayName\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikaExit\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimPreparefxEirika\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikafxFlyIn\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikaSetupSplitWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikaAdvanceSplitLine\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikaMergeShadow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEirikaDisplayName\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimEphraimExit\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFadeToBlack\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000005\n"
    ".4byte gUnkData_98\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimJoshuaScrollIn\n"
    ".4byte 0x00000005\n"
    ".4byte ProcScr_OpAnimMergeBG + 0x18\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupJoshuaScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInLArachel\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupLArachelScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInSeth\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupSethScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInMyrrh\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupMyrrhScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInSaleh\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupSalehScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInTethys\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollInBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollInMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupTethysScroll\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn1\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyIn2\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterFlyOut\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimCharacterScrollOutBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimCharacterScrollOutMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000005\n"
    ".4byte gUnkData_99\n"
    ".4byte 0x00000009\n"
    ".4byte ProcScr_OpAnimMergeBG + 0x18\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimScrollInBlank\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimGatherUnitsBegin\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimGatherUnitsMain\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimGatherUnitsEnd\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageBegin\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg1\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageEwanGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg2\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageGarciaGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg3\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageVanessaGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg4\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageGilliamGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg5\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageColmGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg6\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageKnollGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg7\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageLuteGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg8\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageDuesselGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg9\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageKyleGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg10\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageValterGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg11\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageLyonGroup\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimSetupWalkingObjWindow\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimTitleFlyInSeg12\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimApplyScrollAndPalettes\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFaceMontageBlendOut\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimFadeToWhite\n"
    ".4byte 0x0020000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0063000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimEnd\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte GameIntroPrepareNintendofx\n"
    ".4byte 0x00000003\n"
    ".4byte GameIntroNintendoFadeIN\n"
    ".4byte 0x00000003\n"
    ".4byte GameEarlyStartDelay\n"
    ".4byte 0x00000003\n"
    ".4byte GameIntroNintendoFadeOUT\n"
    ".4byte 0x00000003\n"
    ".4byte GameEarlyStartDelay\n"
    ".4byte 0x00000003\n"
    ".4byte GameIntroIntelligentSystemsFadeIN\n"
    ".4byte 0x00000003\n"
    ".4byte GameEarlyStartDelay\n"
    ".4byte 0x00000003\n"
    ".4byte GameIntroIntelligentSystemsFadeOUT\n"
    ".4byte 0x00000003\n"
    ".4byte GameEarlyStartDelay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte OpAnimHS_InitFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte OpAnimHS_FadeToBlackLoop\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_ending_019_B8B998[] __attribute__((section(".data.frontier_df4_ending.gap19"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_019_B8B998.4bpp.lz");
u8 frontier_df4_ending_020_BAA2E0[] __attribute__((section(".data.frontier_df4_ending.gap20"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_020_BAA2E0.4bpp.lz");
__asm__(
    ".section .data.frontier_df4_ending.gap21, \"aw\", %progbits\n"
    ".global frontier_df4_ending_021_BAB754\n"
    "frontier_df4_ending_021_BAB754:\n"
    ".4byte 0x00011e05\n"
    ".4byte 0x28050008\n"
    ".4byte 0x50050003\n"
    ".4byte 0x00080001\n"
    ".4byte 0x00032805\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F6D00\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte Make6C_PromotionMenuSelect\n"
    ".4byte 0x0006000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ClassChgSel_InitDescAndBg\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000003\n"
    ".4byte LoadBattleSpritesForBranchScreen\n"
    ".4byte 0x0003000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ClassChgSel_RoutePreEndByType\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ClassChgSel_OnEndCleanupBm\n"
    ".4byte 0x00000002\n"
    ".4byte ClassChgSel_RouteOnEndByType\n"
    ".4byte 0x00000004\n"
    ".4byte sub_80D2308\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte PrepClassChgOnCancel\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F6D00 + 0xc\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F6D00 + 0x1c\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_InitScreen\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_Talk1\n"
    ".4byte 0x00000014\n"
    ".4byte CgTextExists\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_Talk2\n"
    ".4byte 0x00000014\n"
    ".4byte CgTextExists\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_Talk3\n"
    ".4byte 0x00000014\n"
    ".4byte CgTextExists\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_Talk4\n"
    ".4byte 0x00000014\n"
    ".4byte CgTextExists\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_Talk5\n"
    ".4byte 0x00000014\n"
    ".4byte CgTextExists\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte RemovePromoTraineeEventFace\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PromoTrainee_OnEnd\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte data_081F6D5C + 0x18\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte MenuAlwaysEnabled\n"
    ".4byte 0x00000000\n"
    ".4byte PromoSubConfirmMenuOnSelect\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte data_081F6D5C + 0xc\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000100\n"
    ".4byte MenuAlwaysEnabled\n"
    ".4byte 0x00000000\n"
    ".4byte PromoSubConfirmMenuOnSelect\n"
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
    ".4byte 0x00070408\n"
    ".4byte 0x00000001\n"
    ".4byte ProcScr_PromoSelectEvent + 0xb8\n"
    ".4byte PromoSubConfirm_OnInit\n"
    ".4byte PromoSubConfirm_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte ClassChgMenuSel_OnBPress\n"
    ".4byte 0x00000000\n"
    ".4byte MenuStdHelpBox\n"
    ".4byte data_081F6D7C + 0x1c\n"
    ".4byte 0x065e0000\n"
    ".4byte 0x00000000\n"
    ".4byte MenuAlwaysEnabled\n"
    ".4byte ClassChgMenuItem_OnTextDraw\n"
    ".4byte ClassChgMenuItem_OnSelect\n"
    ".4byte 0x00000000\n"
    ".4byte ClassChgMenuItem_OnChange\n"
    ".4byte 0x00000000\n"
    ".4byte data_081F6D7C + 0x10\n"
    ".4byte 0x065e0000\n"
    ".4byte 0x00000100\n"
    ".4byte MenuAlwaysEnabled\n"
    ".4byte ClassChgMenuItem_OnTextDraw\n"
    ".4byte ClassChgMenuItem_OnSelect\n"
    ".4byte 0x00000000\n"
    ".4byte ClassChgMenuItem_OnChange\n"
    ".4byte 0x00000000\n"
    ".4byte data_081F6D7C + 0x4\n"
    ".4byte 0x065e0000\n"
    ".4byte 0x00000200\n"
    ".4byte ClassChgMenuItem_3rdUsability\n"
    ".4byte ClassChgMenuItem_OnTextDraw\n"
    ".4byte ClassChgMenuItem_OnSelect\n"
    ".4byte 0x00000000\n"
    ".4byte ClassChgMenuItem_OnChange\n"
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
    ".4byte 0x00080210\n"
    ".4byte 0x00000000\n"
    ".4byte Menu_PromoSubConfirm + 0x24\n"
    ".4byte ClassChgMenuSelOnInit\n"
    ".4byte ClassChgMenuSelOnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte ClassChgMenuSelOnPressB\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
"	.section .data.frontier_df4_ending.gap21, \"aw\", %progbits\n"
"	.global data_08BABA58\n"
"data_08BABA58:\n"
);
struct ProcCmd ProcScr_ClassChgMenuSel[] __attribute__((section(".data.frontier_df4_ending.gap21"))) = {
    PROC_SLEEP(0x6), PROC_NAME((void*)((u8*)data_081F6D7C + 0x28)), PROC_CALL(ClassChgMenuExec), PROC_REPEAT((void*)((u8*)gap_000D2AD0 + 0x1)),
    PROC_SLEEP(0x0), PROC_LABEL(0x0), PROC_GOTO(0x2), PROC_LABEL(0x1),
    PROC_CALL((void*)((u8*)gap_000D2AD0 + 0x5)), PROC_LABEL(0x2), PROC_END,
};
__asm__(
"	.section .data.frontier_df4_ending.gap21, \"aw\", %progbits\n"
"	.4byte 0x000c0101\n"
);
