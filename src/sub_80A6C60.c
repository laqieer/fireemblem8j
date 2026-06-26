#include "global.h"

extern int gUnk_02014EF0;
extern int gUnk_02014EF4;
extern u8 gBuf_2014F28[];

u16 sub_80A6C20(u8 * buf, int len);
void sub_80A6AC0(void);

// JP-only worldmap/augury bit-packing leaf @ 0x080A6C60
void sub_80A6C60(void)
{
    int i;
    int j;
    u16 sb;
    u8 *dst;
    u8 *arg;
    u16 *src;
    u16 *base;

    i = 0;

    arg = (u8 *)(gUnk_02014EF4 + 0x02014F28);
    base = (u16 *)0x02014FC8;
    sb = sub_80A6C20(arg, base[3]);
    dst = (u8 *)0x02014F28;
    src = base;

    do
    {
        register int bits asm("r4");

        if (i % 3 == 0)
        {
            bits = src[0];
            bits &= 1 << (i / 3);
            bits >>= (i / 3);
        }
        else if (i % 3 == 1)
        {
            bits = src[1];
            bits &= (i % 3) << (i / 3);
            bits >>= (i / 3);
        }
        else
        {
            bits = src[2];
            bits &= 1 << (i / 3);
            bits >>= (i / 3);
        }

        *dst |= bits << (i % *(int *)0x02014EEC);

        i++;
        if (i % *(int *)0x02014EEC == 0)
            dst++;
    } while (i != 0x1e);

    for (j = 0; j < gUnk_02014EF4; j++)
    {
        gBuf_2014F28[j] = (gBuf_2014F28[j] + sb) & gUnk_02014EF0;
    }

    sub_80A6AC0();
}
