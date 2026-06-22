#include "global.h"
#include "hardware.h"
#include "uimenu.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmmind.h"

int StealItemMenuCommand_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    int item = GetUnit(gActionData.targetIndex)->items[menuItem->itemNumber];
    int isStealable = (s8)IsItemStealable(item);

    asm("":::"memory");

    DrawItemMenuLine(&menuItem->text, item, isStealable, gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile));

    return;
}
