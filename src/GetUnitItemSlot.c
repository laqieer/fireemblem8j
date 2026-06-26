#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}


int GetUnitItemSlot(struct Unit* unit, int itemIndex) {
    int i;

    for (i = 0; i < UNIT_ITEM_COUNT; ++i)
        if (GetItemIndex(unit->items[i]) == itemIndex)
            return i;

    return (-1);
}
