#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "ekrdragon.h"
#include "efxbattle.h"

extern struct ProcCmd ProcScr_EkrMyrrh[];

void NewEkrDragonManakete(struct Anim * anim)
{
    struct EkrDragonStatus * ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon * proc = Proc_Start(ProcScr_EkrMyrrh, PROC_TREE_3);
    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
}
