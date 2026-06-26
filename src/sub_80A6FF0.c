#include "global.h"

u16 sub_80A6FF0(u16 *target, u16 *list)
{
    register int i asm("r2") = 0;
    register u16 value asm("r3");

    if (*(s8 *)list == 0)
        return 0xFFFF;

    value = *target;

loop:
    if (*list != value)
    {
        list++;
        i++;

        if (*(s8 *)list != 0)
            goto loop;

        return 0xFFFF;
    }

    return i;
}
