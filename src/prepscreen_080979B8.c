#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"
#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"

void ReorderPlayerUnitsBasedOnDeployment()
{
    int i;
    struct Unit *unit;

    InitUnitStack(gPrepUnitPool);
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit) && !(0x1000C & unit->state))
            PushUnit(unit);
    }

    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit) && (0x1000C & unit->state))
            PushUnit(unit);
    }

    LoadPlayerUnitsFromUnitStack();
}
