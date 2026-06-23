#include "global.h"
#include "hardware.h"

void EfxTmCpyExtHFlip(const u16 * src, s16 src_width, u16 * dst, s16 dst_width, u16 width, u16 hight, int pal, int chr)
{
    int i, j;

    dst += width - 1;

    for (i = hight; i != 0; i--)
    {
        u16 len1 = 0;
        u16 len2 = 0;

        for (j = width; j != 0; j--)
        {
            u16 val = *src;
            if (pal != -1)
                val = val + (pal << 0xC);

            if (chr != -1)
                val = val + chr;

            *dst = val ^ TILE_HFLIP;

            src++;
            dst--;
        }

        if (src_width != -1)
        {
            len1 = src_width - width;
            src = src + len1;
        }

        if (dst_width != -1)
        {
            len2 = width + dst_width;
            dst = dst + len2;
        }
    }
}
