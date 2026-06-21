#include "global.h"

#include "bmitem.h"
#include "bmitemuse.h"
#include "bmunit.h"

extern inline const struct ItemData * GetItemData(int itemIndex)
{
    return gItemData + itemIndex;
}

extern inline int GetItemMaxRange(int item)
{
    return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}

//! FE8U = 0x08016FE4
int GetUnitItemUseReachBits(struct Unit* unit, int itemSlot)
{
    int i, tmp, range = 0;

    if (itemSlot >= 0) {
        tmp = unit->items[itemSlot];

        if (!CanUnitUseItem(unit, tmp))
            return REACH_NONE;

        range = GetItemMaxRange(tmp);

        if (range == 0)
            range = 99;
    } else {
        for (i = 0; (i < UNIT_ITEM_COUNT) && (tmp = unit->items[i]); ++i) {
            if (CanUnitUseItem(unit, tmp)) {
                tmp = GetItemMaxRange(tmp);

                if (tmp == 0)
                    tmp = 99;

                if (range < tmp)
                    range = tmp;
            }
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
