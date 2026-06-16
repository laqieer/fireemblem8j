#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "efxbattle.h"

extern struct ProcCmd ProcScr_EkrDracoZombie[];

void NewEkrDragonDracoZombie(struct Anim * anim)
{
    struct EkrDragonStatus * ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon * proc = Proc_Start(ProcScr_EkrDracoZombie, PROC_TREE_3);
    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}
