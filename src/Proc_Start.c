#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

struct Proc * AllocateProcess(void);
void InsertRootProcess(struct Proc *proc, s32 rootIndex);
void InsertChildProcess(struct Proc *proc, struct Proc *parent);
void RunProcessScript(struct Proc* proc);

ProcPtr Proc_Start(const struct ProcCmd* script, ProcPtr parent)
{
    struct Proc* proc = AllocateProcess();

    proc->proc_script = script;
    proc->proc_scrCur = script;
    proc->proc_endCb = NULL;
    proc->proc_idleCb = NULL;
    proc->proc_parent = NULL;
    proc->proc_child = NULL;
    proc->proc_next = NULL;
    proc->proc_prev = NULL;
    proc->proc_sleepTime = 0;
    proc->proc_mark = 0;
    proc->proc_lockCnt = 0;

    proc->proc_flags = PROC_FLAG_STARTING;

    if ((int) parent < 8) // If this is an integer less than 8, then add a root proc
        InsertRootProcess(proc, (int) parent);
    else
        InsertChildProcess(proc, parent);

    RunProcessScript(proc);

    proc->proc_flags &= ~PROC_FLAG_STARTING;

    return proc;
}
