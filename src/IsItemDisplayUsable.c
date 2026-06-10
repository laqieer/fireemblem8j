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
extern inline int GetItemIndex(int item) {
    return ITEM_INDEX(item);
}
extern inline int GetItemUseEffect(int item) {
    return GetItemData(ITEM_INDEX(item))->useEffectId;
}

s8 IsItemDanceRing(int item);

s8 IsItemDisplayUsable(struct Unit* unit, int item) {
    if (GetItemAttributes(item) & IA_WEAPON)
        return CanUnitUseWeapon(unit, item);

    if (GetItemAttributes(item) & IA_STAFF)
        return CanUnitUseStaff(unit, item);

    if (GetItemUseEffect(item)) {
        if (unit->statusIndex == UNIT_STATUS_SLEEP)
            return FALSE;

        if (unit->statusIndex == UNIT_STATUS_BERSERK)
            return FALSE;

        if (!(UNIT_CATTRIBUTES(unit) & CA_THIEF) && GetItemIndex(item) == ITEM_LOCKPICK)
            return FALSE;

        if (!(UNIT_CATTRIBUTES(unit) & CA_REFRESHER) && IsItemDanceRing(item))
            return FALSE;
    }

    return TRUE;
}
