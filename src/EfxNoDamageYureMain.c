#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void EfxNoDamageYureMain(struct ProcEfxHpBar * proc)
{
    s16 off_this;
    struct Anim *anim1 = proc->anim_main_other;
    struct Anim *anim2 = proc->anim_main_this;

    if (gEfxNoDmgBgShakeOff[proc->timer] == -1)
    {
        if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
        {
            anim1->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_other)] - gEkrBgPosition;
            anim2->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_this)]  - gEkrBgPosition;
        }
        Proc_Break(proc);
    }
    else
    {
        if (GetAnimPosition(anim1) == 1)
            off_this = -gEfxNoDmgBgShakeOff[proc->timer];
        else
            off_this = gEfxNoDmgBgShakeOff[proc->timer];

        if (GetBanimDragonStatusType() == EKRDRGON_TYPE_NORMAL)
        {
            anim1->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_other)] - (s32)gEkrBgPosition + off_this;
            anim2->xPosition = gEkrXPosReal[GetAnimPosition(proc->anim_main_this)]  - (s32)gEkrBgPosition + off_this;
        }
        proc->timer++;
    }
}
