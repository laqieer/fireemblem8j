#include "global.h"

// JP-only worldmap/list bit-packing leaf @ 0x080A6AFC
extern int gUnk_02014EEC;
u16 sub_80A6AA8(void);

void sub_80A6AFC(u8* dst, int* pIndex, int bits, int count)
{
    int i;

    bits = (bits + (u16)sub_80A6AA8()) & ((1 << count) - 1);

    for (i = 0; i < count; i++)
    {
        u8* p = dst + (*pIndex / gUnk_02014EEC);
        int bit = ((1 << i) & bits) >> i;

        *p |= bit << (*pIndex % gUnk_02014EEC % 8);

        *pIndex = *pIndex + 1;
    }
}
