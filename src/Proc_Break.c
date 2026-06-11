#include "global.h"
#include "proc.h"

void Proc_Break(ProcPtr proc)
{
    struct Proc* casted = (struct Proc*) proc;
    casted->proc_idleCb = NULL;
}
