#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd gProcScr_efxThunderstormOBJ[];

void StartSubSpell_efxThunderstormOBJ(struct Anim * anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(gProcScr_efxThunderstormOBJ, PROC_TREE_3);
    proc->anim = anim;
    return;
}
