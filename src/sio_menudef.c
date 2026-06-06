#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

//! FE8U = 0x0804D940
u8 SioMenu_OnBPress(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    gUnk_Sio_16.unk_06 = 0;
    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B | MENU_ACT_CLEAR;
}

//! FE8U = 0x0804D950
u8 SioMenu_OnRPress(struct MenuProc * menu)
{
    gUnk_Sio_16.unk_06 = 0;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, menu->rect.x, menu->rect.y), menu->rect.w, menu->rect.h, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return MENU_ACT_SKIPCURSOR | MENU_ACT_END | MENU_ACT_SND6B;
}
