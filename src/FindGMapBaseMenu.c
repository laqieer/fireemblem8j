#include "global.h"
#include "proc.h"

extern struct ProcCmd ProcScr_GmapBaseMenu[];

ProcPtr FindGMapBaseMenu(void)
{
    return Proc_Find(ProcScr_GmapBaseMenu);
}
