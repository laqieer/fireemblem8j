#include "global.h"
#include "proc.h"

void Proc_End(ProcPtr proc);

static void ForAllFollowingProcs(struct Proc* proc, ProcFunc func)
{
    if (proc->proc_prev)
        ForAllFollowingProcs(proc->proc_prev, func);

    func(proc);

    if (proc->proc_child)
        ForAllFollowingProcs(proc->proc_child, func);
}

// unreferenced
static void Proc_ForEachInTree(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    func(casted);

    if (casted->proc_child)
        ForAllFollowingProcs(casted->proc_child, func);
}

static s8 ProcCmd_DELETE(struct Proc *proc)
{
    Proc_End(proc);

    return FALSE;
}
