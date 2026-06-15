#include "global.h"
#include "proc.h"

extern struct ProcCmd sProcScr_DisplayDungeonRecord_FromMenu[];

void StartDungeonRecordProcFromMenu(ProcPtr proc)
{
    Proc_StartBlocking(sProcScr_DisplayDungeonRecord_FromMenu, proc);
    return;
}
