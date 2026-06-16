#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxExcaliburSCR2[];

void StartSubSpell_efxExcaliburSCR2(struct ProcEfx * proc, int b)
{
    struct ProcEfxSCR * childProc = Proc_Start(ProcScr_efxExcaliburSCR2, PROC_TREE_3);
    childProc->timer = 0;
    childProc->unk2E = b;
    childProc->unk5C = proc;
    return;
}
