#include "global.h"
#include "proc.h"

static s8 ProcCmd_NOP2(struct Proc *proc)
{
    proc->proc_scrCur++;
    return TRUE;
}
