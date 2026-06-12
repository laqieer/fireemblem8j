#include "global.h"
#include "gbafe.h"

void EkrDZ_IdleInBattle(struct ProcEkrDragon * proc)
{
    u16 attr = GetEkrDragonStatusAttr(proc->anim);
    if (attr & EKRDRGON_ATTR_BANIMFINISH) {
        proc->timer = 0;

        if (CheckEkrDragonSkipTransfer(proc->anim) == false) {
            SetAnimStateHidden(GetAnimPosition(proc->anim));
            EfxDracoZombiePrepareTSA(0, 0, 1);
        }

        Proc_Break(proc);
    }
}
