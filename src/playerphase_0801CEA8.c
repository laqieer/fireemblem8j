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







//! FE8U = 0x0801D244
bool TryMakeCantoUnit(ProcPtr proc)
{
    if (!(UNIT_CATTRIBUTES(gActiveUnit) & CA_CANTO))
    {
        return false;
    }

    if (gActiveUnit->state & (US_DEAD | US_HAS_MOVED | US_BIT16))
    {
        return false;
    }

    switch (gActionData.unitActionType)
    {
        case UNIT_ACTION_WAIT:
        case UNIT_ACTION_COMBAT:
        case UNIT_ACTION_STAFF:
            return false;
    }

    if (UNIT_MOV(gActiveUnit) <= gActionData.moveCount)
    {
        return false;
    }

    if (!CanUnitMove())
    {
        return false;
    }

    BmMapFill(gBmMapRange, 0);

    UnitBeginCantoAction(gActiveUnit);

    gActiveUnit->state |= US_HAS_MOVED;
    gActiveUnit->state &= ~US_UNSELECTABLE;

    EndAllMus();
    StartMu(gActiveUnit);
    SetAutoMuDefaultFacing();

    if (gPlaySt.chapterVisionRange != 0)
    {
        Proc_Goto(proc, 4);
    }
    else
    {
        Proc_Goto(proc, 1);
    }

    return true;
}
