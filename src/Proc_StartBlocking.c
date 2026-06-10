#include "global.h"
#include "proc.h"

enum {
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

ProcPtr Proc_Start(const struct ProcCmd* script, ProcPtr parent);

// Creates a child process and puts the parent into a wait state
ProcPtr Proc_StartBlocking(const struct ProcCmd *script, ProcPtr parent)
{
    struct Proc *proc = Proc_Start(script, parent);

    if (proc->proc_script == NULL)
        return NULL;

    proc->proc_flags |= PROC_FLAG_BLOCKING;
    ((struct Proc*) proc->proc_parent)->proc_lockCnt++;

    return proc;
}
