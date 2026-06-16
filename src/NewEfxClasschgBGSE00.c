#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

extern struct ProcCmd ProcScr_efxClasschgBGSE00[];

void NewEfxClasschgBGSE00(struct Anim * anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxClasschgBGSE00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}
