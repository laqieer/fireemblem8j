#include "global.h"
#include "proc.h"

static void UpdateSleep(ProcPtr proc)
{
    ((struct Proc*) proc)->proc_sleepTime--;

    if (((struct Proc*) proc)->proc_sleepTime == 0)
        Proc_Break(proc);
}
