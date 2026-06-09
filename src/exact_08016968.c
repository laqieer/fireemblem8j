#include "global.h"

#include "constants/items.h"

#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"

#include "bmitem.h"

void EquipUnitItemSlot(struct Unit* unit, int itemSlot) {
    int item, i;

    item = unit->items[itemSlot];

    for (i = itemSlot; i != 0; --i)
        unit->items[i] = unit->items[i - 1];

    unit->items[0] = item;
}
