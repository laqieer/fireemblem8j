#include "global.h"
#include "proc.h"

static s8 ProcCmd_GOTO(struct Proc *proc)
{
    Proc_Goto(proc, proc->proc_scrCur->dataImm);

    return TRUE;
}
