#include "global.h"
#include "proc.h"
#include "bmlib.h"

extern void WorldMap_Destruct(ProcPtr proc);
extern void WorldMap_SetInitialState(ProcPtr proc);
extern void WorldMap_Init(ProcPtr proc);
extern void WorldMap_CallBeginningEvent(ProcPtr proc);
extern void WorldMap_PostBeginningEvent(ProcPtr proc);
extern void WorldMap_GenerateRandomMonsters(ProcPtr proc);
extern void WorldMap_SetMonsterMergedState(ProcPtr proc);
extern void WorldMap_FadeInOnTimerFlag(ProcPtr proc);
extern int FadeInExists(ProcPtr proc);
extern void _WmMergeMonsters(ProcPtr proc);
extern void WorldMap_WaitMonsterMerging(ProcPtr proc);
extern void WorldMap_UpdateBgm(ProcPtr proc);
extern void StartGMapPlayerInterface(ProcPtr proc);
extern void StartWorldmapMinimap(ProcPtr proc);
extern void WorldMap_EnableUnitSprites(ProcPtr proc);
extern void WorldMap_Loop(ProcPtr proc);
extern void EndGMapPlayerInterface(ProcPtr proc);
extern void EndWorldmapMinimap(ProcPtr proc);
extern void StartWMGeneralMenu(ProcPtr proc);
extern void WorldMap_StartMuWalkScroll(ProcPtr proc);
extern void WorldMap_WaitMuWalkScroll(ProcPtr proc);
extern void WorldMap_MuWalkLoop(ProcPtr proc);
extern void sub_80BE578(ProcPtr proc);
extern void WaitForFade(ProcPtr proc);
extern void WorldMap_TeardownForSubscreen(ProcPtr proc);
extern void WorldMap_StartUnitList(ProcPtr proc);
extern void WorldMap_CallGuide(ProcPtr proc);
extern void WorldMap_ResumeFromGuide(ProcPtr proc);
extern void WorldMap_RestoreDisplayAfterGuide(ProcPtr proc);
extern void WorldMap_StartConfigScreen(ProcPtr proc);
extern void WorldMap_ResumeFromConfigScreen(ProcPtr proc);
extern void WorldMap_RestoreDisplayAfterConfig(ProcPtr proc);
extern void StartWorldmapStatusScreen(ProcPtr proc);
extern void WorldMap_ResumeFromStatusScreen(ProcPtr proc);
extern void WorldMap_RestoreDisplayAfterStatus(ProcPtr proc);
extern void WorldMap_PrepareSaveMenu(ProcPtr proc);
extern void Make6C_SaveMenuPostChapter(ProcPtr proc);
extern void WorldMap_CallIntroEvent(ProcPtr proc);
extern void WorldMap_WaitForChapterIntroEvents(ProcPtr proc);
extern void WorldMap_HideEverything(ProcPtr proc);
extern void WorldMap_StartSkirmishAnim(ProcPtr proc);
extern void Worldmap_WaitForSkirmishAnim(ProcPtr proc);
extern void WorldMap_EndSkirmishDisplay(ProcPtr proc);
extern void NewFadeOut(ProcPtr proc);
extern int FadeOutExists(ProcPtr proc);
extern void WorldMap_RemoveMergedSkirmishUnits(ProcPtr proc);
extern void Worlmap_StartGmapSogu(ProcPtr proc);
extern void Worlmap_WaitGmapSogu(ProcPtr proc);
extern void StartWMNodeMenu(ProcPtr proc);
extern void WorldMap_StartArmory(ProcPtr proc);
extern void WorldMap_StartVendor(ProcPtr proc);
extern void WorldMap_StartSecretShop(ProcPtr proc);
extern void WorldMap_StartManageItems(ProcPtr proc);
extern void WorldMap_RestoreDisplay(ProcPtr proc);
extern void ResetWorldMapScreen(ProcPtr proc);
extern void NULL_WorldmapMain_0(ProcPtr proc);

struct ProcCmd ProcScr_WorldMapMain[] __attribute__((section(".rodata.dat_ProcScr_WorldMapMain_ref"))) = {
    PROC_SET_END_CB(WorldMap_Destruct),
    PROC_CALL(WorldMap_SetInitialState),
    PROC_CALL(WorldMap_Init),
    PROC_CALL_ARG(_FadeBgmOut, 0x1),
    PROC_SLEEP(0x4),
    PROC_CALL(WorldMap_CallBeginningEvent),
    PROC_SLEEP(0x1),

PROC_LABEL(0x0),

PROC_LABEL(0x1),
    PROC_REPEAT(WorldMap_PostBeginningEvent),
    PROC_CALL(WorldMap_GenerateRandomMonsters),
    PROC_CALL(WorldMap_SetMonsterMergedState),
    PROC_GOTO(0x3),

PROC_LABEL(0x2),
    PROC_CALL(WorldMap_FadeInOnTimerFlag),
    PROC_WHILE(FadeInExists),
    PROC_CALL(_WmMergeMonsters),
    PROC_REPEAT(WorldMap_WaitMonsterMerging),
    PROC_CALL(WorldMap_SetMonsterMergedState),

PROC_LABEL(0x3),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_UpdateBgm),
    PROC_CALL(WorldMap_FadeInOnTimerFlag),
    PROC_WHILE(FadeInExists),
    PROC_CALL(StartGMapPlayerInterface),
    PROC_CALL(StartWorldmapMinimap),
    PROC_SLEEP(0x1),

PROC_LABEL(0x4),
    PROC_CALL(WorldMap_EnableUnitSprites),
    PROC_REPEAT(WorldMap_Loop),
    PROC_BLOCK,

PROC_LABEL(0x5),
    PROC_CALL(EndGMapPlayerInterface),
    PROC_CALL(EndWorldmapMinimap),
    PROC_SLEEP(0x1),
    PROC_CALL(StartWMGeneralMenu),
    PROC_GOTO(0x3),

PROC_LABEL(0x6),
    PROC_CALL(EndGMapPlayerInterface),
    PROC_CALL(EndWorldmapMinimap),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_StartMuWalkScroll),
    PROC_REPEAT(WorldMap_WaitMuWalkScroll),

PROC_LABEL(0x7),
    PROC_REPEAT(WorldMap_MuWalkLoop),
    PROC_SLEEP(0x1),
    PROC_GOTO(0x3),

PROC_LABEL(0x8),
    PROC_REPEAT(sub_80BE578),
    PROC_GOTO(0x4),

PROC_LABEL(0x9),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(WorldMap_StartUnitList),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x17),

PROC_LABEL(0xA),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL_2(WorldMap_CallGuide),
    PROC_CALL(WorldMap_Init),
    PROC_CALL(WorldMap_ResumeFromGuide),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_RestoreDisplayAfterGuide),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(0x3),

PROC_LABEL(0xB),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL_2(WorldMap_StartConfigScreen),
    PROC_CALL(WorldMap_Init),
    PROC_CALL(WorldMap_ResumeFromConfigScreen),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_RestoreDisplayAfterConfig),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(0x3),

PROC_LABEL(0xC),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL_2(StartWorldmapStatusScreen),
    PROC_CALL(WorldMap_Init),
    PROC_CALL(WorldMap_ResumeFromStatusScreen),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_RestoreDisplayAfterStatus),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(0x3),

PROC_LABEL(0xD),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(WorldMap_PrepareSaveMenu),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(Make6C_SaveMenuPostChapter),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x17),

PROC_LABEL(0xE),
    PROC_CALL(EndGMapPlayerInterface),
    PROC_CALL(EndWorldmapMinimap),

PROC_LABEL(0xF),
    PROC_CALL(WorldMap_CallIntroEvent),
    PROC_REPEAT(WorldMap_WaitForChapterIntroEvents),
    PROC_CALL(WorldMap_HideEverything),
    PROC_GOTO(0x19),

PROC_LABEL(0x10),
    PROC_CALL(EndGMapPlayerInterface),
    PROC_CALL(EndWorldmapMinimap),
    PROC_SLEEP(0x1E),
    PROC_CALL(WorldMap_StartSkirmishAnim),
    PROC_REPEAT(Worldmap_WaitForSkirmishAnim),
    PROC_SLEEP(0x14),
    PROC_CALL(WorldMap_EndSkirmishDisplay),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(WorldMap_RemoveMergedSkirmishUnits),
    PROC_GOTO(0x19),

PROC_LABEL(0x11),
    PROC_CALL(Worlmap_StartGmapSogu),
    PROC_REPEAT(Worlmap_WaitGmapSogu),
    PROC_SLEEP(0x8),
    PROC_GOTO(0x3),

PROC_LABEL(0x12),
    PROC_CALL(EndGMapPlayerInterface),
    PROC_CALL(EndWorldmapMinimap),
    PROC_SLEEP(0x1),
    PROC_CALL(StartWMNodeMenu),
    PROC_SLEEP(0x6),
    PROC_GOTO(0x3),

PROC_LABEL(0x13),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(WorldMap_StartArmory),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x18),

PROC_LABEL(0x14),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(WorldMap_StartVendor),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x18),

PROC_LABEL(0x15),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(WorldMap_StartSecretShop),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x18),

PROC_LABEL(0x16),
    PROC_CALL_ARG(NewFadeOut, 0x10),
    PROC_WHILE(FadeOutExists),
    PROC_CALL(WorldMap_TeardownForSubscreen),
    PROC_CALL(WorldMap_StartManageItems),
    PROC_SLEEP(0x0),
    PROC_CALL(WorldMap_Init),
    PROC_GOTO(0x18),

PROC_LABEL(0x18),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_RestoreDisplay),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(0x12),

PROC_LABEL(0x17),
    PROC_SLEEP(0x1),
    PROC_CALL(WorldMap_RestoreDisplay),
    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),
    PROC_GOTO(0x3),

PROC_LABEL(0x19),
    PROC_SLEEP(0x10),
    PROC_CALL(ResetWorldMapScreen),
    PROC_CALL(NULL_WorldmapMain_0),
    PROC_END,
};
