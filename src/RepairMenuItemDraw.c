#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "uimenu.h"
#include "menuitempanel.h"
#include "eventinfo.h"
#include "bb.h"
#include "bmmind.h"

int RepairMenuItemDraw(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];
    int isRepairable = IsItemHammernable(item);

    DrawItemMenuLineLong(
        &menuItem->text, item, isRepairable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return 0;
}
