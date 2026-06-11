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
/* TU-private data externs bound at their JP addresses */
extern u8 * gOpenLimitViewImgLut[];

#define LIMIT_VIEW_FRAME_SIZE (4 * CHR_SIZE)

//! FE8U = 0x0801D70C
void MakeMoveunitForActiveUnit(void)
{
    if (!MuExists())
    {
        if (UNIT_FACTION(gActiveUnit) == gPlaySt.faction)
        {
            if ((gActiveUnit->statusIndex != UNIT_STATUS_SLEEP) && (gActiveUnit->statusIndex != UNIT_STATUS_BERSERK))
            {
                StartMu(gActiveUnit);
                HideUnitSprite(gActiveUnit);
            }
        }
    }

    SetAutoMuDefaultFacing();

    return;
}

//! FE8U = 0x0801D75C
void ClearActiveUnit(struct Unit * unit)
{
    ProcPtr playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);

    if (!playerPhaseProc)
    {
        return;
    }

    Proc_Goto(playerPhaseProc, 9);

    if (gActiveUnit != NULL)
    {
        EndAllMus();
        gActiveUnit->state &= ~US_HIDDEN;
    }

    gBmSt.gameStateBits &= ~BM_FLAG_3;

    HideMoveRangeGraphics();
    RefreshEntityBmMaps();
    RefreshUnitSprites();
    UnitBeginAction(unit);

    gActiveUnit->state &= ~US_HIDDEN;

    gActiveUnitMoveOrigin.x = gActiveUnit->xPos;
    gActiveUnitMoveOrigin.y = gActiveUnit->yPos;

    SetCursorMapPosition(gActiveUnitMoveOrigin.x, gActiveUnitMoveOrigin.y);

    RefreshEntityBmMaps();
    RefreshUnitSprites();

    return;
}

//! FE8U = 0x0801D7E8
void PlayPhaseForcePressAButtonInRangeDisp(void)
{
    struct Proc * playerPhaseProc = Proc_Find(gProcScr_PlayerPhase);

    if (!playerPhaseProc)
        return;

    if (playerPhaseProc->proc_idleCb == PlayerPhase_RangeDisplayIdle)
        Proc_SetRepeatCb(playerPhaseProc, PlayerPhase_RangeDisplayIdle_ForceAPress);
}

//! FE8U = 0x0801D818
void PlayerPhase_RangeDisplayIdle_ForceAPress(ProcPtr proc)
{
    gKeyStatusPtr->newKeys = A_BUTTON;
    gKeyStatusPtr->repeatedKeys = 0;

    PlayerPhase_RangeDisplayIdle(proc);
}

//! FE8U = 0x0801D834
void PlayPhaseForceActiveUnitCanto(void)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
        return;

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
        return;

    if ((gActionData.unitActionType == UNIT_ACTION_COMBAT) || (gActionData.unitActionType == UNIT_ACTION_STAFF))
        return;

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount)
        return;

    if (!CanUnitMove())
        return;

    gActiveUnit->state |= US_CANTOING;
}

//! FE8U = 0x0801D89C
void MoveLimitViewChange_OnInit(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(Img_LimitViewSquares + (5 * LIMIT_VIEW_FRAME_SIZE), (u8 *)VRAM + 0x5080, 0x80);

    if (!(gBmSt.gameStateBits & BM_FLAG_0))
    {
        proc->unk_4C = 2;
    }
    else
    {
        RegisterDataMove(Img_LimitViewSquares + (5 * LIMIT_VIEW_FRAME_SIZE), (u8 *)VRAM + 0x5000, 0x80);
        Proc_End(proc);
    }

    return;
}

//! FE8U = 0x0801D8EC
void MoveLimitViewChange_OnLoop(struct MoveLimitViewProc * proc)
{
    RegisterDataMove(gOpenLimitViewImgLut[proc->unk_4C], (u8 *)VRAM + 0x5000, 0x80);

    proc->unk_4C++;

    if (proc->unk_4C == 8)
    {
        Proc_Break(proc);
    }

    return;
}

//! FE8U = 0x0801D92C
void MoveLimitView_OnInit(ProcPtr proc)
{
    int ix;
    int iy;

    SetWinEnable(0, 0, 0);

    gBmSt.gameStateBits |= BM_FLAG_0;
    RenderBmMap();

    for (iy = 9; iy >= 0; --iy)
    {
        for (ix = 14; ix >= 0; --ix)
        {
            s16 xOrigin = gBmSt.mapRenderOrigin.x;
            s16 yOrigin = gBmSt.mapRenderOrigin.y;

            DisplayMovementViewTile(gBG2TilemapBuffer, xOrigin + ix, yOrigin + iy, ix, iy);
        }
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);
    BG_SetPosition(BG_2, 0, 0);

    SetBlendAlpha(10, 6);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendBackdropA(0);

    SetBlendTargetB(0, 0, 0, 1, 1);
    SetBlendBackdropB(1);

    InitBmBgLayers();

    return;
}

//! FE8U = 0x0801D9DC
void MoveLimitView_OnLoop(struct MoveLimitViewProc * proc)
{
    int frame = (GetGameClock() / 2) & 31;

    if (proc->flags & LIMITVIEW_BLUE)
    {
        CopyToPaletteBuffer(gUnkData_35 + frame, 0x82, 0x20);
    }

    if (proc->flags & LIMITVIEW_RED)
    {
        CopyToPaletteBuffer(gUnkData_36 + frame, 0xA2, 0x20);
    }

    if (proc->flags & LIMITVIEW_GREEN)
    {
        CopyToPaletteBuffer(gUnkData_37 + frame, 0xA2, 0x20);
    }

    if (proc->flags & LIMITVIEW_UNK)
    {
        CopyToPaletteBuffer(gUnkData_35 + frame, 0xA2, 0x20);
    }

    return;
}

//! FE8U = 0x0801DA60
void MoveLimitView_OnEnd(struct MoveLimitViewProc * proc)
{
    if ((proc->flags & (LIMITVIEW_BLUE | LIMITVIEW_UNK)) != 0)
    {
        BG_Fill(gBG2TilemapBuffer, 0);
        BG_EnableSyncByMask(BG2_SYNC_BIT);
    }

    gBmSt.gameStateBits &= ~(BM_FLAG_0 | BM_FLAG_1);

    InitBmBgLayers();

    return;
}
