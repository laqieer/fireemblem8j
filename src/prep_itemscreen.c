#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);









/**
 * Checks whether the coordinate would be hidden by
 * the "unit info" minimug box, when a unit is selected
 * on the prep item screen.
 */
//! FE8U = 0x0809A21C
bool IsCoordHiddenByMinimug(u32 x, int y)
{
    if ((x < 97) && (y > 31))
    {
        return true;
    }

    return false;
}

//! FE8U = 0x0809A230
void PutClassSpriteForSecretShop(struct Unit * unit, u16 x, u16 y)
{
    int oam2Base;

    int classId = unit->pClassData->number;

    if (UnitHasItem(unit, ITEM_MEMBERCARD))
    {
        oam2Base = OAM2_PAL(12);
    }
    else
    {
        oam2Base = OAM2_PAL(15);
    }

    PutUnitSpriteForClassId(0, x, y, oam2Base + OAM2_LAYER(2), classId);

    return;
}
