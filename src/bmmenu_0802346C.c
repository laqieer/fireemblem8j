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

int Menu_SwitchOut_DoNothing(struct MenuProc* menu, struct MenuItemProc* menuItem) {
    // return 0; // BUG?
}

void ItemSubMenu_InitFontAndSaveBg(int x, int y) {
    InitTextFont(&gItemSelectMenuFont, (void*)VRAM + 0x4000, 0x200, 0);

    TileMap_CopyRect(gBG0TilemapBuffer + 0x2B, gUiTmScratchA, 9, 19);
    TileMap_CopyRect(gBG1TilemapBuffer + 0x2B, gUiTmScratchB, 9, 19);

    return;
}

void ItemSubMenuEnd(struct MenuProc* menu) {
    SetTextFont(0);

    return;
}

u8 MenuCommand_SelectNo(struct MenuProc* menu) {
    SetTextFont(NULL);

    TileMap_CopyRect(gUiTmScratchA, gBG0TilemapBuffer + 0x2B, 9, 19);
    TileMap_CopyRect(gUiTmScratchB, gBG1TilemapBuffer + 0x2B, 9, 19);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}
