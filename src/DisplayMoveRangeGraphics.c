#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "playerphase.h"

extern struct ProcCmd sProcScr_MoveLimitView[];

void DisplayMoveRangeGraphics(int flags)
{
    struct MoveLimitViewProc * proc = Proc_Find(sProcScr_MoveLimitView);

    if (proc)
    {
        MoveLimitView_OnInit(proc);
        MoveLimitViewChange_OnInit(NULL);

        return;
    }

    proc = Proc_Start(sProcScr_MoveLimitView, PROC_TREE_4);
    proc->flags = flags;

    return;
}
