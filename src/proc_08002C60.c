extern int FreeProcess();
#include "global.h"
#include "proc.h"
/* TU-private data externs bound at their JP addresses */
enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

static void DeleteProcessRecursive(struct Proc *proc)
{
    if (proc->proc_prev)
        DeleteProcessRecursive(proc->proc_prev);

    if (proc->proc_child)
        DeleteProcessRecursive(proc->proc_child);

    if (proc->proc_flags & PROC_FLAG_ENDED)
        return;

    if (proc->proc_endCb)
        proc->proc_endCb(proc);

    FreeProcess(proc);

    proc->proc_script = NULL;
    proc->proc_idleCb = NULL;
    proc->proc_flags |= PROC_FLAG_ENDED;

    if (proc->proc_flags & PROC_FLAG_BLOCKING)
        ((struct Proc*) proc->proc_parent)->proc_lockCnt--;
}
