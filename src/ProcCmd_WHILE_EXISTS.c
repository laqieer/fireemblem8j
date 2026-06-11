#include "global.h"
#include "proc.h"

static s8 ProcCmd_WHILE_EXISTS(struct Proc *proc)
{
    s8 exists = (Proc_Find(proc->proc_scrCur->dataPtr) != NULL);

    if (exists)
        return FALSE;

    proc->proc_scrCur++;

    return TRUE;
}
