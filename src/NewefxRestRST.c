#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

ProcPtr NewefxRestRST(struct Anim *anim, int unk44, int unk48, int frame, int speed)
{
    struct ProcEfx *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxRestRST, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0,
    proc->step = 0;
    proc->unk44 = unk44;
    proc->unk48 = unk48;
    proc->frame = frame;
    proc->speed = speed;

    return proc;
}
