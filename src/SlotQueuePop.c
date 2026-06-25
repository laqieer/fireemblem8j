#include "global.h"
#include "event.h"

unsigned SlotQueuePop(void)
{
    s16 i;
    unsigned result;
    u32 *p;

    p = gEventSlotQueue;
    result = p[0];

    gEventSlots[0xD]--;

    p = gEventSlotQueue;
    for (i = 0; i < gEventSlots[0xD]; ++i)
    {
        *p = p[1];
        p++;
    }

    return result;
}
