#include "global.h"

//! FE8U = banim-ekrutils.c EfxAdvanceFrameLut (s16 return; matches fe8u WITH an
// r6 pin but NON_MATCHING for JP). JP 0x08056890 region-different: the JP build
// colors count -> r6 naturally, returns the frame index directly WITHOUT the
// trailing sign-extend that an s16 return forces. The score-0 decomp.me fork
// 9rbYd reproduces the JP codegen byte-for-byte via an `unsigned int` return
// (drops the sign-extend), a `register u16 count asm("r6")` pin, inline-asm
// decrements, and literal sentinel returns that keep the six `movs;negs`
// constants un-CSE'd. Callers keep the s16 prototype from ekrbattle.h (cross-TU,
// runtime-identical); including it here would conflict with the matched return
// type, so we only need vs16 from global.h. (decomp.me fork 9rbYd, score 0)

unsigned int EfxAdvanceFrameLut(s16 *ptime, s16 *pcount, const s16 lut[])
{
    int iframe;
    register u16 count asm("r6");
    u16 time;
    u16 tmp;
    u16 time2;
    u16 count2;
    time = *ptime;
    if (time == 0)
    {
        count = *pcount;
        iframe = lut[count * 2];
        if (iframe == (-1))
        {
            do
            {
                return -1;
            }
            while (0);
        }
        if (iframe == (-6)) return -6;
        if (iframe == (-5)) return -5;
        if (iframe == (-4)) return -4;
        if (iframe == (-2))
        {
            *pcount = time;
            iframe = lut[0];
        }
        else
        {
            do
            {
            }
            while (0);
            if (iframe == (-3))
            {
                asm("sub r0, %0, #1\n\tstrh r0, [%1]" :: "r"(count), "r"(pcount));
                tmp = *pcount;
                iframe = lut[tmp * 2];
            }
        }
        count2 = *pcount;
        time2 = lut[(count2 * 2) + 1];
        ++(*((vs16 *) pcount));
        *ptime = time2 - 1;
        return iframe;
    }
    else
    {
        do { } while (0);
        asm("sub r0, r0, #1\n\tstrh r0, [%0]" :: "r"(ptime));
        return -7;
    }
}
