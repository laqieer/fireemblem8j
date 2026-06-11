#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "types.h"
#include "functions.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmcontainer.h"
#include "chapterdata.h"
#include "bmdebug.h"
#include "statscreen.h"
#include "ap.h"
#include "proc.h"
#include "eventinfo.h"
#include "bmdifficulty.h"
#include "playerphase.h"
#include "minimap.h"
#include "uichapterstatus.h"
#include "player_interface.h"
#include "bb.h"
#include "bmshop.h"
#include "uiconfig.h"
#include "helpbox.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "muctrl.h"
#include "menu_def.h"
#include "worldmap.h"
#include "sysutil.h"
#include "savemenu.h"
#include "bmsave.h"
#include "bmlib.h"
#include "eventcall.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/terrains.h"
#include "constants/songs.h"

// TODO: Implicit declaration?
int CanShowUnitStatScreen(struct Unit * unit);
int CheckInLinkArena(void);

// clang-format off



struct ProcCmd CONST_DATA gProcScr_SALLYCURSOR[] =
{
    PROC_NAME("SALLYCURSOR"),
    PROC_SLEEP(16),

    PROC_CALL(PrepScreenProc_LockGame),
    PROC_WHILE(PrepScreenProc_AddPostgameUnits),
    PROC_SLEEP(1),

    PROC_CALL(PrepScreenProc_HideEverythingAndUnlockGame),
    PROC_CALL(InitPrepScreenUnitsAndCamera),
    PROC_SLEEP(1),

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_SLEEP(8),

    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),
    PROC_CALL(NewPrepScreenTraineePromotionManager),
    PROC_WHILE(PrepScreenTraineePromotionManagerExists),

PROC_LABEL(PL_SALLYCURSOR_START_ATMENU),
    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_YIELD,
    PROC_CALL(InitPrepScreenCursorPosition),

    PROC_GOTO(PL_SALLYCURSOR_ENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_RETURN_TO_ATMENU),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),

    PROC_CALL(StartPrepAtMenu),
    PROC_WHILE(PrepAtMenuExists),
    PROC_YIELD,

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_ENTER_MAP),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_InitMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_OPEN_MAP_MENU),
    PROC_CALL(PrepScreenProc_StartDimMap),
    PROC_WHILE(MapPaletteBrightnessFadeExists),
    PROC_CALL(PrepScreenProc_StartMapMenu),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_MAP_MENU),
    PROC_CALL(EnablePrepScreenMenu),
    PROC_WHILE(PrepScreenMenuExists),
    PROC_CALL(PrepScreenProc_StartBrightenMap),
    PROC_WHILE(MapPaletteBrightnessFadeExists),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_MAP_IDLE),
    PROC_WHILE(IsSubtitleHelpActive),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(StartPlayerPhaseSideWindows),
    PROC_REPEAT(PrepScreenProc_SetupMapIdle),
    PROC_REPEAT(PrepScreenProc_MapIdle),

    // fallthrough

PROC_LABEL(PL_SALLYCURSOR_UNIT_SELECTED),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(DisplayActiveUnitEffectRange),
    PROC_REPEAT(PrepScreenProc_MapMovementLoop),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_SUPPLY_DEPLOY),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_DeploySupplyUnit),

    PROC_GOTO(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),

PROC_LABEL(PL_SALLYCURSOR_SUPPLY_REMOVE),
    PROC_CALL(PrepScreenProc_SetCameraOnSupply),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(SALLYCURSOR_RemoveSupplyUnit),

    PROC_GOTO(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),

PROC_LABEL(PL_SALLYCURSOR_POST_SUPPLY_CHANGE),
    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),
    PROC_SLEEP(60),

    PROC_GOTO(PL_SALLYCURSOR_OPEN_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_POST_STATSCREEN_IDLE),
    PROC_CALL(RefreshBMapGraphics),
    PROC_START_CHILD_BLOCKING(gProcScr_ADJUSTSFROMXI),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_POST_STATSCREEN_MOVE),
    PROC_CALL(PrepScreenProc_RefreshAfterStatScreen),

    PROC_GOTO(PL_SALLYCURSOR_UNIT_SELECTED),

PROC_LABEL(PL_SALLYCURSOR_UNIT_SWAP),
    PROC_CALL(EndPlayerPhaseSideWindows),
    PROC_CALL(PrepScreen_StartUnitSwap),

    PROC_WHILE_EXISTS(ProcScr_CamMove),

    PROC_REPEAT(PrepScreen_UnitSwapIdle),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(PrepScreen_StartUnitSwapAnim),

    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_WHILE(PrepUnitSwapProcExits),

    PROC_CALL(InitMapChangeGraphicsIfFog),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RefreshUnitSprites),
    PROC_YIELD,
    PROC_CALL(DisplayMapChangeIfFog),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_CANCEL_SWAP),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_WHILE_EXISTS(ProcScr_CamMove),
    PROC_CALL(PrepScreenProc_RecenterOnActiveUnit),
    PROC_YIELD,

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_0B),

    PROC_GOTO(PL_SALLYCURSOR_UNIT_SELECTED),

PROC_LABEL(PL_SALLYCURSOR_OPTIONS),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(EndPrepScreenMenu_),
    PROC_CALL(PrepScreenProc_StartConfigMenu),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_CHAPTER_STATUS),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(StartChapterStatusScreen_FromPrep),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_SAVE),
    PROC_CALL(StartFastFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(BMapDispSuspend),
    PROC_CALL(EndPrepScreenMenu_),

    PROC_CALL(StartPrepSaveScreen),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(PrepScreenProc_RestoreBgmAfterSave),

    PROC_GOTO(PL_SALLYCURSOR_REENTER_MAP),

PROC_LABEL(PL_SALLYCURSOR_END_PREP),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(PrepScreenProc_Cleanup),

    PROC_CALL(Nop_Eventcall_0),
    PROC_YIELD,

    PROC_CALL(SyncUnitDeploymentState),
    PROC_CALL(EndPrepScreen),

    PROC_BLOCK,

PROC_LABEL(PL_SALLYCURSOR_REENTER_MAP),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_StartMapMenu),
    PROC_CALL(PrepScreenProc_DimMapImmediate),

    PROC_CALL(StartFastFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

PROC_LABEL(PL_SALLYCURSOR_SHOP),
    PROC_CALL(StartMidFadeToBlack),
    PROC_REPEAT(WaitForFade),
    PROC_CALL(HideMoveRangeGraphics),
    PROC_CALL(BMapDispSuspend),

    PROC_CALL(PrepScreenProc_StartShopScreen),
    PROC_YIELD,

    PROC_CALL(BMapDispResume),
    PROC_CALL(RefreshBMapGraphics),
    PROC_CALL(RefreshEntityBmMaps),
    PROC_CALL(RenderBmMap),
    PROC_CALL(RefreshUnitSprites),

    PROC_CALL(PrepScreenProc_UpdateBgm),
    PROC_CALL(PrepScreenProc_ApplyBrownBoxPalette),

    PROC_CALL(StartMidFadeFromBlack),
    PROC_REPEAT(WaitForFade),

    PROC_GOTO(PL_SALLYCURSOR_MAP_IDLE),

PROC_LABEL(PL_SALLYCURSOR_POST_DEBUG_MENU),
    PROC_YIELD,
    PROC_CALL(PrepScreenProc_StartMapMenu),

    PROC_GOTO(PL_SALLYCURSOR_MAP_MENU),

    PROC_END,
};

//! FE8U = 0x08034214
void ShrinkPlayerUnits(void)
{
    int i;

    if (!(PLAY_FLAG_EXTRA_MAP & gPlaySt.chapterStateBits))
    {
        return;
    }

    if (BM_FLAG_LINKARENA & gBmSt.gameStateBits)
    {
        return;
    }

    InitUnitStack(gGenericBuffer);

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (!(unit->state & US_UNAVAILABLE))
        {
            PushUnit(unit);
        }
    }

    LoadPlayerUnitsFromUnitStack2();

    return;
}

//! FE8U = 0x08034278
void EndPrepScreen(void)
{
    int i;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; ++i)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        unit->state &= ~(US_UNSELECTABLE);

        if (unit->state & (US_DEAD | US_BIT16 | US_BIT25))
        {
            continue;
        }

        if (unit->state & US_NOT_DEPLOYED)
        {
            PidStatsSubFavval100(unit->pCharacterData->number);
        }
        else
        {
            PidStatsAddDeployAmt(unit->pCharacterData->number);
        }
    }

    ShrinkPlayerUnits();
    Proc_EndEach(gProcScr_SALLYCURSOR);
    gBmSt.gameStateBits &= ~BM_FLAG_PREPSCREEN;
    gPlaySt.chapterStateBits &= ~PLAY_FLAG_PREPSCREEN;
    gPlaySt.unk4A_1 = 1;

    return;
}

//! FE8U = 0x080342FC
bool IsPrepMapActive(void)
{
    return Proc_Find(gProcScr_SALLYCURSOR) ? true : false;
}
