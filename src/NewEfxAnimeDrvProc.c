#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern ProcPtr gpProcEfxAnimeDrv;
extern struct ProcCmd gProc_efxAnimeDrvProc[];

void NewEfxAnimeDrvProc(void)
{
    void ** ptr = (void **)&gpProcEfxAnimeDrv;
    *ptr = Proc_Start(gProc_efxAnimeDrvProc, PROC_TREE_4);
    AnimClearAll();
    return;
}
