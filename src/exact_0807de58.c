#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

void MapAnim_DrawBarSegment(u16* buf1, int* buf2, int arg2, int arg3, int arg4)
{
    int r1;
    if (*buf2 > arg3)
        r1 = arg3;
    else
        r1 = *buf2;

    *buf1 = TILEREF(arg4 + r1, arg2);
    *buf2 += 1 - arg3;

    if (*buf2 < 0)
        *buf2 = 0;
}
