#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"




void EfxTeonoMain(struct ProcEfx * proc)
{
    struct Anim * animc = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        NewEfxTeonoOBJ(proc->anim);

        if (proc->timer == 1)
        {
            animc->state3 |= ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED;
            StartBattleAnimHitEffectsDefault(animc, proc->hitted);

            if (GetEfxHpChangeType(animc) != EFX_HPT_NOT_CHANGE)
            {
                if (CheckRoundCrit(proc->anim) == true)
                    NewEfxPierceCritical(animc);
                else if (proc->hitted != false)
                    return;
                else
                    NewEfxNormalEffect(proc->anim);
            }
            if (proc->hitted == false)
                EfxPlayHittedSFX(animc);

            return;
        }
    }

    if (proc->timer == 0x46)
    {
        return;
    }

    if (proc->timer == 0x50)
    {
        SpellFx_Finish();
        Proc_Break(proc);
        return;
    }
}
