#include "global.h"
#include "proc.h"

// unreferenced
static void Proc_Nop_0(void)
{
}

void Proc_SetRepeatCb(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_idleCb = func;
}
