#include "global.h"
#include "proc.h"

void RunProcessRecursive(struct Proc* proc);


void Proc_Run(ProcPtr proc)
{
    if (proc)
        RunProcessRecursive(proc);
}
