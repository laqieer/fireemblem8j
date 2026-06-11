#include "global.h"
#include "proc.h"

static s8 ProcCmd_SET_MARK(struct Proc *proc)
{
    proc->proc_mark = proc->proc_scrCur->dataImm;
    proc->proc_scrCur++;

    return TRUE;
}
