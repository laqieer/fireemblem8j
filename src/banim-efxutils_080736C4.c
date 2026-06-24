#include "global.h"

#include "ekrbattle.h"
#include "bmlib.h"

bool EkrPalModifyUnused(u16 * pal_start, u16 * pal_end, u16 * dst, u16 amount, u16 start, u16 end)
{
    int i;
    s16 s = (s16)start;
    s16 e = (s16)end;
    for (i = 0; i < amount; i++)
    {
        int r1 = *pal_start & 0x001F;
        int g1 = *pal_start & 0x03E0;
        int b1 = *pal_start & 0x7C00;

        int r2 = *pal_end & 0x001F;
        int g2 = *pal_end & 0x03E0;
        int b2 = *pal_end & 0x7C00;

        u16 r = Interpolate(0, r1, r2, s, e);
        u16 g = Interpolate(0, g1, g2, s, e);
        u16 b = Interpolate(0, b1, b2, s, e);

        *dst = (b & 0x7C00) | (g & 0x03E0) | (r & 0x001F);

        pal_start++;
        pal_end++;
        dst++;
    }

    if (s == e)
        return true;

    return false;
}
