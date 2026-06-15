#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_Minimap[];

void StartMinimapPrepPhase(ProcPtr proc)
{
    Proc_StartBlocking(gProcScr_Minimap, proc);
    return;
}
