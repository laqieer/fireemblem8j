#include "global.h"

#include "hardware.h"
#include "bmlib.h"
#include "mapanim.h"






/* prototypes for same-file helpers called by this run */
void SetScanlineBufWinL(u16 * buf, int x, int y);
void SetScanlineBufWinR(u16 * buf, int x, int y);

//! FE8U = 0x080823FC
void MapAnimScanlineCore(u16 * buf, int x, int y, int arg4)
{
    int i;

    int var = arg4;

    for (i = 0; var >= i; i++)
    {
        SetScanlineBufWinR(buf, x + var, y + i);
        SetScanlineBufWinR(buf, x + var, y - i);
        SetScanlineBufWinR(buf, x + i, y + var);
        SetScanlineBufWinR(buf, x + i, y - var);

        SetScanlineBufWinL(buf, x - var, y + i);
        SetScanlineBufWinL(buf, x - var, y - i);
        SetScanlineBufWinL(buf, x - i, y + var);
        SetScanlineBufWinL(buf, x - i, y - var);

        arg4 -= (i << 1) - 1;

        if (arg4 < 0)
        {
            arg4 = arg4 + ((var - 1) << 1);
            var = var - 1;
        }
    }
}

//! FE8U = 0x080824C4
void PrepareGradientScanlineBuf(u16 * buf, u16 yTop, u16 yBottom, u16 colorA, u16 colorB)
{
    int i;
    int scanline;
    int r, g, b;

    int scanlines = yBottom - yTop;

    scanline = 0;

    for (i = 0; i < DISPLAY_HEIGHT; i++)
    {
        if (i < yTop)
        {
            *buf++ = colorA;
            continue;
        }

        if (i > yBottom)
        {
            *buf++ = colorB;
            continue;
        }

        r = Interpolate(INTERPOLATE_LINEAR, colorA & 0x001F, colorB & 0x001F, scanline, scanlines);
        g = Interpolate(INTERPOLATE_LINEAR, colorA & 0x03E0, colorB & 0x03E0, scanline, scanlines);
        b = Interpolate(INTERPOLATE_LINEAR, colorA & 0x7C00, colorB & 0x7C00, scanline, scanlines);

        *buf++ = (r & 0x001F) | (g & 0x03E0) | (b & 0x7C00);

        scanline++;
    }

    return;
}
