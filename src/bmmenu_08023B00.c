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



int StaffCommandRange(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int reach = GetUnitItemUseReachBits(gActiveUnit, -1);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    GenerateUnitStandingReachRange(gActiveUnit, reach);

    DisplayMoveRangeGraphics(5);

    return 0;
}

int HideMoveRangeGraphicsWrapper2(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    HideMoveRangeGraphics();

    return 0;
}

u8 StaffItemSelect_Usability(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[number];

    if (GetItemType(item) != ITYPE_STAFF) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitUseItem(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;

}

u8 StaffItemSelect_Effect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    EquipUnitItemSlot(gActiveUnit, menuItem->itemNumber);

    gActionData.itemSlotIndex = 0;

    ClearBg0Bg1();

    DoItemUse(gActiveUnit, gActiveUnit->items[gActionData.itemSlotIndex]);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}
