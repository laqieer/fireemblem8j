#include "global.h"

#include "bmsave.h"
#include "savemenu.h"

u8 SaveMenuModifySaveSlot(u8 slot, bool valid, s8 position)
{
    u8 i;
    int v = valid;
    if (position > 0)
    {
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == v))
                return slot;

            if (slot == 2)
                slot = 0;
            else
                slot++;
        }
    }
    else
    {
        for (i = 0; i < 3; i++)
        {
            if ((IsSaveValid(slot) == v))
                return slot;

            if (slot == 0)
                slot = 2;
            else
                slot--;
        }
    }
    return -1;
}
