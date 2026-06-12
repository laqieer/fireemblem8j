#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805E790
void efxThunderstorm_Loop_Main(struct ProcEfx * proc)
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
        PlaySFX(0x119, 0x100, anim->xPosition, 1);
        StartSubSpell_efxThunderstormBG(anim);
        StartSubSpell_efxThunderstormCOLOR(anim);
    }

    if (proc->timer == duration + 89)
    {
        StartSubSpell_efxThunderstormDARK(anim, 2, 3);
    }

    if (proc->timer == duration + 94)
    {
        StartSubSpell_efxThunderstormOBJ(anim);
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 195) && (proc->timer == duration + 200))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
