#include "global.h"

#include "fontgrp.h"
#include "statscreen.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "hardware.h"
#include "face.h"
#include "mu.h"
#include "icon.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "helpbox.h"
#include "worldmap.h"
#include "constants/songs.h"

void WorldmapStatus_GetCharDescription(struct HelpBoxProc * proc);
void WorldmapStatus_GetClassDescription(struct HelpBoxProc * proc);

// clang-format off



//! FE8U = 0x080C0A64
int WorldmapStatus_CountAllies(void)
{
    int i;

    int count = 0;

    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++)
    {
        struct Unit * unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
        {
            continue;
        }

        if (unit->state & (US_DEAD | US_BIT16))
        {
            continue;
        }

        count++;
    }

    return count;
}
