#include "global.h"

#include "ap.h"
#include "ctc.h"
#include "hardware.h"
#include "eventinfo.h"

#include "worldmap.h"

//! FE8U = 0x080C0574
s8 GmapScreen2_GetNodeScreenPos(struct GmScreenProc * proc, s16 xIn, s16 yIn, s16 * xOut, s16 * yOut)
{
    s16 x;
    s16 y;
    int xi = xIn;
    int yi = yIn;

    *&x = proc->x;
    *&y = proc->y;

    *xOut = xi - x;
    *yOut = yi - y;

    if ((*yOut >= -0x20 && *yOut < 0xC0) && (*xOut >= -0x20 && *xOut < 0x110))
    {
        return 1;
    }

    return 0;
}
