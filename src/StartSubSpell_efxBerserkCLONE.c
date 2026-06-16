#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd ProcScr_efxBerserkCLONE[];

void StartSubSpell_efxBerserkCLONE(struct Anim * anim, int terminator)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxBerserkCLONE, PROC_TREE_4);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = terminator;
    return;
}
