#include "global.h"

#include "bmunit.h"
#include "bmitem.h"
#include "uimenu.h"
#include "hardware.h"

#include "sio.h"

int SioWeaponSelectMenu_Draw(struct MenuProc * menu, struct MenuItemProc * menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber];

    s8 color = CanUnitUseWeapon(gActiveUnit, item);

    if (GetItemMinRange(item) > 2)
    {
        color = 0;
    }

    DrawItemMenuLine(
        &menuItem->text, item, color, TILEMAP_LOCATED(gBG0TilemapBuffer, menuItem->xTile, menuItem->yTile));
    BG_EnableSyncByMask(BG0_SYNC_BIT);

    // return;
}
