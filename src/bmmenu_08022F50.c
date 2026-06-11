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

u8 TradeCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    ClearBg0Bg1();

    MakeTradeTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Trade);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

u8 TradeSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_TRADED_1D;

    StartTradeMenu(gActiveUnit, GetUnit(target->uid), 0);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 UnitActionMenu_CanSeize(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (!CanUnitSeize(gActiveUnit)) {
        return MENU_NOTSHOWN;
    }

    return GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_SEIZE
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 UnitActionMenu_Seize(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    gActionData.unitActionType = UNIT_ACTION_SEIZE;
    gActiveUnit->state |= US_HAS_MOVED;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 VisitCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->pClassData->number == CLASS_PHANTOM) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    switch (gBmMapTerrain[gActiveUnit->yPos][gActiveUnit->xPos]) {
        default:
            return MENU_NOTSHOWN;
        case TERRAIN_HOUSE:
        case TERRAIN_INN:
        case TERRAIN_RUINS_VILLAGE:
        case TERRAIN_VILLAGE_REGULAR:
            break;
    }

    if (GetAvailableTileEventCommand(gActiveUnit->xPos, gActiveUnit->yPos) == TILE_COMMAND_VISIT) {
        if (IsUnitMagicSealed(gActiveUnit)) {
            return MENU_DISABLED;
        }

        return MENU_ENABLED;
    }

    return MENU_NOTSHOWN;
}
