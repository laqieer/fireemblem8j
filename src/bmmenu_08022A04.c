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



u8 GiveEffect(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    MakeGiveTargetList(gActiveUnit);
    NewTargetSelection(&gSelectInfo_Give);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A;
}

void MakeUnitRescueTransferGraphics(struct Unit* from, struct Unit* to) {
    struct Unit* rescue = GetUnit(from->rescue);

    EndSubtitleHelp();

    Make6CKOIDOAMM(rescue, GetSomeFacingDirection(to->xPos, to->yPos, from->xPos, from->yPos));

    return;
}

u8 TakeSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_TAKE;
    gActionData.targetIndex = target->uid;

    UnitFinalizeMovement(GetUnit(gActionData.targetIndex));

    MakeUnitRescueTransferGraphics(GetUnit(gActionData.targetIndex), GetUnit(gActionData.subjectIndex));

    UnitGive(GetUnit(gActionData.targetIndex), GetUnit(gActionData.subjectIndex));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 GiveSelection_OnSelect(ProcPtr proc, struct SelectTarget* target) {

    gActionData.unitActionType = UNIT_ACTION_GIVE;
    gActionData.targetIndex = target->uid;

    UnitFinalizeMovement(GetUnit(gActionData.subjectIndex));

    MakeUnitRescueTransferGraphics(GetUnit(gActionData.subjectIndex), GetUnit(gActionData.targetIndex));

    UnitGive(GetUnit(gActionData.subjectIndex), GetUnit(gActionData.targetIndex));

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}
