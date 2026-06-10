#include "global.h"
#include "proc.h"

void ClearNativeCallback(ProcPtr proc);


void Proc_BreakEach(const struct ProcCmd* script)
{
    Proc_ForEach(script, ClearNativeCallback);
}
