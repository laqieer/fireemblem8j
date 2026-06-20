#include "global.h"

#include "bmitem.h"
#include "bmcontainer.h"

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

int GetConvoyItemCostSum(void)
{
    int i, result = 0;
    const u16 * convoy = GetConvoyItemArray();
    for (i = 0; (i < CONVOY_ITEM_COUNT) && (*convoy); ++i)
    {
        result += GetItemCost(*convoy);
        convoy++;
    }
    return result;
}
