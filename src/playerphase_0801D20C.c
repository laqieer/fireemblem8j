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







//! FE8U = 0x0801D5A8
bool CanMoveActiveUnitTo(int x, int y)
{
    struct Trap * trap;

    if (gBmMapUnit[y][x] != 0)
    {
        return false;
    }

    if (gBmMapMovement[y][x] >= MAP_MOVEMENT_MAX)
    {
        return false;
    }

    if (!(gActiveUnit->state & US_IN_BALLISTA))
    {
        return true;
    }

    trap = GetTrapAt(x, y);

    if ((x == gActiveUnitMoveOrigin.x) && (y == gActiveUnitMoveOrigin.y))
    {
        return true;
    }

    if (!trap)
    {
        return true;
    }

    if (trap->type != TRAP_BALLISTA)
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0801D624
void PlayerPhase_DisplayUnitMovement(void)
{
    GetMovementScriptFromPath();
    UnitApplyWorkingMovementScript(gActiveUnit, gActiveUnit->xPos, gActiveUnit->yPos);
    SetAutoMuMoveScript(gWorkingMovementScript);

    return;
}
