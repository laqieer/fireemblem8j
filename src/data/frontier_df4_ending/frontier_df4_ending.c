#include "global.h"
#include "proc.h"

extern const u8 CgTextExists[];
extern const u8 CharacterEnding_0[];
extern const u8 CharacterEnding_End[];
extern const u8 CharacterEnding_Init[];
extern const u8 CharacterEnding_StartBattleDisplay[];
extern const u8 CharacterEnding_StartBattleDisplayText[];
extern const u8 ClassChgMenuItem_3rdUsability[];
extern const u8 ClassChgMenuItem_OnChange[];
extern const u8 ClassChgMenuItem_OnSelect[];
extern const u8 ClassChgMenuItem_OnTextDraw[];
extern const u8 ClassChgMenuSelOnEnd[];
extern const u8 ClassChgMenuSelOnInit[];
extern const u8 ClassChgMenuSelOnPressB[];
extern const u8 ClassChgMenuSel_OnBPress[];
extern const u8 ClassChgSel_InitDescAndBg[];
extern const u8 ClassChgSel_OnEndCleanupBm[];
extern const u8 ClassChgSel_RouteOnEndByType[];
extern const u8 ClassChgSel_RoutePreEndByType[];
extern const u8 EndingBattleInitText[];
extern const u8 EndingBattleText_Loop[];
extern const u8 EndingDetails_InitFog[];
extern const u8 EndingDetails_LoopFog[];
extern const u8 Fin_End[];
extern const u8 GMScreenVSync_Init[];
extern const u8 GMScreenVSync_Loop[];
extern const u8 GMapScreen_ApplyTilePalettes[];
extern const u8 GMapScreen_LoadTileGfx[];
extern const u8 GMapScreen_Loop[];
extern const u8 GameControlHandlePostNormalOrExtraChapter[];
extern const u8 GameEarlyStartDelay[];
extern const u8 GameIntroHealthSafetyWaitButton[];
extern const u8 GameIntroIntelligentSystemsFadeIN[];
extern const u8 GameIntroIntelligentSystemsFadeOUT[];
extern const u8 GameIntroNintendoFadeIN[];
extern const u8 GameIntroNintendoFadeOUT[];
extern const u8 GameIntroPrepareNintendofx[];
extern const u8 GmapCursor_Init[];
extern const u8 GmapCursor_Loop[];
extern const u8 GmapUnitContainer_Destruct[];
extern const u8 GmapUnitContainer_Init[];
extern const u8 GmapUnitFade_Destruct[];
extern const u8 GmapUnitFade_Loop[];
extern const u8 GmapUnit_Destruct[];
extern const u8 GmapUnit_Init[];
extern const u8 GmapUnit_Loop[];
extern const u8 LoadBattleSpritesForBranchScreen[];
extern const u8 LoadNextCharacterEnding[];
extern const u8 Make6C_PromotionMenuSelect[];
extern const u8 MapPaletteBrightnessFadeExists[];
extern const u8 MapRoute_EnableBGSyncs[];
extern const u8 MapRoute_Init[];
extern const u8 MapRoute_Loop[];
extern const u8 MapRoute_PrepareTransition[];
extern const u8 MapRoute_StartTransition[];
extern const u8 MapRoute_TransitionEnd[];
extern const u8 MapRoute_TransitionLoop[];
extern const u8 MapScreen_Init[];
extern const u8 MapScreen_OnDelete[];
extern const u8 MenuAlwaysEnabled[];
extern const u8 MenuStdHelpBox[];
extern const u8 Menu_PromoSubConfirm[];
extern const u8 NewProc08AA6D04[];
extern const u8 NewWorldMap[];
extern const u8 OpAnim1AdvanceSplitLine[];
extern const u8 OpAnimApplyScrollAndPalettes[];
extern const u8 OpAnimBldAlphaExists[];
extern const u8 OpAnimCharacterFlyIn1[];
extern const u8 OpAnimCharacterFlyIn2[];
extern const u8 OpAnimCharacterFlyOut[];
extern const u8 OpAnimCharacterScrollInBegin[];
extern const u8 OpAnimCharacterScrollInMain[];
extern const u8 OpAnimCharacterScrollOutBegin[];
extern const u8 OpAnimCharacterScrollOutMain[];
extern const u8 OpAnimDarkenBg2In[];
extern const u8 OpAnimDarkenBg2Init[];
extern const u8 OpAnimDarkenBg2Out[];
extern const u8 OpAnimDarkenBg2OutInit[];
extern const u8 OpAnimEirikaAdvanceSplitLine[];
extern const u8 OpAnimEirikaDisplayName[];
extern const u8 OpAnimEirikaExit[];
extern const u8 OpAnimEirikaMergeShadow[];
extern const u8 OpAnimEirikaSetupSplitWindow[];
extern const u8 OpAnimEirikafxFlyIn[];
extern const u8 OpAnimEnd[];
extern const u8 OpAnimEphraimDisplayName[];
extern const u8 OpAnimEphraimExit[];
extern const u8 OpAnimEphraimMergeShadow[];
extern const u8 OpAnimEphraimSetupSplitWindow[];
extern const u8 OpAnimEphraimfxFlyIn[];
extern const u8 OpAnimFaceMontageBegin[];
extern const u8 OpAnimFaceMontageBlendOut[];
extern const u8 OpAnimFaceMontageColmGroup[];
extern const u8 OpAnimFaceMontageDuesselGroup[];
extern const u8 OpAnimFaceMontageEwanGroup[];
extern const u8 OpAnimFaceMontageGarciaGroup[];
extern const u8 OpAnimFaceMontageGilliamGroup[];
extern const u8 OpAnimFaceMontageKnollGroup[];
extern const u8 OpAnimFaceMontageKyleGroup[];
extern const u8 OpAnimFaceMontageLuteGroup[];
extern const u8 OpAnimFaceMontageLyonGroup[];
extern const u8 OpAnimFaceMontageValterGroup[];
extern const u8 OpAnimFaceMontageVanessaGroup[];
extern const u8 OpAnimFadeToBlack[];
extern const u8 OpAnimFadeToWhite[];
extern const u8 OpAnimGatherUnitsBegin[];
extern const u8 OpAnimGatherUnitsEnd[];
extern const u8 OpAnimGatherUnitsMain[];
extern const u8 OpAnimHS_FadeToBlackLoop[];
extern const u8 OpAnimHS_InitFadeToBlack[];
extern const u8 OpAnimInit[];
extern const u8 OpAnimJoshuaScrollIn[];
extern const u8 OpAnimPreparefxEirika[];
extern const u8 OpAnimPreparefxEphraim[];
extern const u8 OpAnimRestoreColorEffectsOnEnd[];
extern const u8 OpAnimRestoreColorEffectsOnEnd2[];
extern const u8 OpAnimScrollBg3Loop[];
extern const u8 OpAnimScrollInBlank[];
extern const u8 OpAnimScrollInLArachel[];
extern const u8 OpAnimScrollInMyrrh[];
extern const u8 OpAnimScrollInSaleh[];
extern const u8 OpAnimScrollInSeth[];
extern const u8 OpAnimScrollInTethys[];
extern const u8 OpAnimSetupCharacterScene[];
extern const u8 OpAnimSetupJoshuaScroll[];
extern const u8 OpAnimSetupLArachelScroll[];
extern const u8 OpAnimSetupMyrrhScroll[];
extern const u8 OpAnimSetupSalehScroll[];
extern const u8 OpAnimSetupSethScroll[];
extern const u8 OpAnimSetupTethysScroll[];
extern const u8 OpAnimSetupWalkingObjWindow[];
extern const u8 OpAnimTitleFlyInSeg1[];
extern const u8 OpAnimTitleFlyInSeg10[];
extern const u8 OpAnimTitleFlyInSeg11[];
extern const u8 OpAnimTitleFlyInSeg12[];
extern const u8 OpAnimTitleFlyInSeg2[];
extern const u8 OpAnimTitleFlyInSeg3[];
extern const u8 OpAnimTitleFlyInSeg4[];
extern const u8 OpAnimTitleFlyInSeg5[];
extern const u8 OpAnimTitleFlyInSeg6[];
extern const u8 OpAnimTitleFlyInSeg7[];
extern const u8 OpAnimTitleFlyInSeg8[];
extern const u8 OpAnimTitleFlyInSeg9[];
extern const u8 OpAnimUpdateScreen1[];
extern const u8 OpAnimWorldMapfxMain[];
extern const u8 PairedEndingBattleDisp_InitBlend[];
extern const u8 PairedEndingBattleDisp_Loop_Blend[];
extern const u8 PairedEndingBattleDisp_Loop_SlideIn[];
extern const u8 PrepClassChgOnCancel[];
extern const u8 ProcScr_BmFadeIN[];
extern const u8 ProcScr_PromoSelectEvent[];
extern const u8 ProcScr_WorldMapMain[];
extern const u8 PromoSubConfirmMenuOnSelect[];
extern const u8 PromoSubConfirm_OnEnd[];
extern const u8 PromoSubConfirm_OnInit[];
extern const u8 PromoTrainee_InitScreen[];
extern const u8 PromoTrainee_OnEnd[];
extern const u8 PromoTrainee_Talk1[];
extern const u8 PromoTrainee_Talk2[];
extern const u8 PromoTrainee_Talk3[];
extern const u8 PromoTrainee_Talk4[];
extern const u8 PromoTrainee_Talk5[];
extern const u8 RemovePromoTraineeEventFace[];
extern const u8 SetupOpAnimWorldMapfx[];
extern const u8 SoloEndingBattleDisp_Init[];
extern const u8 SoloEndingBattleDisp_Loop[];
extern const u8 Sprite_EndingDetails_7[];
extern const u8 StartMidFadeFromBlack[];
extern const u8 StartMidFadeToBlack[];
extern const u8 TurnRecord_End[];
extern const u8 TurnRecord_Init[];
extern const u8 TurnRecord_Loop_Main[];
extern const u8 TurnRecord_SetupGfx[];
extern const u8 TurnRecord_SetupText[];
extern const u8 WMFaceCtrl_Init[];
extern const u8 WMFaceCtrl_Loop[];
extern const u8 WorldMap_FadeMapSpritePalIn_Loop[];
extern const u8 WorldMap_FadeMapSpritePalOut_Loop[];
extern const u8 WorldMap_MergeFace_Loop[];
extern const u8 data_081F5BF4[];
extern const u8 data_081F64C0[];
extern const u8 data_081F6D00[];
extern const u8 data_081F6D5C[];
extern const u8 gUnkData_98[];
extern const u8 gUnkData_99[];
extern const u8 gWorldmapCursor_0[];
extern const u8 gWorldmapGmapunit_0[];
extern const u8 gap_000BBA3C[];
extern const u8 img_opanim1[];
extern const u8 img_opanim10[];
extern const u8 img_opanim100[];
extern const u8 img_opanim11[];
extern const u8 img_opanim12[];
extern const u8 img_opanim13[];
extern const u8 img_opanim14[];
extern const u8 img_opanim15[];
extern const u8 img_opanim16[];
extern const u8 img_opanim17[];
extern const u8 img_opanim18[];
extern const u8 img_opanim19[];
extern const u8 img_opanim2[];
extern const u8 img_opanim20[];
extern const u8 img_opanim21[];
extern const u8 img_opanim22[];
extern const u8 img_opanim23[];
extern const u8 img_opanim24[];
extern const u8 img_opanim25[];
extern const u8 img_opanim26[];
extern const u8 img_opanim27[];
extern const u8 img_opanim28[];
extern const u8 img_opanim29[];
extern const u8 img_opanim3[];
extern const u8 img_opanim30[];
extern const u8 img_opanim31[];
extern const u8 img_opanim32[];
extern const u8 img_opanim33[];
extern const u8 img_opanim34[];
extern const u8 img_opanim35[];
extern const u8 img_opanim36[];
extern const u8 img_opanim37[];
extern const u8 img_opanim38[];
extern const u8 img_opanim39[];
extern const u8 img_opanim4[];
extern const u8 img_opanim40[];
extern const u8 img_opanim41[];
extern const u8 img_opanim42[];
extern const u8 img_opanim43[];
extern const u8 img_opanim44[];
extern const u8 img_opanim45[];
extern const u8 img_opanim46[];
extern const u8 img_opanim47[];
extern const u8 img_opanim48[];
extern const u8 img_opanim49[];
extern const u8 img_opanim5[];
extern const u8 img_opanim50[];
extern const u8 img_opanim51[];
extern const u8 img_opanim52[];
extern const u8 img_opanim53[];
extern const u8 img_opanim54[];
extern const u8 img_opanim55[];
extern const u8 img_opanim56[];
extern const u8 img_opanim57[];
extern const u8 img_opanim58[];
extern const u8 img_opanim59[];
extern const u8 img_opanim6[];
extern const u8 img_opanim60[];
extern const u8 img_opanim61[];
extern const u8 img_opanim62[];
extern const u8 img_opanim63[];
extern const u8 img_opanim64[];
extern const u8 img_opanim65[];
extern const u8 img_opanim66[];
extern const u8 img_opanim67[];
extern const u8 img_opanim68[];
extern const u8 img_opanim69[];
extern const u8 img_opanim7[];
extern const u8 img_opanim70[];
extern const u8 img_opanim71[];
extern const u8 img_opanim72[];
extern const u8 img_opanim73[];
extern const u8 img_opanim74[];
extern const u8 img_opanim75[];
extern const u8 img_opanim76[];
extern const u8 img_opanim77[];
extern const u8 img_opanim78[];
extern const u8 img_opanim79[];
extern const u8 img_opanim8[];
extern const u8 img_opanim80[];
extern const u8 img_opanim81[];
extern const u8 img_opanim82[];
extern const u8 img_opanim83[];
extern const u8 img_opanim84[];
extern const u8 img_opanim85[];
extern const u8 img_opanim86[];
extern const u8 img_opanim87[];
extern const u8 img_opanim88[];
extern const u8 img_opanim89[];
extern const u8 img_opanim9[];
extern const u8 img_opanim90[];
extern const u8 img_opanim91[];
extern const u8 img_opanim92[];
extern const u8 img_opanim93[];
extern const u8 img_opanim94[];
extern const u8 img_opanim95[];
extern const u8 img_opanim96[];
extern const u8 img_opanim97[];
extern const u8 img_opanim98[];
extern const u8 img_opanim99[];
extern const u8 nullsub_94[];
extern const u8 nullsub_96[];
extern const u8 nullsub_97[];
extern const u8 sub_80BCA74[];
extern const u8 sub_80BCCF0[];
extern const u8 sub_80BCD2C[];
extern const u8 sub_80BCD74[];
extern const u8 sub_80BCE68[];
extern const u8 sub_80BCE94[];
extern const u8 sub_80BF950[];
extern const u8 sub_80C0094[];
extern const u8 sub_80D2308[];
extern const u8 tsa_opanim1[];
extern const u8 tsa_opanim10[];
extern const u8 tsa_opanim100[];
extern const u8 tsa_opanim11[];
extern const u8 tsa_opanim12[];
extern const u8 tsa_opanim13[];
extern const u8 tsa_opanim14[];
extern const u8 tsa_opanim15[];
extern const u8 tsa_opanim16[];
extern const u8 tsa_opanim17[];
extern const u8 tsa_opanim18[];
extern const u8 tsa_opanim19[];
extern const u8 tsa_opanim2[];
extern const u8 tsa_opanim20[];
extern const u8 tsa_opanim21[];
extern const u8 tsa_opanim22[];
extern const u8 tsa_opanim23[];
extern const u8 tsa_opanim24[];
extern const u8 tsa_opanim25[];
extern const u8 tsa_opanim26[];
extern const u8 tsa_opanim27[];
extern const u8 tsa_opanim28[];
extern const u8 tsa_opanim29[];
extern const u8 tsa_opanim3[];
extern const u8 tsa_opanim30[];
extern const u8 tsa_opanim31[];
extern const u8 tsa_opanim32[];
extern const u8 tsa_opanim33[];
extern const u8 tsa_opanim34[];
extern const u8 tsa_opanim35[];
extern const u8 tsa_opanim36[];
extern const u8 tsa_opanim37[];
extern const u8 tsa_opanim38[];
extern const u8 tsa_opanim39[];
extern const u8 tsa_opanim4[];
extern const u8 tsa_opanim40[];
extern const u8 tsa_opanim41[];
extern const u8 tsa_opanim42[];
extern const u8 tsa_opanim43[];
extern const u8 tsa_opanim44[];
extern const u8 tsa_opanim45[];
extern const u8 tsa_opanim46[];
extern const u8 tsa_opanim47[];
extern const u8 tsa_opanim48[];
extern const u8 tsa_opanim49[];
extern const u8 tsa_opanim5[];
extern const u8 tsa_opanim50[];
extern const u8 tsa_opanim51[];
extern const u8 tsa_opanim52[];
extern const u8 tsa_opanim53[];
extern const u8 tsa_opanim54[];
extern const u8 tsa_opanim55[];
extern const u8 tsa_opanim56[];
extern const u8 tsa_opanim57[];
extern const u8 tsa_opanim58[];
extern const u8 tsa_opanim59[];
extern const u8 tsa_opanim6[];
extern const u8 tsa_opanim60[];
extern const u8 tsa_opanim61[];
extern const u8 tsa_opanim62[];
extern const u8 tsa_opanim63[];
extern const u8 tsa_opanim64[];
extern const u8 tsa_opanim65[];
extern const u8 tsa_opanim66[];
extern const u8 tsa_opanim67[];
extern const u8 tsa_opanim68[];
extern const u8 tsa_opanim69[];
extern const u8 tsa_opanim7[];
extern const u8 tsa_opanim70[];
extern const u8 tsa_opanim71[];
extern const u8 tsa_opanim72[];
extern const u8 tsa_opanim73[];
extern const u8 tsa_opanim74[];
extern const u8 tsa_opanim75[];
extern const u8 tsa_opanim76[];
extern const u8 tsa_opanim77[];
extern const u8 tsa_opanim78[];
extern const u8 tsa_opanim79[];
extern const u8 tsa_opanim8[];
extern const u8 tsa_opanim80[];
extern const u8 tsa_opanim81[];
extern const u8 tsa_opanim82[];
extern const u8 tsa_opanim83[];
extern const u8 tsa_opanim84[];
extern const u8 tsa_opanim85[];
extern const u8 tsa_opanim86[];
extern const u8 tsa_opanim87[];
extern const u8 tsa_opanim88[];
extern const u8 tsa_opanim89[];
extern const u8 tsa_opanim9[];
extern const u8 tsa_opanim90[];
extern const u8 tsa_opanim91[];
extern const u8 tsa_opanim92[];
extern const u8 tsa_opanim93[];
extern const u8 tsa_opanim94[];
extern const u8 tsa_opanim95[];
extern const u8 tsa_opanim96[];
extern const u8 tsa_opanim97[];
extern const u8 tsa_opanim98[];
extern const u8 tsa_opanim99[];

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
/* #143: interior code pointers of the carved gProcScr_CharacterEndings below */
extern void Fin_Init();
extern void Fin_Loop_KeyListener();
extern void Fin_InitBlend();
extern void Fin_Loop_Blend();
extern void StartFinScreen();
extern void _FadeBgmOut();
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
u32 frontier_df4_ending_001_AC0B90[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    0x020027A0, 0x0000000E, 0x00000000, 0x00000002, (u32)&CharacterEnding_Init, 0x00000002,
    (u32)&LoadNextCharacterEnding, 0x0000000B, 0x00000000, 0x00000002, (u32)&CharacterEnding_0, 0x00040018,
    (u32)&NewFadeIn, 0x00000014, (u32)&FadeInExists, 0x00000002, (u32)&CharacterEnding_StartBattleDisplay, 0x001E000E,
    0x00000000, 0x00000002, (u32)&CharacterEnding_StartBattleDisplayText, 0x0072000E, 0x00000000, 0x0063000B,
    0x00000000, 0x00000002, (u32)&LoadNextCharacterEnding, 0x00040018, (u32)&NewFadeOut, 0x00000014,
    (u32)&FadeOutExists, 0x0000000C, 0x00000000, 0x0064000B, 0x00000000, 0x00070018,
    (u32)&_FadeBgmOut, 0x00020018, (u32)&NewFadeOut, 0x00000014, (u32)&FadeOutExists, 0x00000002,
    (u32)&CharacterEnding_End, 0x00000000, 0x00000000, 0x08060300, 0x100E0C0A, 0x16151412,
    0x1A191817, 0x1E1D1C1B, 0x0000000E, 0x00000000, 0x00000002, (u32)&SoloEndingBattleDisp_Init,
    0x00000003, (u32)&SoloEndingBattleDisp_Loop, 0x00000000, 0x00000000, 0x0000000E, 0x00000000,
    0x00000002, (u32)&gap_000BBA3C + 0x1, 0x00000003, (u32)&PairedEndingBattleDisp_Loop_SlideIn, 0x0010000E, 0x00000000,
    0x00000002, (u32)&PairedEndingBattleDisp_InitBlend, 0x00000003, (u32)&PairedEndingBattleDisp_Loop_Blend, 0x00000000, 0x00000000,
    0x0000000E, 0x00000000, 0x00000002, (u32)&EndingBattleInitText, 0x00000003, (u32)&EndingBattleText_Loop,
    0x00000000, 0x00000000,
};

/* #143 shiftability / decomp-completeness: gProcScr_CharacterEndings (JP
 * 0x08AC0CD0, the script StartCharacterEndings starts via Proc_StartBlocking)
 * carved in-place out of the fully-symbolized .gap1 .4byte blob into a typed
 * struct ProcCmd[] -- byte-neutral, every word is the same immediate/reloc, just
 * re-expressed as a PROC_* macro (the same in-place mechanism #148 used for
 * ProcScr_WorldMapFaceHolder above). Its 14 interior code pointers were already
 * R_ARM_ABS32 relocations (Fin_* / fade utilities) so they shift; the remaining
 * #143 work was to make gProcScr_CharacterEndings ITSELF a real relocatable
 * object instead of the opaque baseline `.set 0x08AC0CD0` alias (dropped in
 * layout/baseline_syms_drop.d/gProcScr_CharacterEndings.tsv).
 *
 * Region-different from fe8u (whose nearest structural analog is
 * gProcScr_FinScreen): the JP tail fades out and hands off to StartFinScreen
 * where US does PROC_LABEL(100); PROC_CALL(Fin_End); PROC_END -- so the label at
 * +144 is 2 (not 100) and the PROC_GOTO(100) at +80 is a dangling jump present
 * verbatim in the JP data. */
struct ProcCmd gProcScr_CharacterEndings[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    PROC_SLEEP(30),                     /* AC0CD0 */
    PROC_CALL(Fin_Init),                /* AC0CD8  -> 080BBF5D */
    PROC_CALL_ARG(NewFadeIn, 4),        /* AC0CE0  -> 080B2D4D */
    PROC_WHILE(FadeInExists),           /* AC0CE8  -> 080B2D1D */
    PROC_LABEL(0),                      /* AC0CF0 */
    PROC_REPEAT(Fin_Loop_KeyListener),  /* AC0CF8  -> 080BBF85 */
    PROC_CALL_ARG(_FadeBgmOut, 4),      /* AC0D00  -> 08014BF9 */
    PROC_CALL_ARG(NewFadeOut, 4),       /* AC0D08  -> 080B2D71 */
    PROC_WHILE(FadeOutExists),          /* AC0D10  -> 080B2D35 */
    PROC_SLEEP(60),                     /* AC0D18 */
    PROC_GOTO(100),                     /* AC0D20  (dangling in JP: no label 100) */
    PROC_LABEL(1),                      /* AC0D28 */
    PROC_CALL_ARG(NewFadeIn, 4),        /* AC0D30  -> 080B2D4D */
    PROC_WHILE(FadeInExists),           /* AC0D38  -> 080B2D1D */
    PROC_SLEEP(60),                     /* AC0D40 */
    PROC_CALL(Fin_InitBlend),           /* AC0D48  -> 080BBFAD */
    PROC_REPEAT(Fin_Loop_Blend),        /* AC0D50  -> 080BBFED */
    PROC_GOTO(0),                       /* AC0D58 */
    PROC_LABEL(2),                      /* AC0D60 */
    PROC_CALL_ARG(NewFadeOut, 4),       /* AC0D68  -> 080B2D71 */
    PROC_WHILE(FadeOutExists),          /* AC0D70  -> 080B2D35 */
    PROC_CALL(StartFinScreen),          /* AC0D78  -> 080BD02D */
};
u32 frontier_df4_ending_gap1_r0[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    0x0000000E, 0x00000000, 0x0064000C, 0x00000000, 0x0064000B, 0x00000000,
    0x00000002, (u32)&Fin_End, 0x00000000, 0x00000000, 0x40000005, 0x00008000,
    0x80204000, 0x40000004, 0x00088040, 0x80604000, 0x8000000C, 0x00100080,
    0x40000002, 0x00408000, 0x80204000, 0x00020044, 0x80004000, 0x40000048,
    0x004C8020, 0x40000002, 0x00508000, 0x80204000, 0x00020054, 0x80004000,
    0x40000058, 0x005C8020, 0x40000002, 0x00888000, 0x80204000, 0x0002008C,
    0x80004000, 0x40000080, 0x00848020, 0x40000002, 0x001B4000, 0x00200000,
    0x0001001F, 0x80000000, 0x000100C0, 0x80000000, 0x000100C4, 0x80000000,
    0x000100C8, 0x80000000, 0x000100CC, 0x80000000, 0x000100D0, 0x80000000,
    0x000100D4, 0x80000000, 0x00010140, 0x80000000, 0x00010144, 0x80000000,
    0x00010148, 0x80000000, 0x0001014C, 0x80000000, 0x00010150, 0x80000000,
    0x00000154, (u32)&Sprite_EndingDetails_7 + 0x36, (u32)&Sprite_EndingDetails_7 + 0x2E, (u32)&Sprite_EndingDetails_7 + 0x26, (u32)&Sprite_EndingDetails_7 + 0x1E, (u32)&Sprite_EndingDetails_7 + 0x16,
    (u32)&Sprite_EndingDetails_7 + 0xE, (u32)&Sprite_EndingDetails_7 + 0x66, (u32)&Sprite_EndingDetails_7 + 0x5E, (u32)&Sprite_EndingDetails_7 + 0x56, (u32)&Sprite_EndingDetails_7 + 0x4E, (u32)&Sprite_EndingDetails_7 + 0x46,
    (u32)&Sprite_EndingDetails_7 + 0x3E,
};
u32 data_08AC0EBC[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    0x0000000E, 0x00000000, 0x00000002, (u32)&EndingDetails_InitFog, 0x00000003, (u32)&EndingDetails_LoopFog,
    0x00000000, 0x00000000, 0x020027A0,
};
u32 data_08AC0EE0[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    0x0000000E, 0x00000000, 0x00000002, (u32)&sub_80BCCF0, 0x00000014, (u32)&MapPaletteBrightnessFadeExists,
    0x00000002, (u32)&sub_80BCD2C, 0x00000014, (u32)&MapPaletteBrightnessFadeExists, 0x00000000, 0x00000000,
    0x0000000E, 0x00000000, 0x00000002, (u32)&TurnRecord_Init, 0x00000002, (u32)&sub_80BCA74,
    0x00000002, (u32)&GameIntroHealthSafetyWaitButton, 0x00040018, (u32)&NewFadeIn, 0x00000014, (u32)&FadeInExists,
    0x00000002, (u32)&GameControlHandlePostNormalOrExtraChapter, 0x0000000B, 0x00000000, 0x00000003, (u32)&sub_80BCD74,
    0x0010000E, 0x00000000, 0x00000003, (u32)&sub_80BCD74, 0x0010000E, 0x00000000,
    0x00000003, (u32)&sub_80BCD74, 0x0010000E, 0x00000000, 0x00000003, (u32)&sub_80BCD74,
    0x0010000E, 0x00000000, 0x00000003, (u32)&sub_80BCD74, 0x0020000E, 0x00000000,
    0x00000003, (u32)&sub_80BCD74, 0x0064000C, 0x00000000, 0x0001000B, 0x00000000,
    0x00000003, (u32)&sub_80BCD74, 0x0010000E, 0x00000000, 0x00000003, (u32)&sub_80BCD74,
    0x0010000E, 0x00000000, 0x00000003, (u32)&sub_80BCD74, 0x0020000E, 0x00000000,
    0x00000003, (u32)&sub_80BCD74, 0x0064000C, 0x00000000, 0x0064000B, 0x00000000,
    0x0020000E, 0x00000000, 0x00000003, (u32)&sub_80BCE68, 0x00000002, (u32)&sub_80BCE94,
    0x00040018, (u32)&NewFadeOut, 0x00000014, (u32)&FadeOutExists, 0x001E000E, 0x00000000,
    0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00000002, (u32)&TurnRecord_Init,
    0x00000002, (u32)&TurnRecord_SetupText, 0x00000002, (u32)&TurnRecord_SetupGfx, 0x00040018, (u32)&NewFadeIn,
    0x00000014, (u32)&FadeInExists, 0x00000003, (u32)&TurnRecord_Loop_Main, 0x0078000E, 0x00000000,
    0x00040018, (u32)&NewFadeOut, 0x00000014, (u32)&FadeOutExists, 0x00000002, (u32)&TurnRecord_End,
    0x003C000E, 0x00000000, 0x00000000, 0x00000000,
};
struct ProcCmd ProcScr_WorldMapFaceHolder[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    PROC_MARK(0x8), PROC_CALL(WorldMapFaceHolder_Init), PROC_BLOCK, PROC_END,
};
u32 frontier_df4_ending_gap1_r1[] __attribute__((section(".data.frontier_df4_ending.gap1"))) = {
    0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_94, 0x00000002, (u32)&WMFaceCtrl_Init,
    0x00000003, (u32)&WMFaceCtrl_Loop, 0x00000000, 0x00000000, 0x00006000, 0x00000007,
    0x00007000, 0x00000008, 0x00003000, 0x0000000F, 0x00002000, 0x0000000E,
};
u32 frontier_df4_ending_002_AC16C8[] __attribute__((section(".data.frontier_df4_ending.gap2"))) = {
    0x0000000E, 0x00000000, 0x00000003, (u32)&WorldMap_MergeFace_Loop, 0x00000000, 0x00000000,
    0x0000000E, 0x00000000, 0x00000003, (u32)&WorldMap_FadeMapSpritePalOut_Loop, 0x00000000, 0x00000000,
    0x0000000E, 0x00000000, 0x00000003, (u32)&WorldMap_FadeMapSpritePalIn_Loop, 0x00000000, 0x00000000,
    0x0001000E, 0x00000000, 0x00000002, (u32)&NewWorldMap, 0x0000000E, 0x00000000,
    0x00000008, (u32)&ProcScr_WorldMapMain, 0x00000009, (u32)&ProcScr_BmFadeIN, 0x0000000E, 0x00000000,
    0x00000000, 0x00000000, 0x00040004, 0x00040004, 0x00040004, 0x00040004,
    0x00040004, 0x00040004, 0x00040004, 0x00040004, 0x00040004, 0x00050005,
    0x00050005, 0x00050005, 0x00050005, 0x00050005, 0x00060006, 0x00060006,
    0x00060006, 0x00060006, 0x00060006, 0x00060004, 0x00060005, 0x00070007,
    0x00070007, 0x00070007, 0x00070007, 0x002F002F, 0x00040004, 0x00000001,
    (u32)&data_081F5BF4 + 0x38, 0x0008000F, 0x00000000, 0x00000002, (u32)&GMScreenVSync_Init, 0x00000003,
    (u32)&GMScreenVSync_Loop, 0x00000000, 0x00000000, 0x00780000, 0x012C00F0, 0x021C01A4,
    0x00000294, 0x00003000, 0x00003000, 0x0000E000, 0x00001000, 0x0000C600,
    0x00009800, 0x00009600, 0x00007400, 0x00002000, 0x0000A000, 0x00003000,
    0x00003000, 0x0000E000, 0x00001000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000001,
    (u32)&data_081F5BF4 + 0x48, 0x0008000F, 0x00000000, 0x00000004, (u32)&MapScreen_OnDelete, 0x00000002,
    (u32)&MapScreen_Init, 0x00000002, (u32)&GMapScreen_LoadTileGfx, 0x00000002, (u32)&GMapScreen_ApplyTilePalettes, 0x00000002,
    (u32)&sub_80BF950, 0x00000003, (u32)&GMapScreen_Loop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapGmapunit_0 + 0x8, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapUnit_Destruct, 0x00000002,
    (u32)&GmapUnit_Init, 0x00000003, (u32)&GmapUnit_Loop, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapGmapunit_0 + 0x8, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapUnitContainer_Destruct, 0x00000002,
    (u32)&GmapUnitContainer_Init, 0x00000010, 0x00000000, 0x00000000, 0x00000000, 0x00000001,
    (u32)&gWorldmapGmapunit_0 + 0x14, 0x0008000F, 0x00000000, 0x00000004, (u32)&GmapUnitFade_Destruct, 0x0000000E,
    0x00000000, 0x00000002, (u32)&sub_80C0094, 0x00000003, (u32)&GmapUnitFade_Loop, 0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_GmNodeIconDisplay[] __attribute__((section(".data.frontier_df4_ending.gap2"))) = {
    PROC_NAME((void*)((u8*)data_081F611C + 0x3c)), PROC_MARK(0x8), PROC_SET_END_CB(GmapScreen2_Destruct), PROC_CALL(GmapScreen2_Init),
    PROC_REPEAT(GmapScreen2_Loop), PROC_END,
};
u32 frontier_df4_ending_gap2_r2[] __attribute__((section(".data.frontier_df4_ending.gap2"))) = {
    0x00000001, (u32)&gWorldmapCursor_0 + 0x18, 0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_96,
    0x00000002, (u32)&GmapCursor_Init, 0x00000003, (u32)&GmapCursor_Loop, 0x00000000, 0x00000000,
    0x00000001, (u32)&data_081F64C0, 0x0008000F, 0x00000000, 0x00000004, (u32)&nullsub_97,
    0x0000000E, 0x00000000, 0x00000002, (u32)&MapRoute_Init, 0x0000000B, 0x00000000,
    0x00000003, (u32)&MapRoute_Loop, 0x0002000C, 0x00000000, 0x0001000B, 0x00000000,
    0x00000016, (u32)&MapRoute_StartTransition, 0x00000016, (u32)&MapRoute_PrepareTransition, 0x00000016, (u32)&MapRoute_EnableBGSyncs,
    0x00000003, (u32)&MapRoute_TransitionLoop, 0x00000016, (u32)&MapRoute_TransitionEnd, 0x0000000C, 0x00000000,
    0x0002000B, 0x00000000, 0x00000000, 0x00000000,
};
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

u32 frontier_df4_ending_gap15_r3[] __attribute__((section(".data.frontier_df4_ending.gap15"))) = {
    0x60000000, 0x00000000, 0x00006800, 0x70008000, 0x80000000, 0x00007800,
};

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

u32 frontier_df4_ending_gap15_r4[] __attribute__((section(".data.frontier_df4_ending.gap15"))) = {
    0x60000000, 0x00000000, 0x00006800, 0x70000000, 0x80000000, 0x00007800,
};

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

u32 frontier_df4_ending_gap15_r5[] __attribute__((section(".data.frontier_df4_ending.gap15"))) = {
    0x7BFF398A, 0x6FBD77DE, 0x5F5B677C, 0x52F95B3A, 0x42B74AD8, 0x36553E76,
    0x152C25D0, 0x000008A7,
};

/* #143: tail 48 B (JP 0x08B3EDD0..0x08B3EE00) typed out as gProcScr_DrawTitleSprites +
 * gProcScr_SkipTitleFxKeyListener in src/data/gProcScr_DrawTitleSprites_ref; keep only
 * the 413 B head here so its interior code pointers become R_ARM_ABS32 relocations. */
u8 frontier_df4_ending_016_B3EC33[] __attribute__((section(".data.frontier_df4_ending.gap16"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_016_B3EC33.bin", 0, 413);
u8 frontier_df4_ending_017b_B3F18C[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x02, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x10, 0x00, 0x04, 0x00, 0x06, 0x00,
    0x00, 0x40, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x20, 0x80, 0x08, 0x00, 0x00, 0x40, 0x40, 0x80,
    0x10, 0x00, 0x00, 0x40, 0x60, 0x80, 0x18, 0x00, 0x00, 0x40, 0x80, 0x80, 0x20, 0x00, 0x00, 0x00,
    0xA0, 0x40, 0x28, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x20, 0x40,
    0x08, 0x00,
};
u8 data_08B3F1CE[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x02, 0x00, 0x00, 0x40, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x20, 0x80, 0x08, 0x00,
};
u32 data_08B3F1DC[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x40000003, 0x00008000, 0x80204000, 0x00000008, 0x00104040,
};
u32 data_08B3F1F0[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x40000003, 0x00008000, 0x80204000, 0x80000008, 0x00100040,
};
u32 data_08B3F204[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x40000003, 0x00008000, 0x40200000, 0x80000008, 0x000C0030, 0x40000003,
    0x0000C000, 0x40004020, 0x40200020, 0x00244020, 0x40000003, 0x0000D000,
    0x50004020, 0x40200024, 0x00205020, 0x00000002, 0x00008000, 0x80208000,
    0x00020010, 0x90008000, 0x00000010, 0x00009010, 0x40000002, 0x00008000,
    0x40004010, 0x00020008, 0x90004000, 0x40100000, 0x00085000, 0x00000001,
    0x00004000, 0x00000001, 0x00005000, 0x40000001, 0x00000000, 0x40000001,
    0x00001000,
};
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
u32 frontier_df4_ending_gap17_r6[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    (u32)&img_opanim1, (u32)&img_opanim2, (u32)&img_opanim3, (u32)&img_opanim4, (u32)&img_opanim5, (u32)&img_opanim6,
    (u32)&img_opanim7, (u32)&img_opanim8, (u32)&img_opanim9, (u32)&img_opanim10, (u32)&img_opanim11, (u32)&img_opanim12,
    (u32)&img_opanim13, (u32)&img_opanim14, (u32)&img_opanim15, (u32)&img_opanim16, (u32)&img_opanim17, (u32)&img_opanim18,
    (u32)&img_opanim19, (u32)&img_opanim20, (u32)&img_opanim21, (u32)&img_opanim22, (u32)&img_opanim23, (u32)&img_opanim24,
    (u32)&img_opanim25, (u32)&img_opanim26, (u32)&img_opanim27, (u32)&img_opanim28, (u32)&img_opanim29, (u32)&img_opanim30,
    (u32)&img_opanim31, (u32)&img_opanim32, (u32)&img_opanim33, (u32)&img_opanim34, (u32)&img_opanim35, (u32)&img_opanim36,
    (u32)&img_opanim37, (u32)&img_opanim38, (u32)&img_opanim39, (u32)&img_opanim40, (u32)&img_opanim41, (u32)&img_opanim42,
    (u32)&img_opanim43, (u32)&img_opanim44, (u32)&img_opanim45, (u32)&img_opanim46, (u32)&img_opanim47, (u32)&img_opanim48,
    (u32)&img_opanim49, (u32)&img_opanim50, (u32)&img_opanim51, (u32)&img_opanim52, (u32)&img_opanim53, (u32)&img_opanim54,
    (u32)&img_opanim55, (u32)&img_opanim56, (u32)&img_opanim57, (u32)&img_opanim58, (u32)&img_opanim59, (u32)&img_opanim60,
    (u32)&img_opanim61, (u32)&img_opanim62, (u32)&img_opanim63, (u32)&img_opanim64, (u32)&img_opanim65, (u32)&img_opanim66,
    (u32)&img_opanim67, (u32)&img_opanim68, (u32)&img_opanim69, (u32)&img_opanim70, (u32)&img_opanim71, (u32)&img_opanim72,
    (u32)&img_opanim73, (u32)&img_opanim74, (u32)&img_opanim75, (u32)&img_opanim76, (u32)&img_opanim77, (u32)&img_opanim78,
    (u32)&img_opanim79, (u32)&img_opanim80, (u32)&img_opanim81, (u32)&img_opanim82, (u32)&img_opanim83, (u32)&img_opanim84,
    (u32)&img_opanim85, (u32)&img_opanim86, (u32)&img_opanim87, (u32)&img_opanim88, (u32)&img_opanim89, (u32)&img_opanim90,
    (u32)&img_opanim91, (u32)&img_opanim92, (u32)&img_opanim93, (u32)&img_opanim94, (u32)&img_opanim95, (u32)&img_opanim96,
    (u32)&img_opanim97, (u32)&img_opanim98, (u32)&img_opanim99, (u32)&img_opanim100, (u32)&tsa_opanim1, (u32)&tsa_opanim2,
    (u32)&tsa_opanim3, (u32)&tsa_opanim4, (u32)&tsa_opanim5, (u32)&tsa_opanim6, (u32)&tsa_opanim7, (u32)&tsa_opanim8,
    (u32)&tsa_opanim9, (u32)&tsa_opanim10, (u32)&tsa_opanim11, (u32)&tsa_opanim12, (u32)&tsa_opanim13, (u32)&tsa_opanim14,
    (u32)&tsa_opanim15, (u32)&tsa_opanim16, (u32)&tsa_opanim17, (u32)&tsa_opanim18, (u32)&tsa_opanim19, (u32)&tsa_opanim20,
    (u32)&tsa_opanim21, (u32)&tsa_opanim22, (u32)&tsa_opanim23, (u32)&tsa_opanim24, (u32)&tsa_opanim25, (u32)&tsa_opanim26,
    (u32)&tsa_opanim27, (u32)&tsa_opanim28, (u32)&tsa_opanim29, (u32)&tsa_opanim30, (u32)&tsa_opanim31, (u32)&tsa_opanim32,
    (u32)&tsa_opanim33, (u32)&tsa_opanim34, (u32)&tsa_opanim35, (u32)&tsa_opanim36, (u32)&tsa_opanim37, (u32)&tsa_opanim38,
    (u32)&tsa_opanim39, (u32)&tsa_opanim40, (u32)&tsa_opanim41, (u32)&tsa_opanim42, (u32)&tsa_opanim43, (u32)&tsa_opanim44,
    (u32)&tsa_opanim45, (u32)&tsa_opanim46, (u32)&tsa_opanim47, (u32)&tsa_opanim48, (u32)&tsa_opanim49, (u32)&tsa_opanim50,
    (u32)&tsa_opanim51, (u32)&tsa_opanim52, (u32)&tsa_opanim53, (u32)&tsa_opanim54, (u32)&tsa_opanim55, (u32)&tsa_opanim56,
    (u32)&tsa_opanim57, (u32)&tsa_opanim58, (u32)&tsa_opanim59, (u32)&tsa_opanim60, (u32)&tsa_opanim61, (u32)&tsa_opanim62,
    (u32)&tsa_opanim63, (u32)&tsa_opanim64, (u32)&tsa_opanim65, (u32)&tsa_opanim66, (u32)&tsa_opanim67, (u32)&tsa_opanim68,
    (u32)&tsa_opanim69, (u32)&tsa_opanim70, (u32)&tsa_opanim71, (u32)&tsa_opanim72, (u32)&tsa_opanim73, (u32)&tsa_opanim74,
    (u32)&tsa_opanim75, (u32)&tsa_opanim76, (u32)&tsa_opanim77, (u32)&tsa_opanim78, (u32)&tsa_opanim79, (u32)&tsa_opanim80,
    (u32)&tsa_opanim81, (u32)&tsa_opanim82, (u32)&tsa_opanim83, (u32)&tsa_opanim84, (u32)&tsa_opanim85, (u32)&tsa_opanim86,
    (u32)&tsa_opanim87, (u32)&tsa_opanim88, (u32)&tsa_opanim89, (u32)&tsa_opanim90, (u32)&tsa_opanim91, (u32)&tsa_opanim92,
    (u32)&tsa_opanim93, (u32)&tsa_opanim94, (u32)&tsa_opanim95, (u32)&tsa_opanim96, (u32)&tsa_opanim97, (u32)&tsa_opanim98,
    (u32)&tsa_opanim99, (u32)&tsa_opanim100,
};
struct ProcCmd ProcScr_OpAnimMergeBG[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    PROC_CALL(OpAnimMergeBGProcInit), PROC_REPEAT(OpAnimMergeBGProcUpdateBgPalette), PROC_END,
};
u32 frontier_df4_ending_gap17_r7[] __attribute__((section(".data.frontier_df4_ending.gap17"))) = {
    0x00000003, (u32)&OpAnimScrollBg3Loop, 0x00000000, 0x00000000, 0x00000004, (u32)&OpAnimRestoreColorEffectsOnEnd,
    0x00000002, (u32)&OpAnimDarkenBg2Init, 0x00000003, (u32)&OpAnimDarkenBg2In, 0x00000000, 0x00000000,
    0x00000004, (u32)&OpAnimRestoreColorEffectsOnEnd2, 0x00000002, (u32)&OpAnimDarkenBg2OutInit, 0x00000003, (u32)&OpAnimDarkenBg2Out,
    0x00000000, 0x00000000,
};
u32 frontier_df4_ending_018_B3F7BC[] __attribute__((section(".data.frontier_df4_ending.gap18"))) = {
    0x0000000E, 0x00000000, 0x00000002, (u32)&OpAnimInit, 0x0000000E, 0x00000000,
    0x00000002, (u32)&SetupOpAnimWorldMapfx, 0x00000005, (u32)&ProcScr_OpAnimBLDALPHA, 0x00000014, (u32)&OpAnimBldAlphaExists,
    0x00000002, (u32)&OpAnimUpdateScreen1, 0x00000003, (u32)&OpAnimWorldMapfxMain, 0x00000002, (u32)&OpAnimSetupCharacterScene,
    0x0000000E, 0x00000000, 0x00000003, (u32)&OpAnimPreparefxEphraim, 0x00000002, (u32)&NewProc08AA6D04,
    0x00000003, (u32)&OpAnimEphraimfxFlyIn, 0x00000003, (u32)&OpAnimEphraimSetupSplitWindow, 0x00000003, (u32)&OpAnim1AdvanceSplitLine,
    0x00000003, (u32)&OpAnimEphraimMergeShadow, 0x00000003, (u32)&OpAnimEphraimDisplayName, 0x00000003, (u32)&OpAnimEirikaExit,
    0x00000003, (u32)&OpAnimPreparefxEirika, 0x00000003, (u32)&OpAnimEirikafxFlyIn, 0x00000003, (u32)&OpAnimEirikaSetupSplitWindow,
    0x00000003, (u32)&OpAnimEirikaAdvanceSplitLine, 0x00000003, (u32)&OpAnimEirikaMergeShadow, 0x00000003, (u32)&OpAnimEirikaDisplayName,
    0x00000003, (u32)&OpAnimEphraimExit, 0x00000003, (u32)&OpAnimFadeToBlack, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000005, (u32)&gUnkData_98, 0x00000003, (u32)&OpAnimJoshuaScrollIn, 0x00000005, (u32)&frontier_df4_ending_gap17_r7,
    0x00000002, (u32)&OpAnimCharacterScrollInBegin, 0x00000003, (u32)&OpAnimCharacterScrollInMain, 0x00000002, (u32)&OpAnimSetupJoshuaScroll,
    0x00000003, (u32)&OpAnimCharacterFlyIn1, 0x00000003, (u32)&OpAnimCharacterFlyIn2, 0x00000003, (u32)&OpAnimCharacterFlyOut,
    0x00000002, (u32)&OpAnimCharacterScrollOutBegin, 0x00000003, (u32)&OpAnimCharacterScrollOutMain, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimScrollInLArachel, 0x00000002, (u32)&OpAnimCharacterScrollInBegin, 0x00000003, (u32)&OpAnimCharacterScrollInMain,
    0x00000002, (u32)&OpAnimSetupLArachelScroll, 0x00000003, (u32)&OpAnimCharacterFlyIn1, 0x00000003, (u32)&OpAnimCharacterFlyIn2,
    0x00000003, (u32)&OpAnimCharacterFlyOut, 0x00000002, (u32)&OpAnimCharacterScrollOutBegin, 0x00000003, (u32)&OpAnimCharacterScrollOutMain,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimScrollInSeth, 0x00000002, (u32)&OpAnimCharacterScrollInBegin,
    0x00000003, (u32)&OpAnimCharacterScrollInMain, 0x00000002, (u32)&OpAnimSetupSethScroll, 0x00000003, (u32)&OpAnimCharacterFlyIn1,
    0x00000003, (u32)&OpAnimCharacterFlyIn2, 0x00000003, (u32)&OpAnimCharacterFlyOut, 0x00000002, (u32)&OpAnimCharacterScrollOutBegin,
    0x00000003, (u32)&OpAnimCharacterScrollOutMain, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimScrollInMyrrh,
    0x00000002, (u32)&OpAnimCharacterScrollInBegin, 0x00000003, (u32)&OpAnimCharacterScrollInMain, 0x00000002, (u32)&OpAnimSetupMyrrhScroll,
    0x00000003, (u32)&OpAnimCharacterFlyIn1, 0x00000003, (u32)&OpAnimCharacterFlyIn2, 0x00000003, (u32)&OpAnimCharacterFlyOut,
    0x00000002, (u32)&OpAnimCharacterScrollOutBegin, 0x00000003, (u32)&OpAnimCharacterScrollOutMain, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimScrollInSaleh, 0x00000002, (u32)&OpAnimCharacterScrollInBegin, 0x00000003, (u32)&OpAnimCharacterScrollInMain,
    0x00000002, (u32)&OpAnimSetupSalehScroll, 0x00000003, (u32)&OpAnimCharacterFlyIn1, 0x00000003, (u32)&OpAnimCharacterFlyIn2,
    0x00000003, (u32)&OpAnimCharacterFlyOut, 0x00000002, (u32)&OpAnimCharacterScrollOutBegin, 0x00000003, (u32)&OpAnimCharacterScrollOutMain,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimScrollInTethys, 0x00000002, (u32)&OpAnimCharacterScrollInBegin,
    0x00000003, (u32)&OpAnimCharacterScrollInMain, 0x00000002, (u32)&OpAnimSetupTethysScroll, 0x00000003, (u32)&OpAnimCharacterFlyIn1,
    0x00000003, (u32)&OpAnimCharacterFlyIn2, 0x00000003, (u32)&OpAnimCharacterFlyOut, 0x00000002, (u32)&OpAnimCharacterScrollOutBegin,
    0x00000003, (u32)&OpAnimCharacterScrollOutMain, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000005, (u32)&gUnkData_99,
    0x00000009, (u32)&frontier_df4_ending_gap17_r7, 0x00000003, (u32)&OpAnimScrollInBlank, 0x00000002, (u32)&OpAnimGatherUnitsBegin,
    0x00000003, (u32)&OpAnimGatherUnitsMain, 0x00000002, (u32)&OpAnimGatherUnitsEnd, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimFaceMontageBegin, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg1,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageEwanGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow,
    0x00000003, (u32)&OpAnimTitleFlyInSeg2, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageGarciaGroup,
    0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg3, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimFaceMontageVanessaGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg4,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageGilliamGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow,
    0x00000003, (u32)&OpAnimTitleFlyInSeg5, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageColmGroup,
    0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg6, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimFaceMontageKnollGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg7,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageLuteGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow,
    0x00000003, (u32)&OpAnimTitleFlyInSeg8, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageDuesselGroup,
    0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg9, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimFaceMontageKyleGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg10,
    0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageValterGroup, 0x00000002, (u32)&OpAnimSetupWalkingObjWindow,
    0x00000003, (u32)&OpAnimTitleFlyInSeg11, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes, 0x00000003, (u32)&OpAnimFaceMontageLyonGroup,
    0x00000002, (u32)&OpAnimSetupWalkingObjWindow, 0x00000003, (u32)&OpAnimTitleFlyInSeg12, 0x00000002, (u32)&OpAnimApplyScrollAndPalettes,
    0x00000003, (u32)&OpAnimFaceMontageBlendOut, 0x00000003, (u32)&OpAnimFadeToWhite, 0x0020000E, 0x00000000,
    0x0063000B, 0x00000000, 0x00000002, (u32)&OpAnimEnd, 0x0001000E, 0x00000000,
    0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00000002, (u32)&GameIntroPrepareNintendofx,
    0x00000003, (u32)&GameIntroNintendoFadeIN, 0x00000003, (u32)&GameEarlyStartDelay, 0x00000003, (u32)&GameIntroNintendoFadeOUT,
    0x00000003, (u32)&GameEarlyStartDelay, 0x00000003, (u32)&GameIntroIntelligentSystemsFadeIN, 0x00000003, (u32)&GameEarlyStartDelay,
    0x00000003, (u32)&GameIntroIntelligentSystemsFadeOUT, 0x00000003, (u32)&GameEarlyStartDelay, 0x0001000C, 0x00000000,
    0x0000000B, 0x00000000, 0x00000002, (u32)&OpAnimHS_InitFadeToBlack, 0x00000003, (u32)&OpAnimHS_FadeToBlackLoop,
    0x0001000B, 0x00000000, 0x00000000, 0x00000000,
};
u8 frontier_df4_ending_019_B8B998[] __attribute__((section(".data.frontier_df4_ending.gap19"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_019_B8B998.4bpp.lz");
u8 frontier_df4_ending_020_BAA2E0[] __attribute__((section(".data.frontier_df4_ending.gap20"))) = INCBIN_U8("graphics/frontier_df4_ending/frontier_df4_ending_020_BAA2E0.4bpp.lz");
u32 frontier_df4_ending_021_BAB754[] __attribute__((section(".data.frontier_df4_ending.gap21"))) = {
    0x00011E05, 0x28050008, 0x50050003, 0x00080001, 0x00032805, 0x00000000,
    0x00000002, (u32)&StartMidFadeToBlack, 0x00000003, (u32)&WaitForFade, 0x00000001, (u32)&data_081F6D00,
    0x0000000B, 0x00000000, 0x00000002, (u32)&Make6C_PromotionMenuSelect, 0x0006000E, 0x00000000,
    0x00000002, (u32)&ClassChgSel_InitDescAndBg, 0x0001000B, 0x00000000, 0x00000002, (u32)&StartMidFadeFromBlack,
    0x00000003, (u32)&WaitForFade, 0x00000003, (u32)&LoadBattleSpritesForBranchScreen, 0x0003000C, 0x00000000,
    0x0002000B, 0x00000000, 0x00000002, (u32)&ClassChgSel_RoutePreEndByType, 0x00000002, (u32)&StartMidFadeToBlack,
    0x00000003, (u32)&WaitForFade, 0x0004000B, 0x00000000, 0x00000002, (u32)&ClassChgSel_OnEndCleanupBm,
    0x00000002, (u32)&ClassChgSel_RouteOnEndByType, 0x00000004, (u32)&sub_80D2308, 0x00000002, (u32)&StartMidFadeToBlack,
    0x00000003, (u32)&WaitForFade, 0x00000002, (u32)&PrepClassChgOnCancel, 0x0005000B, 0x00000000,
    0x0003000B, 0x00000000, 0x00000000, 0x00000000, 0x00000001, (u32)&data_081F6D00 + 0xc,
    0x00000002, (u32)&StartMidFadeFromBlack, 0x00000003, (u32)&WaitForFade, 0x00000000, 0x00000000,
    0x0008000E, 0x00000000, 0x00000001, (u32)&data_081F6D00 + 0x1c, 0x0000000B, 0x00000000,
    0x00000002, (u32)&PromoTrainee_InitScreen, 0x0001000B, 0x00000000, 0x00000002, (u32)&StartMidFadeFromBlack,
    0x00000003, (u32)&WaitForFade, 0x00000002, (u32)&PromoTrainee_Talk1, 0x00000014, (u32)&CgTextExists,
    0x00000002, (u32)&PromoTrainee_Talk2, 0x00000014, (u32)&CgTextExists, 0x00000002, (u32)&PromoTrainee_Talk3,
    0x00000014, (u32)&CgTextExists, 0x00000002, (u32)&PromoTrainee_Talk4, 0x00000014, (u32)&CgTextExists,
    0x00000002, (u32)&PromoTrainee_Talk5, 0x00000014, (u32)&CgTextExists, 0x0003000B, 0x00000000,
    0x00000014, (u32)&RemovePromoTraineeEventFace, 0x0002000B, 0x00000000, 0x00000002, (u32)&PromoTrainee_OnEnd,
    0x0004000B, 0x00000000, 0x00000000, 0x00000000, (u32)&data_081F6D5C + 0x18, 0x00000000,
    0x00000000, (u32)&MenuAlwaysEnabled, 0x00000000, (u32)&PromoSubConfirmMenuOnSelect, 0x00000000, 0x00000000,
    0x00000000, (u32)&data_081F6D5C + 0xc, 0x00000000, 0x00000100, (u32)&MenuAlwaysEnabled, 0x00000000,
    (u32)&PromoSubConfirmMenuOnSelect, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00070408, 0x00000001, (u32)&ProcScr_PromoSelectEvent + 0xb8, (u32)&PromoSubConfirm_OnInit, (u32)&PromoSubConfirm_OnEnd,
    0x00000000, (u32)&ClassChgMenuSel_OnBPress, 0x00000000, (u32)&MenuStdHelpBox, (u32)&data_081F6D7C + 0x1c, 0x065E0000,
    0x00000000, (u32)&MenuAlwaysEnabled, (u32)&ClassChgMenuItem_OnTextDraw, (u32)&ClassChgMenuItem_OnSelect, 0x00000000, (u32)&ClassChgMenuItem_OnChange,
    0x00000000, (u32)&data_081F6D7C + 0x10, 0x065E0000, 0x00000100, (u32)&MenuAlwaysEnabled, (u32)&ClassChgMenuItem_OnTextDraw,
    (u32)&ClassChgMenuItem_OnSelect, 0x00000000, (u32)&ClassChgMenuItem_OnChange, 0x00000000, (u32)&data_081F6D7C + 0x4, 0x065E0000,
    0x00000200, (u32)&ClassChgMenuItem_3rdUsability, (u32)&ClassChgMenuItem_OnTextDraw, (u32)&ClassChgMenuItem_OnSelect, 0x00000000, (u32)&ClassChgMenuItem_OnChange,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00080210, 0x00000000,
    (u32)&Menu_PromoSubConfirm + 0x24, (u32)&ClassChgMenuSelOnInit, (u32)&ClassChgMenuSelOnEnd, 0x00000000, (u32)&ClassChgMenuSelOnPressB, 0x00000000,
    0x00000000,
};
/* byte-neutral alias: data_08BABA58 == ProcScr_ClassChgMenuSel (same address) */
extern const u32 data_08BABA58 __attribute__((alias("ProcScr_ClassChgMenuSel")));
struct ProcCmd ProcScr_ClassChgMenuSel[] __attribute__((section(".data.frontier_df4_ending.gap21"))) = {
    PROC_SLEEP(0x6), PROC_NAME((void*)((u8*)data_081F6D7C + 0x28)), PROC_CALL(ClassChgMenuExec), PROC_REPEAT((void*)((u8*)gap_000D2AD0 + 0x1)),
    PROC_SLEEP(0x0), PROC_LABEL(0x0), PROC_GOTO(0x2), PROC_LABEL(0x1),
    PROC_CALL((void*)((u8*)gap_000D2AD0 + 0x5)), PROC_LABEL(0x2), PROC_END,
};
u32 frontier_df4_ending_gap21_r8[] __attribute__((section(".data.frontier_df4_ending.gap21"))) = {
    0x000C0101,
};
