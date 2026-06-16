#include "global.h"
#include "bm.h"

extern struct ProcCmd ProcScr_PartialGameLock[];

void StartPartialGameLock(ProcPtr proc)
{
    struct Proc * gproc;
    gproc = Proc_StartBlocking(ProcScr_PartialGameLock, proc);
    gproc->unk64 = GetGameLock();
}
