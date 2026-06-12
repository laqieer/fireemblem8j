#include "global.h"
#include "spline.h"
#include "worldmap.h"

void GmScrollManage_OnLoop(struct GMapScrollManageProc * proc)
{
    if (proc->delay > 0)
    {
        proc->delay--;
        return;
    }

    if (*proc->wm_flag & proc->lock)
        proc->timer = proc->duration;
    else
        proc->timer += 0x1000;

    if (proc->timer < proc->duration)
    {
        int coeff = _DivArm2(proc->timer, proc->duration, proc->move_type);
        int x = proc->xsrc + DivArm(0x1000, (proc->xdst - proc->xsrc) * coeff);
        int y = proc->ysrc + DivArm(0x1000, (proc->ydst - proc->ysrc) * coeff);

        gGMData.xCamera = x;
        gGMData.yCamera = y;
    }
    else
        Proc_Break(proc);
}
