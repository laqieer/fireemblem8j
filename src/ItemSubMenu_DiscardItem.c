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

u8 ItemSubMenu_DiscardItem(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    struct MenuProc* proc;
    struct MenuRect rect;

    if (menuItem->availability == MENU_DISABLED) {
        MenuFrozenHelpBox(menu, 0x7CD); // TODO: msgid "Treasure can't be dropped."
        return MENU_ACT_SND6B;
    }

    rect.x = menuItem->xTile + 3;
    rect.y = menuItem->yTile;
    rect.w = 5;
    rect.h = 0;

    proc = StartMenuAt(&gYesNoSelectionMenuDef, rect, (struct Proc*)menu);

    proc->itemCurrent = 1;

    return MENU_ACT_SND6A | MENU_ACT_DOOM;

}
