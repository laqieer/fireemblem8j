#include "global.h"
#include "gbafe.h"

void NewEkrDragonDemonKing(struct Anim * anim)
{
    struct EkrDragonStatus *ekrsp = GetEkrDragonStatus(anim);
    struct ProcEkrDragon * proc = Proc_Start(ProcScr_EkrDK, PROC_TREE_3);

    ekrsp->proc = proc;
    AddEkrDragonStatusAttr(anim, EKRDRGON_ATTR_START);
    ekrsp->anim = anim;
    proc->anim = anim;
    proc->timer = 0;
    gEkrXQuakeOff = 0;
    gEkrYQuakeOff = 0;
    EkrDemonkingObj_SetBgOffset(0, 0);
    PlaySFX(0x380, 0x100, 0x78, 0);
}
