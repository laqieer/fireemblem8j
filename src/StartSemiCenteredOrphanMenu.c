#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uimenu.h"

extern u8 sItemCountYOffsetLookup[];

struct MenuProc* StartSemiCenteredOrphanMenu(
    const struct MenuDef* def, int xSubject, int xTileLeft, int xTileRight)
{
    struct MenuProc* result = StartOrphanMenuAdjusted(def, xSubject, xTileLeft, xTileRight);
    int i;

    if (result->itemCount <= 6)
        return result;

    result->rect.y -= sItemCountYOffsetLookup[result->itemCount];

    for (i = 0; i < result->itemCount; ++i)
        result->menuItems[i]->yTile -= sItemCountYOffsetLookup[result->itemCount];

    return result;
}
