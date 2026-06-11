#include "global.h"
#include "proc.h"

static s8 ProcCmd_CALL_ROUTINE(struct Proc *proc)
{
    ProcFunc func = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    func(proc);

    return TRUE;
}
