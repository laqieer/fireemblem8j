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



u8 CommandEffectEndPlayerPhase(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_EndEach(gProcScr_PlayerPhase);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_UnitCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_Goto(Proc_Find(gProcScr_PlayerPhase), 10);
    StartUnitListScreenField();

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_OptionsCommand(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    Proc_Start(ProcScr_Config_Field, PROC_TREE_3);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6A | MENU_ACT_CLEAR;
}

u8 MapMenu_IsStatusCommandAvailable(void) {
    if (GetBattleMapKind() == BATTLEMAP_KIND_DUNGEON) {
        return MENU_NOTSHOWN;
    }

    return MENU_ENABLED;
}
