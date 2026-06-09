
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

EWRAM_DATA static struct Proc *sProcAllocList[MAX_PROC_COUNT + 1] = {0};
EWRAM_DATA static struct Proc **sProcAllocListHead = NULL; // pointer to next entry in sProcAllocList

EWRAM_DATA struct Proc *gProcTreeRootArray[8] = {0};

 struct Proc* AllocateProcess(void);
 void FreeProcess(struct Proc *proc);
 void InsertRootProcess(struct Proc *proc, int rootIndex);
 void InsertChildProcess(struct Proc *proc, struct Proc *parent);
 void UnlinkProcess(struct Proc *proc);
 void RunProcessScript(struct Proc *proc);

void Proc_Init(void)
{
    int i;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        struct Proc *proc = &sProcArray[i];

        proc->proc_script = NULL;
        proc->proc_scrCur = NULL;
        proc->proc_endCb = NULL;
        proc->proc_idleCb = NULL;
        proc->proc_name = NULL;
        proc->proc_parent = NULL;
        proc->proc_child = NULL;
        proc->proc_next = NULL;
        proc->proc_prev = NULL;
        proc->proc_sleepTime = 0;
        proc->proc_mark = 0;
        proc->proc_flags = 0;
        proc->proc_lockCnt = 0;

        sProcAllocList[i] = proc;
    }

    sProcAllocList[MAX_PROC_COUNT] = NULL;
    sProcAllocListHead = sProcAllocList;

    for (i = 0; i < 8; i++)
        ROOT_PROC(i) = NULL;
}
