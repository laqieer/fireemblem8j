#include "global.h"
#include "constants/items.h"
#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "bmitem.h"

extern inline const struct ItemData* GetItemData(int itemIndex) {
    return gItemData + itemIndex;
}

extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}

extern inline int GetItemAttributes(int item) {
    return GetItemData(ITEM_INDEX(item))->attributes;
}


int GetUnitItemHealAmount(struct Unit* unit, int item) {
    int result = 0;

    switch (GetItemIndex(item)) {

    case ITEM_STAFF_HEAL:
    case ITEM_STAFF_PHYSIC:
    case ITEM_STAFF_FORTIFY:
    case ITEM_VULNERARY:
    case ITEM_VULNERARY_2:
        result = 10;
        break;

    case ITEM_STAFF_MEND:
        result = 20;
        break;

    case ITEM_STAFF_RECOVER:
    case ITEM_ELIXIR:
        result = 80;
        break;

    } // switch (GetItemIndex(item))

    if (GetItemAttributes(item) & IA_STAFF) {
        result += GetUnitPower(unit);

        if (result > 80)
            result = 80;
    }

    return result;
}
