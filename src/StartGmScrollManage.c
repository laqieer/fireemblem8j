#include "global.h"
#include "spline.h"
#include "worldmap.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_GmScrollManage[];

// clang-format on

//! FE8U = 0x080BF370
ProcPtr StartGmScrollManage(struct GmScrollInfo * input, ProcPtr parent)
{
    u16 _src;

    struct GMapScrollManageProc * proc = Proc_Start(ProcScr_GmScrollManage, parent);

    if ((input->xsrc < 0) || (input->ysrc < 0))
    {
        input->xsrc = gGMData.xCamera;
        input->ysrc = gGMData.yCamera;
    }

    _src = input->xsrc;
    proc->xsrc = _src;
    proc->ysrc = input->ysrc;

    gGMData.xCamera = _src;
    gGMData.yCamera = proc->ysrc;

    if (input->xdst < 0)
        proc->xdst = _src;
    else
        proc->xdst = input->xdst;

    proc->ydst = input->ydst;
    proc->move_type = input->move_type;
    proc->duration = input->duration << 0xc;
    proc->delay = input->delay;

    proc->wm_flag = input->flags;

    if (proc->wm_flag != 0)
    {
        *proc->wm_flag &= ~input->lock;
        proc->lock = input->lock;
    }
    return proc;
}
