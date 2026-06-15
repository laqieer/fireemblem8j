#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_Minimap[];

void StartMinimapPlayerPhase(void)
{
    Proc_Start(gProcScr_Minimap, PROC_TREE_3);
    return;
}
