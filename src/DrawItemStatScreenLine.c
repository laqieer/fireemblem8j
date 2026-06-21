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
extern inline int GetItemMaxUses(int item) {
    if (GetItemAttributes(item) & IA_UNBREAKABLE) return 0xFF;
    else return GetItemData(ITEM_INDEX(item))->maxUses;
}
extern inline int GetItemIconId(int item) {
    if (!item) return -1;
    return GetItemData(ITEM_INDEX(item))->iconId;
}

//! FE8U = 0x080167D4
void DrawItemStatScreenLine(struct Text* text, int item, int nameColor, u16* mapOut) {
    int color;

    ClearText(text);

    color = nameColor;
    Text_SetColor(text, color);

    Text_DrawString(text, GetItemName(item));

    color = (nameColor == TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_GRAY : TEXT_COLOR_SYSTEM_WHITE;
    PutSpecialChar(mapOut + 12, color, TEXT_SPECIAL_SLASH);

    color = (nameColor != TEXT_COLOR_SYSTEM_GRAY) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY;
    PutNumberOrBlank(mapOut + 11, color, GetItemUses(item));
    PutNumberOrBlank(mapOut + 14, color, GetItemMaxUses(item));

    PutText(text, mapOut + 2);

    DrawIcon(mapOut, GetItemIconId(item), 0x4000);
}
