#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void EkrDZ_SetDragonStatAttrEndBit(struct ProcEkrDragon * proc)
{
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);
    Proc_Break(proc);
}
