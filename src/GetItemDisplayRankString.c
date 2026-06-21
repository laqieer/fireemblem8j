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
extern inline int GetItemAttributes(int item) { return GetItemData(ITEM_INDEX(item))->attributes; }
extern inline int GetItemRequiredExp(int item) { return GetItemData(ITEM_INDEX(item))->weaponRank; }


int GetWeaponLevelFromExp(int wexp);

char* GetItemDisplayRankString(int item) {
    int rankTextIdLookup[] = {
        // TODO: TEXT ID CONSTANTS
        0x4B8, 0x4B9, 0x4BA, 0x4BB, // --, E, D, C
        0x4BC, 0x4BD, 0x4BE, 0x4BF, // B, A, S, Prf
    };

    // reuse of the same variable for different purposes :/
    int var = GetItemRequiredExp(item);

    if ((GetItemAttributes(item) & IA_LOCK_ANY) && GetWeaponLevelFromExp(var) == WPN_LEVEL_0)
        var = 7;
    else
        var = GetWeaponLevelFromExp(var);

    return GetStringFromIndex(rankTextIdLookup[var]);
}
