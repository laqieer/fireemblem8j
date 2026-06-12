#include "global.h"
#include "spline.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmMoveCursor[];

ProcPtr StartGmMoveCursor(struct Vec2 * src, struct Vec2 * dst, int duration, int move_type, ProcPtr parent)
{
    struct GMapMoveCursorProc * proc;

    if (parent)
        proc = Proc_Start(ProcScr_GmMoveCursor, parent);
    else
        proc = Proc_Start(ProcScr_GmMoveCursor, PROC_TREE_3);

    if (src == NULL)
    {
        proc->xsrc = gGMData.ix;
        proc->ysrc = gGMData.iy;
    }
    else
    {
        proc->xsrc = src->x << 8;
        proc->ysrc = src->y << 8;
    }

    if (dst == NULL)
    {
        proc->xdst = 0;
        proc->ydst = 0;
    }
    else
    {
        proc->xdst = dst->x << 8;
        proc->ydst = dst->y << 8;
    }

    proc->xmove = proc->xdst - proc->xsrc;
    proc->ymove = proc->ydst - proc->ysrc;

    proc->duration = duration;
    proc->move_type = move_type;

    return proc;
}
