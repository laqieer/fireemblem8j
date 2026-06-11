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

u8 SupportSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_SUPPORT;
    gActionData.targetIndex = target->uid;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 DoorCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR) < 0) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForDoorAndBridges(gActiveUnit, TERRAIN_DOOR);

    return GetSelectTargetCount() != 0
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 DoorCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_DOOR;

    gActionData.subjectIndex = gActiveUnit->index;

    gActionData.itemSlotIndex = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_DOOR);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 ChestCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST_FULL) < 0) {
        return MENU_NOTSHOWN;
    }

    return CanUnitUseChestKeyItem(gActiveUnit)
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 ChestCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    gActionData.unitActionType = UNIT_ACTION_CHEST;
    gActionData.itemSlotIndex = GetUnitKeyItemSlotForTerrain(gActiveUnit, TERRAIN_CHEST_FULL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 PickCommandUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (gActiveUnit->pClassData->number != CLASS_ROGUE) {
        return MENU_NOTSHOWN;
    }

    MakeTargetListForPick(gActiveUnit);

    return GetSelectTargetCount()
        ? MENU_ENABLED : MENU_NOTSHOWN;
}

u8 PickCommandEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    MakeTargetListForPick(GetUnit(gActionData.subjectIndex));
    NewTargetSelection(&gSelectInfo_Pick);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 PickSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.xOther = target->x;
    gActionData.yOther = target->y;

    gActionData.unitActionType = UNIT_ACTION_PICK;

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}
