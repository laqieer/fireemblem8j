#include "global.h"
#include "proc.h"

void UpdateSleep(ProcPtr proc);

static s8 ProcCmd_SLEEP(struct Proc *proc)
{
    if (proc->proc_scrCur->dataImm != 0)
    {
        proc->proc_sleepTime = proc->proc_scrCur->dataImm;
        proc->proc_idleCb = UpdateSleep;
    }

    proc->proc_scrCur++;

    return FALSE;
}
