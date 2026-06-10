#include "global.h"
#include "constants/items.h"
#include "bmunit.h"
#include "bmitem.h"

extern inline const struct ItemData* GetItemData(int itemIndex) {
    return gItemData + itemIndex;
}
extern inline int GetItemType(int item) {
    if (!item)
        return 0xFF;

    return GetItemData(ITEM_INDEX(item))->weaponType;
}
static inline int GetChapterUnk1C(int arg) {
    return gPlaySt.unk1C[arg];
}

s8 IsItemUnsealedForUnit(struct Unit* unit, int item) {
    return (GetChapterUnk1C(GetItemType(item)) == unit->pCharacterData->number) ? TRUE : FALSE;
}
