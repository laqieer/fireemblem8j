#include "global.h"

#include "constants/items.h"

#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"

#include "bmitem.h"

/* prototypes for same-file helpers called by this run */
s8 CanUnitUseWeapon(struct Unit* unit, int item);
int GetItemReachBits(int item);

int GetUnitWeaponReachBits(struct Unit* unit, int itemSlot) {
    int i, item, result = 0;

    if (itemSlot >= 0)
        return GetItemReachBits(unit->items[itemSlot]);

    for (i = 0; (i < UNIT_ITEM_COUNT) && (item = unit->items[i]); ++i)
        if (CanUnitUseWeapon(unit, item))
            result |= GetItemReachBits(item);

    return result;
}
