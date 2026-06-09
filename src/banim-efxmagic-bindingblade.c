#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd ProcScr_efxHurtmut[];

//! FE8U = 0x0805CEC8
void StartSpellAnimBindingBlade(struct Anim * anim)
{
    struct ProcEfx * proc;

    SpellFx_Begin();
    SpellFx_ClearBG1Position();

    proc = Proc_Start(ProcScr_efxHurtmut, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->hitted = CheckRoundMiss(GetAnimRoundTypeAnotherSide(anim));

    return;
}

//! FE8U = 0x0805CF04
void efxHurtmut_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxArrowOBJ(proc->anim);
        PlaySFX(0xCC, 0x100, proc->anim->xPosition, 1);
    }

    if (proc->timer == 1)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (GetEfxHpChangeType(anim) != 2)
        {
            if (CheckRoundCrit(proc->anim) == 1)
            {
                NewEfxPierceCritical(anim);
            }
            else
            {
                if (proc->hitted)
                {
                    return;
                }

                NewEfxNormalEffect(proc->anim);
            }
        }

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 9)
    {
        return;
    }
    else if (proc->timer == duration + 10)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
