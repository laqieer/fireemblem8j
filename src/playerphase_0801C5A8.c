#include "global.h"

#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "mu.h"
#include "bmmap.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "statscreen.h"
#include "bmidoten.h"
#include "bmpatharrowdisp.h"
#include "event.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "prepscreen.h"
#include "bmtrick.h"
#include "bmio.h"
#include "hardware.h"
#include "bmphase.h"
#include "bmmind.h"
#include "bmtrap.h"
#include "minimap.h"
#include "player_interface.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "eventinfo.h"

#include "playerphase.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

// clang-format off

extern struct ProcCmd CONST_DATA gProcScr_PlayerPhase[];



/* The move-limit-view open animation is 6 uniform frames of 4 tiles (32x8 px) each. */
#define LIMIT_VIEW_FRAME_SIZE (4 * CHR_SIZE)

extern u8 * CONST_DATA gOpenLimitViewImgLut[];





/* prototypes for same-file helpers called by this run */
void HandlePlayerCursorMovement(void);
bool CanShowUnitStatScreen(struct Unit * unit);
int GetPlayerSelectKind(struct Unit * unit);
bool CanMoveActiveUnitTo(int x, int y);
void DisplayMoveRangeGraphics(int flags);
void HideMoveRangeGraphics(void);
void TrySwitchViewedUnit(int x, int y);

//! FE8U = 0x0801C940
void PlayerPhase_MainIdle(ProcPtr proc)
{
    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & L_BUTTON)
    {
        TrySwitchViewedUnit(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
    }
    else if (!DoesBMXFADEExist())
    {
        if ((gKeyStatusPtr->newKeys & R_BUTTON) && (gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x] != 0))
        {
            if (CanShowUnitStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x])))
            {

                EndAllMus();

                EndPlayerPhaseSideWindows();
                SetStatScreenConfig(
                    STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                    STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);

                StartStatScreen(GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]), proc);

                Proc_Goto(proc, 5);

                return;
            }
        }

        if (gKeyStatusPtr->newKeys & A_BUTTON)
        {
            struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

            switch (GetPlayerSelectKind(unit))
            {
                case PLAYER_SELECT_NOUNIT:
                case PLAYER_SELECT_TURNENDED:
                    EndPlayerPhaseSideWindows();

                    gPlaySt.xCursor = gBmSt.playerCursor.x;
                    gPlaySt.yCursor = gBmSt.playerCursor.y;

                    if (unit)
                    {
                        EndAllMus();
                        ShowUnitSprite(unit);
                    }

                    StartOrphanMenuAdjusted(&gMapMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x17);
                    Eventinfo_CondFalse_2();

                    Proc_Goto(proc, 9);

                    return;

                case PLAYER_SELECT_CONTROL:
                    UnitBeginAction(unit);
                    PidStatsAddActAmt(gActiveUnit->pCharacterData->number);

                    Proc_Break(proc);

                    break;

                case PLAYER_SELECT_NOCONTROL:
                    UnitBeginAction(unit);
                    gBmSt.swapActionRangeCount = 0;

                    Proc_Goto(proc, 11);

                    break;

                default:
                    goto else_stmt;
            }
        }
        else
        {
else_stmt:
            if ((gKeyStatusPtr->newKeys & START_BUTTON) && !(gKeyStatusPtr->heldKeys & SELECT_BUTTON))
            {
                struct Unit * unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);

                if (unit)
                {
                    EndAllMus();
                    ShowUnitSprite(unit);
                }

                EndPlayerPhaseSideWindows();
                StartMinimapPlayerPhase();

                Proc_Goto(proc, 9);

                return;
            }
        }
    }

    UnitSpriteHoverUpdate();

    PutMapCursor(
        gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y,
        IsUnitSpriteHoverEnabledAt(gBmSt.playerCursor.x, gBmSt.playerCursor.y) ? 3 : 0);

    return;
}

//! FE8U = 0x0801CB70
void DisplayUnitEffectRange(struct Unit * unit)
{
    int flags = LIMITVIEW_BLUE;

    GenerateUnitMovementMapExt(gActiveUnit, UNIT_MOV(gActiveUnit) - gActionData.moveCount);

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {

        BmMapFill(gBmMapOther, 0);

        if (UnitHasMagicRank(unit))
        {
            GenerateMagicSealMap(1);
        }

        BmMapFill(gBmMapRange, 0);

        switch (GetUnitWeaponUsabilityBits(gActiveUnit))
        {
            case UNIT_USEBIT_WEAPON | UNIT_USEBIT_STAFF:
                if (gBmSt.swapActionRangeCount & 1)
                {
                    GenerateUnitCompleteStaffRange(gActiveUnit);
                    flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;
                }
                else
                {
                    GenerateUnitCompleteAttackRange(gActiveUnit);
                    flags = LIMITVIEW_RED | LIMITVIEW_BLUE;
                }

                break;

            case UNIT_USEBIT_STAFF:
                GenerateUnitCompleteStaffRange(gActiveUnit);
                flags = LIMITVIEW_GREEN | LIMITVIEW_BLUE;

                break;

            case UNIT_USEBIT_WEAPON:
                GenerateUnitCompleteAttackRange(gActiveUnit);
                flags = LIMITVIEW_RED | LIMITVIEW_BLUE;

                break;
        }
    }

    DisplayMoveRangeGraphics(flags);

    return;
}

//! FE8U = 0x0801CC1C
void PlayerPhase_InitUnitMovementSelect(void)
{
    gBmSt.gameStateBits |= BM_FLAG_1;

    DisplayUnitEffectRange(gActiveUnit);

    if ((gActiveUnit->xPos == gBmSt.playerCursor.x) && (gActiveUnit->yPos == gBmSt.playerCursor.y))
    {
        PathArrowDisp_Init(0);
        PlaySoundEffect(SONG_69);
        return;
    }

    PathArrowDisp_Init(1);

    return;
}

//! FE8U = 0x0801CC7C
void DisplayActiveUnitEffectRange(ProcPtr proc)
{
    PlaySoundEffect(SONG_68);

    gBmSt.gameStateBits &= ~BM_FLAG_1;
    DisplayUnitEffectRange(gActiveUnit);

    return;
}

//! FE8U = 0x0801CCB4
void PlayerPhase_DisplayDangerZone(void)
{
    GenerateDangerZoneRange(gBmSt.swapActionRangeCount & 1);

    BmMapFill(gBmMapMovement, -1);

    PlaySoundEffect(SONG_68);

    gBmSt.gameStateBits |= BM_FLAG_3;
    gBmSt.gameStateBits &= ~BM_FLAG_1;

    if (gBmSt.swapActionRangeCount & 1)
    {
        DisplayMoveRangeGraphics(5);
    }
    else
    {
        DisplayMoveRangeGraphics(3);
    }

    return;
}

//! FE8U = 0x0801CD1C
void PlayerPhase_RangeDisplayIdle(ProcPtr proc)
{
    enum
    {
        ACT_FAIL = 0,
        ACT_MOVE = 1,
        ACT_CANCEL = 2,
        ACT_INFOSCREEN = 3,
        ACT_RESET_CURSOR = 4,
        ACT_EVENT = 5,
        ACT_SWAP_RANGES = 6,
    };

    u8 uid;
    u8 action = -1;

    HandlePlayerCursorMovement();

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        if (!gActiveUnit)
        {
            if (GetCombinedEnemyWeaponUsabilityBits() == 3)
            {
                action = ACT_SWAP_RANGES;
            }
            else
            {
                action = ACT_CANCEL;
            }
        }
        else if (StartDestSelectedEvent())
        {
            action = ACT_EVENT;
        }
        else
        {
            if ((GetPlayerSelectKind(gActiveUnit) != 2) && !(gActiveUnit->state & US_HAS_MOVED))
            {
                if (GetUnitWeaponUsabilityBits(gActiveUnit) == 3)
                {
                    action = ACT_SWAP_RANGES;
                }
                else
                {
                    action = ACT_CANCEL;
                }
            }
            else if (!CanMoveActiveUnitTo(gBmSt.playerCursor.x, gBmSt.playerCursor.y))
            {
                action = ACT_FAIL;
            }
            else
            {
                action = ACT_MOVE;
                goto else_stmt;
            }
        }
    }
    else
    {
else_stmt:
        if (gKeyStatusPtr->newKeys & B_BUTTON)
        {
            if (gActiveUnit->state & US_HAS_MOVED)
            {
                action = ACT_FAIL;
            }
            else
            {
                action = ACT_CANCEL;
            }
        }
        else if (gKeyStatusPtr->newKeys & R_BUTTON)
        {
            action = ACT_INFOSCREEN;
        }
        else if (gKeyStatusPtr->newKeys & L_BUTTON)
        {
            action = ACT_RESET_CURSOR;
        }
    }

    switch (action)
    {
        case ACT_FAIL:
            PlaySoundEffect(SONG_6C);

            break;

        case ACT_MOVE:
            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            HideMoveRangeGraphics();
            Proc_Break(proc);

            return;

        case ACT_CANCEL:
            if (gActiveUnit)
            {
                EndAllMus();

                gActiveUnit->state &= ~US_HIDDEN;

                if (UNIT_FACTION(gActiveUnit) == 0)
                {
                    EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
                }
            }

            gBmSt.gameStateBits &= ~BM_FLAG_3;

            HideMoveRangeGraphics();

            RefreshEntityBmMaps();
            RefreshUnitSprites();

            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

            Proc_Goto(proc, 9);

            return;

        case ACT_INFOSCREEN:
            if (EventEngineExists() == 1)
            {
                break;
            }

            uid = gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x];

            if ((gActiveUnitMoveOrigin.x == gBmSt.playerCursor.x) && (gActiveUnitMoveOrigin.y == gBmSt.playerCursor.y))
            {
                uid = gActiveUnit->index;
            }

            if (uid == 0)
            {
                break;
            }

            if (!CanShowUnitStatScreen(GetUnit(uid)))
            {
                break;
            }

            EndAllMus();
            SetStatScreenConfig(
                STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONBENCHED | STATSCREEN_CONFIG_NONUNK9 |
                STATSCREEN_CONFIG_NONROOFED | STATSCREEN_CONFIG_NONUNK16);
            StartStatScreen(GetUnit(uid), proc);

            Proc_Goto(proc, 6);

            return;

        case ACT_RESET_CURSOR:
            if (!gActiveUnit)
            {
                break;
            }

            EnsureCameraOntoPosition(proc, gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

            break;

        case ACT_EVENT:
            break;

        case ACT_SWAP_RANGES:
            gBmSt.swapActionRangeCount++;

            HideMoveRangeGraphics();

            if (gBmSt.gameStateBits & BM_FLAG_3)
            {
                Proc_Goto(proc, 12);
            }
            else
            {
                Proc_Goto(proc, 11);
            }

            break;
    }

    if (GetPlayerSelectKind(gActiveUnit) == PLAYER_SELECT_CONTROL)
    {
        DrawUpdatedPathArrow();
    }

    PutMapCursor(gBmSt.playerCursorDisplay.x, gBmSt.playerCursorDisplay.y, 1);

    return;
}

//! FE8U = 0x0801CFF0
void PlayerPhase_CancelAction(ProcPtr proc)
{
    gActionData.unitActionType = 0;
    Proc_Goto(proc, 2);
    return;
}

//! FE8U = 0x0801D008
void PlayerPhase_BackToMove(ProcPtr proc)
{
    gActiveUnit->xPos = gActiveUnitMoveOrigin.x;
    gActiveUnit->yPos = gActiveUnitMoveOrigin.y;

    UnitFinalizeMovement(gActiveUnit);

    gActiveUnit->state &= ~US_HIDDEN;

    RefreshEntityBmMaps();
    RenderBmMap();
    RefreshUnitSprites();

    if (!(gActiveUnit->state & US_HAS_MOVED))
    {
        UnitBeginAction(gActiveUnit);
    }
    else
    {
        UnitBeginCantoAction(gActiveUnit);
    }

    HideUnitSprite(gActiveUnit);
    EndAllMus();
    StartMu(gActiveUnit);

    Proc_Goto(proc, 1);

    return;
}
