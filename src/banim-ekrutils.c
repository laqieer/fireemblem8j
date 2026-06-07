#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "bmunit.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ctc.h"
#include "constants/video-banim.h"

int Get0201FAC8(void)
{
    return gEkrbattle_7;
}

void Set0201FAC8(int a)
{
    gEkrbattle_7 = a;
}

void NewEfxspdquake(struct Anim *anim)
{
    struct ProcEfxSpdQuake *proc;
    proc = Proc_Start(ProcScr_efxSPDQuake, PROC_TREE_1);
    proc->anim = anim;
    proc->timer = 0;
    proc->vecs = gEfxQuakeVecs;
}
