#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bmmenu.h"
#include "playerphase.h"
#include "bmunit.h"
#include "bmtarget.h"
#include "icon.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmidoten.h"
#include "uiutils.h"
#include "bksel.h"
#include "bmbattle.h"
#include "bmitemuse.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmarch.h"
#include "bmcontainer.h"
#include "statscreen.h"

//! FE8U = 0x08023318
int ItemSelectMenu_TextDraw(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int isUsable;

    int item = gActiveUnit->items[menuItem->itemNumber];

    if (GetItemAttributes(item) & IA_WEAPON) {
        WeaponSelectMenu_Draw(menu, menuItem);
        return 0;
    }

    if (GetItemType(item) == ITYPE_DANCE) {
        isUsable = 0;
    } else {
        isUsable = CanUnitUseItem(gActiveUnit, item);
    }

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isUsable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile)
    );

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    //return 0; BUG?
}
