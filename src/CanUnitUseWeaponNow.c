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

extern inline int GetItemAttributes(int item) {
    return GetItemData(ITEM_INDEX(item))->attributes;
}


s8 CanUnitUseWeaponNow(struct Unit* unit, int item) {
    if (item == 0)
        return FALSE;

    if (!(GetItemAttributes(item) & IA_WEAPON))
        return FALSE;

    if ((GetItemAttributes(item) & IA_MAGIC) && IsUnitMagicSealed(unit))
        return FALSE;

    return CanUnitUseWeapon(unit, item);
}
