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



u8 BallistaRangeMenu_Select(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    ClearBg0Bg1();

    gActionData.itemSlotIndex = BU_ISLOT_BALLISTA;

    FillBallistaRangeMaybe(gActiveUnit);

    NewTargetSelection(&gSelectInfo_Attack);

    return MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_ENDFACE;
}

int FillBallistaRange(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int item;

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    SetWorkingBmMap(gBmMapRange);

    item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    UpdateMenuItemPanel(item);

    MapAddInBoundedRange(gActiveUnit->xPos, gActiveUnit->yPos, GetItemMinRange(item), GetItemMaxRange(item));

    DisplayMoveRangeGraphics(2);

    return 0;
}

u8 StaffCommandUsability(const struct MenuItemDef* def, int number) {
    int i;

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    for (i = 0; i < UNIT_ITEM_COUNT; i++) {
        int item = gActiveUnit->items[i];

        if (item == 0) {
            break;
        }

        if (GetItemType(item) != ITYPE_STAFF) {
            continue;
        }

        if (!CanUnitUseItem(gActiveUnit, item)) {
            continue;
        }

        if (IsUnitMagicSealed(gActiveUnit)) {
            return MENU_DISABLED;
        } else {
            return MENU_ENABLED;
        }
    }

    return MENU_NOTSHOWN;
}
