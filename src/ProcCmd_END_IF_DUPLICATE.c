#include "global.h"
#include "proc.h"
/* TU-private data externs bound at their JP addresses */
extern struct Proc sProcArray[];

#define MAX_PROC_COUNT 64

void Proc_End(ProcPtr proc);

static s8 ProcCmd_END_IF_DUPLICATE(struct Proc *proc)
{
    int i;
    struct Proc *it = sProcArray;
    int count = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it->proc_script == proc->proc_script)
            count++;
    }

    if (count > 1)
    {
        Proc_End(proc);
        return FALSE;
    }

    proc->proc_scrCur++;

    return TRUE;
}
