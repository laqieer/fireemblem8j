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

extern u16 gBattleForecast_2[];

extern u8 gSummonConfig[4][2];



extern struct ProcCmd CONST_DATA gProcScr_BackToUnitMenu[];



u8 ItemMenu_AreOtherCommandsAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number - 1];

    if (GetItemType(item) != ITYPE_DANCE) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitUseItem(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}

int ItemMenu_DrawOtherCommands(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    int item = gActiveUnit->items[menuItem->itemNumber - 1];

    DrawItemMenuLine(&menuItem->text, item, 1, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    return 0;
}

u8 ItemMenu_SelectOtherCommands(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.itemSlotIndex = menuItem->itemNumber - 1;

    ClearBg0Bg1();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}
