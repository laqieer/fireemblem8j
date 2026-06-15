#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_Talk[];

void EndTalk(void)
{
    Proc_EndEach(gProcScr_Talk);
    return;
}
