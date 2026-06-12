#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x080634BC
void efxShine_Loop_Main(struct ProcEfx * proc)
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
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 11)
    {
        StartSubSpell_efxShineBG2(anim);
        PlaySFX(0x2BC, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 23)
    {
        NewEfxFlashBgWhite(anim, 5);
        StartSubSpell_efxShineOBJRND(anim);
    }
    else if (proc->timer == duration + 29)
    {
        StartSubSpell_efxShineBG(anim);
        StartSubSpell_efxShineBGCOL(anim);
    }
    else if (proc->timer == duration + 30)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 35)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
