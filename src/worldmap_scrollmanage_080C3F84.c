#include "global.h"
#include "spline.h"
#include "worldmap.h"

void GmMoveCursor_OnLoop(struct GMapMoveCursorProc * proc)
{
    proc->timer++;

    if (proc->timer < proc->duration)
    {
        int coeff = _DivArm1(proc->timer, proc->duration, proc->move_type);
        int x = proc->xsrc + DivArm(0x1000, proc->xmove * coeff);
        int y = proc->ysrc + DivArm(0x1000, proc->ymove * coeff);

        gGMData.ix = x;
        gGMData.iy = y;
    }
    else
    {
        gGMData.ix = proc->xdst;
        gGMData.iy = proc->ydst;
        Proc_End(proc);
    }
}
