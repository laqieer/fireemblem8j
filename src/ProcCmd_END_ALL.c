#include "global.h"
#include "proc.h"

static s8 ProcCmd_END_ALL(struct Proc *proc)
{
    Proc_EndEach(proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}
