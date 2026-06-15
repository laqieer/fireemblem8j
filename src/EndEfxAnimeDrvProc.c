#include "global.h"
#include "proc.h"

extern ProcPtr gpProcEfxAnimeDrv;

void EndEfxAnimeDrvProc(void)
{
    Proc_End(gpProcEfxAnimeDrv);
    return;
}
