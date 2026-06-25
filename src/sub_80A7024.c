#include "global.h"

extern u8 sub_80A6FF0(s8* src, int arg);
extern u8 gBuf_2014F28[];

void sub_80A7024(s8* src, int arg)
{
    s8* p;
    int i = 0;

    if (src[0] != 0)
    {
        p = src;

        do
        {
            gBuf_2014F28[i] = sub_80A6FF0(p, arg);
            p += 2;
            i++;
        } while (p[0] != 0);
    }
}
