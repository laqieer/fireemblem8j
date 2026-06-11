#include "global.h"
#include "variables.h"
#include "functions.h"
#include "uiutils.h"
#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "spline.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "constants/songs.h"

void PutTmAnimFrame(u16 * tm, int x, int y, u16 tileref, int width, int height, u16 const * src, int arg_7)
{
    int ix, iy;

    u16 const * src_1 = src;

    int r4 = Div(0x20, width);
    int r6 = Div(arg_7, r4);
    int r0 = DivRem(arg_7, r4);

    src_1 = src_1 + (width * r0) + (r6 * height) * 32;

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (iy * 32)) + tileref;
            }
        }
    }
}
