#include "global.h"
#include "ctc.h"
#include "proc.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "bmlib.h"
#include "gamecontrol.h"
#include "sysutil.h"
#include "opanim.h"

//! FE8U = 0x080CA9F8
int OpAnimCalcObjSlideIn(int a, int b, int c, int d)
{
    int val = 0x10 - (d - c);

    if (val < 0)
    {
        return 0xffff;
    }

    if (val >= 0x10)
    {
        return a;
    }

    return Interpolate(INTERPOLATE_RSQUARE, a + b * DISPLAY_WIDTH, a, val, 0x10);
}
