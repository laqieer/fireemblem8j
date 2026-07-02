#include "global.h"
#include "proc.h"

//! FE8U = 0x08003130
s8 ProcCmd_CALL_ROUTINE_ARG(struct Proc *proc)
{
    short arg = proc->proc_scrCur->dataImm;
    s8(*func)(short, ProcPtr) = proc->proc_scrCur->dataPtr;

    proc->proc_scrCur++;
    return func(arg, proc);
}
