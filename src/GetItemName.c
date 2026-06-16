#include "global.h"
#include "bmitem.h"

char* GetItemName(int item)
{
    char* result;

    result = GetStringFromIndex((gItemData + ITEM_INDEX(item))->nameTextId);
    result = StrInsertTact();

    return result;
}
