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





/* The move-limit-view open animation is 6 uniform frames of 4 tiles (32x8 px) each. */
#define LIMIT_VIEW_FRAME_SIZE (4 * CHR_SIZE)







//! FE8U = 0x0801D404
void PlayerPhase_CommitActiveUnitMove(void)
{
    if (gPlaySt.faction == FACTION_BLUE)
    {
        MoveActiveUnit(gActionData.xMove, gActionData.yMove);
        RefreshEntityBmMaps();
        RenderBmMap();
        RefreshUnitSprites();
        EndAllMus();
    }

    return;
}

//! FE8U = 0x0801D434
void PlayerPhase_OpenUnitActionMenu(ProcPtr proc)
{
    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED)
    {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}

//! FE8U = 0x0801D470
void PlayerPhase_ApplyUnitMovement(ProcPtr proc)
{
    gActiveUnit->xPos = gActionData.xMove;
    gActiveUnit->yPos = gActionData.yMove;

    UnitFinalizeMovement(gActiveUnit);

    if ((!(gActiveUnit->state & US_HAS_MOVED) && (gActionData.unitActionType == 0)) && (gBmSt.taken_action == 0))
    {
        gActionData.moveCount = gBmMapMovement[gActionData.yMove][gActionData.xMove];
    }

    ResetTextFont();

    if (StartAfterUnitMovedEvent() == 1)
    {
        PlayerPhase_OpenUnitActionMenu(proc);
        return;
    }

    if (gActionData.unitActionType != UNIT_ACTION_TRAPPED)
    {
        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);
    }

    Proc_Break(proc);

    return;
}
