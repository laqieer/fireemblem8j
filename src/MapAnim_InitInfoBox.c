#include "global.h"
#include "bmbattle.h"
#include "bmunit.h"
#include "event.h"
#include "fontgrp.h"
#include "mu.h"
#include "proc.h"
#include "uiutils.h"
#include "ap.h"
#include "hardware.h"
#include "bmio.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "rng.h"
#include "bmmap.h"
#include "bm.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "popup.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/event-flags.h"
#include "constants/items.h"
#include "constants/songs.h"
#include "mapanim.h"

void MapAnim_InitInfoBox(ProcPtr proc)
{
    SetDefaultColorEffects();

    switch (gManimSt.mapAnimKind)
    {
    case MANIM_KIND_STEAL:
    case MANIM_KIND_REFRESH:
        return;

    default:
        break;
    }

    if (GetSpellAssocReturnBool(gManimSt.actor[0].bu->weaponBefore))
    {
        int y;
        if (gManimSt.actorCount == 1)
        {
            y = gManimSt.actor[0].unit->yPos * 16 - gBmSt.camera.y;

            if (y >= 112)
                y = y - 40;
            else
                y = y + 24;

        }
        else
        {
            int array[2];
            int i;
            int actorNum;

            for (i = 0; i < gManimSt.actorCount; ++i)
                array[i] = gManimSt.actor[i].unit->yPos * 16 - gBmSt.camera.y;

            if (ABS(array[0] - array[1]) >= 80)
            {
                y = 64;
            }
            else
            {
                actorNum = array[0] > array[1] ? 0 : 1;

                if (array[actorNum] >= 112)
                    y = array[1 - actorNum] - 40;
                else
                    y = array[actorNum] + 24;
            }
        }

        StartMapAnimInfoWindow(15, y / 8, proc);
    }
}
