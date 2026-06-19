#include "global.h"
#include "proc.h"

static s8 ProcCmd_LOOP_ROUTINE(struct Proc *proc)
{
    proc->proc_idleCb = proc->proc_scrCur->dataPtr;
    proc->proc_scrCur++;

    return FALSE;
}
