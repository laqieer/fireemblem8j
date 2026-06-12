#include "global.h"
#include "proc.h"

void Proc_SetEndCb(ProcPtr proc, ProcFunc func)
{
    struct Proc* casted = (struct Proc*) proc;

    casted->proc_endCb = func;
}
