#include "global.h"
#include "constants/chapters.h"
#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"
#include "bmcontainer.h"

int GetConvoyItemSlot(int item)
{
    int i;
    u16 * convoy;
    item = GetItemIndex(item);
    convoy = gConvoyItemArray;

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
        if (item == ITEM_INDEX(convoy[i]))
            return i;

    return -1;
}
