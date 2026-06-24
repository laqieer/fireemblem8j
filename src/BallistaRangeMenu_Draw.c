#include "global.h"
#include "hardware.h"
#include "uimenu.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmarch.h"

int BallistaRangeMenu_Draw(struct MenuProc* menu, struct MenuItemProc* menuItem)
{
    s8 isAvailable = menuItem->availability == 1;
    int item = GetBallistaItemAt(gActiveUnit->xPos, gActiveUnit->yPos);

    DrawItemMenuLine(
        &menuItem->text,
        item,
        isAvailable,
        gBG0TilemapBuffer + TILEMAP_INDEX(menuItem->xTile, menuItem->yTile)
    );

    // return 0; // BUG?
}
