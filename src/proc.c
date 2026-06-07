
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

ProcPtr Proc_FindAfter(struct ProcCmd* script, struct Proc* proc)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_script == script)
            return proc;

        proc++;
    }

    return NULL;
}

struct Proc *Proc_FindAfterWithParent(struct Proc* proc, struct Proc* parent)
{
    if (proc == NULL)
        proc = sProcArray;
    else
        proc++;

    while (proc < sProcArray + MAX_PROC_COUNT)
    {
        if (proc->proc_parent == parent)
            return proc;

        proc++;
    }

    return NULL;
}

// unreferenced
static int CountFreeProcs(void)
{
    int i, result = MAX_PROC_COUNT;

    for (i = 0; i < MAX_PROC_COUNT; i++)
    {
        if (sProcArray[i].proc_script)
            result--;
    }

    return result;
}

int CountProcs(const struct ProcCmd* script)
{
    struct Proc* proc = sProcArray;
    int i, result = 0;

    for (i = 0; i < MAX_PROC_COUNT; i++, proc++)
    {
        if (script == NULL)
        {
            if (proc->proc_script != NULL)
                result++;
        }
        else
        {
            if (proc->proc_script == script)
                result++;
        }
    }

    return result;
}

void Proc_FindBegin(struct ProcFindIterator* it, const struct ProcCmd* script)
{
    it->proc = sProcArray;
    it->script = script;
    it->count = 0;
}

ProcPtr Proc_FindNext(struct ProcFindIterator* it)
{
    struct Proc* result = NULL;

    while (it->count < MAX_PROC_COUNT)
    {
        if (it->proc->proc_script == it->script)
            result = it->proc;

        it->count++;
        it->proc++;

        if (result)
            return result;
    }

    return NULL;
}
