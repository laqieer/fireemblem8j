
#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

#define MAX_PROC_COUNT 64

EWRAM_DATA static struct Proc sProcArray[MAX_PROC_COUNT] = {0}; 

EWRAM_DATA static struct Proc *sProcAllocList[MAX_PROC_COUNT + 1] = {0}; // pointer to next entry in sProcAllocList



 struct Proc* AllocateProcess(void);
 void FreeProcess(struct Proc *proc);
 void InsertRootProcess(struct Proc *proc, int rootIndex);
 void InsertChildProcess(struct Proc *proc, struct Proc *parent);
 void UnlinkProcess(struct Proc *proc);
 void RunProcessScript(struct Proc *proc);

/* prototypes for same-file helpers called by this run */
void Proc_End(ProcPtr proc);

static s8 ProcCmd_END_DUPLICATES(struct Proc *proc)
{
    int i;
    struct Proc* it = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, it++)
    {
        if (it != proc && it->proc_script == proc->proc_script)
        {
            Proc_End(it);
            break;
        }
    }

    proc->proc_scrCur++;

    return TRUE;
}
