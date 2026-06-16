#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void StartSubSpell_efxThunderstormCOLOR(struct Anim * anim)
{
    struct ProcEfxBGCOL * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(gProcScr_efxThunderstormCOLOR, PROC_TREE_3);
    proc->anim = anim;
    return;
}
