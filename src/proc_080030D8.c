#include "global.h"
#include "proc.h"

ProcPtr Proc_Start(const struct ProcCmd* script, ProcPtr parent);
ProcPtr Proc_StartBlocking(const struct ProcCmd *script, ProcPtr parent);

static s8 ProcCmd_SET_DESTRUCTOR(struct Proc *proc)
{
    Proc_SetEndCb(proc, proc->proc_scrCur->dataPtr);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NEW_CHILD(struct Proc* proc)
{
    Proc_Start(proc->proc_scrCur->dataPtr, proc);
    proc->proc_scrCur++;

    return TRUE;
}

static s8 ProcCmd_NEW_CHILD_BLOCKING(struct Proc* proc)
{
    Proc_StartBlocking(proc->proc_scrCur->dataPtr, proc);
    proc->proc_scrCur++;

    return FALSE;
}
