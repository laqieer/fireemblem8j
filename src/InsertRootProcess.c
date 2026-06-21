#include "global.h"
#include "proc.h"

//! FE8U = 0x08002CF4
void InsertRootProcess(struct Proc *proc, s32 rootIndex)
{
    struct Proc* root = ROOT_PROC(rootIndex);

    if (root) // root process already exists
    {
        // add this process as a sibling
        root->proc_next = proc;
        proc->proc_prev = root;
    }

    proc->proc_parent = (ProcPtr) rootIndex;
    ROOT_PROC(rootIndex) = proc;
}
