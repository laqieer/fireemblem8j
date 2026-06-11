#include "global.h"
#include "proc.h"

static s8 ProcCmd_JUMP(struct Proc *proc)
{
    Proc_GotoScript(proc, proc->proc_scrCur->dataPtr);

    return TRUE;
}
