#include "gbafe.h"



void CopyPalWithFade(const u16 *src, u16 *dst, int ref)
{
    int i;
    int r, g, b;
    for (i = 0; i < 0x10; i++) {
        if (src[i] == 0) {
            dst[i] = 0;
            continue;
        }

        r = RED_VALUE_(src[i]);
        g = (0x3E0 & src[i]) >> 5;
        b = (0x7C00 & src[i]) >> 10;

        r += ref;
        g += ref;
        b += ref;

        if (r < 0) r = 0;
        if (g < 0) g = 0;
        if (b < 0) b = 0;

        if (r > 0x1F) r = 0x1F;
        if (g > 0x1F) g = 0x1F;
        if (b > 0x1F) b = 0x1F;

        dst[i] = (b << 10) + (g << 5) + r;
    }
}
