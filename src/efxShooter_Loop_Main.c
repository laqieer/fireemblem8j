#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"

//! FE8U = 0x0805CD5C
void efxShooter_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 2)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
        return;
    }
    else
    {
        int timer = proc->timer;

        if (timer == 34)
        {
            PlaySFX(0x137, 0x100, proc->anim->xPosition, 1);
        }
        else if (timer == 42)
        {
            StartSubSpell_efxShooterOBJ(anim);
        }
        else if (timer == 45)
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
        else if (timer == 62)
        {
            return;
        }
        else if (timer == 64)
        {
            SpellFx_Finish();
            Proc_Break(proc);
        }
    }

    return;
}
