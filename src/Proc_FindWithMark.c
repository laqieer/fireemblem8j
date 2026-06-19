#include "global.h"
#include "proc.h"
extern struct Proc sProcArray[];

#define MAX_PROC_COUNT 64

// unreferenced
ProcPtr Proc_FindWithMark(u32 mark)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script != NULL && proc->proc_mark == mark)
            return proc;
    }

    return NULL;
}
