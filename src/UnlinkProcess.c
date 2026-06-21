#include "global.h"
#include "proc.h"

//! FE8U = 0x08002D30
void UnlinkProcess(struct Proc *proc)
{
    int rootIndex;

    if (proc->proc_next != NULL)
        ((struct Proc*) proc->proc_next)->proc_prev = proc->proc_prev;
    if (proc->proc_prev != NULL)
        ((struct Proc*) proc->proc_prev)->proc_next = proc->proc_next;

    rootIndex = (int) proc->proc_parent;
    if (rootIndex > 8)  // child proc
    {
        if (((struct Proc*) proc->proc_parent)->proc_child == proc)
            ((struct Proc*) proc->proc_parent)->proc_child = proc->proc_prev;
    }
    else  // root proc
    {
        if (ROOT_PROC(rootIndex) == proc)
            ROOT_PROC(rootIndex) = proc->proc_prev;
    }
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
}
