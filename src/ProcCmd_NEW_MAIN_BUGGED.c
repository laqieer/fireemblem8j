#include "global.h"
#include "proc.h"

ProcPtr Proc_Start(const struct ProcCmd* script, ProcPtr parent);

static s8 ProcCmd_NEW_MAIN_BUGGED(struct Proc *proc)
{
    Proc_Start(proc->proc_scrCur->dataPtr, (struct Proc *)(u32) proc->proc_sleepTime);  // Why are we using sleepTime here?
    proc->proc_scrCur++;

    return TRUE;
}
