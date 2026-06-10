#include "global.h"
#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"

//! FE8U = 0x080825E8
void PrepareHorizontalBandScanlineBuf(void)
{
    int i;
    volatile u16 * buf;

    for (buf = gManimScanlineBufs[0], i = 0; i < DISPLAY_HEIGHT; i++)
    {
        buf[i] = 0x1000;
    }

    for (i = 8; i < DISPLAY_HEIGHT - 8; i++)
    {
        gManimScanlineBufs[0][i] = 0x10;
    }

    for (i = 0; i <= 32; i++)
    {
        *(gManimScanlineBufs[0] + (i + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
        *(gManimScanlineBufs[0] - (i - DISPLAY_HEIGHT + 8)) = ((0x10 - (i >> 1)) << 8) | (i >> 1);
    }

    return;
}
