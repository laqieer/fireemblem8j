#include "global.h"
#include "proc.h"

/* #148 gProcScr_SoundRoomUi externs (gap28, batch 6f). */
extern void ExtramenuUnk_Init();
extern void ExtramenuUnk_LoadGfx();
extern void ExtramenuUnk_DrawIconLoop();
extern void nullsub_90();

/* #148 ProcScr_CallExtraMap externs (gap27c, batch 6e). */
extern u8 SaveDrawCursorYOffsetLut[];
extern void SaveBgUp_Loop();

/* #148 gProcScr_ClassIntro_FlareFX externs (gap34, batch 6d). */
extern void ClassIntroFlare_Init();
extern void ClassIntroFlare_Loop();

/* #148 gProcScr_Shop / gProcScr_GoldBox externs (gap37, batch 6c). */
extern u8 frontier_df4_menu_037_AB7144[];
extern void FadeInBlackSpeed20();
extern void FadeOutBlackSpeed20Locking();
extern void GoldBox_OnLoop();
extern void Shop_AddItemToConvoy();
extern void Shop_AnythingElseContinueDialogue();
extern void Shop_AnythingElseDialogue();
extern void Shop_AnythingElseRestartDialogue();
extern void Shop_BuyDialogue();
extern void Shop_CheckIfConvoyFull();
extern void Shop_ConvoyFullDialogue();
extern void Shop_EntryDialogue();
extern void Shop_ExitShopDialogue();
extern void Shop_HandleBuyConfirmPrompt();
extern void Shop_HandleEntryDialoguePrompt();
extern void Shop_HandleSellConfirmPrompt();
extern void Shop_HandleSendToConvoyPrompt();
extern void Shop_Init();
extern void Shop_InitBuyState();
extern void Shop_InitSellState();
extern void Shop_Loop_BuyKeyHandler();
extern void Shop_Loop_SellKeyHandler();
extern void Shop_Loop_UnkKeyHandler();
extern void Shop_NoSendToConvoyDialogue();
extern void Shop_OnExit();
extern void Shop_PrepEntryDialogue();
extern void Shop_SellAnythingElseDialogue();
extern void Shop_SellDialogue();
extern void Shop_SendToConvoyDialogue();
extern void Shop_TryAddItemToInventory();
extern void StartShopFadeIn();
extern void StartShopFadeOut();
extern void _FadeBgmOut();

/* #148 proc-script externs (gap20). */
extern void DisableAllDisplay();
extern void DrawFundsSprite_Init();
extern void DrawFundsSprite_Loop();
extern void DrawUnitInfoBg_Init();
extern void DrawUnitInfoBg_Loop();
extern void EnableAllGfx();
extern void MenuScroll_Init();
extern void MenuScroll_Loop();
extern void PrepHbKeyListener_Loop();
extern void PrepItemList_Init();
extern void PrepItemList_InitGfx();
extern void PrepItemList_Loop_MainKeyHandler();
extern void PrepItemList_Loop_UnitInvKeyHandler();
extern void PrepItemList_OnEnd();
extern void PrepItemList_SnapCursorIntoView();
extern void PrepItemList_StartTradeScreen();
extern void PrepItemList_SwitchPageLeft();
extern void PrepItemList_SwitchPageRight();
extern void PrepItemList_SwitchToUnitInventory();
extern void PrepItemScreen_DrawFunds();
extern void PrepItemScreen_HideFunds();
extern void PrepItemScreen_Init();
extern void PrepItemScreen_Loop_MainKeyHandler();
extern void PrepItemScreen_OnEnd();
extern void PrepItemScreen_ResumeFromStatScreen();
extern void PrepItemScreen_SetupGfx();
extern void PrepItemScreen_StartStatScreen();
extern void PrepItemSupply_AdjustCursorAndScroll();
extern void PrepItemSupply_EnterGiveTakeMenu();
extern void PrepItemSupply_Init();
extern void PrepItemSupply_InitGfx();
extern void PrepItemSupply_Loop_GiveTakeKeyHandler();
extern void PrepItemSupply_Loop_ItemListKeyHandler();
extern void PrepItemSupply_Loop_UnitInvKeyHandler();
extern void PrepItemSupply_OnEnd();
extern void PrepItemSupply_ResetBackgrounds();
extern void PrepItemSupply_ShowActiveUnitOnEnter();
extern void PrepItemSupply_StartActiveUnitMuOnExit();
extern void PrepItemSupply_SwitchPageLeft();
extern void PrepItemSupply_SwitchPageRight();
extern void PrepItemSupply_SwitchToUnitInventory();
extern void PrepItemTrade_Init();
extern void PrepItemTrade_Loop_MainKeyHandler();
extern void PrepItemTrade_OnEnd();
extern void PrepItemUse_ConfirmWindowCtrlLoop();
extern void PrepItemUse_ConfirmWindowInit();
extern void PrepItemUse_CtrlLoop();
extern void PrepItemUse_HandleItemEffect();
extern void PrepItemUse_InitDisplay();
extern void PrepItemUse_OnInit();
extern void PrepItemUse_PostPromotion();
extern void PrepItemUse_ResetBgmAfterPromo();
extern void PrepItem_ClearGMapMenuOnCancel();
extern void PrepItem_CommandMenuLoop();
extern void PrepItem_DrawSelectedUnitScreen();
extern void PrepItem_DrawUnitGridScreen();
extern void PrepItem_EndPopupBoxesAndSync();
extern void PrepItem_GridSelectLoop();
extern void PrepItem_InitCommandMenu();
extern void PrepItem_InitTradeScreen();
extern void PrepItem_RefreshSelectedUnitItems();
extern void PrepScreenProc_UpdateBgm();
extern void PrepUnitDisableDisp();
extern void PrepUnitEnableDisp();
extern void PrepUnit_EndScreenGfx();
extern void PrepUnit_ParkCursorOffList();
extern void PrepUnit_RecountSelectedUnits();
extern void PrepUnit_RestoreCursorToList();
extern void PrepUnit_RestoreListAfterStatScreen();
extern void PrepUnit_ScrollDownLoop();
extern void PrepUnit_ScrollUpLoop();
extern void PrepUnit_StartStatScreen();
extern void PrepUnit_StartUnitListScreen();
extern void PrepUnit_WaitDpadUpLoop();
extern void ProcPrepItemUse_OnEnd();
extern void ProcPrepUnit_Idle();
extern void ProcPrepUnit_InitScreen();
extern void ProcPrepUnit_OnEnd();
extern void ProcPrepUnit_OnGameStart();
extern void ProcPrepUnit_OnInit();
extern void StartPrepArmory();
extern void StartPrepItemListScreen();
extern void StartPrepItemSupply();
extern void StartPrepItemTradeScreen();
extern void StartPrepItemUse();
extern void StartPrepScreenPromotion();
extern void StartPrepSell();
extern void ViewCounter_Loop();

/* #148 proc-script externs (gap19). */
extern void AtMenuSetUnitStateAndEndFlag();
extern void AtMenu_CtrlLoop();
extern void AtMenu_InitSubmenuCursor();
extern void AtMenu_LockGame();
extern void AtMenu_OnSubmenuEnd();
extern void AtMenu_Reinitialize();
extern void AtMenu_ResetBmUiEffect();
extern void AtMenu_ResetScreenEffect();
extern void AtMenu_StartSubmenu();
extern void AtMenu_UnlockGame();
extern void AtMenu_UpdateDescLoop();
extern void DoPromoteAnimForChar100();
extern void EnableAllDisplay();
extern void EnablePrepScreenMenu();
extern void EndAllMus();
extern void EndPrepAtMenuIfNoUnitAvailable();
extern void IsGameLockLevelReserved();
extern void MusicProc4Exists();
extern void NullExpForChar100AndResetScreen();
extern void PrepAtMenu_OnInit();
extern void PrepMenuDescOnDraw();
extern void PrepMenuDescOnInit();
extern void PrepMenuDescOnParse();
extern void PrepSpriteDraw_Init();
extern void PrepSpriteDraw_Loop();
extern void PrepSpriteDraw_OnEnd();
extern void StartMidFadeFromBlack();
extern void StartMidFadeToBlack();
extern void UnitList_Init();
extern void UnitList_Loop();
extern void UnitList_OnEnd();
extern void UnitList_PageChangeIn_Loop();
extern void UnitList_PageChangeOut_Loop();
extern void UnitList_ResetFromStatScreen();
extern void UnitList_SetBlendEffects();
extern void UnitList_StartPageChange();
extern void UnitList_StartStatScreen();
extern u8 data_081F5548[];
extern u8 frontier_df4_misc_lo_021bt_1F5598[];

/* #148 proc-script externs (gap15). */
extern void BurstDisplay_Init();
extern void BurstDisplay_Loop_Display();
extern void ChapterStatus_DrawText();
extern void ChapterStatus_FocusLeaderUnit();
extern void ChapterStatus_Init();
extern void ChapterStatus_LoopKeyHandler();
extern void ChapterStatus_OnEnd();
extern void ChapterStatus_ShowAllLayers();
extern void EndMuralBackground();
extern void FadeInBlackSpeed40();
extern void FadeOutBlackSpeed40Locking();
extern void GoalDisplay_Init();
extern void GoalDisplay_Loop_Display();
extern void GoalDisplay_Loop_OnSideChange();
extern void GoalDisplay_Loop_SlideIn();
extern void GoalDisplay_Loop_SlideOut();
extern u8 GoalString_Turn[];
extern void InitPlayerPhaseInterface();
extern void IsAnyPlayerSideWindowRetracting();
extern void MMB_CheckForUnit();
extern void MMB_Init();
extern void MMB_Loop_Display();
extern void MMB_Loop_OnSideChange();
extern void MMB_Loop_SlideIn();
extern void MMB_Loop_SlideOut();
extern void MenuButtonDisp_Init();
extern void MenuButtonDisp_Loop_Display();
extern void MenuButtonDisp_Loop_OnSlideIn();
extern void MenuButtonDisp_Loop_OnSlideOut();
extern void MenuButtonDisp_UpdateCursorPos();
extern u8 ProcScr_CamMove[];
extern void StatusScreenSpriteDraw_Init();
extern void StatusScreenSpriteDraw_Loop();
extern void TerrainDisplay_Init();
extern void TerrainDisplay_Loop_Display();
extern void TerrainDisplay_Loop_OnSideChange();
extern void TerrainDisplay_Loop_SlideIn();
extern void TerrainDisplay_Loop_SlideOut();
extern u8 sPage2TextInfo_Magical[];

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

extern u8 frontier_df4_menu_038_ABCD24_1[];
extern u32 frontier_df4_menu_gap13_2941[];
extern u32 frontier_df4_menu_gap20_3536[];
extern u32 frontier_df4_menu_gap34_4422[];
extern u32 frontier_df4_menu_gap37_4741[];

extern const u8 Arena_PlayArenaSong[];
extern const u8 Arena_PlayResultSong[];
extern const u8 Augury_InitResultScreen[];
extern const u8 BackgroundSlide_Init[];
extern const u8 BonusClaimMenu_Init[];
extern const u8 BonusClaimMenu_PromptSong3[];
extern const u8 BonusClaimMenu_PromptSong4[];
extern const u8 BonusClaimMenu_SaveData[];
extern const u8 BonusClaimMenu_WaitInput[];
extern const u8 BoxDialogueDrawTextProc_Init[];
extern const u8 BoxDialogueDrawText_AfterScroll[];
extern const u8 BoxDialogueDrawText_Finish[];
extern const u8 BoxDialogueDrawText_Init[];
extern const u8 BoxDialogueDrawText_ResizeBox[];
extern const u8 BoxDialogueDrawText_ScrollLines[];
extern const u8 BoxDialogueDrawText_WaitIdle[];
extern const u8 BoxDialogueInterpreter_Main[];
extern const u8 CgTextExists[];
extern const u8 CgTextInterpreter_0[];
extern const u8 CgTextInterpreter_1[];
extern const u8 CgTextInterpreter_2[];
extern const u8 CgTextInterpreter_Loop_Main[];
extern const u8 CgText_0[];
extern const u8 CgText_1[];
extern const u8 CgText_2[];
extern const u8 CgText_Init[];
extern const u8 CgText_InitBlendAmt[];
extern const u8 CgText_InitFadeOut[];
extern const u8 CgText_LoopFadeIn[];
extern const u8 CgText_LoopFadeOut[];
extern const u8 CgText_OnEnd[];
extern const u8 ClassInfoDisplay_ExecScript[];
extern const u8 ClassInfoDisplay_Init[];
extern const u8 ClassInfoDisplay_LoopScript[];
extern const u8 ClassInfoDisplay_LoopWindowIn[];
extern const u8 ClassInfoDisplay_OnEnd[];
extern const u8 ClassIntroBurst_Init[];
extern const u8 ClassIntroBurst_Loop[];
extern const u8 ClassIntroIcon_Init[];
extern const u8 ClassIntroIcon_LoopDisplay[];
extern const u8 ClassIntroIcon_LoopFadeIn[];
extern const u8 ClassIntroIcon_LoopFadeOut[];
extern const u8 ClassIntroLetter_Init[];
extern const u8 ClassIntroLetter_LoopDisplay[];
extern const u8 ClassIntroLetter_LoopFadeIn[];
extern const u8 ClassIntroLetter_LoopFadeOut[];
extern const u8 ClassIntro_DisableAllExceptBg1[];
extern const u8 ClassIntro_Init[];
extern const u8 ClassIntro_LoopIn[];
extern const u8 ClassIntro_LoopOut[];
extern const u8 ClassIntro_OnEnd[];
extern const u8 ClassStatsDisplay_Init[];
extern const u8 ClassStatsDisplay_Loop[];
extern const u8 CloseHelpBox_bug[];
extern const u8 DemonKingSummonAnim_Cleanup[];
extern const u8 DemonKingSummonAnim_Init[];
extern const u8 DemonKingSummonAnim_OnEnd[];
extern const u8 DemonKingSummonAnim_PhaseBurst[];
extern const u8 DemonKingSummonAnim_PhaseDissolve[];
extern const u8 DemonKingSummonAnim_PhaseFlashWhite[];
extern const u8 DemonKingSummonAnim_PhaseIntro[];
extern const u8 DemonKingSummonAnim_PhaseOutro[];
extern const u8 DemonKingSummonAnim_PhaseShakeRamp[];
extern const u8 DemonKingSummonShake_Init[];
extern const u8 DemonKingSummonShake_Loop[];
extern const u8 DirectSoundData_btl_mon_magic1_13k[];
extern const u8 DirectSoundData_sys_chapter_start3_13k[];
extern const u8 EndManimLevelUpStatGainLabels[];
extern const u8 EventScrWM_MessedEventscr_52[];
extern const u8 EventScr_CallOnTutorialMode[];
extern const u8 EventScr_Ch21b_BeginningScene[];
extern const u8 EventScr_EphraimModeGameEnd[];
extern const u8 EventScr_Ruin_54[];
extern const u8 EventScr_Ruin_55[];
extern const u8 EventScr_Ruin_56[];
extern const u8 EventScr_Ruin_57[];
extern const u8 EventScr_Ruin_58[];
extern const u8 EventScr_Ruin_84[];
extern const u8 ExecExtraMap[];
extern const u8 ExtraMapStartSomeBgm[];
extern const u8 FortuneSubMenu_HandleOptionSwitch[];
extern const u8 FortuneSubMenu_OnOptionSelected[];
extern const u8 GlowBlendCtrl_OnInit[];
extern const u8 GlowBlendCtrl_OnLoop[];
extern const u8 HbPopulate_BkselWTriEffA[];
extern const u8 HbPopulate_BkselWTriEffB[];
extern const u8 HbPopulate_SSCharacter[];
extern const u8 HbPopulate_SSClass[];
extern const u8 HbPopulate_SSItem[];
extern const u8 HbPopulate_SSPower[];
extern const u8 HbPopulate_SSStatus[];
extern const u8 HbPopulate_SSWExp[];
extern const u8 HbRedirect_SSItem[];
extern const u8 HbRedirect_SSSupports[];
extern const u8 HelpBoxDrawOneLineExt[];
extern const u8 HelpBoxLock_OnIdle[];
extern const u8 HelpBoxMoveCtrl_OnIdle[];
extern const u8 HelpBoxMoveCtrl_OnInitBox[];
extern const u8 Img_GespenstBg4[];
extern const u8 InitShopBuyStatus[];
extern const u8 InitShopSellStatus[];
extern const u8 IsCgTextBlocking[];
extern const u8 IsMusicProc2Running[];
extern const u8 MapAnimMonsterStone_Init[];
extern const u8 MapEventcallFx0_ClearBg2[];
extern const u8 MapEventcallFx0_FillWhiteTile[];
extern const u8 MapEventcallFx0_Init[];
extern const u8 MapEventcallFx0_PlayIntroAnim[];
extern const u8 MapEventcallFx0_PlayMainAnim[];
extern const u8 MapEventcallFx0_RampToWhite[];
extern const u8 MelkaenCoastMapChanges[];
extern const u8 PostSaveMenuHandler[];
extern const u8 PrepItemUseBooster_IDLE[];
extern const u8 PrepItemUseBooster_OnEnd[];
extern const u8 PrepItemUseBooster_OnInit[];
extern const u8 PrepItemUseJuna_IDLE[];
extern const u8 PrepItemUseJuna_OnEnd[];
extern const u8 PrepItemUseJuna_OnInit[];
extern const u8 SallyCir_Init[];
extern const u8 SallyCir_Loop[];
extern const u8 SameMenu_CtrlLoop[];
extern const u8 SaveMenuDirectlySelectSlotOnPrepScreen[];
extern const u8 SaveMenuExtraSlotSelectLoop[];
extern const u8 SaveMenuExtrasMenuLoop[];
extern const u8 SaveMenuInit[];
extern const u8 SaveMenuLoadExtraOptionGfx[];
extern const u8 SaveMenuPostExtraMiscScreen[];
extern const u8 SaveMenuRegisterSlotSelected[];
extern const u8 SaveMenuScrollBackToMain[];
extern const u8 SaveMenuScrollExtraSlotIn[];
extern const u8 SaveMenuScrollExtraSlotOut[];
extern const u8 SaveMenuScrollExtrasIn[];
extern const u8 SaveMenuScrollExtrasOut[];
extern const u8 SaveMenuScrollSlot[];
extern const u8 SaveMenuSlotSelDrawSprite[];
extern const u8 SaveMenuStartBonusClaim[];
extern const u8 SaveMenuWaitSlotBoxScrolling[];
extern const u8 SaveMenu_EndHelpPromptSprite[];
extern const u8 SaveMenu_Init[];
extern const u8 SaveMenu_InitScreen[];
extern const u8 SaveMenu_JumpToTarget[];
extern const u8 SaveMenu_LoadExtraMenuGraphics[];
extern const u8 SaveMenu_PostDifficultHandler[];
extern const u8 SaveMenu_ReloadScreenFormDifficulty[];
extern const u8 SaveMenu_ResetLcdFormDifficulty[];
extern const u8 SaveMenu_SaveSlotSelectLoop[];
extern const u8 SaveMenu_SetLcdChapterIdx[];
extern const u8 ShowPrepScreenMenuActiveHand[];
extern const u8 SpriteArray_PrepChapterNumbers[];
extern const u8 Sprite_PrepExMap[];
extern const u8 SqMask_Loop[];
extern const u8 StartBonusClaimScreen[];
extern const u8 StartEndingCredits[];
extern const u8 StartEndingTurnRecordScreen[];
extern const u8 StartMapSongBgm[];
extern const u8 StartSupportScreenFromPrepScreen[];
extern const u8 StartTraineePromoScreen[];
extern const u8 SummonGfxAnim_Init[];
extern const u8 SummonGfxAnim_Loop[];
extern const u8 SummonUnitGfx_End[];
extern const u8 SummonUnitGfx_Loop[];
extern const u8 TraineePromo_ResetScreenEffect[];
extern const u8 Tsa_Mapeventcall_0[];
extern const u8 Tsa_Mapeventcall_1[];
extern const u8 Tsa_Mapeventcall_10[];
extern const u8 Tsa_Mapeventcall_11[];
extern const u8 Tsa_Mapeventcall_12[];
extern const u8 Tsa_Mapeventcall_13[];
extern const u8 Tsa_Mapeventcall_14[];
extern const u8 Tsa_Mapeventcall_15[];
extern const u8 Tsa_Mapeventcall_16[];
extern const u8 Tsa_Mapeventcall_17[];
extern const u8 Tsa_Mapeventcall_2[];
extern const u8 Tsa_Mapeventcall_3[];
extern const u8 Tsa_Mapeventcall_4[];
extern const u8 Tsa_Mapeventcall_5[];
extern const u8 Tsa_Mapeventcall_6[];
extern const u8 Tsa_Mapeventcall_7[];
extern const u8 Tsa_Mapeventcall_8[];
extern const u8 Tsa_Mapeventcall_9[];
extern const u8 UnitDef_Tower1Ally[];
extern const u8 UnitDef_Tower2Ally[];
extern const u8 UnitDef_Tower3Ally[];
extern const u8 UnitDef_Tower4Ally[];
extern const u8 UnitDef_Tower5Ally[];
extern const u8 UnitDef_UnusedAlly_1[];
extern const u8 UnitDef_UnusedAlly_19[];
extern const u8 UnitDef_UnusedAlly_2[];
extern const u8 UnitDef_UnusedAlly_20[];
extern const u8 UnitDef_UnusedAlly_3[];
extern const u8 UnitDef_UnusedAlly_4[];
extern const u8 UnitDef_UnusedAlly_5[];
extern const u8 UnitDef_UnusedMixed[];
extern const u8 UnitListScreenSprites_Init[];
extern const u8 UnitListScreenSprites_Main[];
extern const u8 WmSell_Init[];
extern const u8 WmSell_OnEnd[];
extern const u8 WmSell_OnInit_ConfirmSell[];
extern const u8 WmSell_OnInit_ItemSelect[];
extern const u8 WmSell_OnLoop_ConfirmSellKeyHandler[];
extern const u8 WmSell_OnLoop_MainKeyHandler[];
extern const u8 WmSell_Setup[];
extern const u8 YesNoChoice_Loop_KeyHandler[];
extern const u8 _DisplayShopUiArrows[];
extern const u8 _ExecSaveMenuMiscOption[];
extern const u8 data_085B9EE8[];
extern const u8 UnitDef_UnusedAlly_18[];
extern const u8 dat_REDA_08926134_ref[];
extern u32 data_08A9548C[];
extern u32 data_08A95AD8[];
extern const u8 sSprite_ClassDisplay_A[];
extern const u8 frontier_chap_title_000_A7E188[];
extern const u8 frontier_chap_title_001_A7E504[];
extern const u8 frontier_chap_title_002_A7E800[];
extern const u8 frontier_chap_title_003_A7EB7C[];
extern const u8 frontier_chap_title_004_A7EF88[];
extern const u8 frontier_chap_title_005_A7F360[];
extern const u8 frontier_chap_title_006_A7F754[];
extern const u8 frontier_chap_title_007_A7FAA4[];
extern const u8 frontier_chap_title_008_A7FE84[];
extern const u8 frontier_chap_title_009_A8021C[];
extern const u8 frontier_chap_title_010_A80584[];
extern const u8 frontier_chap_title_011_A808BC[];
extern const u8 frontier_chap_title_012_A80CA0[];
extern const u8 frontier_chap_title_013_A81068[];
extern const u8 frontier_chap_title_014_A813F8[];
extern const u8 frontier_chap_title_015_A81774[];
extern const u8 frontier_chap_title_016_A81B1C[];
extern const u8 frontier_chap_title_017_A81F28[];
extern const u8 frontier_chap_title_018_A82294[];
extern const u8 frontier_chap_title_019_A8258C[];
extern const u8 frontier_chap_title_020_A829B4[];
extern const u8 frontier_chap_title_021_A82D58[];
extern const u8 frontier_chap_title_022_A8306C[];
extern const u8 frontier_chap_title_023_A833D4[];
extern const u8 frontier_chap_title_024_A8383C[];
extern const u8 frontier_chap_title_025_A83C0C[];
extern const u8 frontier_chap_title_026_A83F64[];
extern const u8 frontier_chap_title_027_A8436C[];
extern const u8 frontier_chap_title_028_A84720[];
extern const u8 frontier_chap_title_029_A84BFC[];
extern const u8 frontier_chap_title_030_A84F64[];
extern const u8 frontier_chap_title_031_A852E8[];
extern const u8 frontier_chap_title_032_A85670[];
extern const u8 frontier_chap_title_033_A859E4[];
extern const u8 frontier_chap_title_034_A85D6C[];
extern const u8 frontier_chap_title_035_A860F4[];
extern const u8 frontier_chap_title_036_A86460[];
extern const u8 frontier_chap_title_037_A867E4[];
extern const u8 frontier_chap_title_038_A86B60[];
extern const u8 frontier_chap_title_039_A86EF8[];
extern const u8 frontier_chap_title_040_A8729C[];
extern const u8 frontier_chap_title_041_A8765C[];
extern const u8 frontier_chap_title_042_A87A14[];
extern const u8 frontier_chap_title_043_A87DBC[];
extern const u8 frontier_chap_title_044_A88174[];
extern const u8 frontier_chap_title_045_A88530[];
extern const u8 frontier_chap_title_046_A888D0[];
extern const u8 frontier_chap_title_047_A88C8C[];
extern const u8 frontier_chap_title_048_A89048[];
extern const u8 frontier_chap_title_049_A89428[];
extern const u8 frontier_chap_title_050_A89710[];
extern const u8 frontier_chap_title_051_A899E8[];
extern const u8 frontier_chap_title_052_A89CD8[];
extern const u8 frontier_chap_title_053_A89F80[];
extern const u8 frontier_chap_title_054_A8A260[];
extern const u8 frontier_chap_title_055_A8A5A0[];
extern const u8 frontier_chap_title_056_A8A85C[];
extern const u8 frontier_chap_title_057_A8AB8C[];
extern const u8 frontier_chap_title_058_A8AE74[];
extern const u8 frontier_chap_title_059_A8B168[];
extern const u8 frontier_chap_title_060_A8B39C[];
extern const u8 frontier_chap_title_061_A8B5DC[];
extern const u8 frontier_chap_title_062_A8B7F0[];
extern const u8 frontier_chap_title_063_A8BB88[];
extern const u8 frontier_chap_title_064_A8BFB0[];
extern const u8 frontier_chap_title_065_A8C0EC[];
extern const u8 frontier_chap_title_066_A8C1E4[];
extern const u8 frontier_chap_title_067_A8C308[];
extern const u8 frontier_chap_title_068_A8C424[];
extern const u8 frontier_chap_title_069_A8C534[];
extern const u8 frontier_chap_title_070_A8C734[];
extern const u8 frontier_chap_title_071_A8C854[];
extern const u8 frontier_chap_title_072_A8C974[];
extern const u8 frontier_chap_title_073_A8CA74[];
extern const u8 frontier_chap_title_074_A8CB94[];
extern const u8 frontier_chap_title_075_A8CCAC[];
extern const u8 frontier_chap_title_076_A8CDF8[];
extern const u8 frontier_chap_title_077_A8CF14[];
extern const u8 frontier_chap_title_078_A8D064[];
extern const u8 frontier_chap_title_079_A8D1B0[];
extern const u8 frontier_chap_title_080_A8D2F4[];
extern const u8 frontier_chap_title_081_A8D430[];
extern const u8 frontier_chap_title_082_A8D574[];
extern const u8 frontier_chap_title_083_A8D6AC[];
extern const u8 frontier_chap_title_084_A8D7F4[];
extern const u8 frontier_chap_title_085_A8D948[];
extern const u8 frontier_chap_title_086_A8DAB0[];
extern const u8 frontier_chap_title_087_A8DBFC[];
extern const u8 frontier_chap_title_088_A8DE6C[];
extern const u8 frontier_chap_title_089_A8E080[];
extern const u8 frontier_chap_title_090_A8E2EC[];
extern const u8 frontier_chap_title_091_A8E600[];
extern const u8 frontier_chap_title_092_A8E8C8[];
extern const u8 frontier_chap_title_093_A8EAF8[];
extern const u8 frontier_chap_title_094_A8ED30[];
extern const u8 frontier_chap_title_095_A8EFFC[];
extern const u8 frontier_chap_title_096_A8F28C[];
extern const u8 frontier_chap_title_097_A8F4CC[];
extern const u8 frontier_chap_title_098_A8F6F8[];
extern const u8 frontier_chap_title_099_A8F9C0[];
extern const u8 frontier_chap_title_100_A8FC68[];
extern const u8 frontier_chap_title_101_A8FEC0[];
extern const u8 frontier_chap_title_102_A900FC[];
extern const u8 frontier_chap_title_103_A90378[];
extern const u8 frontier_chap_title_104_A9065C[];
extern const u8 frontier_chap_title_105_A90898[];
extern const u8 frontier_chap_title_106_A90A98[];
extern const u8 frontier_chap_title_107_A90D84[];
extern const u8 frontier_chap_title_108_A90FF0[];
extern const u8 frontier_chap_title_109_A911D0[];
extern const u8 frontier_chap_title_110_A91418[];
extern const u8 frontier_chap_title_111_A91760[];
extern const u8 frontier_chap_title_112_A919F8[];
extern const u8 frontier_chap_title_113_A91C28[];
extern const u8 frontier_chap_title_114_A91F08[];
extern const u8 frontier_chap_title_115_A92170[];
extern const u8 frontier_df3_eventscr_ch_021_A6FC48[];
extern u8 frontier_df4_menu_005_A5FFAD[];
extern EventListScr frontier_df4_menu_011_A71268[];
extern const u8 frontier_df4_misc_lo_021cb_1F5664[];
extern const u8 frontier_df4_voice_000_1F578C[];
extern const u8 gAutoUdefJids[];
extern const u8 gChDAsset_140[];
extern const u8 gChDAsset_143[];
extern const u8 gChDAsset_146[];
extern const u8 gChDAsset_149[];
extern const u8 gDivinationDataTable[];
extern const u8 gHelpInfo_CbpHp[];
extern const u8 gHelpInfo_MbpHp[];
extern const u8 gHelpInfo_Ss0Pow[];
extern const u8 gHelpInfo_Ss1Item0[];
extern const u8 gHelpInfo_Ss2Rank0[];
extern const u8 gMapanimEventcall_191[];
extern const u8 gMapanimEventcall_192[];
extern const u8 gMapanimEventcall_193[];
extern const u8 gMapanimEventcall_194[];
extern const u8 gMapanimEventcall_195[];
extern const u8 gMapanimEventcall_196[];
extern const u8 gMapanimEventcall_197[];
extern const u8 gMapanimEventcall_198[];
extern const u8 gMapanimEventcall_199[];
extern const u8 gMapanimEventcall_200[];
extern const u8 gMapanimEventcall_201[];
extern const u8 gMapanimEventcall_202[];
extern const u8 gMapanimEventcall_203[];
extern const u8 gMapanimEventcall_204[];
extern const u8 gMapanimEventcall_205[];
extern const u8 gMapanimEventcall_206[];
extern const u8 gMapanimEventcall_207[];
extern const u8 gMapanimEventcall_208[];
extern const u8 gMapanimEventcall_209[];
extern const u8 gMapanimEventcall_210[];
extern const u8 gMapanimEventcall_211[];
extern const u8 gMapanimEventcall_212[];
extern const u8 gMapanimEventcall_213[];
extern const u8 gMapanimEventcall_214[];
extern const u8 gMapanimEventcall_215[];
extern const u8 gMapanimEventcall_216[];
extern const u8 gMapanimEventcall_217[];
extern const u8 gMapanimEventcall_218[];
extern const u8 gMapanimEventcall_219[];
extern const u8 gMapanimEventcall_220[];
extern const u8 gMapanimEventcall_221[];
extern const u8 gMapanimEventcall_222[];
extern const u8 gMapanimEventcall_223[];
extern const u8 gMapanimEventcall_224[];
extern const u8 gMapanimEventcall_225[];
extern const u8 gMapanimEventcall_226[];
extern const u8 gMapanimEventcall_227[];
extern const u8 gMapanimEventcall_228[];
extern const u8 gMapanimEventcall_229[];
extern const u8 gMapanimEventcall_230[];
extern const u8 gMapanimEventcall_231[];
extern const u8 gMapanimEventcall_232[];
extern const u8 gMapanimEventcall_233[];
extern const u8 gMapanimEventcall_234[];
extern const u8 gMapanimEventcall_235[];
extern const u8 gMapanimEventcall_236[];
extern const u8 gMapanimEventcall_237[];
extern const u8 gMapanimEventcall_238[];
extern const u8 gMapanimEventcall_239[];
extern const u8 gMapanimEventcall_240[];
extern const u8 gMapanimEventcall_241[];
extern const u8 gMapanimEventcall_242[];
extern const u8 gMapanimEventcall_243[];
extern const u8 gMapanimEventcall_244[];
extern const u8 gMapanimEventcall_245[];
extern const u8 gMapanimEventcall_246[];
extern const u8 gMapanimEventcall_247[];
extern const u8 gMapanimEventcall_248[];
extern const u8 gMapanimEventcall_249[];
extern const u8 gMapanimEventcall_250[];
extern const u8 gMapanimEventcall_251[];
extern const u8 gMapanimEventcall_252[];
extern const u8 gMapanimEventcall_253[];
extern const u8 gMapanimEventcall_254[];
extern const u8 gMapanimEventcall_255[];
extern const u8 gMapanimEventcall_256[];
extern const u8 gMapanimEventcall_257[];
extern const u8 gMapanimEventcall_258[];
extern const u8 gMapanimEventcall_259[];
extern const u8 gMapanimEventcall_260[];
extern const u8 gMapanimEventcall_261[];
extern const u8 gMapanimEventcall_262[];
extern const u8 gMapanimEventcall_263[];
extern const u8 gMapanimEventcall_264[];
extern const u8 gMapanimEventcall_265[];
extern const u8 gMapanimEventcall_266[];
extern const u8 gMapanimEventcall_267[];
extern const u8 gMapanimEventcall_268[];
extern const u8 gMapanimEventcall_269[];
extern const u8 gMapanimEventcall_270[];
extern const u8 gMapanimEventcall_271[];
extern const u8 gMapanimEventcall_272[];
extern const u8 gMapanimEventcall_273[];
extern const u8 gMapanimEventcall_274[];
extern const u8 gMapanimEventcall_275[];
extern const u8 gMapanimEventcall_276[];
extern const u8 gMapanimEventcall_277[];
extern const u8 gMapanimEventcall_278[];
extern const u8 gMapanimEventcall_279[];
extern const u8 gMapanimEventcall_280[];
extern const u8 gMapanimEventcall_281[];
extern const u8 gMapanimEventcall_282[];
extern const u8 gMapanimEventcall_283[];
extern const u8 gMapanimEventcall_284[];
extern const u8 gMapanimEventcall_285[];
extern const u8 gMapanimEventcall_286[];
extern const u8 gMapanimEventcall_287[];
extern const u8 gMapanimEventcall_288[];
extern const u8 gMapanimEventcall_289[];
extern const u8 gMapanimEventcall_290[];
extern const u8 gMapanimEventcall_291[];
extern const u8 gMapanimEventcall_292[];
extern const u8 gOpinfo_0[];
extern const u8 gOpinfo_1[];
extern const u8 gPrepItemTextMsgIds[];
extern const u8 gProcScr_85B9D0C[];
extern const u8 gProcScr_PrepWMShopSell[];
extern const u8 gProcScr_opinfogaugedraw[];
extern const u8 gSprite_MusicPlayer_Colon[];
extern const u8 gUidebug_0[];
extern const u8 gUnkData_ClassIntroBgConfig[];
extern const u8 gap_000AE5A4[];
extern const u8 nullsub_76[];
extern const u8 nullsub_80[];
extern const u8 nullsub_82[];
extern const u8 sHelpInfo_ChapterStatus_AllyUnits[];
extern const u8 sHelpInfo_ChapterStatus_EnemyUnits[];
extern const u8 sHelpInfo_ChapterStatus_Funds[];
extern const u8 sHelpInfo_ChapterStatus_Goal[];
extern const u8 sHelpInfo_ChapterStatus_Leader[];
extern const u8 sHelpInfo_ChapterStatus_TimePlayed[];
extern const u8 sHelpInfo_ChapterStatus_TurnCount[];
extern const u8 sSpriteLut_GaugePips[];
extern const u8 sSprite_ClassDisplay_B[];
extern const u8 sSprite_ClassDisplay_C[];
extern const u8 sSprite_ClassDisplay_D[];
extern const u8 sSprite_ClassDisplay_E[];
extern const u8 sSprite_ClassDisplay_F[];
extern const u8 sSprite_ClassDisplay_G[];
extern const u8 sSprite_ClassDisplay_H[];
extern const u8 sSprite_ClassDisplay_I[];
extern const u8 sSprite_ClassDisplay_L[];
extern const u8 sSprite_ClassDisplay_M[];
extern const u8 sSprite_ClassDisplay_N[];
extern const u8 sSprite_ClassDisplay_P[];
extern const u8 sSprite_ClassDisplay_R[];
extern const u8 sSprite_ClassDisplay_S[];
extern const u8 sSprite_ClassDisplay_T[];
extern const u8 sSprite_ClassDisplay_V[];
extern const u8 sSprite_ClassDisplay_W[];
extern const u8 sSprite_ClassDisplay_Z[];
extern const u8 sSprite_Opinfo_13[];
extern const u8 sub_80831C4[];
extern const u8 sub_8099D78[];
extern const u8 sub_80A2DF8[];
extern const u8 sub_80A3074[];
extern const u8 sub_80A3118[];
extern const u8 sub_80A3228[];
extern const u8 sub_80A3250[];
extern const u8 sub_80A3274[];
extern const u8 sub_80A32C0[];
extern const u8 sub_80A3458[];
extern const u8 sub_80A3898[];
extern const u8 sub_80A3C64[];
extern const u8 sub_80A3CEC[];
extern const u8 sub_80A3E24[];
extern const u8 sub_80A3EF8[];
extern const u8 sub_80A3F68[];
extern const u8 sub_80A4088[];
extern const u8 sub_80A421C[];
extern const u8 sub_80A43A0[];
extern const u8 sub_80A43E4[];
extern const u8 sub_80A4428[];
extern const u8 sub_80A447C[];
extern const u8 sub_80A44D0[];
extern const u8 sub_80A44F0[];
extern const u8 sub_80A4544[];
extern const u8 sub_80A4568[];
extern const u8 sub_80A45AC[];
extern const u8 sub_80A4608[];
extern const u8 sub_80A462C[];
extern const u8 sub_80A467C[];
extern const u8 sub_80A46C0[];
extern const u8 sub_80A46DC[];
extern const u8 sub_80A46F8[];
extern const u8 sub_80A4738[];
extern const u8 sub_80A47D0[];
extern const u8 sub_80A74D4[];
extern const u8 sub_80A7620[];
extern const u8 sub_80AEBAC[];
extern const u8 sub_80B0E88[];


extern void BonusClaim_ClearItemSentPopup();
extern void BonusClaim_DrawItemSentPopup();
extern void BonusClaim_EndSelectTargetSubMenu();
extern void BonusClaim_Init();
extern void BonusClaim_Loop_MainKeyHandler();
extern void BonusClaim_Loop_PopupDisplayTimer();
extern void BonusClaim_Loop_SelectTargetKeyHandler();
extern void BonusClaim_OnEnd();
extern void BonusClaim_StartSelectTargetSubMenu();
extern void SoundRoomSongChange_FadeOutPrevious();
extern void SoundRoomSongChange_StartNext();
extern void VolumeGraphBuffer_Loop();
extern void nullsub_89();
extern void sub_80B3E40();

extern void PrepMenu_CtrlLoop();
extern void PrepMenu_OnEnd();
extern void PrepMenu_OnInit();
extern void PrepMenu_ShowActiveHand();
extern void PrepMenu_ShowFrozenHand();
extern void SaveMenuPopupHelpBox_Init();
extern void SaveMenuPopupHelpBox_WaitInput();
extern void SoundRoomUi_0();
extern void SoundRoomUi_1();
extern void SoundRoomUi_2();
extern void SoundRoomUi_3();
extern void SoundRoomUi_Init();
extern void SoundRoomUi_Loop_MainKeyHandler();
extern void SoundRoomUi_Loop_MainUiSlideIn();
extern void SoundRoomUi_Loop_MainUiSlideOut();
extern void SoundRoomUi_Loop_ShufflePlayKeyHandler();
extern void SoundRoomUi_Loop_ShufflePlayUiSlideIn();
extern void SoundRoomUi_Loop_ShufflePlayUiSlideOut();
extern void SoundRoomUi_OnEnd();
extern void SoundRoomUi_RestartTitleMusic();
extern void SoundRoom_DrawSprites_Loop();
extern void sub_80B4F34();

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
extern const u8 UnitDef_LordSplitAlly[];
extern const u8 UnitDef_Ch8NPC[];
extern const u8 UnitDef_Ch8Enemy_5[];
extern const u8 UnitDef_Ch8Enemy_6[];
extern const u8 UnitDef_Ch8Enemy_7[];
extern const u8 UnitDef_Ch12AAlly_0[];
extern const u8 UnitDef_Ch12AAlly_1[];
extern const u8 UnitDef_Ch12AMixed[];
extern const u8 UnitDef_Ch12AEnemy_4[];
extern const u8 UnitDef_Ch13AEnemy_10[];
extern const u8 UnitDef_Ch13AEnemy_11[];
extern const u8 UnitDef_Ch13AAlly_0[];
extern const u8 UnitDef_Ch13AAlly_1[];
extern const u8 EventScr_LoadUnitForTutorial[];
extern const u8 EventScr_LoadReinforce[];
extern const u8 EventScr_LoadReinforceHardMode[];
extern const u8 EventScr_SetBackground[];
extern const u8 Event_TextWithBG[];
extern const u8 EventScr_CallBreakStone[];
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
extern u32 frontier_df4_menu_013_A72408[];

/* Migrated from asm/frontier_df4_menu.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_menu_000_A149D4[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&MapEventcallFx0_Init + 0x1,
    0x00000003,
    (u32)&MapEventcallFx0_PlayIntroAnim + 0x1,
    0x001E000E,
    0x00000000,
    0x00000003,
    (u32)&MapEventcallFx0_PlayMainAnim + 0x1,
    0x00000003,
    (u32)&MapEventcallFx0_FillWhiteTile + 0x1,
    0x00000003,
    (u32)&MapEventcallFx0_RampToWhite + 0x1,
    0x00000002,
    (u32)&MapEventcallFx0_ClearBg2 + 0x1,
    0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_MapanimEventcall_1[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)MapEventcallFx1_Init + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx1_FadeWhiteDown + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx1_PlayFadeAnim + 0x1)),
    PROC_CALL((void*)((u8*)MapEventcallFx1_ClearBgs + 0x1)), PROC_SLEEP(0x3C), PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap0_445[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    (u32)&gMapanimEventcall_191,
    (u32)&gMapanimEventcall_199,
    (u32)&gMapanimEventcall_207,
    (u32)&gMapanimEventcall_192,
    (u32)&gMapanimEventcall_200,
    (u32)&gMapanimEventcall_208,
    (u32)&gMapanimEventcall_193,
    (u32)&gMapanimEventcall_201,
    (u32)&gMapanimEventcall_209,
    (u32)&gMapanimEventcall_194,
    (u32)&gMapanimEventcall_202,
    (u32)&gMapanimEventcall_210,
    (u32)&gMapanimEventcall_195,
    (u32)&gMapanimEventcall_203,
    (u32)&gMapanimEventcall_211,
    (u32)&gMapanimEventcall_196,
    (u32)&gMapanimEventcall_204,
    (u32)&gMapanimEventcall_212,
    (u32)&gMapanimEventcall_197,
    (u32)&gMapanimEventcall_205,
    (u32)&gMapanimEventcall_213,
    (u32)&gMapanimEventcall_198,
    (u32)&gMapanimEventcall_206,
    (u32)&gMapanimEventcall_214,
};
struct ProcCmd ProcScr_MapanimEventcall_2[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SET_END_CB((void*)((u8*)MapEventcallFx2_OnEnd + 0x1)), PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)MapEventcallFx2_Init + 0x1)), PROC_REPEAT((void*)((u8*)MapEventcallFx2_PlayAnim + 0x1)),
    PROC_REPEAT((void*)((u8*)MapEventcallFx2_RampToWhite + 0x1)), PROC_SLEEP(0x1E), PROC_REPEAT((void*)((u8*)MapEventcallFx2_FadeOutBlend + 0x1)), PROC_CALL((void*)((u8*)MapEventcallFx2_ClearBgs + 0x1)),
    PROC_SLEEP(0x3C), PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
struct ProcCmd ProcScr_MapanimEventcall_3[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x0), PROC_REPEAT((void*)((u8*)MapanimEventcall_VsyncWaveLoop + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap0_460[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    (u32)&gMapanimEventcall_215,
    (u32)&gMapanimEventcall_241,
    (u32)&gMapanimEventcall_267,
    (u32)&gMapanimEventcall_216,
    (u32)&gMapanimEventcall_242,
    (u32)&gMapanimEventcall_268,
    (u32)&gMapanimEventcall_217,
    (u32)&gMapanimEventcall_243,
    (u32)&gMapanimEventcall_269,
    (u32)&gMapanimEventcall_218,
    (u32)&gMapanimEventcall_244,
    (u32)&gMapanimEventcall_270,
    (u32)&gMapanimEventcall_219,
    (u32)&gMapanimEventcall_245,
    (u32)&gMapanimEventcall_271,
    (u32)&gMapanimEventcall_220,
    (u32)&gMapanimEventcall_246,
    (u32)&gMapanimEventcall_272,
    (u32)&gMapanimEventcall_221,
    (u32)&gMapanimEventcall_247,
    (u32)&gMapanimEventcall_273,
    (u32)&gMapanimEventcall_222,
    (u32)&gMapanimEventcall_248,
    (u32)&gMapanimEventcall_274,
    (u32)&gMapanimEventcall_223,
    (u32)&gMapanimEventcall_249,
    (u32)&gMapanimEventcall_275,
    (u32)&gMapanimEventcall_224,
    (u32)&gMapanimEventcall_250,
    (u32)&gMapanimEventcall_276,
    (u32)&gMapanimEventcall_225,
    (u32)&gMapanimEventcall_251,
    (u32)&gMapanimEventcall_277,
    (u32)&gMapanimEventcall_226,
    (u32)&gMapanimEventcall_252,
    (u32)&gMapanimEventcall_278,
    (u32)&gMapanimEventcall_227,
    (u32)&gMapanimEventcall_253,
    (u32)&gMapanimEventcall_279,
    (u32)&gMapanimEventcall_228,
    (u32)&gMapanimEventcall_254,
    (u32)&gMapanimEventcall_280,
    (u32)&gMapanimEventcall_229,
    (u32)&gMapanimEventcall_255,
    (u32)&gMapanimEventcall_281,
    (u32)&gMapanimEventcall_230,
    (u32)&gMapanimEventcall_256,
    (u32)&gMapanimEventcall_282,
    (u32)&gMapanimEventcall_231,
    (u32)&gMapanimEventcall_257,
    (u32)&gMapanimEventcall_283,
    (u32)&gMapanimEventcall_232,
    (u32)&gMapanimEventcall_258,
    (u32)&gMapanimEventcall_284,
    (u32)&gMapanimEventcall_233,
    (u32)&gMapanimEventcall_259,
    (u32)&gMapanimEventcall_285,
    (u32)&gMapanimEventcall_234,
    (u32)&gMapanimEventcall_260,
    (u32)&gMapanimEventcall_286,
    (u32)&gMapanimEventcall_235,
    (u32)&gMapanimEventcall_261,
    (u32)&gMapanimEventcall_287,
    (u32)&gMapanimEventcall_236,
    (u32)&gMapanimEventcall_262,
    (u32)&gMapanimEventcall_288,
    (u32)&gMapanimEventcall_237,
    (u32)&gMapanimEventcall_263,
    (u32)&gMapanimEventcall_289,
    (u32)&gMapanimEventcall_238,
    (u32)&gMapanimEventcall_264,
    (u32)&gMapanimEventcall_290,
    (u32)&gMapanimEventcall_239,
    (u32)&gMapanimEventcall_265,
    (u32)&gMapanimEventcall_291,
    (u32)&gMapanimEventcall_240,
    (u32)&gMapanimEventcall_266,
    (u32)&gMapanimEventcall_292,
    0x00000004,
    (u32)&DemonKingSummonAnim_OnEnd + 0x1,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&DemonKingSummonAnim_Init + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseIntro + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseShakeRamp + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseBurst + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseFlashWhite + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseDissolve + 0x1,
    0x00000003,
    (u32)&DemonKingSummonAnim_PhaseOutro + 0x1,
    0x00000002,
    (u32)&DemonKingSummonAnim_Cleanup + 0x1,
    0x003C000E,
    0x00000000,
    0x00000002,
    (u32)&MapSpellAnim_CommonEnd + 0x1,
    0x00000000,
    0x00000000,
    0x00000002,
    (u32)&DemonKingSummonShake_Init + 0x1,
    0x0000000E,
    0x00000000,
    0x00000003,
    (u32)&DemonKingSummonShake_Loop + 0x1,
    0x00000000,
    0x00000000,
    (u32)&Tsa_Mapeventcall_0,
    (u32)&Tsa_Mapeventcall_1,
    (u32)&Tsa_Mapeventcall_2,
    (u32)&Tsa_Mapeventcall_3,
    (u32)&Tsa_Mapeventcall_4,
    (u32)&Tsa_Mapeventcall_5,
    (u32)&Tsa_Mapeventcall_6,
    (u32)&Tsa_Mapeventcall_7,
    (u32)&Tsa_Mapeventcall_8,
    (u32)&Tsa_Mapeventcall_9,
    (u32)&Tsa_Mapeventcall_10,
    (u32)&Tsa_Mapeventcall_11,
    (u32)&Tsa_Mapeventcall_12,
    (u32)&Tsa_Mapeventcall_13,
    (u32)&Tsa_Mapeventcall_14,
    (u32)&Tsa_Mapeventcall_15,
    (u32)&Tsa_Mapeventcall_16,
    (u32)&Tsa_Mapeventcall_17,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&MapAnimMonsterStone_Init + 0x1,
    0x00000003,
    (u32)&SummonGfxAnim_Loop + 0x1,
    0x00000002,
    (u32)&sub_80831C4 + 0x1,
    0x00000002,
    (u32)&MapSpellAnim_CommonEnd + 0x1,
    0x00000000,
    0x00000000,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&SummonGfxAnim_Init + 0x1,
    0x00000003,
    (u32)&SummonUnitGfx_Loop + 0x1,
    0x00000002,
    (u32)&SummonUnitGfx_End + 0x1,
    0x00000002,
    (u32)&MapSpellAnim_CommonEnd + 0x1,
    0x00000000,
    0x00000000,
};
extern const u8 data_08A14D94 __attribute__((alias("ProcScr_GlowingCross")));
struct ProcCmd ProcScr_GlowingCross[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_SET_END_CB((void*)((u8*)GlowingCross_OnEnd + 0x1)), PROC_CALL((void*)((u8*)GlowingCross_Init + 0x1)), PROC_REPEAT((void*)((u8*)GlowingCross_Loop + 0x1)),
    PROC_END,
};
struct ProcCmd ProcScr_GlowCrossExit[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = {
    PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)GlowCrossExit_Init + 0x1)), PROC_REPEAT((void*)((u8*)GlowCrossExit_Loop + 0x1)), PROC_CALL((void*)((u8*)gap_0008359C + 0x1)),
    PROC_CALL((void*)((u8*)MapSpellAnim_CommonEnd + 0x1)), PROC_END,
};
/* frontier_df4_menu_001_A588C0 tail [0x15C8,0x1A9C): standard TSA header 0x1d 0x13
   (30x20), 600 u16 tile-attr entries (all 0x001F) + 2-byte zero pad (1204 B total,
   matching the fe8u cg_N.tsa.bin convention), then a 32-B 16-color palette that is
   byte-identical to fe8u/fe8j's own Pal_GameOverText2 (src/data/A01CC4/dat_data_A01CC4_2.c)
   -- a separate ROM copy at a different address, so it needs its own definition here. */
u8 frontier_df4_menu_001_A588C0[] __attribute__((section(".data.frontier_df4_menu.gap1"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin", 0x0, 0x1218, "graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0_tail.tsa.bin", "graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0_pal.gbapal");
/* frontier_df4_menu_002_A5D648: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_menu_002_A5D648[] __attribute__((section(".data.frontier_df4_menu.gap2"))) = {
    0x00000000,
    0x00000000,
    0x0000000A,
    (u32)&gUidebug_0 + 0x308,
    0x00161100,
    0x0000000A,
    (u32)&gUidebug_0 + 0x30C,
    0x00171101,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x54,
    0x00000006,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df4_menu_002_A5D648,
    (u32)&frontier_df4_menu_002_A5D648 + 0x4,
    (u32)&frontier_df4_menu_002_A5D648 + 0x8,
    (u32)&frontier_df4_menu_002_A5D648 + 0x24,
    (u32)&frontier_df4_menu_002_A5D648 + 0x40,
    (u32)&frontier_df4_menu_002_A5D648 + 0x44,
    (u32)&frontier_df4_menu_002_A5D648 + 0x48,
    (u32)&frontier_df4_menu_002_A5D648 + 0x4C,
    (u32)&gUidebug_0 + 0x64C,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6C,
    (u32)&UnitDef_Tower1Ally,
    (u32)&UnitDef_Tower1Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&EventScr_Ch21b_BeginningScene + 0x1C,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x54,
    0x00080002,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x168,
    0x0000FF01,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x100,
    0x00000006,
    0x0007000B,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x134,
    0x11130111,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gChDAsset_140 + 0x50,
    (u32)&gChDAsset_140 + 0x60,
    (u32)&gChDAsset_140 + 0x64,
    (u32)&gChDAsset_140 + 0x68,
    (u32)&gChDAsset_140 + 0x90,
    (u32)&gChDAsset_140 + 0x94,
    (u32)&gChDAsset_140 + 0x98,
    (u32)&gChDAsset_140 + 0x9C,
    (u32)&gUidebug_0 + 0x64D,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6D,
    (u32)&UnitDef_Tower2Ally,
    (u32)&UnitDef_Tower2Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x88,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x100,
    0x00000000,
    0x00000000,
    0x00000007,
    0x0BB80077,
    0x0014030A,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4,
    0x00000006,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gChDAsset_143 + 0x50,
    (u32)&gChDAsset_143 + 0x54,
    (u32)&gChDAsset_143 + 0x58,
    (u32)&gChDAsset_143 + 0x68,
    (u32)&gChDAsset_143 + 0x84,
    (u32)&gChDAsset_143 + 0x88,
    (u32)&gChDAsset_143 + 0x8C,
    (u32)&gChDAsset_143 + 0x90,
    (u32)&gUidebug_0 + 0x64E,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6E,
    (u32)&UnitDef_Tower3Ally,
    (u32)&UnitDef_Tower3Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x180,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC,
    0x00000006,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gChDAsset_146 + 0x50,
    (u32)&gChDAsset_146 + 0x54,
    (u32)&gChDAsset_146 + 0x58,
    (u32)&gChDAsset_146 + 0x5C,
    (u32)&gChDAsset_146 + 0x78,
    (u32)&gChDAsset_146 + 0x7C,
    (u32)&gChDAsset_146 + 0x80,
    (u32)&gChDAsset_146 + 0x84,
    (u32)&gUidebug_0 + 0x64F,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x6F,
    (u32)&UnitDef_Tower4Ally,
    (u32)&UnitDef_Tower4Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x238,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC,
    0x00000002,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x388,
    0x00000602,
    0x00000000,
    0x00000000,
    0x00000005,
    (u32)&gUidebug_0 + 0x60,
    0x00140906,
    0x00000005,
    (u32)&gUidebug_0 + 0x6E,
    0x00140E0E,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x354,
    0x00000006,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gChDAsset_149 + 0x50,
    (u32)&gChDAsset_149 + 0x60,
    (u32)&gChDAsset_149 + 0x64,
    (u32)&gChDAsset_149 + 0x80,
    (u32)&gChDAsset_149 + 0x9C,
    (u32)&gChDAsset_149 + 0xA0,
    (u32)&gChDAsset_149 + 0xA4,
    (u32)&gChDAsset_149 + 0xA8,
    (u32)&gUidebug_0 + 0x650,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x70,
    (u32)&UnitDef_Tower5Ally,
    (u32)&UnitDef_Tower5Ally,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x2E0,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x354,
    0x00000000,
    0x00000000,
    0x00000005,
    (u32)&gUidebug_0 + 0x7C,
    0x00141202,
    0x00000005,
    (u32)&gUidebug_0 + 0x86,
    0x0014010C,
    0x00000005,
    (u32)&gUidebug_0 + 0x9A,
    0x0014010A,
    0x00000007,
    0x13880077,
    0x00140113,
    0x00000000,
    0x00000001,
    (u32)&frontier_df3_eventscr_ch_021_A6FC48 + 0x414,
    0x00000006,
    0x00000001,
    (u32)&EventScr_GameOver,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
};
u32 frontier_df4_menu_003_A5E6CC[] __attribute__((section(".data.frontier_df4_menu.gap3"))) = {
    (u32)&MelkaenCoastMapChanges + 0x50,
    (u32)&MelkaenCoastMapChanges + 0x144,
    (u32)&MelkaenCoastMapChanges + 0x148,
    (u32)&MelkaenCoastMapChanges + 0x14C,
    (u32)&MelkaenCoastMapChanges + 0x15C,
    (u32)&MelkaenCoastMapChanges + 0x160,
    (u32)&MelkaenCoastMapChanges + 0x164,
    (u32)&MelkaenCoastMapChanges + 0x168,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x3,
    (u32)&frontier_df4_menu_005_A5FFAD + 0xF8,
    (u32)&UnitDef_MelkaenCoastMixed,
    (u32)&UnitDef_MelkaenCoastMixed,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df4_menu_011_A71268 + 0x2A8,
    (u32)&frontier_df4_menu_011_A71268 + 0x2C8,
    0x00000000,
    0x00000000,
    0x00000005,
    (u32)&EventScr_Ruin_54,
    0x00100101,
    0x00000005,
    (u32)&EventScr_Ruin_56,
    0x00100103,
    0x00000005,
    (u32)&EventScr_Ruin_58,
    0x00100105,
    0x00000000,
    0x0000000B,
    (u32)&gAutoUdefJids + 0x64,
    0x01010101,
    0x0000000B,
    (u32)&EventScr_Ruin_55,
    0x01030103,
    0x0000000B,
    (u32)&EventScr_Ruin_57,
    0x01050105,
    0x00000001,
    (u32)&data_085B9EE8,
    0x00000065,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&frontier_df4_menu_003_A5E6CC + 0x50,
    (u32)&frontier_df4_menu_003_A5E6CC + 0x54,
    (u32)&frontier_df4_menu_003_A5E6CC + 0x58,
    (u32)&frontier_df4_menu_003_A5E6CC + 0x80,
    (u32)&frontier_df4_menu_003_A5E6CC + 0xB4,
    (u32)&frontier_df4_menu_003_A5E6CC + 0xB8,
    (u32)&frontier_df4_menu_003_A5E6CC + 0xBC,
    (u32)&frontier_df4_menu_003_A5E6CC + 0xC0,
    (u32)&frontier_df4_menu_005_A5FFAD + 0x4,
    (u32)&frontier_df4_menu_005_A5FFAD + 0xF9,
    (u32)&UnitDef_UnusedAlly,
    (u32)&UnitDef_UnusedAlly,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gAutoUdefJids + 0x38,
    (u32)&gAutoUdefJids + 0x58,
    0x00020045,
    0x00000040,
    0x000008CA,
    0x00000000,
    0x00680000,
    0x00010000,
    0x000008D6,
    0x00000000,
    0x00000068,
    0x00010000,
    0x000008D6,
    0x00000000,
    0x00460000,
    0x00010001,
    0x000008F5,
    0x00000000,
    0x00000046,
    0x00010001,
    0x000008F5,
    0x00000000,
    0x00470000,
    0x00010002,
    0x00000920,
    0x00000000,
    0x00000047,
    0x00010002,
    0x00000920,
    0x00000000,
    0x00480000,
    0x00010003,
    0x00000953,
    0x00000000,
    0x00000048,
    0x00010003,
    0x00000953,
    0x00000000,
    0x004A0000,
    0x00010006,
    0x00000987,
    0x00000000,
    0x0000004A,
    0x00010006,
    0x00000987,
    0x00000000,
    0x006A0000,
    0x00010005,
    0x0000099F,
    0x00000000,
    0x0000006A,
    0x00010005,
    0x0000099F,
    0x00000000,
    0x004B0000,
    0x00010007,
    0x000009B0,
    0x00000000,
    0x0000004B,
    0x00010007,
    0x000009B0,
    0x00000000,
    0x004C0000,
    0x00010008,
    0x000009C3,
    0x00000000,
    0x0000004C,
    0x00010008,
    0x000009C3,
    0x00000000,
    0x004D0000,
    0x00010009,
    0x000009CF,
    0x00000000,
    0x0000004D,
    0x00010009,
    0x000009CF,
    0x00000000,
    0x004E0000,
    0x0001000A,
    0x000009E1,
    0x00000000,
    0x0000004E,
    0x0001000A,
    0x000009E1,
    0x00000000,
    0x005A0012,
    0x00090017,
    0x00000A6A,
    0x00000000,
    0x005A0000,
    0x00010017,
    0x00000A6B,
    0x00000000,
    0x0000005A,
    0x00010017,
    0x00000A6B,
    0x00000000,
    0x004F000B,
    0x000C000B,
    0x000009F4,
    0x00000000,
    0x004F0000,
    0x0001000B,
    0x000009F5,
    0x00000000,
    0x0000004F,
    0x0001000B,
    0x000009F5,
    0x00000000,
    0x000E001D,
    0x00090018,
    0x00000A7E,
    0x00000000,
    0x005B0000,
    0x00010018,
    0x00000A7F,
    0x00000000,
    0x0000005B,
    0x00010018,
    0x00000A7F,
    0x00000000,
    0x00510001,
    0x0009000D,
    0x00000A31,
    0x00000000,
    0x00510000,
    0x000A000D,
    0x00000A32,
    0x00000000,
    0x00000051,
    0x000A000D,
    0x00000A32,
    0x00000000,
    0x004F0000,
    0x000B000D,
    0x00000A34,
    0x00000000,
    0x0000004F,
    0x000B000D,
    0x00000A34,
    0x00000000,
    0x00440000,
    0x0001001A,
    0x00000AB1,
    0x00000000,
    0x00000044,
    0x0001001A,
    0x00000AB1,
    0x00000000,
    0x00520020,
    0x0007000E,
    0x00000A49,
    0x00000000,
    0x00520000,
    0x0001000E,
    0x00000A4A,
    0x00000000,
    0x00000052,
    0x0001000E,
    0x00000A4A,
    0x00000000,
    0x006B000F,
    0x0007001B,
    0x00000AC2,
    0x00000000,
    0x006B001D,
    0x0008001B,
    0x00000AC3,
    0x00000000,
    0x006B0000,
    0x0001001B,
    0x00000AC4,
    0x00000000,
    0x0000006B,
    0x0001001B,
    0x00000AC4,
    0x00000000,
    0x00430069,
    0x00000041,
    0x00000A12,
    0x00000000,
    0x00430001,
    0x0007000F,
    0x00000ADE,
    0x00000000,
    0x0043000F,
    0x0008000F,
    0x00000ADF,
    0x00000000,
    0x0043000E,
    0x0009000F,
    0x00000AE0,
    0x00000000,
    0x00530020,
    0x000A000F,
    0x00000AE2,
    0x00000000,
    0x00430000,
    0x000B000F,
    0x00000AE4,
    0x00000000,
    0x00000043,
    0x000B000F,
    0x00000AE4,
    0x00000000,
    0x00530000,
    0x000C000F,
    0x00000AE6,
    0x00000000,
    0x00000053,
    0x000C000F,
    0x00000AE6,
    0x00000000,
    0x00430001,
    0x0007001C,
    0x00000ADE,
    0x00000000,
    0x0043000F,
    0x0008001C,
    0x00000ADF,
    0x00000000,
    0x0043000E,
    0x0009001C,
    0x00000AE1,
    0x00000000,
    0x00530020,
    0x000A001C,
    0x00000AE3,
    0x00000000,
    0x00430000,
    0x000B001C,
    0x00000AE4,
    0x00000000,
    0x00000043,
    0x000B001C,
    0x00000AE4,
    0x00000000,
    0x00530000,
    0x000C001C,
    0x00000AE6,
    0x00000000,
    0x00000053,
    0x000C001C,
    0x00000AE6,
    0x00000000,
    0x006D0001,
    0x00070010,
    0x00000B02,
    0x00000000,
    0x006D0002,
    0x00080010,
    0x00000B04,
    0x00000000,
    0x006D0011,
    0x00090010,
    0x00000B05,
    0x00000000,
    0x006D0010,
    0x000A0010,
    0x00000B06,
    0x00000000,
    0x006D0000,
    0x00010010,
    0x00000B07,
    0x00000000,
    0x0000006D,
    0x00010010,
    0x00000B07,
    0x00000000,
    0x006D000F,
    0x0007001D,
    0x00000B03,
    0x00000000,
    0x006D0002,
    0x0008001D,
    0x00000B04,
    0x00000000,
    0x006D0011,
    0x0009001D,
    0x00000B05,
    0x00000000,
    0x006D0010,
    0x000A001D,
    0x00000B06,
    0x00000000,
    0x006D0000,
    0x0001001D,
    0x00000B07,
    0x00000000,
    0x0000006D,
    0x0001001D,
    0x00000B07,
    0x00000000,
    0x00400001,
    0x00070011,
    0x00000B28,
    0x00000000,
    0x0040000F,
    0x00080011,
    0x00000B29,
    0x00000000,
    0x00400000,
    0x00010011,
    0x00000B2C,
    0x00000000,
    0x00000040,
    0x00010011,
    0x00000B2C,
    0x00000000,
    0x00400001,
    0x0007001E,
    0x00000B2A,
    0x00000000,
    0x0040000F,
    0x0008001E,
    0x00000B2B,
    0x00000000,
    0x00400000,
    0x0001001E,
    0x00000B2C,
    0x00000000,
    0x00000040,
    0x0001001E,
    0x00000B2C,
    0x00000000,
    0x00570000,
    0x00010013,
    0x00000B5A,
    0x00000000,
    0x00000057,
    0x00010013,
    0x00000B5A,
    0x00000000,
    0x00570000,
    0x00010020,
    0x00000B5A,
    0x00000000,
    0x00000057,
    0x00010020,
    0x00000B5A,
    0x00000000,
    0x0041001E,
    0x00070014,
    0x00000B6F,
    0x00000000,
    0x00570019,
    0x00080014,
    0x00000B70,
    0x00000000,
    0x00570000,
    0x00010014,
    0x00000B71,
    0x00000000,
    0x00000057,
    0x00010014,
    0x00000B71,
    0x00000000,
    0x0041001E,
    0x00070021,
    0x00000B6F,
    0x00000000,
    0x00570019,
    0x00080021,
    0x00000B70,
    0x00000000,
    0x00570000,
    0x00010021,
    0x00000B71,
    0x00000000,
    0x00000057,
    0x00010021,
    0x00000B71,
    0x00000000,
    0x006C0001,
    0x00070015,
    0x00000B7F,
    0x00000000,
    0x006C0000,
    0x00010015,
    0x00000B81,
    0x00000000,
    0x0000006C,
    0x00010015,
    0x00000B81,
    0x00000000,
    0x006C000F,
    0x00070022,
    0x00000B80,
    0x00000000,
    0x006C0000,
    0x00010022,
    0x00000B83,
    0x00000000,
    0x0000006C,
    0x00010022,
    0x00000B83,
    0x00000000,
    0x00BE0001,
    0x00070016,
    0x00000BB3,
    0x00000000,
    0x00BE000F,
    0x00070023,
    0x00000BB4,
    0x00000000,
    0x00000006,
    0x007F00FE,
    0x000008C0,
    0x00000000,
    0x00000022,
    0x008000FE,
    0x000008C1,
    0x00000000,
    0x00000021,
    0x008100FE,
    0x000008C2,
    0x00000000,
    0x0000FFFF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00FF0068,
    0x08D70002,
    0x00000000,
    0x01FF0046,
    0x08F60002,
    0x00000000,
    0x02FF0047,
    0x09210002,
    0x00000000,
    0x03FF0048,
    0x09540002,
    0x00000000,
    0x04FF0049,
    0x00000002,
    0x00000000,
    0x06FF000D,
    0x09860000,
    0x00000000,
    0x06FF004A,
    0x09880002,
    0x00000000,
    0x05FF006A,
    0x09A00002,
    0x00000000,
    0x05FF0010,
    0x099C0000,
    0x00000000,
    0x05FF0011,
    0x099D0000,
    0x00000000,
    0x05FF0042,
    0x099E0000,
    0x00000000,
    0x07FF004B,
    0x09B10002,
    0x00000000,
    0x08FF004C,
    0x09C40002,
    0x00000000,
    0x09FF004D,
    0x09D00002,
    0x00000000,
    0x0AFF004E,
    0x09E20002,
    0x00000000,
    0x17FF005A,
    0x0A6C0002,
    0x00000000,
    0x0BFF004F,
    0x09F60002,
    0x00000000,
    0x18FF001D,
    0x0C000065,
    0x00000000,
    0x18FF005B,
    0x0A800002,
    0x00000000,
    0x19FF005C,
    0x00000002,
    0x00000000,
    0x0DFF0051,
    0x0A330002,
    0x00000000,
    0x0DFF004F,
    0x0A350000,
    0x00000000,
    0x1AFF0044,
    0x0AB20002,
    0x00000000,
    0x0EFF0052,
    0x0A4B0002,
    0x00000000,
    0x1BFF006B,
    0x0AC50002,
    0x00000000,
    0x0FFF0043,
    0x0AE50000,
    0x00000000,
    0x0FFF0053,
    0x0AE70000,
    0x00000000,
    0x1CFF0043,
    0x0AE50000,
    0x00000000,
    0x1CFF0053,
    0x0AE70000,
    0x00000000,
    0x10FF006D,
    0x0B080002,
    0x00000000,
    0x1DFF006D,
    0x0B080002,
    0x00000000,
    0x11FF0040,
    0x0B2D0002,
    0x00000000,
    0x1EFF0040,
    0x0B2D0002,
    0x00000000,
    0x12FF0056,
    0x00000002,
    0x00000000,
    0x1FFF0056,
    0x00000002,
    0x00000000,
    0x13FF00C8,
    0x0B590065,
    0x00000000,
    0x13FF0057,
    0x0B5B0002,
    0x00000000,
    0x20FF0022,
    0x0BF40007,
    0x00000000,
    0x20FF00C8,
    0x0B590065,
    0x00000000,
    0x20FF0057,
    0x0B5B0002,
    0x00000000,
    0x14FF0057,
    0x0B720000,
    0x00000000,
    0x21FF0057,
    0x0B720000,
    0x00000000,
    0x15FF006C,
    0x0B820002,
    0x00000000,
    0x22FF006C,
    0x0B840002,
    0x00000000,
    0x16FF00BE,
    0x00000002,
    0x00000000,
    0x23FF00BE,
    0x00000002,
    0x00000000,
    0xFFFF0001,
    0x0BE30065,
    0x00000000,
    0xFFFF000F,
    0x0BE40065,
    0x00000000,
    0xFFFF0002,
    0x0BE50000,
    0x00000000,
    0xFFFF0004,
    0x0BE60000,
    0x00000000,
    0xFFFF0003,
    0x0BE70000,
    0x00000000,
    0xFFFF0005,
    0x0BE80000,
    0x00000000,
    0xFFFF0006,
    0x0BE90000,
    0x00000000,
    0xFFFF000A,
    0x0BEA0000,
    0x00000000,
    0xFFFF0007,
    0x0BEB0000,
    0x00000000,
    0xFFFF0009,
    0x0BEC0000,
    0x00000000,
    0xFFFF0008,
    0x0BED0000,
    0x00000000,
    0xFFFF0013,
    0x0BEE0000,
    0x00000000,
    0xFFFF000C,
    0x0BEF0000,
    0x00000000,
    0xFFFF000D,
    0x0BF00000,
    0x00000000,
    0xFFFF0020,
    0x0BF10000,
    0x00000000,
    0xFFFF0011,
    0x0BF20000,
    0x00000000,
    0xFFFF0010,
    0x0BF30000,
    0x00000000,
    0xFFFF0022,
    0x0BF40000,
    0x00000000,
    0xFFFF000B,
    0x0BF50000,
    0x00000000,
    0xFFFF0014,
    0x0BF60000,
    0x00000000,
    0xFFFF0015,
    0x0BF70000,
    0x00000000,
    0xFFFF0016,
    0x0BF80000,
    0x00000000,
    0xFFFF0017,
    0x0BF90000,
    0x00000000,
    0xFFFF0018,
    0x0BFA0000,
    0x00000000,
    0xFFFF0019,
    0x0BFB0000,
    0x00000000,
    0xFFFF001A,
    0x0BFC0000,
    0x00000000,
    0xFFFF000E,
    0x0BFD0000,
    0x00000000,
    0xFFFF0012,
    0x0BFE0086,
    0x00000000,
    0xFFFF001C,
    0x0BFF0000,
    0x00000000,
    0xFFFF001D,
    0x0C000000,
    0x00000000,
    0xFFFF001E,
    0x0C010000,
    0x00000000,
    0xFFFF001F,
    0x0C020000,
    0x00000000,
    0xFFFF0021,
    0x0C030000,
    0x00000000,
    0x0000FFFF,
    0x00000000,
    0x00000000,
};
u32 frontier_df4_menu_004_A5F770[] __attribute__((section(".data.frontier_df4_menu.gap4"))) = {
    0xFF010001,
    0xFF020001,
    0xFF03000F,
    0x04FF0013,
    0x06FF000D,
    0x0AFF0022,
    0x0CFF0017,
    0x1502000F,
    0x22030001,
    0x0000FFFF,
    0x1E0B1902,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x161A160D,
    0x16311624,
    (u32)&Img_GespenstBg4 + 0xF1,
    0x16390000,
    0x16461640,
    0x0475164D,
    0x00000876,
    0x144F284E,
    0x14501451,
    0x0A030000,
    0x050B0A06,
    0x05191416,
    0x05231420,
    0x0532142E,
    0x193A0000,
    0x1941093B,
    0x19470842,
    0x00000848,
    0x1C411B3A,
    0x02741C47,
    0x0A760575,
    0x17060000,
    0x14201416,
    0x0274142E,
    0x0A760575,
    0x190D0000,
    0x1924191A,
    0x00001931,
    0x0A0F0A0E,
    0x0A950A13,
    0x0A1B0A8D,
    0x0A250A2B,
    0x0A340A5A,
    0x19040000,
    0x19211917,
    0x0000192F,
    0x14511450,
    0x144F144E,
    0x0000144C,
    0x093C193A,
    (u32)&DirectSoundData_btl_mon_magic1_13k + 0xA15,
    (u32)&DirectSoundData_sys_chapter_start3_13k + 0x2FA7,
    0x14740000,
    0x1E763275,
    0x1E0F0000,
    0x285A1E8D,
    0x5A740000,
    0x00000A72,
    0x00020001,
    0x00150014,
    0x0000001F,
    0x00020001,
    0x00140003,
    0x00160015,
    0x0020001F,
    0x002E002D,
    0x004B0000,
    0x006C0056,
    0x003F0038,
    0x00380000,
    0x003F0039,
    0x004B0040,
    0x0058004C,
    0x006D006C,
    0x0070006F,
    0x00030000,
    0x00140005,
    0x001F0016,
    0x00260020,
    0x002D0028,
    0x0033002E,
    0x00390000,
    0x0040003A,
    0x004C004B,
    0x006C0050,
    0x006E006D,
    0x0000006F,
    0x002A0012,
    0x0031001E,
    0x003B0042,
    0x005B004D,
    0x006B005C,
    0x00650064,
    0x00670066,
    0x00970068,
    0x00390000,
    0x003F003A,
    0x00410040,
    0x00460045,
    0x0050004C,
    0x006C0059,
    0x006E006D,
    0x0000006F,
    0x003A0039,
    0x00410040,
    0x00460045,
    0x004D004C,
    0x006D0050,
    0x006F006E,
    0x00020000,
    0x000D0003,
    0x00160015,
    0x0020001A,
    0x00240028,
    0x0034002E,
    0x00000031,
    0x001D000C,
    0x004E0086,
    0x005C005B,
    0x005E005D,
    0x0060005F,
    0x00650064,
    0x00670066,
    0x00970068,
    0x00030000,
    0x00150005,
    0x001F0016,
    0x00260020,
    0x002D0028,
    0x0033002E,
    0x00380000,
    0x003F0039,
    0x004B0040,
    0x0050004C,
    0x006C0058,
    0x006F006D,
    0x00000070,
    0x003A0039,
    0x004B0040,
    0x0050004C,
    0x006D006C,
    0x006F006E,
    0x00120000,
    0x001E002A,
    0x00420031,
    0x004D003B,
    0x005C005B,
    0x0064006B,
    0x00660065,
    0x00680067,
    0x00000097,
    0x003A0039,
    0x0040003F,
    0x00450041,
    0x004C0046,
    0x00590050,
    0x006D006C,
    0x006F006E,
    0x00390000,
    0x0040003A,
    0x00450041,
    0x004C0046,
    0x0050004D,
    0x006E006D,
    0x0000006F,
    0x00030002,
    0x0015000D,
    0x001A0016,
    0x00280020,
    0x002E0024,
    0x00310034,
    0x000C0000,
    0x0086001D,
    0x005B004E,
    0x005D005C,
    0x005F005E,
    0x00640060,
    0x00660065,
    0x00680067,
    0x00000097,
    0x000000A1,
    0x00000097,
    0x00000000,
    0x00000000,
    0x00000000,
    0x01000000,
    0x00350811,
    0x0A020100,
    0x00000035,
    0x00000000,
    0x01000000,
    0x0035030E,
    0x03100100,
    0x01000035,
    0x00351704,
    0x00000000,
    0x0B010000,
    0x0000350D,
    0x35071101,
    0x0C010000,
    0x00003503,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000D070C,
    0x070C0403,
    0x05050000,
    0x0001090C,
    0x0A0C0506,
    0x05050000,
    0x0008060C,
    0x150C0504,
    0x05060004,
    0x0005160C,
    0x160C0506,
    0x05050008,
    0x000E140C,
    0x150C0503,
    0x0504000F,
    0x0010130C,
    0x130C0504,
    0x0504001A,
    0x0011090C,
    0x080C0401,
    0x04010011,
    0x0012080C,
    0x0C0C0401,
    0x04020012,
    0x000A1304,
    0x11040101,
    0x0101000A,
    0x000B1204,
    0x13040101,
    0x0101000E,
    0x000F1304,
    0x14040101,
    0x0101000F,
    0x00101404,
    0x16040101,
    0x01010015,
    0x00161504,
    0x16040101,
    0x01010016,
    0x00150F04,
    0x10040101,
    0x01010016,
    0x00160E04,
    0x0E040101,
    0x01010017,
    0x000C0904,
    0x08040101,
    0x0101000A,
    0x000A0704,
    0x07040101,
    0x01010009,
    0x00090604,
    0x08040101,
    0x01010008,
    0x00070704,
    0x140C0101,
    0x05050019,
    0x00081504,
    0x14040101,
    0x01010007,
    0x00061204,
    0x0E040101,
    0x01010014,
    0x00170F04,
    0x11040101,
    0x01010017,
    0x00181004,
    0x15040101,
    0x01010017,
    0x00131604,
    0x15040101,
    0x01010014,
    0x000B0904,
    0x12040101,
    0x01010009,
    0x00071204,
    0x13040101,
    0x01010008,
    0x0002070C,
    0x0D0C0505,
    0x05050003,
    0x0001040C,
    0x0D0C0505,
    0x07050005,
    0x001A140C,
    0x080C0505,
    0x05050007,
    0x0005150C,
    0x00000505,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0D070C00,
    0x0C040300,
    0x05000007,
    0x01090C05,
    0x0C050600,
    0x0500000A,
    0x08060C05,
    0x0C050400,
    0x06000415,
    0x05160C05,
    0x0C050600,
    0x05000816,
    0x0E140C05,
    0x0C050300,
    0x04000F15,
    0x10130C05,
    0x0C050400,
    0x04001A13,
    0x11090C05,
    0x0C040100,
    0x01001108,
    0x12080C04,
    0x0C040100,
    0x0200120C,
    0x0A130404,
    0x04010100,
    0x01000A11,
    0x0B120401,
    0x04010100,
    0x01000E13,
    0x0F130401,
    0x04010100,
    0x01000F14,
    0x10140401,
    0x04010100,
    0x01001516,
    0x16150401,
    0x04010100,
    0x01001616,
    0x150F0401,
    0x04010100,
    0x01001610,
    0x160E0401,
    0x04010100,
    0x0100170E,
    0x0C090401,
    0x04010100,
    0x01000A08,
    0x0A070401,
    0x04010100,
    0x01000907,
    0x09060401,
    0x04010100,
    0x01000808,
    0x07070401,
    0x0C010100,
    0x05001914,
    (u32)&gMsgTable + 0x3379,
    0x04010100,
    0x01000714,
    0x06120401,
    0x04010100,
    0x0100140E,
    0x170F0401,
    0x04010100,
    0x01001711,
    0x18100401,
    0x04010100,
    0x01001715,
    0x13160401,
    0x04010100,
    0x01001415,
    0x0B090401,
    0x04010100,
    0x01000912,
    0x07120401,
    0x04010100,
    0x01000813,
    0x02070C01,
    0x0C050500,
    0x0500030D,
    0x01040C05,
    0x0C050500,
    0x0500050D,
    0x1A140C07,
    0x0C050500,
    0x05000708,
    0x05150C05,
    0x00050500,
    0x00000000,
    0x00000000,
    0x07000000,
    0x03000003,
    0x00130702,
    0x00020200,
    0x00000000,
    0x030A0905,
    0x07050101,
    0x0101020F,
    0x020B0405,
    0x08050101,
    0x0101020A,
    0x02050705,
    0x10050101,
    0x0101010C,
    0x01081005,
    0x12050101,
    0x0101000A,
    0x00101305,
    0x00050101,
    0x0101010A,
    0x03100D05,
    0x0E050101,
    0x01010213,
    0x010C0005,
    0x0A050101,
    0x01010009,
    0x03160C05,
    0x07050101,
    0x01010201,
    0x00040905,
    0x02050101,
    0x01010206,
    0x02030A05,
    0x0C050101,
    0x01010203,
    0x02030E05,
    0x00000101,
};
u8 frontier_df4_menu_004_A5F770_1[] __attribute__((section(".data.frontier_df4_menu.gap4"))) = {
    0x00, 0x00,
};
EventListScr frontier_df4_menu_006_A65504[] __attribute__((section(".data.frontier_df4_menu.gap6"))) = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBC6)
    TEXTEND
    FADI(0x10)
    REMA
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBC7)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBC8)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    STAL(0x1E)
    MUSC(0x2B)
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBCE)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    CALL((u8 *)data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBD0)
    TEXTEND
    GOTO(3)
    LABEL(1)
    CHECK_ALIVE(0x11)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xBD1)
    TEXTEND
    GOTO(3)
    LABEL(2)
    CHECK_ALIVE(0x10)
    BEQ(3, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    LOAD1(1, (u8 *)UnitDef_Ch8NPC)
    ENUN
    FADU(0x10)
    BROWNBOXTEXT(0x5FC, 8, 8)
    CALL((u8 *)frontier_df4_menu_007_A657D4 + 0x5C)
    CALL((u8 *)frontier_df4_menu_007_A657D4 + 0x1E0)
    ENDA
    LABEL(0x5F90)
    LOAD1(1, (u8 *)UnitDef_Ch8Enemy_5)
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
    LOAD1(1, (u8 *)UnitDef_Ch8Enemy_6)
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
    LOAD1(1, (u8 *)UnitDef_Ch8Enemy_7)
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
    CALL((u8 *)EventScr_CallBreakStone)
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
    CALL((u8 *)EventScr_LoadReinforce)
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
    CALL((u8 *)EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11AEnemy_3)
    CALL((u8 *)EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11AEnemy_4)
    CALL((u8 *)EventScr_LoadReinforceHardMode)
    EVBIT_T(7)
    ENDA
    MUSC(0x47)
    LOAD2(1, (u8 *)UnitDef_Ch12AAlly_1)
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
    SVAL(EVT_SLOT_2, (u8 *)UnitDef_Ch12AEnemy_4)
    SVAL(EVT_SLOT_3, 1)
    CALL((u8 *)EventScr_LoadUnitForTutorial)
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
    LOAD2(1, (u8 *)UnitDef_Ch12AMixed)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xA1C)
    TEXTEND
    GOTO(1)
    LABEL(0)
    CHECK_ALIVE(0x15)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xA1D)
    TEXTEND
    LABEL(1)
    FADI(0x10)
    LOAD1(1, UnitDef_Ch12AAlly_0)
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
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xA1E)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xA20)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 4)
    CALL((u8 *)EventScr_SetBackground)
    TEXTSHOW(0xA21)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
    MUSC(0x25)
    TEXTSHOW(0xA2B)
    TEXTEND
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x25)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_LoadUnitForTutorial)
    CHECK_EVENTID(0x86)
    BNE(0, 0xC, 0)
    CHECK_EXISTS(0x12)
    BNE(0, 0xC, 0)
    LOAD1(1, UnitDef_Ch13AEnemy_10)
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
    CALL((u8 *)Event_TextWithBG)
    LOAD1(1, (u8 *)UnitDef_Ch13AEnemy_11)
    ENUN
    LOAD1(1, frontier_df4_banim_b_079_90EFAC)
    ENUN
    DISA(0x53)
    CAMERA2(0xD, 9)
    LOAD2(1, (u8 *)UnitDef_Ch13AAlly_0)
    ENUN
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xB)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, (u8 *)UnitDef_Ch13AAlly_1)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)Event_TextWithBG)
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
    CALL((u8 *)EventScr_CallBreakStone)
    MOVE(0x30, 0x40, 6, 3)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_SetBackground)
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
    CALL((u8 *)EventScr_LoadReinforce)
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
    CALL((u8 *)EventScr_SetBackground)
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
    LOAD1(1, UnitDef_LordSplitAlly)
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
u32 frontier_df4_menu_013_A72408[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    0x00020540,
    0x00000004,
    0x00000120,
    0x00070228,
    0x00000120,
    0x00070228,
    0x00000120,
    0x00000D40,
    (u32)&StartBonusClaimScreen,
    0x00010E20,
    0x00000120,
    0x00021020,
    0x00331220,
    0x00020540,
    (u32)&UnitDef_UnusedAlly_1,
    0x00030540,
    0x00000BD9,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0xb8,
    0x00203322,
    0x00000C40,
    0x0000000C,
    0x00012C41,
    (u32)&UnitDef_UnusedAlly_3,
    0x00003020,
    0x000B0540,
    0x00000017,
    0x000F2520,
    0x00101720,
    0x05EF3A41,
    0x00080008,
    0x00082F42,
    0x00020020,
    0x00003020,
    0x00203B21,
    0x003C0E20,
    0x00003B22,
    0x0BDA1B20,
    0x00001D20,
    0x00010920,
    0x00000820,
    0x00012C41,
    (u32)&UnitDef_UnusedAlly_4,
    0x00003020,
    0x000B0540,
    0x00000017,
    0x000F2520,
    0x00101720,
    0x05EF3A41,
    0x00080008,
    0x00082F42,
    0x0002001E,
    0x00003020,
    0x001E3B21,
    0x003C0E20,
    0x00003B22,
    0x0BDB1B20,
    0x00001D20,
    0x00010820,
    0x00041721,
    0x00001B22,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x00020540,
    (u32)&UnitDef_UnusedAlly_19,
    0x00030540,
    0x00000BDC,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x128,
    0x00020540,
    (u32)&dat_REDA_08926134_ref + 0x58,
    0x00030540,
    0x00000BDD,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x1a0,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x1f4,
    0x00000120,
    0x00021020,
    0x00331220,
    0x00020540,
    (u32)&UnitDef_UnusedAlly_2,
    0x00030540,
    0x00000BDE,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0xb8,
    0x00012C41,
    (u32)&UnitDef_UnusedAlly_5,
    0x00003020,
    0x000B0540,
    0x0008000C,
    0x000C2520,
    0x00101720,
    0x05ED3A41,
    0x00080008,
    0x00001A20,
    0x00082F42,
    0x0002001E,
    0x00003020,
    0x001E3B21,
    0x003C0E20,
    0x00003B22,
    0x0BDF1B20,
    0x00001D20,
    0x00041721,
    0x00001B22,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x00020540,
    (u32)&UnitDef_UnusedAlly_20,
    0x00030540,
    0x00000BE0,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x128,
    0x00020540,
    (u32)&dat_REDA_08926134_ref + 0x94,
    0x00030540,
    0x00000BE1,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x1a0,
    0x00000A40,
    (u32)&EventScr_EphraimModeGameEnd + 0x1f4,
    0x00000120,
    0x00012C41,
    (u32)&UnitDef_UnusedMixed,
    0x00003020,
    0x00012C41,
    0xFFFFFFFF,
    0x00003020,
    0x000B0540,
    0x000C0011,
    0x00132520,
    0x00101720,
    0x05F93A41,
    0x00080008,
    0x00082F42,
    0x00020019,
    0x00003020,
    0x00193B21,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x00320620,
    0xFFFF1B20,
    0x00001D20,
    0x00041721,
    0x00001B22,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x00000120,
    0x00002B22,
    0x00012C41,
    (u32)&UnitDef_UnusedAlly_18,
    0x00003020,
    0x00012C41,
    0xFFFFFFFF,
    0x00003020,
    0x000B0540,
    0x00000000,
    0x00402520,
    0x00101720,
    0x05F63A41,
    0x00080008,
    0x000B3B21,
    0x003C0E20,
    0x00003B22,
    0x00320620,
    0x00001A20,
    0xFFFF1B20,
    0x00001D20,
    0x00001B22,
    0x00012C41,
    (u32)&UnitDef_UnusedAlly_18,
    0x00200E22,
    0x00041721,
    0x00003020,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x00000120,
    0x000B0540,
    0x0005000E,
    0x00102520,
    0x00041720,
    0x00012C41,
    0xFFFFFFFF,
    0x00003020,
    0x00013B21,
    0x003C0E20,
    0x00003B22,
    0x00001A20,
    0x00320620,
    0xFFFF1B20,
    0x00001D20,
    0x7FFF1328,
    0x00021721,
    0x00001B22,
    0x0000342A,
    0x0000342C,
    0x0000342B,
    0x00000120,
    0x00020220,
    0x00000D40,
    (u32)&BMapDispSuspend,
    0x00421220,
    0x00000D40,
    (u32)&StartEndingCredits,
    0x005A0E20,
    0x00001A22,
    0x00002142,
    0x00020000,
    0x0BE21B20,
    0x00001D20,
    0x7FFF1328,
    0x00021721,
    0x00001B22,
    0x00020220,
    0x00780E20,
    0x00000D40,
    (u32)&StartEndingTurnRecordScreen,
    0x00010E20,
    0x00000A40,
    (u32)&EventScr_Ruin_84 + 0x8,
    0x005A0E20,
    0x00002A20,
    0x00000120,
};
struct ProcCmd ProcScr_SlidingWallBg[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_CALL(sub_8088E30), PROC_REPEAT(BackgroundSlide_Loop), PROC_END,
};
u32 frontier_df4_menu_gap13_2912[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    0x02003C14,
    0x00000007,
    0x02003C1C,
    0x00000007,
    0x02003C24,
    0x00000003,
    0x02003C2C,
    0x00000003,
    0x02003C34,
    0x00000003,
    0x02003C3C,
    0x00000003,
    0x02003C44,
    0x00000003,
    0x02003C4C,
    0x00000003,
    0x02003C54,
    0x00000003,
    0x02003C5C,
    0x00000003,
    0x02003C64,
    0x00000003,
    0x02003C6C,
    0x00000003,
    0x02003C74,
    0x00000009,
    0x02003C7C,
    0x00000007,
    0x02003C84,
    0x00000009,
    0x02003C8C,
    0x00000007,
    0x02003C94,
    0x00000007,
    0x02003C9C,
    0x00000007,
    0x02003CA4,
    0x00000007,
    0x02003CAC,
    0x00000007,
    0x02003CB4,
    0x00000007,
    0x02003CBC,
    0x00000003,
    0x02003CC4,
    0x00000003,
    0x02003CCC,
    0x00000003,
    0x02003CD4,
    0x00000003,
    0x02003CDC,
    0x00000002,
    0x02003CE4,
    0x00000002,
    0x02003CEC,
    0x00000002,
    0x02003CF4,
    0x00000002,
    0x02003CFC,
    0x00000007,
    0x02003D04,
    0x00000007,
    0x02003D0C,
    0x00000007,
    0x02003D14,
    0x00000007,
    0x02003D1C,
    0x00000007,
    0x02003D24,
    0x00000010,
    0x00000000,
    0x00000000,
    0xF4F6F9FC,
    0x090D7FF2,
    0x02030507,
    0x00800001,
};
struct ProcCmd gProcScr_SSPageSlide[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_REPEAT(PageSlide_OnLoop), PROC_CALL(PageSlide_OnEnd), PROC_END,
};
u32 frontier_df4_menu_gap13_2931[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&GlowBlendCtrl_OnInit,
    0x00000003,
    (u32)&GlowBlendCtrl_OnLoop,
    0x00000000,
    0x00000000,
};
struct ProcCmd gProcScr_SSUnitSlide[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    PROC_SLEEP(0x0), PROC_CALL(EndGlowBlendCtrl), PROC_CALL(UnitSlide_InitFadeOut), PROC_REPEAT(UnitSlide_FadeOutLoop),
    PROC_CALL(UnitSlide_SetNewUnit), PROC_CALL(UnitSlide_InitFadeIn), PROC_REPEAT(UnitSlide_FadeInLoop), PROC_SLEEP(0x0),
    PROC_CALL(StartGlowBlendCtrl), PROC_CALL(ClearSlide), PROC_END,
};
u32 frontier_df4_menu_gap13_2941[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = {
    0x41040003,
    0x00009008,
    0x90284104,
    0x41040004,
    0x00089048,
    0x41040002,
    0x0000901E,
    0x903E4104,
    0x00050004,
    0x90044108,
    0x41080006,
    0x000A9024,
    0x90444108,
    0x4100000E,
    0x00009000,
    0x50200100,
    0x00060004,
    0x80004002,
    0x00020000,
    0x00044020,
    0x00308002,
    0x80020006,
    0x00061032,
    0x503A0002,
    0x40020004,
    0x0000904A,
    (u32)&frontier_df4_menu_gap13_2941,
    (u32)&gProcScr_SSUnitSlide + 0x6c,
    (u32)&gProcScr_SSUnitSlide + 0x7a,
    0x00400000,
    0x0000000E,
};
/* frontier_df4_menu_014_A72BF0: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_menu_014_A72BF0[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    0x00000000,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x1C,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x54,
    0x00005018,
    0x00000000,
    (u32)&HbPopulate_SSCharacter + 0x1,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x38,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x8C,
    0x066B6806,
    0x00000000,
    (u32)&HbPopulate_SSClass + 0x1,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x1C,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x70,
    0x00000000,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x54,
    0x04D77806,
    0x00000000,
    0x00000000,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x1C,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x70,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x38,
    (u32)&gHelpInfo_Ss0Pow + 0x8C,
    0x04D87826,
    0x00000000,
    0x00000000,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x38,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x8C,
    0x04D98806,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x1C,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&gHelpInfo_Ss0Pow + 0xA8,
    0x04DB1866,
    0x00000000,
    (u32)&HbPopulate_SSPower + 0x1,
    (u32)&gHelpInfo_Ss0Pow,
    (u32)&gHelpInfo_Ss0Pow + 0x38,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&gHelpInfo_Ss0Pow + 0xC4,
    0x04DD2869,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x1C,
    (u32)&gHelpInfo_Ss0Pow + 0x54,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&gHelpInfo_Ss0Pow + 0xE0,
    0x04DE3866,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x38,
    (u32)&gHelpInfo_Ss0Pow + 0x70,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&gHelpInfo_Ss0Pow + 0xFC,
    0x04DF4866,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x54,
    (u32)&gHelpInfo_Ss0Pow + 0x8C,
    (u32)&frontier_df4_menu_014_A72BF0,
    (u32)&gHelpInfo_Ss0Pow + 0x118,
    0x04E05866,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x70,
    0x00000000,
    (u32)&frontier_df4_menu_014_A72BF0 + 0x1C,
    (u32)&gHelpInfo_Ss0Pow + 0x134,
    0x04E16866,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0xC4,
    (u32)&gHelpInfo_Ss0Pow,
    0x00000000,
    0x04E218A6,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0xA8,
    (u32)&gHelpInfo_Ss0Pow + 0xE0,
    (u32)&gHelpInfo_Ss0Pow + 0x1C,
    0x00000000,
    0x04E328A6,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0xC4,
    (u32)&gHelpInfo_Ss0Pow + 0xFC,
    (u32)&gHelpInfo_Ss0Pow + 0x38,
    0x00000000,
    0x04E438A6,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0xE0,
    (u32)&gHelpInfo_Ss0Pow + 0x118,
    (u32)&gHelpInfo_Ss0Pow + 0x54,
    0x00000000,
    0x04E548A6,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0xFC,
    (u32)&gHelpInfo_Ss0Pow + 0x134,
    (u32)&gHelpInfo_Ss0Pow + 0x70,
    0x00000000,
    0x04E658A6,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x118,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x8C,
    0x00000000,
    0x000068A6,
    0x00000000,
    (u32)&HbPopulate_SSStatus + 0x1,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x16C,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x54,
    0x00005018,
    0x00000000,
    (u32)&HbPopulate_SSCharacter + 0x1,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    (u32)&gHelpInfo_Ss0Pow + 0x188,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    0x066B6806,
    0x00000000,
    (u32)&HbPopulate_SSClass + 0x1,
    (u32)&gHelpInfo_Ss0Pow + 0x16C,
    (u32)&gHelpInfo_Ss0Pow + 0x1C0,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x1A4,
    0x04D77806,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x16C,
    (u32)&gHelpInfo_Ss0Pow + 0x1C0,
    (u32)&gHelpInfo_Ss0Pow + 0x188,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    0x04D87826,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x188,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0xA8,
    0x04D98806,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x1C,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    0x00000000,
    0x00001868,
    (u32)&HbRedirect_SSItem + 0x1,
    (u32)&HbPopulate_SSItem + 0x1,
    (u32)&gHelpInfo_Ss1Item0,
    (u32)&gHelpInfo_Ss1Item0 + 0x38,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    0x00000000,
    0x00012868,
    (u32)&HbRedirect_SSItem + 0x1,
    (u32)&HbPopulate_SSItem + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x1C,
    (u32)&gHelpInfo_Ss1Item0 + 0x54,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    0x00000000,
    0x00023868,
    (u32)&HbRedirect_SSItem + 0x1,
    (u32)&HbPopulate_SSItem + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x38,
    (u32)&gHelpInfo_Ss1Item0 + 0x70,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    0x00000000,
    0x00034868,
    (u32)&HbRedirect_SSItem + 0x1,
    (u32)&HbPopulate_SSItem + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x54,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    (u32)&gHelpInfo_Ss0Pow + 0x150,
    (u32)&gHelpInfo_Ss1Item0 + 0xC4,
    0x00045868,
    (u32)&HbRedirect_SSItem + 0x1,
    (u32)&HbPopulate_SSItem + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x70,
    (u32)&gHelpInfo_Ss1Item0 + 0xA8,
    (u32)&gHelpInfo_Ss0Pow + 0x1A4,
    (u32)&gHelpInfo_Ss1Item0 + 0xE0,
    0x04F17876,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    0x00000000,
    (u32)&gHelpInfo_Ss0Pow + 0x1C0,
    (u32)&gHelpInfo_Ss1Item0 + 0xFC,
    0x04F28876,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x70,
    (u32)&gHelpInfo_Ss1Item0 + 0xE0,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    0x00000000,
    0x04F368AE,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0xC4,
    (u32)&gHelpInfo_Ss1Item0 + 0xFC,
    (u32)&gHelpInfo_Ss1Item0 + 0x8C,
    0x00000000,
    0x04F478AE,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0xE0,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0xA8,
    0x00000000,
    0x04F588AE,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x134,
    0x00000000,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    0x00005018,
    0x00000000,
    (u32)&HbPopulate_SSCharacter + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x118,
    (u32)&gHelpInfo_Ss1Item0 + 0x150,
    0x00000000,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    0x066B6806,
    0x00000000,
    (u32)&HbPopulate_SSClass + 0x1,
    (u32)&gHelpInfo_Ss1Item0 + 0x134,
    (u32)&gHelpInfo_Ss1Item0 + 0x188,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x16C,
    0x04D77806,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x134,
    (u32)&gHelpInfo_Ss1Item0 + 0x188,
    (u32)&gHelpInfo_Ss1Item0 + 0x150,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    0x04D87826,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss1Item0 + 0x150,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    0x04D98806,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_Ss2Rank0 + 0x1C,
    (u32)&gHelpInfo_Ss1Item0 + 0x118,
    (u32)&gHelpInfo_Ss2Rank0 + 0x38,
    0x00001868,
    0x00000000,
    (u32)&HbPopulate_SSWExp + 0x1,
    (u32)&gHelpInfo_Ss2Rank0,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    (u32)&gHelpInfo_Ss1Item0 + 0x118,
    (u32)&gHelpInfo_Ss2Rank0 + 0x54,
    0x00012868,
    0x00000000,
    (u32)&HbPopulate_SSWExp + 0x1,
    0x00000000,
    (u32)&gHelpInfo_Ss2Rank0 + 0x54,
    (u32)&gHelpInfo_Ss2Rank0,
    0x00000000,
    0x000218A8,
    0x00000000,
    (u32)&HbPopulate_SSWExp + 0x1,
    (u32)&gHelpInfo_Ss2Rank0 + 0x38,
    (u32)&gHelpInfo_Ss2Rank0 + 0x70,
    (u32)&gHelpInfo_Ss2Rank0 + 0x1C,
    0x00000000,
    0x000328A8,
    0x00000000,
    (u32)&HbPopulate_SSWExp + 0x1,
    (u32)&gHelpInfo_Ss2Rank0 + 0x1C,
    (u32)&gHelpInfo_Ss1Item0 + 0x118,
    (u32)&gHelpInfo_Ss1Item0 + 0x118,
    0x00000000,
    0x04FE4080,
    (u32)&HbRedirect_SSSupports + 0x1,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_MbpHp,
    0x00000000,
    0x00000000,
    0x00000808,
    0x00000000,
    (u32)&HbPopulate_BkselWTriEffA + 0x1,
    (u32)&gHelpInfo_Ss2Rank0 + 0x8C,
    (u32)&gHelpInfo_MbpHp + 0x1C,
    0x00000000,
    0x00000000,
    0x04D9181C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_MbpHp,
    (u32)&gHelpInfo_MbpHp + 0x38,
    0x00000000,
    0x00000000,
    0x0506281C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_MbpHp + 0x1C,
    (u32)&gHelpInfo_MbpHp + 0x54,
    0x00000000,
    0x00000000,
    0x04F2381C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_MbpHp + 0x38,
    (u32)&gHelpInfo_MbpHp + 0x70,
    0x00000000,
    0x00000000,
    0x04F4481C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_MbpHp + 0x54,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00005838,
    0x00000000,
    (u32)&HbPopulate_BkselWTriEffB + 0x1,
    0x00000000,
    (u32)&gHelpInfo_CbpHp,
    0x00000000,
    0x00000000,
    0x00000808,
    0x00000000,
    (u32)&HbPopulate_BkselWTriEffA + 0x1,
    (u32)&gHelpInfo_MbpHp + 0x8C,
    (u32)&gHelpInfo_CbpHp + 0x1C,
    0x00000000,
    0x00000000,
    0x04D9181C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp,
    (u32)&gHelpInfo_CbpHp + 0x38,
    0x00000000,
    0x00000000,
    0x04F1281C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp + 0x1C,
    (u32)&gHelpInfo_CbpHp + 0x54,
    0x00000000,
    0x00000000,
    0x0508381C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp + 0x38,
    (u32)&gHelpInfo_CbpHp + 0x70,
    0x00000000,
    0x00000000,
    0x04F2481C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp + 0x54,
    (u32)&gHelpInfo_CbpHp + 0x8C,
    0x00000000,
    0x00000000,
    0x04F4581C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp + 0x70,
    (u32)&gHelpInfo_CbpHp + 0xA8,
    0x00000000,
    0x00000000,
    0x0507681C,
    0x00000000,
    0x00000000,
    (u32)&gHelpInfo_CbpHp + 0x8C,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00007838,
    0x00000000,
    (u32)&HbPopulate_BkselWTriEffB + 0x1,
    0x00000476,
    0x00000477,
    0x00000478,
    0x0000048D,
    0x0000048E,
    0x0000047B,
    0x0000047C,
    0x0000047E,
    0x0000047F,
    0x0000047D,
    0x00000486,
    0x00000487,
    0x00000485,
    0x00000488,
    0x00000480,
    0x0000048F,
    0x00000482,
    0x00000483,
    0x00000490,
    0x00000484,
    0x00000489,
    0x00000492,
    0x00000491,
    0x000004AE,
    0x000004AF,
    0x000004B0,
    0x000004B1,
    0x000004B2,
    0x000004B3,
    0x000004B4,
    0x000004B5,
    0x000004C6,
    0x000004A3,
    0x000004A4,
    0x000004A5,
    0x000004A6,
    0x00000494,
    0x00000495,
    0x00000496,
    0x00000497,
    0x00000498,
    0x0000049D,
    0x0000049E,
    0x0000049F,
    (u32)&frontier_chap_title_000_A7E188,
    (u32)&frontier_chap_title_064_A8BFB0,
    (u32)&frontier_chap_title_087_A8DBFC,
    (u32)&frontier_chap_title_001_A7E504,
    (u32)&frontier_chap_title_065_A8C0EC,
    (u32)&frontier_chap_title_088_A8DE6C,
    (u32)&frontier_chap_title_002_A7E800,
    (u32)&frontier_chap_title_066_A8C1E4,
    (u32)&frontier_chap_title_089_A8E080,
    (u32)&frontier_chap_title_003_A7EB7C,
    (u32)&frontier_chap_title_067_A8C308,
    (u32)&frontier_chap_title_090_A8E2EC,
    (u32)&frontier_chap_title_004_A7EF88,
    (u32)&frontier_chap_title_068_A8C424,
    (u32)&frontier_chap_title_091_A8E600,
    (u32)&frontier_chap_title_005_A7F360,
    (u32)&frontier_chap_title_069_A8C534,
    (u32)&frontier_chap_title_092_A8E8C8,
    (u32)&frontier_chap_title_006_A7F754,
    (u32)&frontier_chap_title_070_A8C734,
    (u32)&frontier_chap_title_093_A8EAF8,
    (u32)&frontier_chap_title_007_A7FAA4,
    (u32)&frontier_chap_title_071_A8C854,
    (u32)&frontier_chap_title_094_A8ED30,
    (u32)&frontier_chap_title_008_A7FE84,
    (u32)&frontier_chap_title_072_A8C974,
    (u32)&frontier_chap_title_095_A8EFFC,
    (u32)&frontier_chap_title_009_A8021C,
    (u32)&frontier_chap_title_073_A8CA74,
    (u32)&frontier_chap_title_096_A8F28C,
    (u32)&frontier_chap_title_010_A80584,
    (u32)&frontier_chap_title_074_A8CB94,
    (u32)&frontier_chap_title_097_A8F4CC,
    (u32)&frontier_chap_title_011_A808BC,
    (u32)&frontier_chap_title_075_A8CCAC,
    (u32)&frontier_chap_title_098_A8F6F8,
    (u32)&frontier_chap_title_013_A81068,
    (u32)&frontier_chap_title_077_A8CF14,
    (u32)&frontier_chap_title_100_A8FC68,
    (u32)&frontier_chap_title_014_A813F8,
    (u32)&frontier_chap_title_078_A8D064,
    (u32)&frontier_chap_title_101_A8FEC0,
    (u32)&frontier_chap_title_015_A81774,
    (u32)&frontier_chap_title_079_A8D1B0,
    (u32)&frontier_chap_title_102_A900FC,
    (u32)&frontier_chap_title_022_A8306C,
    (u32)&frontier_chap_title_080_A8D2F4,
    (u32)&frontier_chap_title_109_A911D0,
    (u32)&frontier_chap_title_023_A833D4,
    (u32)&frontier_chap_title_081_A8D430,
    (u32)&frontier_chap_title_110_A91418,
    (u32)&frontier_chap_title_024_A8383C,
    (u32)&frontier_chap_title_082_A8D574,
    (u32)&frontier_chap_title_111_A91760,
    (u32)&frontier_chap_title_025_A83C0C,
    (u32)&frontier_chap_title_083_A8D6AC,
    (u32)&frontier_chap_title_112_A919F8,
    (u32)&frontier_chap_title_026_A83F64,
    (u32)&frontier_chap_title_084_A8D7F4,
    (u32)&frontier_chap_title_113_A91C28,
    (u32)&frontier_chap_title_027_A8436C,
    (u32)&frontier_chap_title_085_A8D948,
    (u32)&frontier_chap_title_114_A91F08,
    (u32)&frontier_chap_title_028_A84720,
    (u32)&frontier_chap_title_086_A8DAB0,
    (u32)&frontier_chap_title_115_A92170,
    (u32)&frontier_chap_title_028_A84720,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_016_A81B1C,
    (u32)&frontier_chap_title_074_A8CB94,
    (u32)&frontier_chap_title_103_A90378,
    (u32)&frontier_chap_title_017_A81F28,
    (u32)&frontier_chap_title_075_A8CCAC,
    (u32)&frontier_chap_title_104_A9065C,
    (u32)&frontier_chap_title_019_A8258C,
    (u32)&frontier_chap_title_077_A8CF14,
    (u32)&frontier_chap_title_106_A90A98,
    (u32)&frontier_chap_title_020_A829B4,
    (u32)&frontier_chap_title_078_A8D064,
    (u32)&frontier_chap_title_107_A90D84,
    (u32)&frontier_chap_title_021_A82D58,
    (u32)&frontier_chap_title_079_A8D1B0,
    (u32)&frontier_chap_title_108_A90FF0,
    (u32)&frontier_chap_title_022_A8306C,
    (u32)&frontier_chap_title_080_A8D2F4,
    (u32)&frontier_chap_title_109_A911D0,
    (u32)&frontier_chap_title_023_A833D4,
    (u32)&frontier_chap_title_081_A8D430,
    (u32)&frontier_chap_title_110_A91418,
    (u32)&frontier_chap_title_024_A8383C,
    (u32)&frontier_chap_title_082_A8D574,
    (u32)&frontier_chap_title_111_A91760,
    (u32)&frontier_chap_title_025_A83C0C,
    (u32)&frontier_chap_title_083_A8D6AC,
    (u32)&frontier_chap_title_112_A919F8,
    (u32)&frontier_chap_title_026_A83F64,
    (u32)&frontier_chap_title_084_A8D7F4,
    (u32)&frontier_chap_title_113_A91C28,
    (u32)&frontier_chap_title_027_A8436C,
    (u32)&frontier_chap_title_085_A8D948,
    (u32)&frontier_chap_title_114_A91F08,
    (u32)&frontier_chap_title_028_A84720,
    (u32)&frontier_chap_title_086_A8DAB0,
    (u32)&frontier_chap_title_115_A92170,
    (u32)&frontier_chap_title_028_A84720,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_029_A84BFC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_030_A84F64,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_031_A852E8,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_032_A85670,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_033_A859E4,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_034_A85D6C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_035_A860F4,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_036_A86460,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_037_A867E4,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_038_A86B60,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_039_A86EF8,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_040_A8729C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_041_A8765C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_042_A87A14,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_043_A87DBC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_044_A88174,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_045_A88530,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_046_A888D0,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_047_A88C8C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_048_A89048,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_062_A8B7F0,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_012_A80CA0,
    (u32)&frontier_chap_title_076_A8CDF8,
    (u32)&frontier_chap_title_099_A8F9C0,
    (u32)&frontier_chap_title_018_A82294,
    (u32)&frontier_chap_title_076_A8CDF8,
    (u32)&frontier_chap_title_105_A90898,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_049_A89428,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_050_A89710,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_051_A899E8,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_052_A89CD8,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_053_A89F80,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_054_A8A260,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_055_A8A5A0,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_056_A8A85C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_057_A8AB8C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_061_A8B5DC,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_058_A8AE74,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_059_A8B168,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_060_A8B39C,
    0x00000000,
    0x00000000,
    (u32)&frontier_chap_title_063_A8BB88,
    0x00000000,
    0x00000000,
};
struct ProcCmd gProcScr_HelpBoxTextScroll[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)HelpBoxTextScroll_OnLoop + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap14_3077[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&HelpBoxDrawOneLineExt + 0x1,
    0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_HelpBoxIntro[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_SLEEP(0x6), PROC_REPEAT((void*)((u8*)HelpBoxSetupstringLines + 0x1)), PROC_REPEAT((void*)((u8*)HelpBoxDrawstring + 0x1)), PROC_CALL((void*)((u8*)HelpBoxIntroDrawTexts + 0x1)),
    PROC_END,
};
struct ProcCmd ProcScr_Helpbox_bug_0[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)HelpBoxIntro_bug_0 + 0x1)), PROC_CALL((void*)((u8*)HelpBoxIntro_bug_OnClose + 0x1)), PROC_REPEAT((void*)((u8*)HelpBoxIntro_bug_WaitClose + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap14_3088[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    0x0001000E,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&HelpBoxMoveCtrl_OnInitBox + 0x1,
    0x00000003,
    (u32)&HelpBoxMoveCtrl_OnIdle + 0x1,
    0x00000002,
    (u32)&CloseHelpBox_bug + 0x1,
    0x00000000,
    0x00000000,
    0x00000003,
    (u32)&HelpBoxLock_OnIdle + 0x1,
    0x00000000,
    0x00000000,
    0x000007BB,
    0x000007BC,
};
struct ProcCmd gProcScr_BoxDialogue[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)BoxDialogue_OnInit + 0x1)), PROC_LABEL(0x0), PROC_REPEAT((void*)((u8*)BoxDialogue_OnIdle + 0x1)),
    PROC_LABEL(0x1), PROC_BLOCK, PROC_LABEL(0x3), PROC_SLEEP(0x6),
    PROC_LABEL(0x2), PROC_CALL((void*)((u8*)BoxDialogue_OnClose + 0x1)), PROC_SLEEP(0xA), PROC_END,
};
struct ProcCmd ProcScr_MergeBoxDialogue[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_REPEAT((void*)((u8*)MergeBoxDialogue1 + 0x1)), PROC_CALL((void*)((u8*)MergeBoxDialogue2 + 0x1)), PROC_REPEAT((void*)((u8*)MergeBoxDialogue3 + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap14_3102[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&BoxDialogueDrawText_Init + 0x1,
    0x0000000B,
    0x00000000,
    0x00000003,
    (u32)&BoxDialogueInterpreter_Main + 0x1,
    0x0002000C,
    0x00000000,
    0x0001000B,
    0x00000000,
    0x00000003,
    (u32)&BoxDialogueDrawText_WaitIdle + 0x1,
    0x0004000B,
    0x00000000,
    0x00000003,
    (u32)&BoxDialogueDrawText_ScrollLines + 0x1,
    0x0000000C,
    0x00000000,
    0x0005000B,
    0x00000000,
    0x00000003,
    (u32)&BoxDialogueDrawText_ScrollLines + 0x1,
    0x00000002,
    (u32)&BoxDialogueDrawText_AfterScroll + 0x1,
    0x0000000C,
    0x00000000,
    0x0006000B,
    0x00000000,
    0x00000003,
    (u32)&BoxDialogueDrawText_ResizeBox + 0x1,
    0x0000000C,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&BoxDialogueDrawText_Finish + 0x1,
    0x00000000,
    0x00000000,
    0x0006000E,
    0x00000000,
    0x00000002,
    (u32)&BoxDialogueDrawTextProc_Init + 0x1,
    0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_TalkBoxIdle[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = {
    PROC_BLOCK, PROC_END,
};
u32 frontier_df4_menu_015_A73900[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    0x01010101,
    0x01010101,
    0x01010101,
    0x01010101,
    0x03030101,
    0x03030303,
    0x00FAFF00,
    0xFAFAFAFF,
    0x030303FA,
    (u32)&gUnkData_50,
    (u32)&gUnkData_50,
    (u32)&gUnkData_50,
    (u32)&gUnkData_51,
    (u32)&gUnkData_52,
    (u32)&gUnkData_53,
    (u32)&gUnkData_55,
    (u32)&gUnkData_56,
    (u32)&gUnkData_57,
    (u32)&gUnkData_58,
    (u32)&gUnkData_58,
    (u32)&gUnkData_58,
    0x0D0B0905,
    0x0400070B,
    0x04050605,
    0x00000000,
};
struct ProcCmd gProcScr_TerrainDisplay[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_NAME((void*)((u8*)sPage2TextInfo_Magical + 0x90)), PROC_15, PROC_SLEEP(0x0), PROC_CALL(TerrainDisplay_Init),
    PROC_LABEL(0x0), PROC_WHILE_EXISTS(ProcScr_CamMove), PROC_REPEAT(TerrainDisplay_Loop_OnSideChange), PROC_REPEAT(TerrainDisplay_Loop_SlideIn),
    PROC_REPEAT(TerrainDisplay_Loop_Display), PROC_REPEAT(TerrainDisplay_Loop_SlideOut), PROC_GOTO(0x0), PROC_END,
};
struct ProcCmd gProcScr_UnitDisplay_MinimugBox[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_NAME((void*)((u8*)sPage2TextInfo_Magical + 0x94)), PROC_15, PROC_SLEEP(0x0), PROC_CALL(MMB_Init),
    PROC_LABEL(0x0), PROC_WHILE_EXISTS(ProcScr_CamMove), PROC_REPEAT(MMB_Loop_OnSideChange), PROC_REPEAT(MMB_Loop_SlideIn),
    PROC_LABEL(0x2), PROC_REPEAT(MMB_Loop_Display), PROC_LABEL(0x3), PROC_REPEAT(MMB_Loop_SlideOut),
    PROC_GOTO(0x0), PROC_LABEL(0x1), PROC_CALL(MMB_CheckForUnit), PROC_GOTO(0x2),
    PROC_END,
};
struct ProcCmd gProcScr_UnitDisplay_Burst[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_NAME((void*)((u8*)sPage2TextInfo_Magical + 0x98)), PROC_15, PROC_SLEEP(0x0), PROC_CALL(BurstDisplay_Init),
    PROC_REPEAT(BurstDisplay_Loop_Display), PROC_END,
};
struct ProcCmd gProcScr_SideWindowMaker[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_WHILE(DoesBMXFADEExist), PROC_CALL(InitPlayerPhaseInterface), PROC_END,
};
u32 frontier_df4_menu_gap15_3145[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    0x05040301,
    0x00010306,
};
struct ProcCmd gProcScr_GoalDisplay[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_NAME((void*)((u8*)GoalString_Turn + 0x8)), PROC_15, PROC_SLEEP(0x0), PROC_CALL(GoalDisplay_Init),
    PROC_LABEL(0x0), PROC_WHILE_EXISTS(ProcScr_CamMove), PROC_REPEAT(GoalDisplay_Loop_OnSideChange), PROC_REPEAT(GoalDisplay_Loop_SlideIn),
    PROC_REPEAT(GoalDisplay_Loop_Display), PROC_REPEAT(GoalDisplay_Loop_SlideOut), PROC_GOTO(0x0), PROC_END,
};
struct ProcCmd gProcScr_PrepMap_MenuButtonDisplay[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_15, PROC_SLEEP(0x0), PROC_CALL(MenuButtonDisp_Init), PROC_LABEL(0x0),
    PROC_WHILE_EXISTS(ProcScr_CamMove), PROC_WHILE(IsAnyPlayerSideWindowRetracting), PROC_CALL(MenuButtonDisp_UpdateCursorPos), PROC_REPEAT(MenuButtonDisp_Loop_OnSlideIn),
    PROC_REPEAT(MenuButtonDisp_Loop_Display), PROC_REPEAT(MenuButtonDisp_Loop_OnSlideOut), PROC_GOTO(0x0), PROC_END,
};
u32 frontier_df4_menu_gap15_3159[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    0x00000001,
    0x47404000,
    0x40000002,
    0x47544000,
    0x00204000,
    0x00024758,
    0x40004000,
    0x4000475A,
    0x475E0020,
    0x40000002,
    0x47438000,
    0x80204000,
    0x00014747,
    0x80004000,
    0x0001474B,
    0x80004000,
    0x0008474F,
    0x00004000,
    0x40000018,
    0x00190010,
    0x00204000,
    0x40000019,
    0x00181030,
    0x20004008,
    0x40080018,
    0x00192010,
    0x20204008,
    0x40080019,
    0x00183030,
    0x40000003,
    0x0000C000,
    0xC0404000,
    0x40000008,
    0x0010C080,
    0x40000002,
    0x0090C000,
    0x80408000,
    0x00000098,
    0x02004BAC,
    0x0000000C,
    0x02004BB4,
    0x0000000C,
    0x00000000,
    0x00000000,
};
struct ProcCmd gProcScr_ChapterStatusScreen[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_CALL(LockGame), PROC_CALL(StartFastFadeToBlack), PROC_REPEAT(WaitForFade), PROC_CALL(BMapDispSuspend),
    PROC_CALL(ChapterStatus_Init), PROC_CALL(ChapterStatus_DrawText), PROC_CALL(ChapterStatus_ShowAllLayers), PROC_LABEL(0x0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler), PROC_LABEL(0x1), PROC_CALL(FadeOutBlackSpeed40Locking), PROC_SLEEP(0x0),
    PROC_CALL(EndMuralBackground), PROC_CALL(ChapterStatus_OnEnd), PROC_CALL(BMapDispResume), PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(StartFastFadeFromBlack), PROC_REPEAT(WaitForFade), PROC_CALL(ChapterStatus_FocusLeaderUnit), PROC_SLEEP(0x0),
    PROC_CALL(UnlockGame), PROC_END,
};
struct ProcCmd ProcScr_ChapterStatusScreen_FromPrep[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_SLEEP(0x0), PROC_CALL(ChapterStatus_Init), PROC_CALL(ChapterStatus_DrawText), PROC_SLEEP(0x0),
    PROC_CALL(ChapterStatus_ShowAllLayers), PROC_CALL(FadeInBlackSpeed40), PROC_SLEEP(0x0), PROC_LABEL(0x0),
    PROC_REPEAT(ChapterStatus_LoopKeyHandler), PROC_LABEL(0x1), PROC_CALL(FadeOutBlackSpeed40Locking), PROC_SLEEP(0x0),
    PROC_CALL(EndMuralBackground), PROC_CALL(ChapterStatus_OnEnd), PROC_END,
};
u32 frontier_df4_menu_gap15_3184[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    0x40000006,
    0x00008000,
    0x80204000,
    0x40000004,
    0x00088040,
    0x80604000,
    0x4000000C,
    0x00108080,
    0x80A04000,
    0x00000014,
};
struct ProcCmd ProcScr_StatusScreenSpriteDraw[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    PROC_SLEEP(0x0), PROC_CALL(StatusScreenSpriteDraw_Init), PROC_REPEAT(StatusScreenSpriteDraw_Loop), PROC_END,
};
u32 frontier_df4_menu_gap15_3192[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = {
    (u32)&sHelpInfo_ChapterStatus_AllyUnits,
    (u32)&sHelpInfo_ChapterStatus_TurnCount,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_Leader,
    0x06744424,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_Goal,
    (u32)&sHelpInfo_ChapterStatus_Funds,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_TimePlayed,
    0x06757410,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_TurnCount,
    (u32)&sHelpInfo_ChapterStatus_AllyUnits,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_TimePlayed,
    0x06768410,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_Funds,
    (u32)&sHelpInfo_ChapterStatus_Goal,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_EnemyUnits,
    0x06702B14,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_Funds,
    (u32)&sHelpInfo_ChapterStatus_Goal,
    (u32)&sHelpInfo_ChapterStatus_AllyUnits,
    (u32)&sHelpInfo_ChapterStatus_Leader,
    0x06712B4C,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_TimePlayed,
    (u32)&sHelpInfo_ChapterStatus_TimePlayed,
    (u32)&sHelpInfo_ChapterStatus_Goal,
    0x00000000,
    0x06723E88,
    0x00000000,
    0x00000000,
    (u32)&sHelpInfo_ChapterStatus_Leader,
    (u32)&sHelpInfo_ChapterStatus_Leader,
    (u32)&sHelpInfo_ChapterStatus_Funds,
    0x00000000,
    0x06737F98,
    0x00000000,
    0x00000000,
    0x44000006,
    0x00004000,
    0x40204400,
    0x44080004,
    0x00084000,
    0x40204408,
    0x4410000C,
    0x00104000,
    0x40204410,
    0x00020014,
    0x80004400,
    0x44000000,
    0x00048020,
    0x00000004,
    (u32)&CgText_OnEnd,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&CgText_Init,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&CgText_InitBlendAmt,
    0x0002000B,
    0x00000000,
    0x00000003,
    (u32)&CgText_LoopFadeIn,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&CgText_2,
    0x00000003,
    (u32)&CgText_0,
    0x0004000B,
    0x00000000,
    0x00000010,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&CgText_InitFadeOut,
    0x00000003,
    (u32)&CgText_LoopFadeOut,
    0x00000002,
    (u32)&CgText_1,
    0x0000000E,
    0x00000000,
    0x0005000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000007BF,
    0x000007C0,
    0x000007BB,
    0x000007BC,
    0x0000000E,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000003,
    (u32)&CgTextInterpreter_Loop_Main,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&BackgroundSlide_Init,
    0x00000003,
    (u32)&CgTextInterpreter_1,
    0x0000000C,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&CgTextInterpreter_2,
    0x0000000C,
    0x00000000,
    0x0063000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0008000E,
    0x00000000,
    0x00000003,
    (u32)&YesNoChoice_Loop_KeyHandler,
    0x0005000E,
    0x00000000,
    0x00000000,
    0x00000000,
};
u8 frontier_df4_menu_016_A74CEC[] __attribute__((section(".data.frontier_df4_menu.gap16"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.4bpp");
/* PNG-extracted LZ sheet (byte-exact at -mindist 2): Img_ChapterIntroCrestJp [0:0xFC0]
 * 212 4bpp tiles (32x424 human layout, TSA-composed 192x144) -> editable PNG.
 * Tsa_ChapterIntroCrestJp [0xFC0:0x11E8]: LZ77 TSA payload (0x227+1-B natural pad
 * compressed -> 0x360 B/432 u16 entries), consumed by sub_801FAA0 as a 24x18 map
 * with tilebase 0x5000 + palette 5 into gBG2TilemapBuffer -- was baseline symbol
 * gUnknown_08A7AE50 (layout/baseline_syms.d/zfix_801FAA0.tsv), now real typed data.
 * Pal_ChapterIntroCrestJp [0x11E8:0x1208]: matching 16-color palette; 3 of 16
 * entries have bit15 set so a JASC/.gbapal round-trip would clear that bit --
 * emitted as exact editable u16 literals instead. Both LZ streams reproduce
 * byte-exact at gbagfx's default (mindist 2). */
u8 Img_ChapterIntroCrestJp[] __attribute__((section(".data.frontier_df4_menu.gap17"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.4bpp.lz");
u8 Tsa_ChapterIntroCrestJp[] __attribute__((section(".data.frontier_df4_menu.gap17"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90_tsa.tsa.bin.lz");
u16 Pal_ChapterIntroCrestJp[16] __attribute__((section(".data.frontier_df4_menu.gap17"))) = {
    0x0000, 0x0C00, 0x2400, 0x1800, 0xAC22, 0x1C00, 0xB063, 0x38A5,
    0x3CE7, 0x4529, 0x496A, 0xCDCE, 0x49AD, 0x4A0F, 0x4A52, 0x0000,
};
u8 frontier_df4_menu_018_A92B38[] __attribute__((section(".data.frontier_df4_menu.gap18"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.4bpp");
u32 frontier_df4_menu_019_A934EC[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    0x00000001,
    (u32)&data_081F5548 + 0x4,
    0x0008000F,
    0x00000000,
    0x00000002,
    (u32)&LockGame,
    0x00000002,
    (u32)&StartFastFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&BMapDispSuspend,
    0x00000002,
    (u32)&UnitList_Init,
    0x00000002,
    (u32)&StartFastFadeFromBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_SetBlendEffects,
    0x00000003,
    (u32)&UnitList_Loop,
    0x00000002,
    (u32)&StartFastFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&UnitList_OnEnd,
    0x00000002,
    (u32)&BMapDispResume,
    0x00000002,
    (u32)&RefreshBMapGraphics,
    0x00000002,
    (u32)&EndAllMus,
    0x00000002,
    (u32)&StartFastFadeFromBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&UnlockGame,
    0x0004000C,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_StartPageChange,
    0x00000003,
    (u32)&UnitList_PageChangeOut_Loop,
    0x00000003,
    (u32)&UnitList_PageChangeIn_Loop,
    0x0001000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_StartStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&UnitList_ResetFromStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&EnableAllDisplay,
    0x0001000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_UnitListScreen_PrepMenu[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_NAME((void*)((u8*)data_081F5548 + 0x4)), PROC_SLEEP(0x1), PROC_CALL(UnitList_Init), PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade), PROC_LABEL(0x1), PROC_CALL(UnitList_SetBlendEffects), PROC_REPEAT(UnitList_Loop),
    PROC_CALL(StartMidFadeToBlack), PROC_REPEAT(WaitForFade), PROC_CALL(UnitList_OnEnd), PROC_GOTO(0x4),
    PROC_LABEL(0x2), PROC_CALL(UnitList_StartPageChange), PROC_REPEAT(UnitList_PageChangeOut_Loop), PROC_REPEAT(UnitList_PageChangeIn_Loop),
    PROC_GOTO(0x1), PROC_LABEL(0x3), PROC_CALL(UnitList_StartStatScreen), PROC_SLEEP(0x1),
    PROC_CALL(UnitList_ResetFromStatScreen), PROC_SLEEP(0x1), PROC_CALL(EnableAllDisplay), PROC_GOTO(0x1),
    PROC_LABEL(0x4), PROC_END,
};
u32 frontier_df4_menu_gap19_3247[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&UnitList_Init,
    0x00000002,
    (u32)&StartFastFadeFromBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_SetBlendEffects,
    0x00000003,
    (u32)&UnitList_Loop,
    0x00000002,
    (u32)&StartFastFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&UnitList_OnEnd,
    0x0004000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_StartStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&UnitList_ResetFromStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&EnableAllDisplay,
    0x0001000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&data_081F5548 + 0x4,
    0x00000002,
    (u32)&LockGame,
    0x00000002,
    (u32)&UnitList_Init,
    0x00000002,
    (u32)&StartFastFadeFromBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_SetBlendEffects,
    0x00000003,
    (u32)&UnitList_Loop,
    0x00000002,
    (u32)&StartFastFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&UnitList_OnEnd,
    0x00000002,
    (u32)&UnlockGame,
    0x0004000C,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_StartPageChange,
    0x00000003,
    (u32)&UnitList_PageChangeOut_Loop,
    0x00000003,
    (u32)&UnitList_PageChangeIn_Loop,
    0x0001000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&UnitList_StartStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&UnitList_ResetFromStatScreen,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&EnableAllDisplay,
    0x0001000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&data_081F5548 + 0xc,
    0x00000002,
    (u32)&UnitListScreenSprites_Init,
    0x00000003,
    (u32)&UnitListScreenSprites_Main,
    0x00000002,
    (u32)&nullsub_76,
    0x00000000,
    0x00000000,
    0x03040405,
    0x04050203,
    0x02020203,
    0x00010101,
    0x80000001,
    0x025C0000,
    0x00000001,
    0x025D4000,
    0x80000001,
    0x025F0000,
    (u32)&gUnitlistscreen_11 + 0xa,
    (u32)&gUnitlistscreen_11 + 0x12,
    (u32)&gUnitlistscreen_11 + 0x1a,
    0x80000001,
    0x02DF0000,
    0x40000007,
    0x0A4B4000,
    0x40204000,
    0x40000A4C,
    0x0A4C4040,
    0x40604000,
    0x40000A4C,
    0x0A4C4080,
    0x40A04000,
    0x40000A4C,
    0x0A4B50C0,
    0x40000002,
    0x02C08010,
    0x80304000,
    0x000302C4,
    0x80084000,
    0x400002CA,
    0x02CE8028,
    0x40480000,
    0x000302D2,
    0x800C4000,
    0x400002D4,
    0x02D8802C,
    0x404C0000,
    0x000302DC,
    0x80084000,
    0x40000300,
    0x03048028,
    0x40480000,
    0x00030308,
    0x80084000,
    0x4000030A,
    0x030E8028,
    0x40480000,
    0x00030312,
    0x80004000,
    0x40000314,
    0x03188020,
    0x80404000,
    0x0003031C,
    0x800C4000,
    0x400002C0,
    0x02C4802C,
    0x004C8000,
    0x000002C8,
    (u32)&Sprite_Unitlistscreen_4 + 0x9e,
    (u32)&Sprite_Unitlistscreen_4 + 0x2c,
    (u32)&Sprite_Unitlistscreen_4 + 0x3a,
    (u32)&Sprite_Unitlistscreen_4 + 0x4e,
    (u32)&Sprite_Unitlistscreen_4 + 0x62,
    (u32)&Sprite_Unitlistscreen_4 + 0x76,
    (u32)&Sprite_Unitlistscreen_4 + 0x8a,
    (u32)&Sprite_Unitlistscreen_4 + 0x8a,
    (u32)&Sprite_Unitlistscreen_4 + 0x8a,
    (u32)&Sprite_Unitlistscreen_4 + 0x8a,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x00000002,
    0x00000475,
    0x00000040,
    0x0000066B,
    0x0000000E,
    0x00000481,
    0x00000088,
    0x0000066E,
    0x00000020,
    0x0000048B,
    0x000000C0,
    0x00000677,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x00000002,
    0x00000475,
    0x00000044,
    0x0000066B,
    0x00000003,
    0x00000476,
    0x00000081,
    0x000004D7,
    0x00000004,
    0x00000477,
    0x00000098,
    0x000004D8,
    0x00000005,
    0x00000478,
    0x000000B0,
    0x000004D9,
    0x00000006,
    0x00000479,
    0x000000C4,
    0x0000066C,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x00000007,
    0x0000047A,
    0x00000040,
    0x0000066D,
    0x00000008,
    0x0000047B,
    0x0000005F,
    0x000004DD,
    0x00000009,
    0x0000047C,
    0x00000071,
    0x000004DE,
    0x0000000A,
    0x0000047D,
    0x00000088,
    0x000004DF,
    0x0000000B,
    0x0000047E,
    0x000000A1,
    0x000004E0,
    0x0000000C,
    0x0000047F,
    0x000000B8,
    0x000004E1,
    0x0000000D,
    0x00000480,
    0x000000CE,
    0x000004E6,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x0000000E,
    0x00000481,
    0x00000050,
    0x0000066E,
    0x0000000F,
    0x00000482,
    0x00000087,
    0x000004F1,
    0x00000010,
    0x00000483,
    0x000000A6,
    0x000004F2,
    0x00000011,
    0x00000484,
    0x000000C8,
    0x000004F5,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x00000012,
    0x00000485,
    0x00000047,
    0x000004E2,
    0x00000013,
    0x00000486,
    0x0000005F,
    0x000004E3,
    0x00000014,
    0x00000487,
    0x00000078,
    0x000004E4,
    0x00000016,
    0x00000488,
    0x00000093,
    0x000004E5,
    0x00000015,
    0x00000489,
    0x000000BA,
    0x0000066F,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x00000017,
    0x00000000,
    0x0000004C,
    0x000004F6,
    0x00000018,
    0x00000000,
    0x0000005C,
    0x000004F7,
    0x00000019,
    0x00000000,
    0x0000006C,
    0x000004F8,
    0x0000001A,
    0x00000000,
    0x0000007C,
    0x000004F9,
    0x0000001B,
    0x00000000,
    0x0000008C,
    0x000004FD,
    0x0000001C,
    0x00000000,
    0x0000009C,
    0x000004FA,
    0x0000001D,
    0x00000000,
    0x000000AC,
    0x000004FB,
    0x0000001E,
    0x00000000,
    0x000000BC,
    0x000004FC,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x0000001F,
    0x0000048A,
    0x0000004A,
    0x000004FF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x0000001F,
    0x0000048A,
    0x0000004A,
    0x000004FF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x0000001F,
    0x0000048A,
    0x0000004A,
    0x000004FF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    0x00000474,
    0x00000014,
    0x0000066A,
    0x0000001F,
    0x0000048A,
    0x0000004A,
    0x000004FF,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0xE0000000,
    0x00000000,
    0x0000E800,
    0xF0000000,
    0x80000000,
    0x0000F800,
    0x00000539,
    0x00000539,
    0x000006F1,
    0x0000053A,
    0x0000053B,
    0x000006F2,
    0x0000053C,
    0x0000053F,
    0x00000000,
    0x00000000,
    0x00000000,
    0x000006F3,
    0x0000053C,
    0x0000054C,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000053E,
    0x0000053E,
    0x00000000,
    0x000006EE,
    0x000006EF,
    0x00000000,
};
struct ProcCmd ProcScr_PrepMenuDescHandler[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_CALL(PrepMenuDescOnInit), PROC_SLEEP(0x1), PROC_CALL(PrepMenuDescOnParse), PROC_SLEEP(0x0),
    PROC_CALL(PrepMenuDescOnDraw), PROC_END,
};
struct ProcCmd ProcScr_AtMenu[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_021bt_1F5598 + 0x10)), PROC_CALL(AtMenu_LockGame), PROC_CALL(EndPrepAtMenuIfNoUnitAvailable), PROC_CALL(PrepAtMenu_OnInit),
    PROC_SLEEP(0x2), PROC_CALL(AtMenu_Reinitialize), PROC_SLEEP(0x2), PROC_CALL_ARG(NewFadeIn, 0x8),
    PROC_WHILE(FadeInExists), PROC_WHILE(MusicProc4Exists), PROC_LABEL(0x1), PROC_CALL(EnablePrepScreenMenu),
    PROC_REPEAT(AtMenu_UpdateDescLoop), PROC_GOTO(0x4), PROC_LABEL(0xC), PROC_CALL(AtMenu_InitSubmenuCursor),
    PROC_REPEAT(AtMenu_CtrlLoop), PROC_GOTO(0x1), PROC_LABEL(0xD), PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL(AtMenu_InitSubmenuCursor), PROC_CALL_ARG(NewFadeIn, 0x8), PROC_WHILE(FadeInExists), PROC_WHILE(MusicProc4Exists),
    PROC_REPEAT(AtMenu_CtrlLoop), PROC_GOTO(0x1), PROC_LABEL(0x2), PROC_REPEAT(AtMenu_StartSubmenu),
    PROC_REPEAT(AtMenu_OnSubmenuEnd), PROC_BLOCK, PROC_LABEL(0xA), PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists), PROC_GOTO(0x2), PROC_LABEL(0x9), PROC_CALL(AtMenu_Reinitialize),
    PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_GOTO(0x1), PROC_LABEL(0x8),
    PROC_CALL_ARG(NewFadeOut, 0x8), PROC_WHILE(FadeOutExists), PROC_GOTO(0x2), PROC_LABEL(0x7),
    PROC_CALL(AtMenu_Reinitialize), PROC_CALL_ARG(NewFadeIn, 0x8), PROC_WHILE(FadeInExists), PROC_GOTO(0x1),
    PROC_LABEL(0xB), PROC_CALL(AtMenuSetUnitStateAndEndFlag), PROC_GOTO(0x5), PROC_LABEL(0x4),
    PROC_CALL(AtMenuSetUnitStateAndEndFlag), PROC_SLEEP(0xA), PROC_LABEL(0x5), PROC_CALL_ARG(NewFadeOut, 0x8),
    PROC_WHILE(FadeOutExists), PROC_SLEEP(0x1), PROC_LABEL(0x6), PROC_CALL(AtMenu_ResetScreenEffect),
    PROC_SLEEP(0x0), PROC_CALL(AtMenu_ResetBmUiEffect), PROC_SLEEP(0x0), PROC_CALL(EndAllMus),
    PROC_CALL(AtMenu_UnlockGame), PROC_END,
};
struct ProcCmd ProcScr_PrepPromoteDebug[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_WHILE(MusicProc4Exists), PROC_CALL(DoPromoteAnimForChar100), PROC_REPEAT(IsGameLockLevelReserved), PROC_SLEEP(0x8),
    PROC_CALL(NullExpForChar100AndResetScreen), PROC_SLEEP(0x1E), PROC_WHILE(MusicProc4Exists), PROC_END,
};
u32 frontier_df4_menu_gap19_3372[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    0x00000002,
    (u32)&AtMenu_LockGame,
    0x00000002,
    (u32)&StartTraineePromoScreen,
    0x0000000E,
    0x00000000,
    0x00C8000B,
    0x00000000,
    0x00000002,
    (u32)&TraineePromo_ResetScreenEffect,
    0x00000002,
    (u32)&AtMenu_UnlockGame,
    0x00000000,
    0x00000000,
    0x40000001,
    0x77808000,
    0x40000002,
    0x77C08000,
    0x80204000,
    0x000277C4,
    0x60004000,
    0x40006798,
    0x679CA020,
    0x40000002,
    0x67985020,
    0x90004000,
    0x0001679C,
    0x80004000,
    0x00016798,
    0x80004000,
    0x0003679C,
    0x80004000,
    0x40000412,
    0x04168020,
    0x40400000,
    0x0002041A,
    0x80004000,
    0x00000400,
    0x04044020,
    0x40000002,
    0x04408000,
    0x40200000,
    0x00020444,
    0x80004000,
    0x80000446,
    0x044A0020,
    0x40000002,
    0x044B8000,
    0x80204000,
    0x0001044F,
    0x00008000,
    0x00010406,
    0x00008000,
    0x00010407,
    0x00008000,
    0x00010408,
    0x00008000,
    0x00010409,
    0x00008000,
    0x0001040A,
    0x00008000,
    0x0001040B,
    0x00008000,
    0x0001040C,
    0x00008000,
    0x0001040D,
    0x00008000,
    0x0001040E,
    0x00008000,
    0x0001040F,
    0x00008000,
    0x00000410,
    (u32)&Sprite_PrepExMap + 0xe,
    (u32)&Sprite_PrepExMap + 0x16,
    (u32)&Sprite_PrepExMap + 0x1e,
    (u32)&Sprite_PrepExMap + 0x26,
    (u32)&Sprite_PrepExMap + 0x2e,
    (u32)&Sprite_PrepExMap + 0x36,
    (u32)&Sprite_PrepExMap + 0x3e,
    (u32)&Sprite_PrepExMap + 0x46,
    (u32)&Sprite_PrepExMap + 0x4e,
    (u32)&Sprite_PrepExMap + 0x56,
    (u32)&Sprite_PrepExMap + 0x5e,
    (u32)&Sprite_PrepExMap + 0xe,
    0x04000001,
    0x0C808000,
    0x44000003,
    0x0C948020,
    0x80484400,
    0x04000C98,
    0x0C9C4068,
    0x44000004,
    0x0C948008,
    0x80304400,
    0x44000CC4,
    0x0CC88050,
    0x40700400,
    0x00040CCC,
    0x80004400,
    0x44000C84,
    0x0C888020,
    0x80404400,
    0x44000C8C,
    0x0C908060,
    0x44000002,
    0x0C948030,
    0x80584400,
    0x00000CCE,
    (u32)&SpriteArray_PrepChapterNumbers + 0x38,
    (u32)&SpriteArray_PrepChapterNumbers + 0x4c,
    (u32)&SpriteArray_PrepChapterNumbers + 0x66,
    (u32)&SpriteArray_PrepChapterNumbers + 0x80,
};
struct ProcCmd ProcScr_PrepScreenSpriteDraw[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_SLEEP(0x0), PROC_CALL(PrepSpriteDraw_Init), PROC_SET_END_CB(PrepSpriteDraw_OnEnd), PROC_REPEAT(PrepSpriteDraw_Loop),
    PROC_END,
};
struct ProcCmd ProcScr_PrepScreenMenuDummyItem[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = {
    PROC_BLOCK, PROC_END,
};
struct ProcCmd data_08A94430[] SECTION(".data.frontier_df4_menu.gap19") = {
    PROC_CALL(PrepMenu_OnInit),
    PROC_SET_END_CB(PrepMenu_OnEnd),
    PROC_SLEEP(0),
    PROC_LABEL(0),
    PROC_REPEAT(PrepMenu_ShowActiveHand),
    PROC_LABEL(1),
    PROC_REPEAT(PrepMenu_CtrlLoop),
    PROC_LABEL(2),
    PROC_REPEAT(PrepMenu_ShowFrozenHand),
    PROC_LABEL(0xA),
    PROC_END,
};

extern const u8 frontier_df4_menu_020_A9454C __attribute__((alias("ProcScr_menu_scroll")));
struct ProcCmd ProcScr_menu_scroll[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_021bt_1F5598 + 0x18)), PROC_CALL(MenuScroll_Init), PROC_LABEL(0x0), PROC_REPEAT(MenuScroll_Loop),
    PROC_LABEL(0x1), PROC_BLOCK, PROC_END,
};
u32 data_08A94584[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x00000001,
    (u32)&frontier_df4_misc_lo_021bt_1F5598 + 0x24,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&SallyCir_Init,
    0x00000003,
    (u32)&SallyCir_Loop,
    0x00000002,
    (u32)&sub_8099D78,
    0x00000000,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000000,
    0x00000000,
};
struct ProcCmd ProcScr_ViewCounter[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_NAME((void*)((u8*)frontier_df4_misc_lo_021bt_1F5598 + 0x30)), PROC_SLEEP(0x0), PROC_REPEAT(ViewCounter_Loop), PROC_END,
};
struct ProcCmd gProcScr_PrepHelpboxListener[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x1), PROC_REPEAT(PrepHbKeyListener_Loop), PROC_END,
};
u32 frontier_df4_menu_gap20_3438[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x00000000,
    0x00000101,
    0x00000202,
    0x00000303,
    0x00000404,
    0x00000505,
    0x00000606,
    0x00000707,
    0x00000C09,
    0x00140001,
    0x002D001F,
    0x00450038,
    0x004B003F,
    0x00000000,
    0x00000540,
    0x00000544,
    0x00000541,
    0x00000546,
    0x00000542,
    0x00000543,
    0x00000540,
    0x00000544,
    0x00000541,
    0x00000546,
    0x00000542,
    0x00000545,
    0x40000004,
    0x00508000,
    0x80204000,
    0x40100054,
    0x00588000,
    0x80204010,
    0x0000005C,
};
struct ProcCmd gProcScr_DrawPrepFundsSprite[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_CALL(DrawFundsSprite_Init), PROC_REPEAT(DrawFundsSprite_Loop), PROC_END,
};
u32 frontier_df4_menu_gap20_3450[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x40000006,
    0x0000C000,
    0xC0404000,
    0x40200008,
    0x00108000,
    0x80204020,
    0x40200014,
    0x00188040,
    0x80604020,
    0x0000001C,
};
struct ProcCmd gProcScr_DrawUnitInfoBgSprites[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_CALL(DrawUnitInfoBg_Init), PROC_REPEAT(DrawUnitInfoBg_Loop), PROC_END,
};
struct ProcCmd ProcScr_PrepItemScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_Init), PROC_CALL(PrepItemScreen_SetupGfx), PROC_CALL(PrepItem_DrawUnitGridScreen),
    PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_SLEEP(0x0), PROC_GOTO(0x1),
    PROC_LABEL(0x0), PROC_CALL(PrepItem_DrawUnitGridScreen), PROC_LABEL(0x1), PROC_REPEAT(PrepItem_GridSelectLoop),
    PROC_CALL(DisableAllDisplay), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_StartStatScreen), PROC_SLEEP(0x0),
    PROC_CALL(PrepItemScreen_ResumeFromStatScreen), PROC_CALL(PrepItem_DrawUnitGridScreen), PROC_SLEEP(0x0), PROC_CALL(EnableAllGfx),
    PROC_GOTO(0x1), PROC_LABEL(0x2), PROC_CALL(PrepItem_DrawSelectedUnitScreen), PROC_CALL(PrepItemScreen_DrawFunds),
    PROC_SLEEP(0x0), PROC_CALL(PrepItem_InitCommandMenu), PROC_LABEL(0x3), PROC_REPEAT(PrepItem_CommandMenuLoop),
    PROC_LABEL(0x4), PROC_CALL(PrepItemScreen_HideFunds), PROC_CALL(PrepItem_InitTradeScreen), PROC_SLEEP(0x0),
    PROC_CALL(PrepItem_EndPopupBoxesAndSync), PROC_LABEL(0x5), PROC_REPEAT(PrepItemScreen_Loop_MainKeyHandler), PROC_CALL(DisableAllDisplay),
    PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_StartStatScreen), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_ResumeFromStatScreen),
    PROC_CALL(PrepItem_InitTradeScreen), PROC_CALL(PrepItem_EndPopupBoxesAndSync), PROC_SLEEP(0x0), PROC_CALL(EnableAllGfx),
    PROC_GOTO(0x5), PROC_LABEL(0x6), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(StartPrepItemTradeScreen), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx), PROC_SLEEP(0x0),
    PROC_CALL(PrepItem_InitTradeScreen), PROC_CALL(PrepItem_EndPopupBoxesAndSync), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x5), PROC_LABEL(0x8), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(StartPrepItemListScreen), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0x0), PROC_CALL(PrepScreenProc_UpdateBgm), PROC_CALL(PrepItem_RefreshSelectedUnitItems), PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds), PROC_CALL(PrepItem_InitCommandMenu), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x3), PROC_LABEL(0x9), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(StartPrepItemUse), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0x0), PROC_CALL(PrepScreenProc_UpdateBgm), PROC_CALL(PrepItem_RefreshSelectedUnitItems), PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds), PROC_CALL(PrepItem_InitCommandMenu), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x3), PROC_LABEL(0xA), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(StartPrepItemSupply), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0x0), PROC_CALL(PrepScreenProc_UpdateBgm), PROC_CALL(PrepItem_RefreshSelectedUnitItems), PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds), PROC_CALL(PrepItem_InitCommandMenu), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x3), PROC_LABEL(0xB), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(StartPrepSell), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0x0), PROC_CALL(PrepScreenProc_UpdateBgm), PROC_CALL(PrepItem_RefreshSelectedUnitItems), PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds), PROC_CALL(PrepItem_InitCommandMenu), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x3), PROC_LABEL(0xC), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(StartPrepArmory), PROC_SLEEP(0x0), PROC_CALL(PrepItemScreen_SetupGfx),
    PROC_SLEEP(0x0), PROC_CALL(PrepScreenProc_UpdateBgm), PROC_CALL(PrepItem_RefreshSelectedUnitItems), PROC_CALL(PrepItem_DrawSelectedUnitScreen),
    PROC_CALL(PrepItemScreen_DrawFunds), PROC_CALL(PrepItem_InitCommandMenu), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_GOTO(0x3), PROC_LABEL(0xD), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_CALL(PrepItemScreen_OnEnd), PROC_CALL(PrepItem_ClearGMapMenuOnCancel), PROC_END,
};
u32 frontier_df4_menu_gap20_3496[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x40000003,
    0x08000000,
    0x00004008,
    0x40100806,
    0x080C0000,
    0x02040200,
    0x40000004,
    0x90008000,
    0x80204000,
    0x00009004,
    0x90084040,
    0x00508000,
    0x0003900A,
    0x80004000,
    0x4000900B,
    0x900F8020,
    0x00408000,
    0x00039013,
    0x80004000,
    0x4000900B,
    0x90148020,
    0x00408000,
    0x00039018,
    0x80004000,
    0x00009019,
    0x901D4020,
    0x00308000,
    0x0000901F,
};
struct ProcCmd ProcScr_PrepUnitScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_SET_END_CB(ProcPrepUnit_OnEnd), PROC_LABEL(0x0), PROC_CALL(ProcPrepUnit_OnInit),
    PROC_CALL(ProcPrepUnit_InitScreen), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_LABEL(0x1),
    PROC_REPEAT(ProcPrepUnit_Idle), PROC_LABEL(0x2), PROC_CALL(PrepUnit_ParkCursorOffList), PROC_REPEAT(PrepUnit_ScrollDownLoop),
    PROC_REPEAT(PrepUnit_WaitDpadUpLoop), PROC_REPEAT(PrepUnit_ScrollUpLoop), PROC_CALL(PrepUnit_RestoreCursorToList), PROC_GOTO(0x1),
    PROC_LABEL(0x3), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists), PROC_CALL(PrepUnit_EndScreenGfx),
    PROC_CALL(PrepUnit_StartUnitListScreen), PROC_SLEEP(0x0), PROC_CALL(PrepUnit_RecountSelectedUnits), PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(0x0), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_GOTO(0x1),
    PROC_LABEL(0x4), PROC_CALL(PrepUnitDisableDisp), PROC_SLEEP(0x2), PROC_CALL(PrepUnit_EndScreenGfx),
    PROC_CALL(PrepUnit_StartStatScreen), PROC_SLEEP(0x0), PROC_CALL(PrepUnit_RestoreListAfterStatScreen), PROC_CALL(ProcPrepUnit_InitScreen),
    PROC_SLEEP(0x2), PROC_CALL(PrepUnitEnableDisp), PROC_GOTO(0x1), PROC_LABEL(0x63),
    PROC_CALL(ProcPrepUnit_OnGameStart), PROC_SLEEP(0x1E), PROC_CALL_ARG(NewFadeOut, 0x8), PROC_WHILE(FadeOutExists),
    PROC_GOTO(0x64), PROC_LABEL(0xA), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_LABEL(0x64), PROC_END,
};
struct ProcCmd ProcScr_PrepItemTradeScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_CALL(PrepItemTrade_Init), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_REPEAT(PrepItemTrade_Loop_MainKeyHandler), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists), PROC_CALL(PrepItemTrade_OnEnd),
    PROC_END,
};
struct ProcCmd ProcScr_PrepItemUseScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_LABEL(0x0), PROC_CALL(PrepItemUse_OnInit), PROC_CALL(PrepItemUse_InitDisplay),
    PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_LABEL(0x1), PROC_REPEAT(PrepItemUse_CtrlLoop),
    PROC_LABEL(0x2), PROC_CALL(PrepItemUse_ConfirmWindowInit), PROC_REPEAT(PrepItemUse_ConfirmWindowCtrlLoop), PROC_GOTO(0x1),
    PROC_LABEL(0x3), PROC_CALL(PrepItemUse_HandleItemEffect), PROC_START_CHILD_BLOCKING((void*)((u8*)frontier_df4_menu_gap20_3536)), PROC_GOTO(0x1),
    PROC_LABEL(0x4), PROC_START_CHILD_BLOCKING((void*)((u8*)ProcScr_PrepItemUseScreen + 0x160)), PROC_GOTO(0x1), PROC_LABEL(0x5),
    PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists), PROC_CALL(StartMidFadeToBlack), PROC_REPEAT(WaitForFade),
    PROC_CALL(StartPrepScreenPromotion), PROC_SLEEP(0x8), PROC_CALL(PrepItemUse_ResetBgmAfterPromo), PROC_SLEEP(0x1E),
    PROC_CALL(PrepItemUse_PostPromotion), PROC_CALL(PrepItemUse_InitDisplay), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists), PROC_GOTO(0x1), PROC_LABEL(0x6), PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists), PROC_LABEL(0x7), PROC_CALL(ProcPrepItemUse_OnEnd), PROC_END,
};
u32 frontier_df4_menu_gap20_3536[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x00000004,
    (u32)&PrepItemUseBooster_OnEnd,
    0x00000002,
    (u32)&PrepItemUseBooster_OnInit,
    0x00000003,
    (u32)&PrepItemUseBooster_IDLE,
    0x00000000,
    0x00000000,
    0x00000004,
    (u32)&PrepItemUseJuna_OnEnd,
    0x00000002,
    (u32)&PrepItemUseJuna_OnInit,
    0x00000003,
    (u32)&PrepItemUseJuna_IDLE,
    0x00000002,
    (u32)&EndManimLevelUpStatGainLabels,
    0x0001000E,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000530,
    0x00000531,
    0x00000532,
    0x0200F17C,
    0x00000547,
    0x00000548,
};
struct ProcCmd ProcScr_PrepItemSupplyScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_LABEL(0x0), PROC_CALL(PrepItemSupply_Init), PROC_CALL(PrepItemSupply_ResetBackgrounds),
    PROC_SLEEP(0x1), PROC_CALL(PrepItemSupply_InitGfx), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_LABEL(0x1), PROC_CALL(PrepItemSupply_EnterGiveTakeMenu), PROC_LABEL(0x2), PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),
    PROC_LABEL(0x4), PROC_CALL(PrepItemSupply_AdjustCursorAndScroll), PROC_REPEAT(PrepItemSupply_Loop_ItemListKeyHandler), PROC_LABEL(0x5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft), PROC_LABEL(0x6), PROC_REPEAT(PrepItemSupply_SwitchPageRight), PROC_LABEL(0x3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory), PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler), PROC_LABEL(0x8), PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists), PROC_LABEL(0x9), PROC_CALL(PrepItemSupply_OnEnd), PROC_END,
};
struct ProcCmd ProcScr_BmSupplyScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_CALL(LockGame), PROC_CALL(StartFastFadeToBlack), PROC_REPEAT(WaitForFade), PROC_CALL(BMapDispSuspend),
    PROC_LABEL(0x0), PROC_CALL(PrepItemSupply_ShowActiveUnitOnEnter), PROC_CALL(PrepItemSupply_Init), PROC_CALL(PrepItemSupply_ResetBackgrounds),
    PROC_SLEEP(0x1), PROC_CALL(PrepItemSupply_InitGfx), PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists),
    PROC_LABEL(0x1), PROC_CALL(PrepItemSupply_EnterGiveTakeMenu), PROC_LABEL(0x2), PROC_REPEAT(PrepItemSupply_Loop_GiveTakeKeyHandler),
    PROC_LABEL(0x4), PROC_CALL(PrepItemSupply_AdjustCursorAndScroll), PROC_REPEAT(PrepItemSupply_Loop_ItemListKeyHandler), PROC_LABEL(0x5),
    PROC_REPEAT(PrepItemSupply_SwitchPageLeft), PROC_LABEL(0x6), PROC_REPEAT(PrepItemSupply_SwitchPageRight), PROC_LABEL(0x3),
    PROC_CALL(PrepItemSupply_SwitchToUnitInventory), PROC_REPEAT(PrepItemSupply_Loop_UnitInvKeyHandler), PROC_LABEL(0x8), PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists), PROC_LABEL(0x9), PROC_CALL(PrepItemSupply_OnEnd), PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics), PROC_CALL(PrepItemSupply_StartActiveUnitMuOnExit), PROC_CALL(StartFastFadeFromBlack), PROC_REPEAT(WaitForFade),
    PROC_SLEEP(0x0), PROC_CALL(UnlockGame), PROC_END,
};
struct ProcCmd ProcScr_PrepItemListScreen[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    PROC_SLEEP(0x0), PROC_CALL(PrepItemList_Init), PROC_LABEL(0x0), PROC_CALL(PrepItemList_InitGfx),
    PROC_CALL_ARG(NewFadeIn, 0x10), PROC_WHILE(FadeInExists), PROC_LABEL(0x1), PROC_CALL(PrepItemList_SnapCursorIntoView),
    PROC_LABEL(0x2), PROC_REPEAT(PrepItemList_Loop_MainKeyHandler), PROC_LABEL(0x6), PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists), PROC_CALL(PrepItemList_OnEnd), PROC_CALL(PrepItemList_StartTradeScreen), PROC_SLEEP(0x0),
    PROC_GOTO(0x0), PROC_LABEL(0x7), PROC_CALL(PrepItemList_SwitchToUnitInventory), PROC_REPEAT(PrepItemList_Loop_UnitInvKeyHandler),
    PROC_GOTO(0x1), PROC_LABEL(0x3), PROC_REPEAT(PrepItemList_SwitchPageLeft), PROC_LABEL(0x4),
    PROC_REPEAT(PrepItemList_SwitchPageRight), PROC_LABEL(0x8), PROC_CALL_ARG(NewFadeOut, 0x10), PROC_WHILE(FadeOutExists),
    PROC_LABEL(0x9), PROC_CALL(PrepItemList_OnEnd), PROC_END,
};
u32 frontier_df4_menu_gap20_3575[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x0000052E,
    0x0000052F,
    0x0200F17C,
    0x0000000E,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&WmSell_Init,
    0x00000002,
    (u32)&WmSell_Setup,
    0x00100018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&WmSell_OnInit_ItemSelect,
    0x00000003,
    (u32)&WmSell_OnLoop_MainKeyHandler,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&WmSell_OnInit_ConfirmSell,
    0x00000003,
    (u32)&WmSell_OnLoop_ConfirmSellKeyHandler,
    0x0003000B,
    0x00000000,
    0x00100018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x00000002,
    (u32)&WmSell_OnEnd,
    0x00000000,
    0x00000000,
    0x00000001,
    0x04064000,
    0x00000001,
    0x04084000,
    0x00000001,
    0x040A4000,
    0x00000001,
    0x040C4000,
    0x00000001,
    0x040E4000,
    0x00000001,
    0x04104000,
    0x00000001,
    0x04124000,
    0x00000001,
    0x04144000,
    0x00000001,
    0x04164000,
    0x40000002,
    0x04008000,
    0x00004010,
    0x00000404,
    (u32)&gProcScr_PrepWMShopSell + 0x88,
    (u32)&gProcScr_PrepWMShopSell + 0x90,
    (u32)&gProcScr_PrepWMShopSell + 0x98,
    (u32)&gProcScr_PrepWMShopSell + 0xA0,
    (u32)&gProcScr_PrepWMShopSell + 0xA8,
    (u32)&gProcScr_PrepWMShopSell + 0xB0,
    (u32)&gProcScr_PrepWMShopSell + 0xB8,
    (u32)&gProcScr_PrepWMShopSell + 0xC0,
    (u32)&gProcScr_PrepWMShopSell + 0xC8,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&nullsub_80,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&FortuneSubMenu_HandleOptionSwitch,
    0x0001000B,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&FortuneSubMenu_OnOptionSelected,
    0x00010006,
    (u32)&data_08A9548C + 0x20,
    0x0005000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&FortuneSubMenu_OnOptionSelected,
    0x00010006,
    (u32)&gDivinationDataTable + 0x2D0,
    0x0005000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00000002,
    (u32)&FortuneSubMenu_OnOptionSelected,
    0x00000002,
    (u32)&StartSupportScreenFromPrepScreen,
    0x0000000E,
    0x00000000,
    0x0005000C,
    0x00000000,
    0x0005000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000510,
    0x00000511,
    0x00000512,
    0x00000513,
    0x00000514,
    0x00000510,
    0x00000511,
    0x00000512,
    0x00000513,
    0x00000514,
    0x00000515,
    0x00000516,
    0x00000517,
    0x00000518,
    0x00000519,
    0x0000051A,
    0x00000001,
    0x08044000,
    0x00000001,
    0x08024000,
    0x00000001,
    0x08024000,
    0x00000001,
    0x08024000,
    0x00000001,
    0x08004000,
    (u32)&gPrepItemTextMsgIds + 0x38,
    (u32)&gPrepItemTextMsgIds + 0x38,
    (u32)&gPrepItemTextMsgIds + 0x38,
    (u32)&gPrepItemTextMsgIds + 0x38,
    (u32)&gPrepItemTextMsgIds + 0x38,
};
u32 data_08A9548C[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&CgTextInterpreter_0,
    0x00000003,
    (u32)&sub_80A2DF8,
    0x00000000,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A3074,
    0x00000002,
    (u32)&sub_80A3118,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x001E000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A3228,
    0x00000002,
    (u32)&sub_80A32C0,
    0x0000000E,
    0x00000000,
    0x00000003,
    (u32)&sub_80A3274,
    0x0000000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x00000002,
    (u32)&sub_80A3250,
    0x00000000,
    0x00000000,
    0x0000001D,
    0x0000001C,
    0x0000001B,
    0x0000001A,
    0x00000019,
    0x00000018,
    (u32)&frontier_df4_misc_lo_021cb_1F5664 + 0x2C,
    (u32)&frontier_df4_misc_lo_021cb_1F5664 + 0x1C,
    (u32)&frontier_df4_misc_lo_021cb_1F5664 + 0x10,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A3458,
    0x00000002,
    (u32)&sub_80A3898,
    0x00000002,
    (u32)&Augury_InitResultScreen,
    0x00000002,
    (u32)&StartMidFadeFromBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000014,
    (u32)&MusicProc4Exists,
    0x0004000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuExtrasMenuLoop,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&sub_80A3C64,
    0x0000000E,
    0x00000000,
    0x00000014,
    (u32)&CgTextExists,
    0x0004000C,
    0x00000000,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&sub_80A3CEC,
    0x00000003,
    (u32)&sub_80A3E24,
    0x00000002,
    (u32)&sub_80A3EF8,
    0x00000002,
    (u32)&Augury_InitResultScreen,
    0x00000003,
    (u32)&sub_80A3F68,
    0x0004000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000002,
    (u32)&StartMidFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&sub_80A3250,
    0x00000002,
    (u32)&sub_80A4088,
    0x0000000E,
    0x00000000,
    0x0004000C,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&StartMidFadeToBlack,
    0x00000003,
    (u32)&WaitForFade,
    0x00000002,
    (u32)&sub_80A3250,
    0x00000000,
    0x00000000,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000100,
    0x000007B1,
    0x000007B1,
    0x000007B1,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A421C,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x00000002,
    (u32)&sub_80A43A0,
    0x00000014,
    (u32)&IsCgTextBlocking,
    0x00000014,
    (u32)&MusicProc4Exists,
    0x00000002,
    (u32)&sub_80A45AC,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&ShowPrepScreenMenuActiveHand,
    0x00000002,
    (u32)&sub_80A46C0,
    0x00000014,
    (u32)&CgTextExists,
    0x00010006,
    (u32)&data_08A95AD8,
    0x0010000E,
    0x00000000,
    0x00000014,
    (u32)&MusicProc4Exists,
    0x00000002,
    (u32)&sub_80A43E4,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A4568,
    0x00000014,
    (u32)&IsCgTextBlocking,
    0x00000002,
    (u32)&sub_80A4608,
    0x0002000B,
    0x00000000,
    0x00000002,
    (u32)&ShowPrepScreenMenuActiveHand,
    0x00000014,
    (u32)&CgTextExists,
    0x00000002,
    (u32)&sub_80A467C,
    0x00000014,
    (u32)&IsCgTextBlocking,
    0x0005000C,
    0x00000000,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&ShowPrepScreenMenuActiveHand,
    0x00000014,
    (u32)&CgTextExists,
    0x00000002,
    (u32)&sub_80A462C,
    0x00000014,
    (u32)&IsCgTextBlocking,
    0x0005000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x00000002,
    (u32)&sub_80A4428,
    0x00000014,
    (u32)&CgTextExists,
    0x0005000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x00000002,
    (u32)&sub_80A447C,
    0x00000014,
    (u32)&CgTextExists,
    0x001E000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A44D0,
    0x0008000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A44F0,
    0x00000014,
    (u32)&CgTextExists,
    0x0005000C,
    0x00000000,
    0x0005000B,
    0x00000000,
    0x00000002,
    (u32)&sub_80A46DC,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x00000002,
    (u32)&sub_80A4544,
    0x00000000,
    0x00000000,
};
u32 data_08A95AD8[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = {
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&sub_80A46F8,
    0x00000003,
    (u32)&sub_80A4738,
    0x0010000E,
    0x00000000,
    0x00000003,
    (u32)&sub_80A47D0,
    0x001E000E,
    0x00000000,
    0x00000000,
    0x00000000,
    0x0200F17C,
};
/* #143 shiftability: the 0x90E B gap21 blob embedded two proc-script tables
 * (gProcScr_SupportScreen @A95B70, gProcScr_SupportUnitSubScreen @A95C94) whose
 * interior pointers were raw un-relocatable words. The two tables are carved into
 * src/data/ProcScr_uisupport_ref/dat_ProcScr_uisupport_ref.c (own 4-aligned .rodata
 * sections); the surrounding data stays here as three INCBIN slices. Byte-exact:
 * 0x22 + 0xE0 + 0x44 + 0x148 + 0x680 = 0x90E. */
/* [0x102,0x146) -> 4 SpriteEx u16 tables, region-same with fe8u src/uisupport.c
 * (sSprite_NameAffinLv/Uisupport_0/Uisupport_1/BackButton), consumed by
 * DrawSupportSubScreenSprites (src/DrawSupportSubScreenSprites.c). Were baseline
 * ABS aliases (layout/baseline_syms.d/cfbind_uisupport.tsv), now real typed data.
 * 0x14+0xE+0x14+0xE = 0x44 (exact). */
u16 sSprite_NameAffinLv[] __attribute__((section(".data.frontier_df4_menu.gap21b"))) = {
    3,
    0x4000, 0x4000, 0x082C,
    0x4000, 0x4020, 0x0830,
    0x4000, 0x4040, 0x0834,
};
u16 sSprite_Uisupport_0[] __attribute__((section(".data.frontier_df4_menu.gap21b"))) = {
    2,
    0x4000, 0x8000, 0x0800,
    0x0000, 0x4020, 0x0804,
};
u16 sSprite_Uisupport_1[] __attribute__((section(".data.frontier_df4_menu.gap21b"))) = {
    3,
    0x4000, 0x8000, 0x0806,
    0x4000, 0x8020, 0x080A,
    0x0000, 0x4040, 0x080E,
};
u16 sSprite_BackButton[] __attribute__((section(".data.frontier_df4_menu.gap21b"))) = {
    2,
    0x4000, 0x8000, 0x0018,
    0x8000, 0x0020, 0x001C,
};
/* [0x146,0x28E) -> gProcScr_SupportUnitSubScreen (ref file) */
/* #143 shiftability: gap21c embeds gUnknown_08A95E20 (ProcScr for sub_80A7650)
 * whose 7 interior ProcCmd pointer words were raw un-relocatable addresses. Split
 * the INCBIN blob around each pointer and emit .4byte <FuncSym> so the linker emits
 * an R_ARM_ABS32 (Thumb bit re-ORed for the FUNC targets). Byte-exact: the .bin base
 * is ROM 0xA95B4E; slices 0x50+4+4+4+4+4+4+0xC+4+4+4+0x5F4 + 7*4 = 0x680. */
u8 frontier_df4_menu_021c_A95DDC[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x28E, 0x50);
u32 frontier_df4_menu_021c_A95DDC_1[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&sub_80A74D4,
};
u8 frontier_df4_menu_021c_A95DDC_2[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x2E2, 0x4);
u32 frontier_df4_menu_021c_A95DDC_3[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&StartMidFadeFromBlack,
};
u8 frontier_df4_menu_021c_A95DDC_4[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x2EA, 0x4);
u32 frontier_df4_menu_021c_A95DDC_5[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&WaitForFade,
};
u8 frontier_df4_menu_021c_A95DDC_6[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x2F2, 0x4);
u32 frontier_df4_menu_021c_A95DDC_7[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&nullsub_82,
};
u8 frontier_df4_menu_021c_A95DDC_8[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x2FA, 0xC);
u32 frontier_df4_menu_021c_A95DDC_9[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&StartMidFadeToBlack,
};
u8 frontier_df4_menu_021c_A95DDC_10[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x30A, 0x4);
u32 frontier_df4_menu_021c_A95DDC_11[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&WaitForFade,
};
u8 frontier_df4_menu_021c_A95DDC_12[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin", 0x312, 0x4);
u32 frontier_df4_menu_021c_A95DDC_13[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    (u32)&sub_80A7620,
};
/* Tail [0x31A,0x90E) / ROM 0x08A95E68..0x08A9645C (issue #143 menu pass):
 * [0,0x18) 12 exact u16 values, no pointer/consumer/fe8u match -> typed literal
 * table, honest "unknown purpose" floor. [0x18,0x320) Img_PrepHelpButtonSprites:
 * LZ77 (776 B compressed) -> 2048 B/64 4bpp tiles, 256x16 PNG; consumers
 * PrepHelpPrompt_Init/MenuButtonDisp_Init (was baseline ABS alias
 * layout/baseline_syms.tsv:Img_PrepHelpButtonSprites, dropped via
 * layout/baseline_syms_drop.d/Img_PrepHelpButtonSprites.tsv). [0x320,0x5D4)
 * Gfx_SoundTest_8035650: JP-only BB sound-test caption, LZ77 (689 B + 3-B natural
 * pad = 692 B compressed) -> 2048 B/64 4bpp tiles, 256x16 PNG; consumer
 * sub_8035650 decompresses to 0x06015000 (was baseline ABS alias
 * layout/baseline_syms.d/zfix_8035650.tsv). Both LZ streams reproduce byte-exact
 * at gbagfx's default (mindist 2). [0x5D4,0x5F4) Pal_SoundTest_8035650: matching
 * 16-color palette, applied to OBJ palette bank 5 (0xA8<<2) before
 * gProcScr_SubtitleHelpDarkener; clean JASC round-trip. */
u16 frontier_df4_menu_021c_A95E68[12] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = {
    0x000B, 0x0063, 0x0000, 0x0000, 0x0010, 0x0000,
    0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000,
};
u8 Img_PrepHelpButtonSprites[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/Img_PrepHelpButtonSprites.4bpp.lz");
u8 Gfx_SoundTest_8035650[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U8("graphics/frontier_df4_menu/Gfx_SoundTest_8035650.4bpp.lz");
u16 Pal_SoundTest_8035650[] __attribute__((section(".data.frontier_df4_menu.gap21c"))) = INCBIN_U16("graphics/frontier_df4_menu/Pal_SoundTest_8035650.gbapal");
u8 frontier_df4_menu_022_A96D18[] __attribute__((section(".data.frontier_df4_menu.gap22"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18_0.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18_1.4bpp.lz");
/* multi-stream container split (A99FA8, 1660 B): [0x0,0x40) = 2 verbatim palettes,
   then 3 self-delimiting LZ77 4bpp sub-streams -> editable PNG (png->4bpp->.4bpp.lz,
   -mindist 2 reproduces each ROM block byte-for-byte incl. %4 padding): _0 64t menu
   text, _1 14t UI bar, _2 64t icon sheet; [0x53C,end) = 0x140 trailing raw verbatim.
   Reassembled at the exact ROM offsets; make compare is the oracle. */
u8 frontier_df4_menu_023_A99FA8[] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U8(
    "graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_pal0.gbapal",
    "graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_pal1.gbapal",
    "graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_0.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_1.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8_2.4bpp.lz");
/* [0x53C,0x5FC): gPal_A9A4E4[6][16], six augury/rank-sprite palette frames
 * (consumers sub_80A2DF8, sub_80A3074, sub_80A3458); was baseline ABS alias
 * (layout/baseline_syms.d/zfix_80A3074.tsv). Emitted as 6 concatenated 16-color
 * JASC sources (a single 96-color .pal round-trips to a padded 256-color
 * .gbapal, so it is split per fe8-palette-bank convention). */
u16 gPal_A9A4E4[96] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U16(
    "graphics/frontier_df4_menu/gPal_A9A4E4_0.gbapal",
    "graphics/frontier_df4_menu/gPal_A9A4E4_1.gbapal",
    "graphics/frontier_df4_menu/gPal_A9A4E4_2.gbapal",
    "graphics/frontier_df4_menu/gPal_A9A4E4_3.gbapal",
    "graphics/frontier_df4_menu/gPal_A9A4E4_4.gbapal",
    "graphics/frontier_df4_menu/gPal_A9A4E4_5.gbapal");
/* [0x5FC,0x67C): Pal_PrepWindowA/B/C/D[16], byte-identical to fe8u's own
 * Pal_08A1D850/08A1D870/08A1D890/08A1D8B0.gbapal (src/data/data_A195B0.c);
 * were baseline ABS aliases (layout/baseline_syms.d/handdecomp_Prep_LoadWindowGfx.tsv). */
u16 Pal_PrepWindowA[16] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U16("graphics/frontier_df4_menu/Pal_PrepWindowA.gbapal");
u16 Pal_PrepWindowB[16] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U16("graphics/frontier_df4_menu/Pal_PrepWindowB.gbapal");
u16 Pal_PrepWindowC[16] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U16("graphics/frontier_df4_menu/Pal_PrepWindowC.gbapal");
u16 Pal_PrepWindowD[16] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U16("graphics/frontier_df4_menu/Pal_PrepWindowD.gbapal");
/* PNG-extracted LZ sheet (byte-exact at -mindist 2): [0:0x3DC] 61t 4bpp sheet ->
 * editable PNG; [0x3DC:0x3FC] trailing raw kept verbatim (symbol size 1020). */
/* PNG-extracted LZ sheet (byte-exact at -mindist 2): [0:0x3DC] 61t 4bpp sheet ->
 * editable PNG; [0x3DC:0x3FC] a generic reused 16-color UI-gradient palette,
 * byte-identical to fe8u's gPal_SupportMenu (src/data/data_A195B0.c) -- no static
 * consumer found for this JP copy, so kept a conservative local name/comment
 * rather than claiming that identity, but emitted as an editable JASC source. */
u8 frontier_df4_menu_024_A9AC28[] __attribute__((section(".data.frontier_df4_menu.gap24"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28_pal.gbapal");
u32 frontier_df4_menu_026_A9CF7C[] __attribute__((section(".data.frontier_df4_menu.gap26"))) = {
    0x60000000,
    0x00000000,
    0x00006800,
    0x70008000,
    0x80000000,
    0x00007800,
};

struct ProcCmd ProcScr_SaveMenuPopupHelpBox_Init_A9CF7C_0[] SECTION(".data.frontier_df4_menu.gap26") = {
    PROC_SLEEP(0),
    PROC_CALL(SaveMenuPopupHelpBox_Init),
    PROC_SLEEP(8),
    PROC_REPEAT(SaveMenuPopupHelpBox_WaitInput),
    PROC_SLEEP(8),
    PROC_END,
};

u32 data_08A9CFC4[] __attribute__((section(".data.frontier_df4_menu.gap26"))) = {
    0x00000002,
    (u32)&ExtraMapStartSomeBgm,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&ExecExtraMap,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&frontier_df4_voice_000_1F578C + 0x50,
    0x0000000B,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_Init,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_InitScreen,
    0x00000002,
    (u32)&SaveMenu_LoadExtraMenuGraphics,
    0x0000000E,
    0x00000000,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x0000000E,
    0x00000000,
    0x00000014,
    (u32)&MusicProc4Exists,
    0x00000002,
    (u32)&SaveMenu_JumpToTarget,
    0x0002000B,
    0x00000000,
    0x00000003,
    (u32)&SameMenu_CtrlLoop,
    0x000F000C,
    0x00000000,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_ResetLcdFormDifficulty,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x00000002,
    (u32)&DisableAllDisplay,
    0x00000002,
    (u32)&sub_80B0E88,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_ReloadScreenFormDifficulty,
    0x00000002,
    (u32)&SaveMenu_ResetLcdFormDifficulty,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x00000002,
    (u32)&SaveMenu_PostDifficultHandler,
    0x0005000B,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuSlotSelDrawSprite,
    0x0000000E,
    0x00000000,
    0x00000003,
    (u32)&SaveMenu_SaveSlotSelectLoop,
    0x000F000C,
    0x00000000,
    0x0007000B,
    0x00000000,
    0x0005000E,
    0x00000000,
    0x00000002,
    (u32)&_ExecSaveMenuMiscOption,
    0x0005000C,
    0x00000000,
    0x0006000B,
    0x00000000,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuRegisterSlotSelected,
    0x0001000E,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuWaitSlotBoxScrolling,
    0x0005000C,
    0x00000000,
    0x0003000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuScrollSlot,
    0x0005000C,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_EndHelpPromptSprite,
    0x00000003,
    (u32)&SaveMenuScrollBackToMain,
    0x0002000C,
    0x00000000,
    0x0008000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuScrollExtrasIn,
    0x0009000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuScrollExtrasOut,
    0x000C000B,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuLoadExtraOptionGfx,
    0x00000003,
    (u32)&SaveMenuScrollExtraSlotIn,
    0x000D000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuScrollExtraSlotOut,
    0x000A000B,
    0x00000000,
    0x00000003,
    (u32)&gap_000AE5A4 + 0x1,
    0x000B000B,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuStartBonusClaim,
    0x0000000E,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuExtraSlotSelectLoop,
    0x000E000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x00000014,
    (u32)&IsMusicProc2Running,
    0x00000002,
    (u32)&sub_80AEBAC,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_Init,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_InitScreen,
    0x00000002,
    (u32)&SaveMenu_LoadExtraMenuGraphics,
    0x0000000E,
    0x00000000,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x00000014,
    (u32)&IsMusicProc2Running,
    0x00000002,
    (u32)&SaveMenuPostExtraMiscScreen,
    0x0015000B,
    0x00000000,
    0x00000010,
    0x00000000,
    0x0012000B,
    0x00000000,
    0x00040018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x000F000C,
    0x00000000,
    0x0011000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x000F000B,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&PostSaveMenuHandler,
    0x0000000E,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&frontier_df4_voice_000_1F578C + 0x50,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuInit,
    0x00000002,
    (u32)&SaveMenu_SetLcdChapterIdx,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenu_InitScreen,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuDirectlySelectSlotOnPrepScreen,
    0x00080018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x0005000C,
    0x00000000,
    0x0014000B,
    0x00000000,
    0x00040018,
    (u32)&NewFadeIn,
    0x00000014,
    (u32)&FadeInExists,
    0x0005000B,
    0x00000000,
    0x00000003,
    (u32)&SaveMenu_SaveSlotSelectLoop,
    0x000F000C,
    0x00000000,
    0x0006000B,
    0x00000000,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&SaveMenuRegisterSlotSelected,
    0x0001000E,
    0x00000000,
    0x00000003,
    (u32)&SaveMenuWaitSlotBoxScrolling,
    0x0005000C,
    0x00000000,
    0x0012000B,
    0x00000000,
    0x00040018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x000F000C,
    0x00000000,
    0x0011000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut,
    0x00000014,
    (u32)&FadeOutExists,
    0x000F000B,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00000002,
    (u32)&PostSaveMenuHandler,
    0x00000000,
    0x00000000,
    0x02000968,
    0x00000002,
    (u32)&BonusClaimMenu_Init,
    0x00000002,
    (u32)&BonusClaimMenu_PromptSong4,
    0x00000003,
    (u32)&BonusClaimMenu_WaitInput,
    0x0010000E,
    0x00000000,
    0x0000000B,
    0x00000000,
    0x00000002,
    (u32)&BonusClaimMenu_PromptSong3,
    0x00000003,
    (u32)&BonusClaimMenu_WaitInput,
    0x0010000E,
    0x00000000,
    0x0001000B,
    0x00000000,
    0x00000002,
    (u32)&BonusClaimMenu_SaveData,
    0x000A000B,
    0x00000000,
    0x00000000,
    0x00000000,
};
/* #143: the 120 B block [0x08A9D5D4, 0x08A9D64C) that held ProcScr_savedraw,
 * gProcScr_SaveDrawCursor and gProcScr_Savedraw_0 is typed out as struct
 * ProcCmd[] in src/data/ProcScr_savedraw_ref so its interior code/name pointers
 * become R_ARM_ABS32 relocations. Keep only the 0x172 B head here; the tail
 * (0x1EA onward, incl. data_08A9D688) moves to a new gap27c section placed at
 * 0x08A9D64C, so the carved scripts can sit in their own 4-aligned section
 * without bumping this 2-aligned (base 0x08A9D462) blob's alignment. */
u8 frontier_df4_menu_027b_A9D64C[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x1EA, 0x20);
u32 frontier_df4_menu_027b_A9D64C_1[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = {
    (u32)&SaveDrawCursorYOffsetLut + 0x1B,
};
u8 frontier_df4_menu_027b_A9D64C_2[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x20E, 0xC);
u32 frontier_df4_menu_027b_A9D64C_3[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = {
    (u32)&SqMask_Loop,
};
u8 frontier_df4_menu_027b_A9D64C_4[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x21E, 0x8);
struct ProcCmd ProcScr_CallExtraMap[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = {
    PROC_NAME((void*)((u8*)SaveDrawCursorYOffsetLut + 0x23)),
    PROC_SLEEP(0x1),
    PROC_REPEAT(SaveBgUp_Loop),
    PROC_END,
};
extern const u32 data_08A9D688 __attribute__((alias("ProcScr_CallExtraMap")));
u8 frontier_df4_menu_gap27c_4090[] __attribute__((section(".data.frontier_df4_menu.gap27c"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x246, 0x1AE);
u32 frontier_df4_menu_028_A9E244[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    0x02021188,
    0x02021388,
};

struct ProcCmd ProcScr_SoundRoomSongChange_FadeOutPrevious_A9E244_0[] SECTION(".data.frontier_df4_menu.gap28") = {
    PROC_CALL(SoundRoomSongChange_FadeOutPrevious),
    PROC_SLEEP(0),
    PROC_CALL(SoundRoomSongChange_StartNext),
    PROC_END,
};

u32 frontier_df4_menu_gap28_4111[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    0x03005400,
};

struct ProcCmd ProcScr_sub_80B3E40_A9E244_1[] SECTION(".data.frontier_df4_menu.gap28") = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80B3E40),
    PROC_SLEEP(0),
    PROC_CALL(nullsub_89),
    PROC_REPEAT(VolumeGraphBuffer_Loop),
    PROC_END,
};

struct ProcCmd data_08A9E2A0[] SECTION(".data.frontier_df4_menu.gap28") = {
    PROC_SLEEP(0),
    PROC_CALL(SoundRoomUi_Init),
    PROC_CALL_ARG(NewFadeIn, 4),
    PROC_WHILE(FadeInExists),
    PROC_WHILE(MusicProc4Exists),
    PROC_LABEL(0),
    PROC_REPEAT(SoundRoomUi_Loop_MainKeyHandler),
    PROC_LABEL(1),
    PROC_CALL(SoundRoomUi_0),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),
    PROC_REPEAT(SoundRoomUi_1),
    PROC_CALL(SoundRoomUi_2),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),
    PROC_GOTO(0),
    PROC_LABEL(2),
    PROC_CALL(SoundRoomUi_0),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideOut),
    PROC_CALL(SoundRoomUi_3),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideIn),
    PROC_SLEEP(0x10),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayKeyHandler),
    PROC_REPEAT(SoundRoomUi_Loop_ShufflePlayUiSlideOut),
    PROC_CALL(SoundRoomUi_2),
    PROC_REPEAT(SoundRoomUi_Loop_MainUiSlideIn),
    PROC_SLEEP(0x10),
    PROC_GOTO(0),
    PROC_LABEL(3),
    PROC_REPEAT(SoundRoomUi_RestartTitleMusic),
    PROC_CALL_ARG(NewFadeOut, 4),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(SoundRoomUi_OnEnd),
    PROC_SLEEP(0),
    PROC_END,
};

u32 frontier_df4_menu_gap28_4161[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    0x00000002,
    0x05504008,
    0x80204000,
    0x00020512,
    0x80004000,
    0x40000552,
    0x05168020,
    0x40000002,
    0x05568000,
    0x80204000,
    0x0005051A,
    0x80004000,
    0x40000500,
    0x05048020,
    0x80404000,
    0x40000508,
    0x050C8060,
    0x40800000,
    0x00030510,
    0x40004000,
    0x40000560,
    0x05644020,
    0x00400000,
    0x00010568,
    0x00000000,
    0x0001014F,
    0x40004000,
    0x00010140,
    0x00000000,
    0x0001014E,
    0x00000000,
    0x00010144,
    0x00000000,
    0x00010145,
    0x00000000,
    0x00010146,
    0x00000000,
    0x00010147,
    0x00000000,
    0x00010148,
    0x00000000,
    0x00010149,
    0x00000000,
    0x0001014A,
    0x00000000,
    0x0001014B,
    0x00000000,
    0x0001014C,
    0x00000000,
    0x0000014D,
    (u32)&gSprite_MusicPlayer_Colon + 0x8,
    (u32)&gSprite_MusicPlayer_Colon + 0x10,
    (u32)&gSprite_MusicPlayer_Colon + 0x18,
    (u32)&gSprite_MusicPlayer_Colon + 0x20,
    (u32)&gSprite_MusicPlayer_Colon + 0x28,
    (u32)&gSprite_MusicPlayer_Colon + 0x30,
    (u32)&gSprite_MusicPlayer_Colon + 0x38,
    (u32)&gSprite_MusicPlayer_Colon + 0x40,
    (u32)&gSprite_MusicPlayer_Colon + 0x48,
    (u32)&gSprite_MusicPlayer_Colon + 0x50,
};

struct ProcCmd ProcScr_sub_80B4F34_08A9E2A0_0[] SECTION(".data.frontier_df4_menu.gap28") = {
    PROC_SLEEP(0),
    PROC_CALL(sub_80B4F34),
    PROC_REPEAT(SoundRoom_DrawSprites_Loop),
    PROC_END,
};

u32 frontier_df4_menu_gap28_4232[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    0x60000000,
    0x00000000,
    0x00006800,
    0x78008000,
    0x80000000,
    0x00007800,
};

struct ProcCmd gProcScr_SoundRoomUi[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    PROC_CALL(ExtramenuUnk_Init),
    PROC_CALL(ExtramenuUnk_LoadGfx),
    PROC_SET_END_CB(nullsub_90),
    PROC_REPEAT(ExtramenuUnk_DrawIconLoop),
    PROC_END,
};
extern const u32 data_08A9E4D0 __attribute__((alias("gProcScr_SoundRoomUi")));
u32 frontier_df4_menu_gap28_4249[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = {
    0x02000968,
    0x02000D68,
    0x02001168,
    0x02001568,
    0x02001668,
    0x02001368,
};
struct ProcCmd data_08A9E510[] SECTION(".data.frontier_df4_menu.gap28") = {
    PROC_SLEEP(0),
    PROC_CALL(BonusClaim_Init),
    PROC_CALL_ARG(NewFadeIn, 8),
    PROC_WHILE(FadeInExists),
    PROC_LABEL(0),
    PROC_REPEAT(BonusClaim_Loop_MainKeyHandler),
    PROC_GOTO(0x64),
    PROC_LABEL(1),
    PROC_CALL(BonusClaim_StartSelectTargetSubMenu),
    PROC_REPEAT(BonusClaim_Loop_SelectTargetKeyHandler),
    PROC_CALL(BonusClaim_EndSelectTargetSubMenu),
    PROC_GOTO(0),
    PROC_LABEL(2),
    PROC_CALL(BonusClaim_DrawItemSentPopup),
    PROC_REPEAT(BonusClaim_Loop_PopupDisplayTimer),
    PROC_CALL(BonusClaim_ClearItemSentPopup),
    PROC_GOTO(0),
    PROC_LABEL(0x64),
    PROC_CALL_ARG(NewFadeOut, 8),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(BonusClaim_OnEnd),
    PROC_END,
};

u8 frontier_df4_menu_029_AA3860[] __attribute__((section(".data.frontier_df4_menu.gap29"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin");
u8 frontier_df4_menu_030_AA71D4[] __attribute__((section(".data.frontier_df4_menu.gap30"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin");
/* Wave47: LZ-hybrid decomposed — 1044B JP-LZ 4bpp sheet (128 tiles, byte-exact
 * via gbagfx default) + 32B raw 16-color palette tail. */
u8 frontier_df4_menu_031_AA9F98[] __attribute__((section(".data.frontier_df4_menu.gap31"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98_pal.gbapal");
/* PNG-extracted LZ sheet (byte-exact at -mindist 2): [0:0x7F4] is a self-contained
 * 122t 4bpp LZ sheet -> editable PNG. The [0x7F4:0x300C] trailing raw block is a
 * separate symbol (data_08AAB440) still sliced verbatim from the original .bin. */
u8 frontier_df4_menu_032_AAAC4C[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.4bpp.lz");
u8 data_08AAB440[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x7F4, 0x2818);
/* PNG-extracted LZ sheet (byte-exact at -mindist 2): [0:0x33C] 52t 4bpp sheet ->
 * editable PNG; [0x33C:0x810] trailing raw kept verbatim. */
u8 frontier_df4_menu_033_AAEB40[] __attribute__((section(".data.frontier_df4_menu.gap33"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.4bpp.lz", "graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin", 0x33C, 0x4D4);
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
struct ProcCmd ProcScr_Config_Field[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
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
};
struct ProcCmd ProcScr_Config_PrepMapMenu[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
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
};
struct ProcCmd ProcScr_Config_WorldMap[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
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
};
struct ProcCmd ProcScr_ColFadeOut[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    PROC_NAME(&frontier_df4_voice_000b_1F5898[0xC]),
    PROC_SLEEP(0x2),
    PROC_CALL(ColFadeOut_Init),
    PROC_SLEEP(0x0),
    PROC_REPEAT(ColFadeOut_Loop),
    PROC_END,
};
struct ProcCmd ProcScr_ColFadeIn[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
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
u32 data_08AAFCAC[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    0x03000001,
    0x04008000,
    0x00000001,
    (u32)&gUnkData_ClassIntroBgConfig + 0x18,
    0x00100018,
    (u32)&NewFadeIn + 0x1,
    0x00000014,
    (u32)&FadeInExists + 0x1,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&ClassIntro_Init + 0x1,
    0x00000003,
    (u32)&ClassIntro_LoopIn + 0x1,
    0x003C000E,
    0x00000000,
    0x00000003,
    (u32)&ClassIntro_LoopOut + 0x1,
    0x00000002,
    (u32)&ClassIntro_DisableAllExceptBg1 + 0x1,
    0x00000002,
    (u32)&StartMidFadeToBlack + 0x1,
    0x00000003,
    (u32)&WaitForFade + 0x1,
    0x0004000B,
    0x00000000,
    0x00000002,
    (u32)&ClassIntro_OnEnd + 0x1,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&gUnkData_ClassIntroBgConfig + 0x24,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&ClassIntroLetter_Init + 0x1,
    0x00000003,
    (u32)&ClassIntroLetter_LoopFadeIn + 0x1,
    0x00000003,
    (u32)&ClassIntroLetter_LoopDisplay + 0x1,
    0x00000003,
    (u32)&ClassIntroLetter_LoopFadeOut + 0x1,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&gUnkData_ClassIntroBgConfig + 0x30,
    0x0001000E,
    0x00000000,
    0x00000002,
    (u32)&ClassIntroIcon_Init + 0x1,
    0x00000003,
    (u32)&ClassIntroIcon_LoopFadeIn + 0x1,
    0x00000003,
    (u32)&ClassIntroIcon_LoopDisplay + 0x1,
    0x0004000B,
    0x00000000,
    0x00000003,
    (u32)&ClassIntroIcon_LoopFadeOut + 0x1,
    0x00000000,
    0x00000000,
};
struct ProcCmd gProcScr_ClassIntro_FlareFX[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    PROC_SLEEP(0x1),
    PROC_CALL((void*)((u8*)ClassIntroFlare_Init + 0x1)),
    PROC_START_CHILD((void*)((u8*)frontier_df4_menu_gap34_4422)),
    PROC_REPEAT((void*)((u8*)ClassIntroFlare_Loop + 0x1)),
    PROC_SLEEP(0x1E),
    PROC_END,
};
u32 frontier_df4_menu_gap34_4422[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    0x001E000E,
    0x00000000,
    0x00000002,
    (u32)&ClassIntroBurst_Init + 0x1,
    0x00000003,
    (u32)&ClassIntroBurst_Loop + 0x1,
    0x00000000,
    0x00000000,
    0x0000000E,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut + 0x1,
    0x00000014,
    (u32)&FadeOutExists + 0x1,
    0x00000002,
    (u32)&ClassInfoDisplay_Init + 0x1,
    0x00000004,
    (u32)&ClassInfoDisplay_OnEnd + 0x1,
    0x0002000E,
    0x00000000,
    0x00000003,
    (u32)&ClassInfoDisplay_LoopWindowIn + 0x1,
    0x0009000B,
    0x00000000,
    0x00000002,
    (u32)&ClassInfoDisplay_ExecScript + 0x1,
    0x00000003,
    (u32)&ClassInfoDisplay_LoopScript + 0x1,
    0x0009000C,
    0x00000000,
    0x000A000B,
    0x00000000,
    0x00000010,
    0x00000000,
    0x0004000B,
    0x00000000,
    0x00080018,
    (u32)&NewFadeOut + 0x1,
    0x00000014,
    (u32)&FadeOutExists + 0x1,
    0x0008000C,
    0x00000000,
    0x0007000B,
    0x00000000,
    0x00020018,
    (u32)&NewFadeOut + 0x1,
    0x00000014,
    (u32)&FadeOutExists + 0x1,
    0x0008000B,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000001,
    (u32)&gOpinfo_0 + 0x30,
    0x0003000E,
    0x00000000,
    0x00000002,
    (u32)&ClassStatsDisplay_Init + 0x1,
    0x00000003,
    (u32)&ClassStatsDisplay_Loop + 0x1,
    0x00000000,
    0x00000000,
    0x00000001,
    0x093F0000,
    0x00000001,
    0x093E0000,
    0x00000001,
    0x093D0000,
    0x00000001,
    0x093C0000,
    (u32)&gProcScr_opinfogaugedraw + 0x28,
    (u32)&gProcScr_opinfogaugedraw + 0x30,
    (u32)&gProcScr_opinfogaugedraw + 0x38,
    (u32)&gProcScr_opinfogaugedraw + 0x40,
    0x00000001,
    0x07008000,
    0x00000001,
    0x07048000,
    0x00000001,
    0x07088000,
    0x00000001,
    0x070C8000,
    0x00000001,
    0x07108000,
    0x00000001,
    0x07148000,
    0x00000001,
    0x07188000,
    0x00000001,
    0x071C8000,
    (u32)&sSpriteLut_GaugePips + 0x10,
    (u32)&sSpriteLut_GaugePips + 0x18,
    (u32)&sSpriteLut_GaugePips + 0x20,
    (u32)&sSpriteLut_GaugePips + 0x28,
    (u32)&sSpriteLut_GaugePips + 0x30,
    (u32)&sSpriteLut_GaugePips + 0x38,
    (u32)&sSpriteLut_GaugePips + 0x40,
    (u32)&sSpriteLut_GaugePips + 0x48,
    0x00000001,
    0x07804000,
    0x00011E05,
    0x28050008,
    0x50050003,
    0x00080001,
    0x00032805,
    0x28050000,
    0x00080001,
    0x00032805,
    0x00016405,
    0x28050008,
    0x00000003,
    0x00012805,
    0x5A050008,
    0x00000003,
    0x00043C05,
    0x46050008,
    0x00000003,
    0x00013C05,
    0x28050008,
    0x00000003,
    0x00042805,
    0x28050008,
    0x48050003,
    0x00080004,
    0x00032805,
    0x28050000,
    0x00080004,
    0x00032805,
    0x50050000,
    0x00080004,
    0x00035A05,
    0x50050000,
    0x00080004,
    0x00035A05,
    0x50050000,
    0x00080001,
    0x00036405,
    0x78050000,
    0x00080001,
    0x00032805,
    0x28050000,
    0x00080004,
    0x0003AA05,
    0x3C050000,
    0x00080004,
    0x00036005,
    0x28050000,
    0x00080004,
    0x0003C805,
    0x00000000,
    (u32)&gUnkData_96 + 0x20,
    (u32)&gUnkData_96 + 0xD4,
    (u32)&gUnkData_96 + 0x144,
    (u32)&gUnkData_96 + 0x1E4,
    (u32)&gUnkData_96 + 0x28C,
    (u32)&gUnkData_96 + 0x344,
    (u32)&gUnkData_96 + 0x404,
    (u32)&gUnkData_96 + 0x4A8,
    (u32)&gUnkData_96 + 0x560,
    (u32)&gUnkData_96 + 0x610,
    (u32)&gUnkData_96 + 0x6A4,
    (u32)&gUnkData_96 + 0x72C,
    (u32)&gUnkData_96 + 0x7E4,
    (u32)&gUnkData_96 + 0x884,
    (u32)&gUnkData_96 + 0x944,
    (u32)&gUnkData_96 + 0xA18,
    (u32)&gUnkData_96 + 0xAD4,
    (u32)&gUnkData_96 + 0xB70,
    (u32)&gUnkData_96 + 0xC18,
    (u32)&gUnkData_96 + 0xCBC,
    (u32)&gUnkData_96 + 0xD60,
    (u32)&gUnkData_96 + 0xDF8,
    (u32)&gUnkData_96 + 0xE80,
    (u32)&gUnkData_96 + 0xF10,
    (u32)&gUnkData_96 + 0xFAC,
    (u32)&gUnkData_96 + 0x1068,
    (u32)&gUnkData_96 + 0x1110,
    (u32)&gUnkData_96 + 0x11C8,
    (u32)&gUnkData_96 + 0x1250,
    (u32)&gUnkData_96 + 0x12FC,
    (u32)&gUnkData_96 + 0x1370,
    (u32)&gUnkData_96 + 0x1448,
    (u32)&gUnkData_96 + 0x1504,
    (u32)&gUnkData_96 + 0x15C0,
    (u32)&gUnkData_96 + 0x165C,
    (u32)&gUnkData_96 + 0x170C,
    (u32)&gUnkData_96 + 0x17AC,
    (u32)&gUnkData_96 + 0x1890,
    (u32)&gUnkData_96 + 0x1924,
    (u32)&gUnkData_96 + 0x19C4,
    (u32)&gUnkData_96 + 0x1A7C,
    (u32)&gUnkData_96 + 0x1B08,
    (u32)&gUnkData_96 + 0x1BB0,
    (u32)&gUnkData_96 + 0x1C74,
    (u32)&gUnkData_96 + 0x1D38,
    (u32)&gUnkData_96 + 0x1DC8,
    (u32)&gUnkData_96 + 0x1E88,
    (u32)&gUnkData_96 + 0x1F2C,
    (u32)&gUnkData_96 + 0x1FB8,
    (u32)&gUnkData_96 + 0x2068,
    (u32)&gUnkData_96 + 0x20F4,
    (u32)&gUnkData_96 + 0x2194,
    (u32)&gUnkData_96 + 0x222C,
    (u32)&gUnkData_96 + 0x22D4,
    (u32)&gUnkData_96 + 0x2398,
    (u32)&gUnkData_96 + 0x242C,
    (u32)&gUnkData_96 + 0x24BC,
    (u32)&gUnkData_96 + 0x25F4,
    (u32)&gUnkData_96 + 0x26DC,
    (u32)&gUnkData_96 + 0x27E0,
    (u32)&gUnkData_96 + 0x28D4,
    (u32)&gUnkData_96 + 0x29E4,
    (u32)&gUnkData_96 + 0x2B24,
    (u32)&gUnkData_96 + 0x2BD0,
    (u32)&gUnkData_96 + 0x2C74,
    (u32)&gUnkData_96 + 0x2DA4,
    (u32)&gUnkData_96 + 0x2EE0,
    (u32)&gUnkData_96 + 0x2FEC,
    (u32)&gUnkData_96 + 0x3090,
    (u32)&gUnkData_96 + 0x31B4,
    (u32)&gUnkData_96 + 0x32E0,
    (u32)&gUnkData_96 + 0x33E4,
    (u32)&gUnkData_96 + 0x34D8,
    (u32)&gUnkData_96 + 0x35A4,
    (u32)&gUnkData_96 + 0x36C8,
    (u32)&gUnkData_96 + 0x37D4,
    (u32)&gUnkData_96 + 0x3900,
    (u32)&gUnkData_96 + 0x39A0,
    (u32)&gUnkData_96 + 0x3A60,
    (u32)&gUnkData_96 + 0x3B80,
    (u32)&gUnkData_96 + 0x3C38,
    (u32)&gUnkData_96 + 0x3D54,
    (u32)&gUnkData_96 + 0x3E30,
    (u32)&gUnkData_96 + 0x3F28,
    (u32)&gUnkData_96 + 0x4048,
    (u32)&gUnkData_96 + 0x40E8,
    (u32)&gUnkData_96 + 0x4220,
    (u32)&gUnkData_96 + 0x42D8,
    (u32)&gUnkData_96 + 0x43DC,
    (u32)&gUnkData_96 + 0x44B4,
    (u32)&gUnkData_96 + 0x457C,
    (u32)&gUnkData_96 + 0x4654,
    0xFF020100,
    0x01050403,
    0xFF020100,
    0x3AFF3938,
    0x433CFF3B,
    0x020106FF,
    0x01050403,
    0xFF433DFF,
    0x0A010908,
    0x403EFF0B,
    0x0D010CFF,
    0xFF010E01,
    0x100F010B,
    0x1104FF01,
    0xFF011216,
    0x04140913,
    0x15161115,
    0x0B1706FF,
    0x15161118,
    0x1A1912FF,
    0x0BFF211B,
    0x11010301,
    0x1CFF1516,
    0x18191E1D,
    0x01141FFF,
    0x15161115,
    0x201902FF,
    0x15161121,
    0x201902FF,
    0x05040321,
    0x1622FF01,
    0x1121010C,
    0x23FF1516,
    0x11040D24,
    0x13FF1516,
    0x21261825,
    0xFF151611,
    0xFF434241,
    0x03FF3B44,
    0x16111C01,
    0x1017FF15,
    0xFF210301,
    0x02161802,
    0x11030DFF,
    0x4245FF01,
    0x4746FF43,
    0x050417FF,
    0x4948FF01,
    0x0C1815FF,
    0xFF180102,
    0x2B18252A,
    0xFF0B0A2C,
    0x0BFF404A,
    0xFF21170D,
    0xFF1F0100,
    0xFF4D4C4B,
    0x101C1806,
    0x404EFF01,
    0x002D1EFF,
    0x010D2103,
    0x012C17FF,
    0x4FFF0105,
    0xFF433D50,
    0xFF27212E,
    0xFF012F03,
    0x15183004,
    0x1831FF21,
    0xFF210151,
    0xFF18010C,
    0x0C351836,
    0x0DFF1801,
    0x29002D16,
    0x0132FF04,
    0x0133020D,
    0x1830FF1F,
    0xFF040034,
    0x092A1805,
    0x1F03FF04,
    0xFF181635,
    0xFF181F27,
    0x272D010B,
    0x20FF181F,
    0xFF212001,
    0x21200120,
    0xFF1F3736,
    0x16200124,
    0x041AFF18,
    0x16200124,
    0x1902FF18,
    0x212E2120,
    0x3F41FF27,
    0x2D0703FF,
    0x58FF1501,
    0x3D5B5A59,
    0x4241FF43,
    0x54535243,
    0x575655FF,
    0x0000FF43,
};
/* frontier_df4_menu_035_AB0830: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
u32 frontier_df4_menu_035_AB0830[] __attribute__((section(".data.frontier_df4_menu.gap35"))) = {
    0x012FFF04,
    0x00000576,
    0x15150000,
    (u32)&sSprite_Opinfo_13 + 0xAA,
    (u32)&gOpinfo_0 + 0x218,
    0x0000067F,
    (u32)&gOpinfo_1 + 0x1CB,
    0x010BFF05,
    0x00000044,
    0x02020000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x220,
    0x00000684,
    (u32)&gOpinfo_1 + 0x185,
    0x0015FF07,
    0x00000014,
    0x09090000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x22C,
    0x0000068B,
    (u32)&gOpinfo_1 + 0x1EA,
    0x00236808,
    0x00000061,
    0x16160000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x23C,
    0x0000068F,
    (u32)&gOpinfo_1 + 0x22E,
    0x002B0D02,
    0x00000481,
    0x14140000,
    (u32)&sSprite_Opinfo_13 + 0x7A,
    (u32)&gOpinfo_0 + 0x244,
    0x0000068A,
    (u32)&gOpinfo_1 + 0x1E1,
    0x00211708,
    0x0000005C,
    0x16160000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x254,
    0x00000682,
    (u32)&gOpinfo_1 + 0x17F,
    0x00116B02,
    0x0000000D,
    0x17170000,
    (u32)&sSprite_Opinfo_13 + 0x8,
    (u32)&gOpinfo_0 + 0x25C,
    0x000006A3,
    (u32)&gOpinfo_1 + 0x1FB,
    0x00491C08,
    0x00000067,
    0x0D0D0000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x26C,
    0x000006B2,
    (u32)&gOpinfo_1 + 0x284,
    0x0159FF06,
    0x000000AC,
    0x04040000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x278,
    0x000006B6,
    (u32)&gOpinfo_1 + 0x2A0,
    0x015DFF05,
    0x000000B2,
    0x01010000,
    (u32)&sSprite_Opinfo_13 + 0x8,
    (u32)&gOpinfo_0 + 0x280,
    0x000006BD,
    (u32)&gOpinfo_1 + 0x2CA,
    0x0164FF07,
    0x000000BE,
    0x16160000,
    (u32)&sSprite_Opinfo_13 + 0x34,
    (u32)&gOpinfo_0 + 0x290,
    0x000006B5,
    (u32)&gOpinfo_1 + 0x29A,
    0x015CFF05,
    0x000000B1,
    0x13130000,
    (u32)&sSprite_Opinfo_13 + 0x8,
    (u32)&gOpinfo_0 + 0x29C,
    0x000006BA,
    (u32)&gOpinfo_1 + 0x2B7,
    0x0161FF04,
    0x000008BB,
    0x01010000,
    (u32)&sSprite_Opinfo_13 + 0xC2,
    (u32)&gOpinfo_0 + 0x2A4,
    0x000006AA,
    (u32)&gOpinfo_1 + 0x259,
    0x014FFF07,
    0x0000029C,
    0x14140000,
    (u32)&sSprite_Opinfo_13 + 0x7A,
    (u32)&gOpinfo_0 + 0x2B0,
    0x0000069D,
    (u32)&gOpinfo_1 + 0x21D,
    0x01314F04,
    0x0000057A,
    0x15150000,
    (u32)&sSprite_Opinfo_13 + 0xAA,
    (u32)&gOpinfo_0 + 0x2BC,
    0x00000692,
    (u32)&gOpinfo_1 + 0x2DD,
    0x003CFF05,
    0x000006C4,
    0x10100000,
    (u32)&sSprite_Opinfo_13 + 0x9E,
    (u32)&gOpinfo_0 + 0x2C4,
    0x000006B9,
    (u32)&gOpinfo_1 + 0x2B0,
    0x0160FF06,
    0x000007BA,
    0x06060000,
    (u32)&sSprite_Opinfo_13 + 0xB6,
    (u32)&gOpinfo_0 + 0x2D0,
    0x00000689,
    (u32)&gOpinfo_1 + 0x1D9,
    0x001F1507,
    0x00000057,
    0x04040000,
    (u32)&sSprite_Opinfo_13 + 0x8,
    (u32)&gOpinfo_0 + 0x2E0,
    0x000006A8,
    (u32)&gOpinfo_1 + 0x250,
    0x014EFF05,
    0x00000097,
    0x14140000,
    (u32)&sSprite_Opinfo_13 + 0x8,
    0x23292F35,
    0x0C12181D,
    0x00000006,
};
u32 frontier_df4_menu_036_AB0D18[] __attribute__((section(".data.frontier_df4_menu.gap36"))) = {
    0x00080001,
    0x0C784000,
    0x00000002,
    0x0CC24000,
    0x00004010,
    0x00010D02,
    0x00008008,
    0x00020C7A,
    0x40000000,
    0x40100CC4,
    0x0D040000,
    0x00080001,
    0x0C7B4000,
    0x80000002,
    0x0CC60000,
    0x00000010,
    0x00020D06,
    0x40000008,
    0x40180CC8,
    0x0D080000,
    0x00000002,
    0x0CCA4000,
    0x00004010,
    0x00020D0A,
    0x00008000,
    0x00100CCC,
    0x0D0C0000,
    0x80000002,
    0x0C7F0000,
    0x00008010,
    0x00020CBF,
    0x40000000,
    0x40100CCD,
    0x0D0D0000,
    0x80000002,
    0x0CCF0000,
    0x00000010,
    0x00010D0F,
    0x40000008,
    0x00010C7D,
    0x40000008,
    0x00010CB8,
    0x40000008,
    0x00020CBA,
    0x40000008,
    0x40180CD0,
    0x0D100000,
    0x00080002,
    0x0CD24000,
    0x00004018,
    0x00020D12,
    0x00008000,
    0x00100CD4,
    0x0D140000,
    0x80080001,
    0x0CBC0000,
    0x80000002,
    0x0CD50000,
    0x00000010,
    0x00010D15,
    0x40000008,
    0x00010CBD,
    0x40000008,
    0x00020CF8,
    0x40000008,
    0x00020CFA,
    0x40000008,
    0x00020CFC,
    0x40000008,
    0x40180CD6,
    0x0D160000,
    0x00080001,
    0x0CFE4000,
    (u32)&sSprite_ClassDisplay_A,
    0x00001900,
    (u32)&sSprite_ClassDisplay_B,
    0x00001100,
    (u32)&sSprite_ClassDisplay_C,
    0x00001200,
    (u32)&sSprite_ClassDisplay_D,
    0x00001400,
    (u32)&sSprite_ClassDisplay_E,
    0x00001000,
    (u32)&sSprite_ClassDisplay_F,
    0x00001000,
    (u32)&sSprite_ClassDisplay_G,
    0x00001200,
    (u32)&sSprite_ClassDisplay_H,
    0x00001400,
    (u32)&sSprite_ClassDisplay_I,
    0x00000F00,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&sSprite_ClassDisplay_L,
    0x00001100,
    (u32)&sSprite_ClassDisplay_M,
    0x00001600,
    (u32)&sSprite_ClassDisplay_N,
    0x00001400,
    0x00000000,
    0x00000000,
    (u32)&sSprite_ClassDisplay_P,
    0x00001000,
    0x00000000,
    0x00000000,
    (u32)&sSprite_ClassDisplay_R,
    0x00001500,
    (u32)&sSprite_ClassDisplay_S,
    0x00001700,
    (u32)&sSprite_ClassDisplay_T,
    0x00001100,
    0x00000000,
    0x00000000,
    (u32)&sSprite_ClassDisplay_V,
    0x00001300,
    (u32)&sSprite_ClassDisplay_W,
    0x00001800,
    0x00000000,
    0x00000000,
    0x00000000,
    0x00000000,
    (u32)&sSprite_ClassDisplay_Z,
    0x00001700,
    (u32)&frontier_df4_menu_036_AB0D18,
    0x00000800,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x8,
    0x00000900,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x16,
    0x00000600,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x1e,
    0x00000800,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x2c,
    0x00000800,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x34,
    0x00000700,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x42,
    0x00000B01,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x50,
    0x00000901,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x5e,
    0x00000600,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x6c,
    0x00000701,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x7a,
    0x00000901,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x88,
    0x00000601,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x96,
    0x00000D00,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x9e,
    0x00000900,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xa6,
    0x00000700,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xae,
    0x00000800,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xbc,
    0x00000A00,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xca,
    0x00000700,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xd8,
    0x00000700,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xe0,
    0x00000600,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xee,
    0x00000901,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xf6,
    0x00000801,
    (u32)&frontier_df4_menu_036_AB0D18 + 0xfe,
    0x00000C01,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x106,
    0x00000901,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x10e,
    0x00000A01,
    (u32)&frontier_df4_menu_036_AB0D18 + 0x11c,
    0x00000801,
};
/* multi-slice atomic relocation carve of frontier_df4_menu_037_AB7144 (embedded ProcScr @ 0x5650):
   the graphics prefix [0,0x5650) is a DECORATIVE FONT container -- fully split into editable PNGs:
   [0,0x20) 1 palette verbatim, then a 320t Latin-alphabet sheet (_00), [0xF00,0xF60) 3 palettes
   verbatim, then 92 self-delimiting 16t class-name glyph sheets (_01.._92, e.g. Lord/Mercenary/
   Hero/Myrmidon kanji), [0x5624,0x5650) 0x2C pre-ProcScr raw verbatim. Each LZ sub-stream is
   png->4bpp->.4bpp.lz at -mindist 2 (reproduces the ROM block byte-for-byte incl. %4 padding).
   The shop/menu ProcScr tail [0x5650,end) keeps its 50 func pointers + 2 self-ref child-ProcScr
   pointers (blob+0x5984) as .4byte Sym(+addend); the 11 coincidental ROM-range words there are NOT
   pointers (mid-func / mid-data offsets) and stay raw. byte-exact; make compare is the oracle. */
u8 frontier_df4_menu_037_AB7144[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = INCBIN_U8(
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin", 0x0, 0x20,
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_00.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin", 0xF00, 0x60,
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_01.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_02.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_03.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_04.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_05.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_06.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_07.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_08.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_09.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_10.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_11.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_12.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_13.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_14.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_15.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_16.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_17.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_18.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_19.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_20.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_21.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_22.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_23.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_24.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_25.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_26.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_27.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_28.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_29.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_30.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_31.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_32.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_33.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_34.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_35.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_36.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_37.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_38.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_39.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_40.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_41.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_42.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_43.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_44.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_45.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_46.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_47.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_48.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_49.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_50.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_51.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_52.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_53.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_54.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_55.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_56.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_57.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_58.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_59.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_60.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_61.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_62.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_63.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_64.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_65.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_66.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_67.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_68.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_69.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_70.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_71.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_72.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_73.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_74.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_75.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_76.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_77.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_78.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_79.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_80.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_81.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_82.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_83.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_84.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_85.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_86.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_87.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_88.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_89.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_90.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_91.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144_92.4bpp.lz",
    "graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin", 0x5624, 0x2C);
u32 frontier_df4_menu_037_AB7144_1[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = {
    (u32)&LockGame + 0x1,
    0x0001000E,
    0x00000000,
    0xFFFF0018,
    (u32)&_FadeBgmOut + 0x1,
    0x00000002,
    (u32)&StartMidFadeToBlack + 0x1,
    0x00000003,
    (u32)&WaitForFade + 0x1,
    0x00000002,
    (u32)&BMapDispSuspend + 0x1,
    0x00000000,
    0x00000000,
    0x00000002,
    (u32)&ResetDialogueScreen + 0x1,
    0x00000002,
    (u32)&BMapDispResume + 0x1,
    0x00000002,
    (u32)&RefreshBMapGraphics + 0x1,
    0x00000002,
    (u32)&StartMapSongBgm + 0x1,
    0x00000002,
    (u32)&StartMidFadeFromBlack + 0x1,
    0x00000003,
    (u32)&WaitForFade + 0x1,
    0x00000002,
    (u32)&UnlockGame + 0x1,
    0x00000000,
    0x00000000,
};
struct ProcCmd gProcScr_Shop[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = {
    PROC_CALL((void*)((u8*)StartShopFadeIn + 0x1)), PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)LockGame + 0x1)), PROC_CALL((void*)((u8*)Shop_Init + 0x1)),
    PROC_CALL((void*)((u8*)Shop_InitBuyState + 0x1)), PROC_START_CHILD((void*)((u8*)frontier_df4_menu_gap37_4741)), PROC_CALL((void*)((u8*)FadeInBlackSpeed20 + 0x1)), PROC_SLEEP(0x1),
    PROC_CALL((void*)((u8*)Shop_EntryDialogue + 0x1)), PROC_LABEL(0x0), PROC_SLEEP(0x1), PROC_REPEAT((void*)((u8*)Shop_HandleEntryDialoguePrompt + 0x1)),
    PROC_LABEL(0x1), PROC_CALL((void*)((u8*)Shop_BuyDialogue + 0x1)), PROC_LABEL(0x2), PROC_CALL((void*)((u8*)Shop_InitBuyState + 0x1)),
    PROC_SLEEP(0x1), PROC_REPEAT((void*)((u8*)Shop_Loop_BuyKeyHandler + 0x1)), PROC_CALL((void*)((u8*)Shop_HandleBuyConfirmPrompt + 0x1)), PROC_GOTO(0x9),
    PROC_LABEL(0x3), PROC_CALL((void*)((u8*)Shop_AnythingElseDialogue + 0x1)), PROC_GOTO(0x2), PROC_LABEL(0x4),
    PROC_CALL((void*)((u8*)Shop_SellDialogue + 0x1)), PROC_LABEL(0x5), PROC_CALL((void*)((u8*)Shop_InitSellState + 0x1)), PROC_SLEEP(0x1),
    PROC_REPEAT((void*)((u8*)Shop_Loop_SellKeyHandler + 0x1)), PROC_CALL((void*)((u8*)Shop_HandleSellConfirmPrompt + 0x1)), PROC_SLEEP(0x2), PROC_CALL((void*)((u8*)Shop_SellAnythingElseDialogue + 0x1)),
    PROC_GOTO(0x5), PROC_LABEL(0x7), PROC_SLEEP(0x2), PROC_CALL((void*)((u8*)Shop_AnythingElseRestartDialogue + 0x1)),
    PROC_GOTO(0x0), PROC_LABEL(0x8), PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)Shop_AnythingElseContinueDialogue + 0x1)),
    PROC_GOTO(0x0), PROC_LABEL(0x9), PROC_CALL((void*)((u8*)Shop_TryAddItemToInventory + 0x1)), PROC_SLEEP(0x0),
    PROC_CALL((void*)((u8*)Shop_HandleSendToConvoyPrompt + 0x1)), PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)Shop_CheckIfConvoyFull + 0x1)), PROC_CALL((void*)((u8*)Shop_ConvoyFullDialogue + 0x1)),
    PROC_SLEEP(0x0), PROC_GOTO(0x7), PROC_LABEL(0xA), PROC_CALL((void*)((u8*)Shop_AddItemToConvoy + 0x1)),
    PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)Shop_SendToConvoyDialogue + 0x1)), PROC_SLEEP(0x0), PROC_GOTO(0x3),
    PROC_LABEL(0xB), PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)Shop_NoSendToConvoyDialogue + 0x1)), PROC_SLEEP(0x0),
    PROC_GOTO(0x7), PROC_LABEL(0xD), PROC_CALL((void*)((u8*)Shop_PrepEntryDialogue + 0x1)), PROC_SLEEP(0x0),
    PROC_REPEAT((void*)((u8*)Shop_Loop_UnkKeyHandler + 0x1)), PROC_LABEL(0xC), PROC_CALL((void*)((u8*)Shop_ExitShopDialogue + 0x1)), PROC_SLEEP(0x1),
    PROC_CALL_ARG((void*)((u8*)_FadeBgmOut + 0x1), 0x2), PROC_CALL((void*)((u8*)FadeOutBlackSpeed20Locking + 0x1)), PROC_SLEEP(0x1), PROC_CALL((void*)((u8*)Shop_OnExit + 0x1)),
    PROC_END_EACH((void*)((u8*)frontier_df4_menu_gap37_4741)), PROC_CALL((void*)((u8*)StartShopFadeOut + 0x1)), PROC_SLEEP(0x0), PROC_CALL((void*)((u8*)UnlockGame + 0x1)),
    PROC_END,
};
u32 frontier_df4_menu_gap37_4732[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = {
    0x00000003,
    (u32)&InitShopBuyStatus + 0x1,
    0x00000000,
    0x00000000,
    0x00000003,
    (u32)&InitShopSellStatus + 0x1,
    0x00000000,
    0x00000000,
    0x40000006,
    0x04004000,
    0x40204000,
    0x40080402,
    0x04064000,
    0x40204008,
    0x40100408,
    0x040C4000,
    0x40204010,
    0x0000040E,
};
struct ProcCmd gProcScr_GoldBox[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = {
    PROC_REPEAT((void*)((u8*)GoldBox_OnLoop + 0x1)), PROC_END,
};
u32 frontier_df4_menu_gap37_4741[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = {
    0x00000003,
    (u32)&_DisplayShopUiArrows + 0x1,
};
/* frontier_df4_menu_038_ABCD24: the [0,0x20) arena ProcScr's 2 func pointers (Arena_PlayResultSong,
   Arena_PlayArenaSong) become .4byte Sym+0x1. The [0x20,end) descriptor table stays .incbin -- it
   interleaves u16 immediates with sparse pointers and contains PROVEN coincidental ROM-range words
   (adjacent u16 pairs read as 0x08xx1B20), so a typed extraction is deferred to a dedicated data
   task. Externally referenced by base+offset (dat_gProcScr_ArenaUiResults_ref, frontier_df4_banim_b);
   the .global symbol keeps the same address. byte-exact. */
u32 frontier_df4_menu_038_ABCD24[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    0x00000002,
    (u32)&Arena_PlayResultSong + 0x1,
    0x00D2000E,
    0x00000000,
    0x00000002,
    (u32)&Arena_PlayArenaSong + 0x1,
    0x00000000,
    0x00000000,
};
u8 frontier_df4_menu_038_ABCD24_1[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x20, 0x6D0);
u32 frontier_df4_menu_038_ABCD24_2[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0x684,
};
u8 frontier_df4_menu_038_ABCD24_3[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x6F4, 0x4);
u32 frontier_df4_menu_038_ABCD24_4[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&EventScr_CallOnTutorialMode,
};
u8 frontier_df4_menu_038_ABCD24_5[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x6FC, 0x10);
u32 frontier_df4_menu_038_ABCD24_6[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_7[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x710, 0x20);
u32 frontier_df4_menu_038_ABCD24_8[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_9[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x734, 0x198);
u32 frontier_df4_menu_038_ABCD24_10[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0x85C,
};
u8 frontier_df4_menu_038_ABCD24_11[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x8D0, 0x4);
u32 frontier_df4_menu_038_ABCD24_12[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&EventScr_CallOnTutorialMode,
};
u8 frontier_df4_menu_038_ABCD24_13[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x8D8, 0x10);
u32 frontier_df4_menu_038_ABCD24_14[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_15[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x8EC, 0x20);
u32 frontier_df4_menu_038_ABCD24_16[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_17[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x910, 0x160);
u32 frontier_df4_menu_038_ABCD24_18[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_19[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xA74, 0x20);
u32 frontier_df4_menu_038_ABCD24_20[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_21[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xA98, 0xC4);
u32 frontier_df4_menu_038_ABCD24_22[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0xBC8,
};
u8 frontier_df4_menu_038_ABCD24_23[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xB60, 0x5C);
u32 frontier_df4_menu_038_ABCD24_24[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_25[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xBC0, 0x88);
u32 frontier_df4_menu_038_ABCD24_26[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0xE30,
};
u8 frontier_df4_menu_038_ABCD24_27[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xC4C, 0x24);
u32 frontier_df4_menu_038_ABCD24_28[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_29[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xC74, 0x218);
u32 frontier_df4_menu_038_ABCD24_30[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_31[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xE90, 0x20);
u32 frontier_df4_menu_038_ABCD24_32[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_33[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xEB4, 0xC4);
u32 frontier_df4_menu_038_ABCD24_34[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_35[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xF7C, 0x20);
u32 frontier_df4_menu_038_ABCD24_36[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_37[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0xFA0, 0x190);
u32 frontier_df4_menu_038_ABCD24_38[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0x106C,
};
u8 frontier_df4_menu_038_ABCD24_39[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1134, 0x10);
u32 frontier_df4_menu_038_ABCD24_40[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_41[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1148, 0x20);
u32 frontier_df4_menu_038_ABCD24_42[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_43[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x116C, 0x1D8);
u32 frontier_df4_menu_038_ABCD24_44[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_45[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1348, 0x20);
u32 frontier_df4_menu_038_ABCD24_46[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_47[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x136C, 0x154);
u32 frontier_df4_menu_038_ABCD24_48[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_49[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x14C4, 0x5C);
u32 frontier_df4_menu_038_ABCD24_50[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_51[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1524, 0x20);
u32 frontier_df4_menu_038_ABCD24_52[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_53[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1548, 0x150);
u32 frontier_df4_menu_038_ABCD24_54[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_55[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x169C, 0x20);
u32 frontier_df4_menu_038_ABCD24_56[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_57[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x16C0, 0x1D8);
u32 frontier_df4_menu_038_ABCD24_58[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0x17B8,
};
u8 frontier_df4_menu_038_ABCD24_59[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x189C, 0x10);
u32 frontier_df4_menu_038_ABCD24_60[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_61[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x18B0, 0x20);
u32 frontier_df4_menu_038_ABCD24_62[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_63[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x18D4, 0x1B4);
u32 frontier_df4_menu_038_ABCD24_64[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_65[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1A8C, 0x20);
u32 frontier_df4_menu_038_ABCD24_66[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_67[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1AB0, 0xBC);
u32 frontier_df4_menu_038_ABCD24_68[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_69[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1B70, 0x5C);
u32 frontier_df4_menu_038_ABCD24_70[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_71[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1BD0, 0xC);
u32 frontier_df4_menu_038_ABCD24_72[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_73[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1BE0, 0xD4);
u32 frontier_df4_menu_038_ABCD24_74[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_75[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1CB8, 0xC);
u32 frontier_df4_menu_038_ABCD24_76[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_77[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1CC8, 0x248);
u32 frontier_df4_menu_038_ABCD24_78[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_79[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x1F14, 0xE8);
u32 frontier_df4_menu_038_ABCD24_80[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_81[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2000, 0x20);
u32 frontier_df4_menu_038_ABCD24_82[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_83[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2024, 0x168);
u32 frontier_df4_menu_038_ABCD24_84[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_85[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2190, 0x20);
u32 frontier_df4_menu_038_ABCD24_86[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_87[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x21B4, 0x114);
u32 frontier_df4_menu_038_ABCD24_88[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_89[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x22CC, 0x20);
u32 frontier_df4_menu_038_ABCD24_90[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_91[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x22F0, 0x154);
u32 frontier_df4_menu_038_ABCD24_92[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_93[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2448, 0x20);
u32 frontier_df4_menu_038_ABCD24_94[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_95[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x246C, 0x1A4);
u32 frontier_df4_menu_038_ABCD24_96[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_97[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2614, 0x20);
u32 frontier_df4_menu_038_ABCD24_98[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_99[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2638, 0x22C);
u32 frontier_df4_menu_038_ABCD24_100[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_101[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2868, 0xC);
u32 frontier_df4_menu_038_ABCD24_102[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_103[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2878, 0x1CC);
u32 frontier_df4_menu_038_ABCD24_104[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_105[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2A48, 0x20);
u32 frontier_df4_menu_038_ABCD24_106[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_107[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2A6C, 0x168);
u32 frontier_df4_menu_038_ABCD24_108[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_109[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2BD8, 0x20);
u32 frontier_df4_menu_038_ABCD24_110[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_111[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2BFC, 0x110);
u32 frontier_df4_menu_038_ABCD24_112[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_113[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2D10, 0x20);
u32 frontier_df4_menu_038_ABCD24_114[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_115[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2D34, 0x154);
u32 frontier_df4_menu_038_ABCD24_116[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_117[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2E8C, 0x20);
u32 frontier_df4_menu_038_ABCD24_118[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_119[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x2EB0, 0x1A4);
u32 frontier_df4_menu_038_ABCD24_120[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_038_ABCD24_121[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x3058, 0x20);
u32 frontier_df4_menu_038_ABCD24_122[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_038_ABCD24_123[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin", 0x307C, 0x244);
u8 frontier_df4_menu_039_AC00A8[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0x0, 0x10);
u32 frontier_df4_menu_039_AC00A8_1[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&frontier_df4_menu_038_ABCD24 + 0x3210,
};
u8 frontier_df4_menu_039_AC00A8_2[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0x14, 0xC);
u32 frontier_df4_menu_039_AC00A8_3[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&EventScrWM_MessedEventscr_52,
};
u8 frontier_df4_menu_039_AC00A8_4[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0x24, 0x78);
u32 frontier_df4_menu_039_AC00A8_5[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_039_AC00A8_6[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0xA0, 0x20);
u32 frontier_df4_menu_039_AC00A8_7[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_039_AC00A8_8[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0xC4, 0xF8);
u32 frontier_df4_menu_039_AC00A8_9[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&gProcScr_85B9D0C + 0x18,
};
u8 frontier_df4_menu_039_AC00A8_10[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0x1C0, 0xC);
u32 frontier_df4_menu_039_AC00A8_11[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = {
    (u32)&frontier_df4_menu_038_ABCD24_1,
};
u8 frontier_df4_menu_039_AC00A8_12[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin", 0x1D0, 0x11C);
