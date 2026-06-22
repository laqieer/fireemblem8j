#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

void sub_805E0C0(struct Anim * anim);

//! JP 0x0805E004 - US-shape efxHurtmut_Loop_Main (name efxHurtmut_Loop_Main already used at JP 0x05D000)
void sub_805E004(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        PlaySFX(0x10D, 0x100, anim->xPosition, 1);
        sub_805E0C0(anim);

        NewEfxFlashBgWhite(proc->anim, 6);

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 28)
    {
        NewEfxALPHA(anim, 0, 14, 16, 0, 0);
    }
    else if (proc->timer == duration + 50)
    {
        return;
    }
    else if (proc->timer == duration + 55)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
