#include "global.h"

#include "bmitem.h"
#include "bmitemuse.h"
#include "bmunit.h"

extern inline const struct ItemData * GetItemData(int itemIndex)
{
    return gItemData + itemIndex;
}

extern inline int GetItemAttributes(int item)
{
    return GetItemData(ITEM_INDEX(item))->attributes;
}

s8 CanUnitUse_unused(struct Unit * unit, int item)
{
    if (GetItemAttributes(item) & IA_WEAPON)
        return CanUnitUseWeapon(unit, item);
    else
        return CanUnitUseItem(unit, item);
}
