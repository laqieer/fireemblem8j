#include "global.h"
#include "proc.h"

extern struct ProcCmd gProcScr_ArenaUiResults[];

void StartArenaResultsScreen(void)
{
    Proc_Start(gProcScr_ArenaUiResults, PROC_TREE_3);
    return;
}
