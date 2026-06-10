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
extern inline const struct ItemStatBonuses* GetItemStatBonuses(int item) {
    return GetItemData(ITEM_INDEX(item))->pStatBonuses;
}

int GetItemResBonus(int item) {
    if (!item)
        return 0;
    else {
        const struct ItemStatBonuses* statBonuses = GetItemStatBonuses(item);

        if (statBonuses)
            return statBonuses->resBonus;
    }

    return 0;
}
