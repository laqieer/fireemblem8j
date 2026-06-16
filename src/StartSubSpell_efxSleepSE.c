#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxSleepSE[];

void StartSubSpell_efxSleepSE(struct Anim * anim)
{
    struct ProcEfx * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSleepSE, PROC_TREE_3);
    proc->anim = anim;
    return;
}
