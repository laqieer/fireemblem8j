#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void NewEfxALPHA(struct Anim * anim, int a, int b, int c, int d, int e)
{
    struct ProcEfxALPHA * proc;

    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxALPHA, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = a;
    proc->unk30 = a + b;
    proc->unk44 = c;
    proc->unk48 = d;
    proc->unk4C = e;
}
