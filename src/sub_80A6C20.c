#include "global.h"

u16 sub_80A6C20(u8 * buf, int len)
{
    u8 b;
    int i;
    u16 acc;

    acc = 0;

    for (i = 0; i < len; i++)
    {
        b = buf[i];
        acc = acc + ((b * b) * (i + 1));
    }

    return ((acc + (acc >> 8)) + (acc >> 16)) & 0x3FF;
}
