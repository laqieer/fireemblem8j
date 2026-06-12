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

void PutTmAnimFrameFromTsa(u16 * tm, int x, int y, u16 tileref, int width, int height, u8 const * src, int arg_7)
{
    int ix, iy;
    int r0, r5;

    u16 const * src_1 = (u16 const *) src;

    u16 r9 = *src + 1;

    src_1 = src_1 + 1;

    r5 = Div(r9, width);
    r0 = Div(arg_7, r5);

    src_1 = src_1 + width * (arg_7 - r5 * r0) + ((r0 * height) * 0x20);

    for (iy = 0; iy < height; ++iy)
    {
        for (ix = 0; ix < width; ++ix)
        {
            if ((x+ix >= 0 && x+ix < 0x20) && (y+iy >= 0 && y+iy < 0x20))
            {
                *(tm + (x + ix) + ((y + iy) * 32)) = *(src_1 + ix + (r9 * (height - iy - 1))) + tileref;
            }
        }
    }
}
