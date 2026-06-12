
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

extern EWRAM_DATA struct Proc *gProcTreeRootArray[8];

 struct Proc* AllocateProcess(void);
 void FreeProcess(struct Proc *proc);
 void InsertRootProcess(struct Proc *proc, int rootIndex);
 void InsertChildProcess(struct Proc *proc, struct Proc *parent);
 void UnlinkProcess(struct Proc *proc);
 void RunProcessScript(struct Proc *proc);

void Proc_ForAll(ProcFunc func)
{
    int i;
    struct Proc* proc = sProcArray;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (proc->proc_script)
            func(proc);
    }
}
