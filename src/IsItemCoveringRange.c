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
extern inline int GetItemMinRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange >> 4;
}
extern inline int GetItemMaxRange(int item) {
    return GetItemData(ITEM_INDEX(item))->encodedRange & 0xF;
}

s8 IsItemCoveringRange(int item, int range) {
    int min = GetItemMinRange(item);
    int max = GetItemMaxRange(item);

    if ((min <= range) && (range <= max))
        return TRUE;

    return FALSE;
}
