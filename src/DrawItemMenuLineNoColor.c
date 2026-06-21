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
extern inline char* GetItemName(int item) {
    char* result;
    result = GetStringFromIndex(GetItemData(ITEM_INDEX(item))->nameTextId);
    result = StrInsertTact();
    return result;
}
extern inline int GetItemUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE) return 0xFF;
    else return ITEM_USES(item);
}
extern inline int GetItemIconId(int item) {
    if (!item) return -1;
    return GetItemData(ITEM_INDEX(item))->iconId;
}


void DrawItemMenuLineNoColor(struct Text* text, int item, u16* mapOut) {
    Text_SetCursor(text, 0);
    Text_DrawString(text, GetItemName(item));

    PutText(text, mapOut + 2);

    PutNumberOrBlank(mapOut + 11, Text_GetColor(text), GetItemUses(item));

    DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}
