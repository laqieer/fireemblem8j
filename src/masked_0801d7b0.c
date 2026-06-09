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







/* prototypes for same-file helpers called by this run */
bool TrySetCursorOn(int unitId);

//! FE8U = 0x0801DB4C
void TrySwitchViewedUnit(int x, int y)
{
    int i;

    int unitId = gBmMapUnit[y][x];

    if ((unitId & 0xC0) != FACTION_BLUE)
    {
        unitId = 0;
    }

    unitId++;

    for (i = unitId; i < 0x3F; ++i)
    {
        if (TrySetCursorOn(i))
        {
            return;
        }
    }

    for (i = 1; i <= unitId; ++i)
    {
        if (TrySetCursorOn(i))
        {
            return;
        }
    }

    return;
}
