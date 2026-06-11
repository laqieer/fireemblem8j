#include "global.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"

//! FE8U = 0x0804ADA0
int GetUnitBestWeaponPower(struct Unit * unit)
{
    int i;

    u16 bestItem = 0;
    u32 bestMight = 0;

    for (i = 0; i < UNIT_ITEM_COUNT; i++)
    {
        u16 item = unit->items[i];

        if (item == 0)
        {
            break;
        }

        if (!CanUnitUseWeapon(unit, item))
        {
            continue;
        }

        if (GetItemMight(item) <= bestMight)
        {
            continue;
        }

        bestItem = item;
        bestMight = GetItemMight(item);
    }

    if (bestItem == 0)
    {
        return 0;
    }

    return bestMight + GetUnitPower(unit);
}
