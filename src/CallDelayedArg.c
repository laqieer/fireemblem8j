#include "global.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_CallDelayedArg[];

void CallDelayedArg(void (* func)(int), int arg, int delay)
{
    struct CallDelayedProc * proc = Proc_Start(ProcScr_CallDelayedArg, PROC_TREE_3);
    proc->func = func;
    proc->arg = arg;
    proc->clock = delay;
}
