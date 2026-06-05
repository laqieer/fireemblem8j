

#include "global.h"
#include "spline.h"
#include "worldmap.h"

void GmMoveCursor_OnEnd(struct GMapMoveCursorProc * proc)
{
    gGMData.ix = proc->xdst;
    gGMData.iy = proc->ydst;
}
