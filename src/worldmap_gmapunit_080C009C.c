#include "global.h"

#include "hardware.h"
#include "ap.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "ctc.h"
#include "mu.h"
#include "spline.h"

#include "worldmap.h"

// TODO: bmudisp.h - implicit declaration
void SMS_DisplayOne(int class, int layer, int x, int y, int oam2, int isBlend);

//! FE8U = 0x080BB26C
u16 GmapUnitFade_InterpolateColor(int arg0, int arg1, int arg2, int arg3, int arg4)
{
    int red;
    int green;
    int blue;

    u16 col1;
    int r1;
    int g1;
    int b1;

    u16 col2;
    int r2;
    int g2;
    int b2;

    int num;

    int tmp = 0x10 * 0x10;

    if (arg0 >= 0)
    {
        col1 = gPaletteBuffer[(arg0 * 0x10) + (arg1 + tmp)];
        r1 = col1 & 0x1f;
        g1 = (col1 & 0x3e0) >> 5;
        b1 = (col1 & 0x7c00) >> 10;
    }
    else
    {
        b1 = 0;
        g1 = 0;
        r1 = 0;
    }

    if (arg2 >= 0)
    {
        col2 = gPaletteBuffer[(arg2 * 0x10) + (arg3 + tmp)];
        r2 = col2 & 0x1f;
        g2 = (col2 & 0x3e0) >> 5;
        b2 = (col2 & 0x7c00) >> 10;
    }
    else
    {
        b2 = 0;
        g2 = 0;
        r2 = 0;
    }

    num = 0x1000;

    red = r1 + DivArm(num, (r2 - r1) * arg4);
    green = g1 + DivArm(num, (g2 - g1) * arg4);
    blue = b1 + DivArm(num, (b2 - b1) * arg4);

    return ((blue << 10) + (green << 5)) + red;
}
