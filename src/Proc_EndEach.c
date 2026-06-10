#include "global.h"
#include "proc.h"

void Delete(ProcPtr proc);


void Proc_EndEach(const struct ProcCmd* script)
{
    Proc_ForEach(script, Delete);
}
