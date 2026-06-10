#include "global.h"

struct UnknownDmaStruct
{
    u16 unk00;  // u32? Why do these overlap?
    u8 unk02[1];
};

void Hardware_CopyViaDmaStruct(u16 *a, struct UnknownDmaStruct *b)
{
    int i;
    int j;
    u8 r6 = b->unk00;
    u8 r0 = b->unk00 >> 8;
    int r4 = 0;
    s16 *src = (s16 *)b->unk02;

    for (i = 0; i < r0; i++)
    {
        s16 *dest = a + i * 32;

        for (j = 0; j < r6; j++)
        {
            r4 += *src++;
            *dest++ = r4;
        }
    }
}
