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

#define _SWAP(a, b) \
do {                \
    tmp = a;        \
    a = b;          \
    b = tmp;        \
} while (0)

void RasterizeWindowEdge(s16 *buf, int x1, int y1, int x2, int y2)
{
    int val1, val2;
    int tmp;

    if (y1 > y2) {
        _SWAP(x2, x1);
        _SWAP(y2, y1);
    }

    val1 = ((x2 - x1) << 0x10) / (y2 - y1);
    val2 = x1 << 0x10;

    if (y2 > DISPLAY_HEIGHT)
        y2 = DISPLAY_HEIGHT;

    if (y1 < 0) {
        val2 += val1 * -y1;
        y1 = 0;
    }

    for (; y1 < y2; y1++) {
#ifndef NONMATCHING
        register int val asm("r3") = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
        asm(""::"r"(buf + 2 * y1));
#else
        int val = val2 >> 0x10;
        LIMIT_AREA(val, 0, 240);

        if (buf[2 * y1 + 0] > val)
            buf[2 * y1 + 0] = val;

        if (buf[2 * y1 + 1] < val)
            buf[2 * y1 + 1] = val;
#endif

        val2 += val1;
    }
}
