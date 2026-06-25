#include "global.h"
void sub_80A6AC0(void)
{
    int i;
    for (i = 0; i < *(int *)0x02014EF4; i++)
    {
        u8 *base = (u8 *)0x02014F28;
        int off = i + *(int *)0x02014EF4 + 2 * i;
        u8 tmp = base[off];
        base[off] = base[i];
        base[i] = tmp;
    }
}
