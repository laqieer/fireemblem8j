#include "global.h"
#include "constants/items.h"
#include "fontgrp.h"
#include "icon.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "bmitem.h"

static inline const struct ItemData* GetItemData_(int itemIndex) {
    return gItemData + itemIndex;
}

static inline char* GetItemName_(int item) {
    char* result;

    result = GetStringFromIndex(GetItemData_(ITEM_INDEX(item))->nameTextId);
    result = StrInsertTact();

    return result;
}

static inline int GetItemAttributes_(int item) {
    return GetItemData_(ITEM_INDEX(item))->attributes;
}

static inline int GetItemUses_(int item) {
    if (GetItemAttributes_(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return ITEM_USES(item);
}

static inline int GetItemMaxUses_(int item) {
    if (GetItemAttributes_(item) & IA_UNBREAKABLE)
        return 0xFF;
    else
        return GetItemData_(ITEM_INDEX(item))->maxUses;
}

static inline int GetItemIconId_(int item) {
    if (!item)
        return -1;

    return GetItemData_(ITEM_INDEX(item))->iconId;
}

void DrawItemMenuLineLong(struct Text* text, int item, int isUsable, u16* mapOut) {
    int u = (s8)isUsable;

    Text_SetParams(text, 0, u ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY);
    Text_DrawString(text, GetItemName_(item));

    PutText(text, mapOut + 2);

    PutNumberOrBlank(mapOut + 10, u ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemUses_(item));
    PutNumberOrBlank(mapOut + 13, u ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY, GetItemMaxUses_(item));
    PutSpecialChar(mapOut + 11, u ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_SLASH);

    DrawIcon(mapOut, GetItemIconId_(item), 0x4000);
}
