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
extern inline int GetItemMaxUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return GetItemData(ITEM_INDEX(item))->maxUses;
}
extern inline int GetItemUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}

s8 IsItemHammernable(int item) {
    if (!item)
        return FALSE;

    if (!(GetItemAttributes(item) & (IA_WEAPON | IA_STAFF)))
        return FALSE;

    if (GetItemAttributes(item) & (IA_UNBREAKABLE | IA_HAMMERNE | IA_LOCK_3))
        return FALSE;

    if (GetItemUses(item) == GetItemMaxUses(item))
        return FALSE;

    return TRUE;
}
