#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_ApProc[];

void APProc_DeleteAll(void)
{
    Proc_EndEach(ProcScr_ApProc);
}
