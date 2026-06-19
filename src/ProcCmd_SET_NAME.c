#include "global.h"
#include "proc.h"

static s8 ProcCmd_SET_NAME(struct Proc *proc)
{
    proc->proc_name = proc->proc_scrCur->dataPtr;
    proc->proc_scrCur++;

    return TRUE;
}
