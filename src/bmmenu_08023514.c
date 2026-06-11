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
u8 MenuCommand_SelectNo(struct MenuProc* menu);
u8 ItemSelectMenu_Teardown(struct MenuProc* menu);

u8 ItemSubMenu_RestartItemSelect(struct MenuProc* menu) {
    ProcPtr proc;

    ItemSelectMenu_Teardown(menu);
    MenuCommand_SelectNo(menu);

    proc = StartOrphanMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);
    ForceMenuItemPanel(proc, gActiveUnit, 15, 11);

    return MENU_ENABLED;
}

u8 ItemSubMenu_RestartItemSelectAfterDiscard(struct MenuProc* menu) {

    ProcPtr proc;

    ItemSelectMenu_Teardown(menu);

    if (GetUnitItemCount(gActiveUnit) == 0) {
        ClearBg0Bg1();

        EndFaceById(0);

        StartSemiCenteredOrphanMenu(&gUnitActionMenuDef, gBmSt.cursorTarget.x - gBmSt.camera.x, 1, 0x16);

        return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
    }

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 0x2B, 9, 0x13);
    TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 0x2B, 9, 0x13);

    TileMap_FillRect(gBG0TilemapBuffer + 0x2B - 0xA, 0xE, 0xC, 0);
    TileMap_FillRect(gBG1TilemapBuffer + 0x2B - 0xA, 0xD, 0xC, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    proc = StartOrphanMenu(&gItemSelectMenuDef);

    StartFace(0, GetUnitPortraitId(gActiveUnit), 0xB0, 0xC, 2);

    SetFaceBlinkControlById(0, 5);

    ForceMenuItemPanel(proc, gActiveUnit, 0xF, 0xB);

    return MENU_ACT_SKIPCURSOR;
}

u8 ItemSubMenu_IsUseAvailable(const struct MenuItemDef* def, int number) {
    int item = gActiveUnit->items[gActionData.itemSlotIndex];

    if (GetItemUseEffect(item) == 0) {
        return MENU_NOTSHOWN;
    }

    if (GetItemType(item) == ITYPE_STAFF) {
        return MENU_NOTSHOWN;
    }

    if (GetItemType(item) == ITYPE_DANCE) {
        return MENU_NOTSHOWN;
    }

    if ((GetItemAttributes(item) & IA_WEAPON) && !CanUnitUseWeapon(gActiveUnit, item)) {
        return MENU_NOTSHOWN;
    }

    return CanUnitUseItem(gActiveUnit, item)
        ? MENU_ENABLED : MENU_DISABLED;
}
