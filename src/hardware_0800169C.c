#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

void MaybeResetSomePal(void)
{
    int i;

    for (i = 31; i >= 0; i--)
        gFadeComponentStep[i] = 0;
}

void MaybeSmoothChangeSomePal(u16 *src, int b, int c, int d)
{
    int i;
    int j;
    int r3 = (d < 0) ? 32 : 0;
    int destOffset = b * 48;

    for (i = 0; i < c; i++)
    {
        gFadeComponentStep[b + i] = d;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[destOffset++] = RED_VALUE(*src) + r3;
            gFadeComponents[destOffset++] = GREEN_VALUE(*src) + r3;
            gFadeComponents[destOffset++] = BLUE_VALUE(*src) + r3;
            src++;
        }
    }
}

void ColorFadeSetupRange(int a, int b, int c, int d)
{
    int i;
    int j;
    int destOffset = PAL_OFFSET(a);
    u16 *src = gPaletteBuffer + destOffset;

    for (i = 0; i < b; i++)
    {
        gFadeComponentStep[a + i] = d;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[destOffset++] = RED_VALUE(*src) + c;
            gFadeComponents[destOffset++] = GREEN_VALUE(*src) + c;
            gFadeComponents[destOffset++] = BLUE_VALUE(*src) + c;
            src++;
        }
    }
}

void ColorFadeSetStepRange(int a, int b, int c)
{
    int i;

    for (i = a; i < a + b; i++)
        gFadeComponentStep[i] = c;
}
