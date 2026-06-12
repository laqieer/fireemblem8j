#include "global.h"
#include "gbafe.h"

void EkrDZ_TriggerPreparedFlag(struct ProcEkrDragon * proc)
{
    if (GetEkrDragonStatusAttr(GetAnimAnotherSide(proc->anim)) != EKRDRGON_ATTR_START) {
        AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
        Proc_Break(proc);
    }
}
