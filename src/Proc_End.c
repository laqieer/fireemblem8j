#include "global.h"
#include "proc.h"

void UnlinkProcess(struct Proc *proc);
void DeleteProcessRecursive(struct Proc *proc);

//! FE8U = 0x08002D78
void Proc_End(ProcPtr proc)
{
    struct Proc* casted = (struct Proc*) proc;

    if (proc != NULL)
    {
        UnlinkProcess(casted);
        DeleteProcessRecursive(casted);
    }
}
