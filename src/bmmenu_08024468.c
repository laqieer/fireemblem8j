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



u8 SummonCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    MakeTargetListForSummon(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Summon);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 SummonSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON;
    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 YobimaCommandUsability(const struct MenuItemDef* def, int number) {

    u16 count;
    int i;

    if (gActiveUnit->pClassData->number != CLASS_DEMON_KING) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    count = 0;

    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        struct Unit* unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit)) {
            continue;
        }

        if (count > 0x27) {
            return MENU_NOTSHOWN;
        }

        count++;
    }

    return MENU_ENABLED;
}

u8 YobimaCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 YobimaSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    GetUnit(gActionData.subjectIndex);

    gActionData.unitActionType = UNIT_ACTION_SUMMON_DK;

    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ConvoyMenu_HelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    if (menuItem->itemNumber >= 5) {
        StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gBmSt.um_tmp_item);
        return 0;
    }

    StartItemHelpBox(menuItem->xTile << 3, menuItem->yTile << 3, gActiveUnit->items[menuItem->itemNumber]);

    // return 0; // BUG?
}

u8 ItemMenu_HelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    struct Unit* unit = GetUnit(gActionData.targetIndex);

    StartItemHelpBox(menuItem->xTile * 8, menuItem->yTile << 3,
    unit->items[menuItem->itemNumber]);

    //return 0; // BUG?
}

u8 BallistaRangeMenuHelpBox(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    int x = menuItem->xTile << 3;
    int y = menuItem->yTile << 3;

    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    StartItemHelpBox(x, y, item);

    // return 0; // BUG?
}
