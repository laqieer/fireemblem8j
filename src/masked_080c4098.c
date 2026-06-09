#include "global.h"
#include "spline.h"
#include "worldmap.h"

void GmScrollManage_OnEnd(struct GMapScrollManageProc * proc)
{
    gGMData.xCamera = proc->xdst;
    gGMData.yCamera = proc->ydst;

    if (proc->wm_flag)
        *proc->wm_flag |= proc->lock;
}
