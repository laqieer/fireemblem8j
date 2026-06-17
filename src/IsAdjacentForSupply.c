#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmenu.h"
#include "playerphase.h"
#include "uichapterstatus.h"
#include "uiselecttarget.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "icon.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmidoten.h"
#include "uiutils.h"
#include "bksel.h"
#include "bmbattle.h"
#include "bmdifficulty.h"
#include "bmitemuse.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "bmcontainer.h"
#include "statscreen.h"
#include "bmtrick.h"
#include "mu.h"
#include "bmarch.h"
#include "event.h"
#include "bb.h"
#include "bmarena.h"
#include "face.h"
#include "uiconfig.h"
#include "bm.h"
#include "unitinfowindow.h"
#include "eventinfo.h"
#include "menu_def.h"
#include "worldmap.h"
#include "savemenu.h"
#include "prepscreen.h"
#include "bmguide.h"
#include "menuitempanel.h"
#include "bmmind.h"
#include "unitlistscreen.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/items.h"
#include "constants/songs.h"



extern s8 gSupplyAdjacentPosLut[4][2];

bool IsAdjacentForSupply(u8 pid)
{
    int i;
    const s8 * iter;

    int xUnit = gActiveUnit->xPos;
    int yUnit = gActiveUnit->yPos;

    for (i = 0, iter = gSupplyAdjacentPosLut[i]; i < 4; iter += 2, i++)
    {
        struct Unit * unit;

        int x = xUnit + iter[0];
        int y = yUnit + iter[1];

        u8 other = gBmMapUnit[y][x];

        if (other & FACTION_RED)
        {
            continue;
        }

        unit = GetUnit(other);

        if (!unit)
        {
            continue;
        }

        if (unit->pCharacterData->number == pid)
        {
            return true;
        }
    }

    return false;
}
