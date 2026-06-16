#include "global.h"
#include "bmlib.h"

void CallDelayed(void (* func)(void), int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayed, PROC_TREE_3);

    proc->func = func;
    proc->clock = delay;
}
