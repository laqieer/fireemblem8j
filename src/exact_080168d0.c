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
s8 CanUnitUseWeaponNow(struct Unit* unit, int item);

u16 GetUnitEquippedWeapon(struct Unit* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeapon(unit, unit->items[i]) == TRUE)
            return unit->items[i];

    return 0;
}

int GetUnitEquippedWeaponSlot(struct Unit* unit) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (CanUnitUseWeaponNow(unit, unit->items[i]) == TRUE)
            return i;

    return -1;
}
