#include "global.h"
#include "proc.h"

enum
{
    PROC_FLAG_ENDED    = (1 << 0),
    PROC_FLAG_BLOCKING = (1 << 1),
    PROC_FLAG_UNK2     = (1 << 2),
    PROC_FLAG_STARTING = (1 << 3),
};

extern s8 (*sProcessCmdTable[])(struct Proc*);

void RunProcessScript(struct Proc* proc)
{
    if (proc->proc_script == NULL)
        return;

    if (proc->proc_lockCnt > 0)
        return;

    if (proc->proc_idleCb != NULL)
        return;

    while (sProcessCmdTable[proc->proc_scrCur->opcode](proc))
    {
        if (proc->proc_script == NULL)
            return;
    }
}
