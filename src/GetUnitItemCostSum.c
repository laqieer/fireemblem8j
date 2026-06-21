#include "global.h"

#include "bmitem.h"
#include "bmunit.h"

extern inline const struct ItemData * GetItemData(int itemIndex)
{
    return gItemData + itemIndex;
}

extern inline int GetItemAttributes(int item)
{
    return GetItemData(ITEM_INDEX(item))->attributes;
}

extern inline int GetItemUses(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}

extern inline int GetItemCost(int item)
{
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return GetItemData(ITEM_INDEX(item))->costPerUse;
    else
        return GetItemData(ITEM_INDEX(item))->costPerUse * GetItemUses(item);
}

//! FE8U = 0x08017178
int GetUnitItemCostSum(void)
{
    int i, j, item, result = 0;

    for (i = 1; i < 0x40; ++i) {
        struct Unit* unit = GetUnit(i);

        if (!unit)
            continue;

        if (!unit->pCharacterData)
            continue;

        if (unit->state & (US_DEAD | US_BIT16))
            continue;

        for (j = 0; (j < UNIT_ITEM_COUNT) && (item = unit->items[j]); ++j)
            result += GetItemCost(item);
    }

    return result;
}
