#include "global.h"
#include "proc.h"

//! FE8U = 0x08002D18
void InsertChildProcess(struct Proc *proc, struct Proc *parent)
{
    if (parent->proc_child != NULL)  // parent already has a child
    {
        // add this process as a sibling
        ((struct Proc*) parent->proc_child)->proc_next = proc;
        proc->proc_prev = parent->proc_child;
    }
    parent->proc_child = proc;
    proc->proc_parent = parent;
}
