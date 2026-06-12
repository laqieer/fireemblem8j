#include "global.h"
#include "gbafe.h"

void EkrDK_IdleInBattle(struct ProcEkrDragon * proc)
{
    u16 attr1 = GetEkrDragonStatusAttr(proc->anim);
    u16 attr2 = GetEkrDragonStatusAttr(GetAnimAnotherSide(proc->anim));

    /* 1 << 2 seems to be the end of battle */
    if (attr2 != EKRDRGON_ATTR_START && attr1 & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;
        Proc_End(proc->fxproc);

        if (CheckEkrDragonDead(proc->anim) == false)
            /* Normal end banim */
            proc->fxproc = NewEkrDragonBodvBlack(proc->anim);
        else
            /* Demon King dead */
            proc->fxproc = NewEkrDragonTunk(proc->anim);

        Proc_Break(proc);
    }
}
