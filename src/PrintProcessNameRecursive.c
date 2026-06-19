#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

void PrintProcessName(struct Proc* proc);


void PrintProcessNameRecursive(struct Proc* proc, int* indent)
{
    if (proc->proc_prev != NULL)
        PrintProcessNameRecursive(proc->proc_prev, indent);

    PrintProcessName(proc);

    if (proc->proc_child != NULL)
    {
        *indent += 2;
        PrintProcessNameRecursive(proc->proc_child, indent);
        *indent -= 2;
    }
}

