#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrtriangle.h"

extern struct ProcCmd ProcScr_EkrTriArmorKnight[];

ProcPtr NewEkrTriArmorKnight(struct Anim * anim, u32 ekr1, u32 ekr2, u32 banim1, u32 ewtype2)
{
    struct ProcEkrTriClass * proc;
    proc = Proc_Start(ProcScr_EkrTriArmorKnight, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->etype1 = ekr1;
    proc->etype2 = ekr2;
    proc->ewtype1 = banim1;
    proc->ewtype2 = ewtype2;
    return proc;
}
