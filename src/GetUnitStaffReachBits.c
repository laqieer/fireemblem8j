#include "global.h"
#include "constants/items.h"
#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "bmitem.h"

extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}
extern inline const struct ItemData* GetItemData(int itemIndex) {
    return gItemData + itemIndex;
}
extern inline int GetItemMaxRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}

int GetUnitStaffReachBits(struct Unit* unit) {
    int i, tmp, range = 0;

    for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
        if (CanUnitUseStaff(unit, tmp)) {
            if (GetItemIndex(tmp) == ITEM_NIGHTMARE) {
                tmp = 99;
            } else {
                tmp = GetItemMaxRange(tmp);

                if (tmp == 0)
                    tmp = 99;
            }

            if (range < tmp)
                range = tmp;
        }
    }

    switch (range) {

    case 1:
        return REACH_RANGE1;

    case 2:
        return REACH_RANGE1 | REACH_RANGE2;

    case 99:
        return REACH_MAGBY2;

    default:
        return REACH_NONE;

    } // switch (range)
}
