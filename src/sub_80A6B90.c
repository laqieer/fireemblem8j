#include "global.h"

// JP-only worldmap/list bit-unpacking leaf @ 0x080A6B90
extern int gUnk_02014EEC;
u16 sub_80A6AA8(void);

int sub_80A6B90(u8* src, int* pIndex, int count)
{
    int acc;
    int i;

    acc = 0;

    for (i = 0; i < count; i++)
    {
        u8* p = src + (*pIndex / gUnk_02014EEC);
        int bit = (*p & (1 << (*pIndex % gUnk_02014EEC % 8))) >> (*pIndex % gUnk_02014EEC % 8);

        acc |= bit << i;

        *pIndex = *pIndex + 1;
    }

    return (acc - (u16)sub_80A6AA8()) & ((1 << count) - 1);
}
