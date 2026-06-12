#include "global.h"
#include "proc.h"

static s8 ProcCmd_CALL_ROUTINE_2(struct Proc *proc)
{
    s8(*func)(ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    return func(proc);
}
