#include "global.h"
#include "proc.h"


void Proc_End(ProcPtr proc);

void Delete(ProcPtr proc)
{
    Proc_End(proc);
}
