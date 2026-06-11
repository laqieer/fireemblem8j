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

int PrepGetDeployedUnitAmt(void)
{
    struct Unit *unit;
    int i, _count = 0;
    int count = GetChapterAllyUnitCount();

    for (i = 0; i < PrepGetUnitAmount(); i++) {
        unit = GetUnitFromPrepList(i);

        if (unit->state & 8)
            continue;

        if (_count >= count)
            unit->state |= 8;
        else
            _count++;
    }
    return (s8)_count;
}
