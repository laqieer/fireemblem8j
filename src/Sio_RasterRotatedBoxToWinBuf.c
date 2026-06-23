#include "global.h"

#include "hardware.h"
#include "bmlib.h"

#include "sio.h"

//! FE8U = 0x0804B9E4
void Sio_RasterRotatedBoxToWinBuf(s16 * a, int b, int c, int d, int e, int f, int g, int h, int i, s16 j, u16 k)
{
    int x1;
    int y1;
    int x2;
    int y2;
    int x3;
    int y3;
    int x4;
    int y4;

    b -= (DISPLAY_WIDTH / 2);
    c -= (DISPLAY_HEIGHT / 2);

    d -= (DISPLAY_WIDTH / 2);
    e -= (DISPLAY_HEIGHT / 2);

    f -= (DISPLAY_WIDTH / 2);
    g -= (DISPLAY_HEIGHT / 2);

    h -= (DISPLAY_WIDTH / 2);
    i -= (DISPLAY_HEIGHT / 2);

    x1 = (b * SIN(j)) + (c * COS(j));
    y1 = (b * COS(j)) - (c * SIN(j));

    x2 = (d * SIN(j)) + (e * COS(j));
    y2 = (d * COS(j)) - (e * SIN(j));

    x3 = (f * SIN(j)) + (g * COS(j));
    y3 = (f * COS(j)) - (g * SIN(j));

    x4 = (h * SIN(j)) + (i * COS(j));
    y4 = (h * COS(j)) - (i * SIN(j));

    x1 = ((k * (x1 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y1 = ((k * (y1 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x2 = ((k * (x2 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y2 = ((k * (y2 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x3 = ((k * (x3 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y3 = ((k * (y3 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    x4 = ((k * (x4 >> 0xc)) >> 0x8) + (DISPLAY_WIDTH / 2);
    y4 = ((k * (y4 >> 0xc)) >> 0x8) + (DISPLAY_HEIGHT / 2);

    RasterizeWindowEdge(a, x1, y1, x2, y2);
    RasterizeWindowEdge(a, x2, y2, x3, y3);
    RasterizeWindowEdge(a, x3, y3, x4, y4);
    RasterizeWindowEdge(a, x4, y4, x1, y1);

    return;
}
