#include "global.h"

#include "constants/chapters.h"
#include "variables.h"
#include "bmitem.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "worldmap.h"

#include "bmcontainer.h"

EWRAM_DATA u16 gConvoyItemArray[CONVOY_ITEM_COUNT] = {0};

void ClearSupplyItems(void)
{
    CpuFill16(0, gConvoyItemArray, CONVOY_ITEM_COUNT * sizeof(u16));
}

void ShrinkConvoyItemList(void)
{
    u16 i;
    u16 * buffer = (void*) gGenericBuffer;
    u16 * bufferIt = buffer;
    u16 * convoy = GetConvoyItemArray();

    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (*convoy != 0)
        {
            *bufferIt = *convoy;
            bufferIt++;
        }
        convoy++;
    }

    *bufferIt = 0;
    ClearSupplyItems();
    CpuCopy16(buffer, GetConvoyItemArray(), i * sizeof(u16));
    return;
}

int GetConvoyItemCount(void)
{
    int i;
    int count = 0;
    u16 * convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; i++)
        if (convoy[i] != 0)
            count++;

    return count;
}

int AddItemToConvoy(int item)
{
    int i;
    u16 * convoy;
    gBmSt.itemUnk2E = 0;
    convoy = gConvoyItemArray;
    for (i = 0; i < CONVOY_ITEM_COUNT; ++i)
    {
        if (convoy[i] == 0)
        {
            convoy[i] = item;
            return i;
        }
    }
    gBmSt.itemUnk2E = item;
    return -1;
}

void RemoveItemFromConvoy(int index)
{
    gConvoyItemArray[index] = 0;
    ShrinkConvoyItemList();
    return;
}
