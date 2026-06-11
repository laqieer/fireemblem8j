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



int WeaponSelectMenu_SwitchIn(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    int reach;

    UpdateMenuItemPanel(menuItem->itemNumber);

    BmMapFill(gBmMapMovement, -1);
    BmMapFill(gBmMapRange, 0);

    reach = GetUnitWeaponReachBits(gActiveUnit, menuItem->itemNumber);
    GenerateUnitStandingReachRange(gActiveUnit, reach);

    DisplayMoveRangeGraphics(2);

    return 0;
}

int BallistaRangeMenu_SwitchOut(struct MenuProc* menu, struct MenuItemProc* menuItem) {

    if (!(menu->state & US_DEAD)) {
        HideMoveRangeGraphics();
    }

    return 0;
}

u8 AttackMapSelect_Select(ProcPtr proc, struct SelectTarget* target) {

    if (EventEngineExists() == 1) {
        return 0;
    }

    gActionData.unitActionType = UNIT_ACTION_COMBAT;
    gActionData.targetIndex = target->uid;

    if (target->uid == 0) {
        gActionData.xOther = target->x;
        gActionData.yOther = target->y;
        gActionData.trapType = target->extra;
    }

    Proc_EndEach(gProcScr_BKSEL);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;

}

void BackToAttackMenu_CamWatch(void) {
    EnsureCameraOntoPosition(NULL, gActiveUnit->xPos, gActiveUnit->yPos);

    return;
}
