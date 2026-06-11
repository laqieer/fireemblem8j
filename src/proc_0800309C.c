#include "global.h"
#include "proc.h"

static s8 ProcCmd_WHILE_ROUTINE(struct Proc *proc)
{
    s8(*func)(ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;

    if (func(proc) == TRUE)
    {
        proc->proc_scrCur--;
        return FALSE;
    }

    return TRUE;
}
