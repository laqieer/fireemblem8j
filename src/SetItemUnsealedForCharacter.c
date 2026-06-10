#include "global.h"
#include "constants/items.h"
#include "bmitem.h"

extern inline const struct ItemData* GetItemData(int itemIndex) {
    return gItemData + itemIndex;
}
extern inline int GetItemType(int item) {
    if (!item)
        return 0xFF;

    return GetItemData(ITEM_INDEX(item))->weaponType;
}
static inline void SetChapterUnk1C(int arg, u8 val) {
    gPlaySt.unk1C[arg] = val;
}

void SetItemUnsealedForCharacter(int item, u8 unk) {
    SetChapterUnk1C(GetItemType(item), unk);
}
