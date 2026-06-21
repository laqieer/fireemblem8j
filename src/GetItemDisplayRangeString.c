#include "global.h"
#include "constants/items.h"
#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "bmitem.h"

extern inline const struct ItemData* GetItemData(int itemIndex) { return gItemData + itemIndex; }
extern inline int GetItemEncodedRange(int item) { return GetItemData(ITEM_INDEX(item))->encodedRange; }


char* GetItemDisplayRangeString(int item) {
    int rangeTextIdLookup[10] = {
        // TODO: TEXT ID CONSTANTS
        0x4AE, 0x4AF, 0x4B0, 0x4B1, 0x4B2, // 0-Mag/2, 1, 1-2, 1-3, 2
        0x4B3, 0x4B4, 0x4B5, 0x4B6, 0x4B7, // 2-3, 3-10, 3-15, Total, --
    };

    switch (GetItemEncodedRange(item)) {

    case 0x10: // 1-mag/2
        return GetStringFromIndex(rangeTextIdLookup[0]);

    case 0x11: // 1-1
        return GetStringFromIndex(rangeTextIdLookup[1]);

    case 0x12: // 1-2
        return GetStringFromIndex(rangeTextIdLookup[2]);

    case 0x13: // 1-3
        return GetStringFromIndex(rangeTextIdLookup[3]);

    case 0x22: // 2-2
        return GetStringFromIndex(rangeTextIdLookup[4]);

    case 0x23: // 2-3
        return GetStringFromIndex(rangeTextIdLookup[5]);

    case 0x3A: // 3-10
        return GetStringFromIndex(rangeTextIdLookup[6]);

    case 0x3F: // 3-15
        return GetStringFromIndex(rangeTextIdLookup[7]);

    case 0xFF: // total
        return GetStringFromIndex(rangeTextIdLookup[8]);

    default: // bad
        return GetStringFromIndex(rangeTextIdLookup[9]);

    } // switch (GetItemEncodedRange(item))
}
