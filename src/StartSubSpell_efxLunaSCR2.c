#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxLunaSCR2[];

void StartSubSpell_efxLunaSCR2(ProcPtr proc)
{
    struct ProcEfxSCR * otherProc = Proc_Start(ProcScr_efxLunaSCR2, PROC_TREE_3);
    otherProc->timer = 0;
    otherProc->unk2E = 20;
    otherProc->unk5C = proc;
    return;
}
