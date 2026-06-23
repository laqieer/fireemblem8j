#include "global.h"
#include "eventinfo.h"

//! FE8U = 0x080845E4
u16 GetEventTriggerId(const void * script)
{
    s16 i;
    for (i = 0; i < gActiveEventRegistry.idx; i++)
        if (gActiveEventRegistry.scripts[i] == (u32)script)
            return gActiveEventRegistry.flags[i];

    return 0;
}
