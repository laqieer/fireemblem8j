#include "global.h"
#include "spline.h"
#include "worldmap.h"

//! FE8U = 0x080C41F0
void StartGmScroll(s16 xStart, s16 yStart, s16 xEnd, s16 yEnd, s16 speed, s16 delay)
{
    struct GmScrollInfo info;
    int xs = xStart;
    int ys = yStart;
    int xe = xEnd;
    int ye = yEnd;
    int sp = speed;
    int dl = delay;

    struct WorldMapMainProc * worldMapProc = GM_MAIN;
    info.flags = &worldMapProc->scrolling;

    info.lock = 1;
    info.move_type = 1;
    info.xsrc = xs;
    info.ysrc = ys;
    info.xdst = xe;
    info.ydst = ye;
    info.duration = sp;
    info.delay = dl;

    StartGmScrollManage(&info, worldMapProc);

    GM_CURSOR->unk_32--;
}
