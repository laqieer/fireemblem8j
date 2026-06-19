#include "global.h"
#include "proc.h"
extern struct Proc sProcArray[];

#define MAX_PROC_COUNT 64

// unreferenced
ProcPtr Proc_FindNonBlocked(struct ProcCmd* script)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script == script && proc->proc_lockCnt == 0)
            return proc;
    }

    return NULL;
}
