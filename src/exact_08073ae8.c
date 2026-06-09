#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmmap.h"
#include "rng.h"

#include "constants/classes.h"
#include "constants/items.h"



void EfxDecodeSplitedPalette(u16 * dst, s8 * src1, s8 * src2, s16 * src3, u32 length, int ref, int unk)
{
    u32 i;
    int r, g, b;

    for (i = 0; i < length; i++)
    {
        if (ref != unk)
        {
            r = *src3++;
            g = *src3++;
            b = *src3++;

            r = (r * ref) >> 8;
            g = (g * ref) >> 8;
            b = (b * ref) >> 8;

            r = r + *src1++;
            g = g + *src1++;
            b = b + *src1++;
        }
        else
        {
            r = *src2++;
            g = *src2++;
            b = *src2++;
        }
        *dst++ = RGB(r, g, b);
    }
}
