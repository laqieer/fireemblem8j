#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};


void RunProcessScript(struct Proc* proc);
void RunProcessRecursive(struct Proc* proc)
{
    // Run previous sibling process
    if (proc->proc_prev != NULL)
        RunProcessRecursive(proc->proc_prev);
    // Run this process
    if (proc->proc_lockCnt == 0 && !(proc->proc_flags & PROC_FLAG_STARTING))
    {
        if (proc->proc_idleCb == NULL)
            RunProcessScript(proc);
        if (proc->proc_idleCb != NULL)
            proc->proc_idleCb(proc);
        if (proc->proc_flags & PROC_FLAG_ENDED)
            return;
    }
    // Run child process
    if (proc->proc_child != NULL)
        RunProcessRecursive(proc->proc_child);
}
