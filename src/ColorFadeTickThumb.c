#include "global.h"
#include "hardware.h"

void ColorFadeTickThumb(void)
{
    int i;
    int j;
    s16 r4;
    s16 r3;
    s16 r1;

    for (i = 31; i >= 0; i--)
    {
        if (gFadeComponentStep[i] != 0)
        {
            for (j = 15; j >= 0; j--)
            {
                gFadeComponents[(i * 16 + j) * 3 + 0] += gFadeComponentStep[i];
                gFadeComponents[(i * 16 + j) * 3 + 1] += gFadeComponentStep[i];
                gFadeComponents[(i * 16 + j) * 3 + 2] += gFadeComponentStep[i];

                r4 = gFadeComponents[(i * 16 + j) * 3 + 0] - 32;
                if (r4 > 31) r4 = 31;
                if (r4 < 0)  r4 = 0;

                r3 = gFadeComponents[(i * 16 + j) * 3 + 1] - 32;
                if (r3 > 31) r3 = 31;
                if (r3 < 0)  r3 = 0;

                r1 = gFadeComponents[(i * 16 + j) * 3 + 2] - 32;
                if (r1 > 31) r1 = 31;
                if (r1 < 0)  r1 = 0;

                gPaletteBuffer[i * 16 + j] = (r1 << 10) + (r3 << 5) + r4;
            }
        }
    }

    sModifiedPalette = 1;
}
