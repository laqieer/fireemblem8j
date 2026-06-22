#include "global.h"
#include "hardware.h"
#include "uimenu.h"
#include "bmunit.h"
#include "bmitem.h"

int WeaponSelectMenu_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    int item = gActiveUnit->items[menuItem->itemNumber];
    int isUsable = (s8)CanUnitUseWeapon(gActiveUnit, item);

    asm("":::"memory");

    DrawItemMenuLine(&menuItem->text, item, isUsable, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    return 0;
}
