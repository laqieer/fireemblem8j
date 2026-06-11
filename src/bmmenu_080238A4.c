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



/* prototypes for same-file helpers called by this run */
u8 ItemSubMenu_RestartItemSelectAfterDiscard(struct MenuProc* menu);

u8 MenuCommand_SelectYes(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    UnitRemoveItem(gActiveUnit, gActionData.itemSlotIndex);

    if (gActionData.itemSlotIndex != 0) {
        BG_Fill(gBG0TilemapBuffer, 0);
    }

    ItemSubMenu_RestartItemSelectAfterDiscard(menu);

    return MENU_ACT_SKIPCURSOR;
}

u8 BallistaRangeMenu_BallistaUsability(const struct MenuItemDef* def, int number) {

    if (gActiveUnit->state & US_HAS_MOVED) {
        return MENU_NOTSHOWN;
    }

    if (GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos) & 0xFF00) {
        return MENU_ENABLED;
    }

    return MENU_DISABLED;

}
