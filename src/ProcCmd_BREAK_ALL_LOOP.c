#include "global.h"
#include "proc.h"

static s8 ProcCmd_BREAK_ALL_LOOP(struct Proc *proc)
{
    Proc_BreakEach(proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}
