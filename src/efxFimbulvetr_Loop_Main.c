#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"

//! FE8U = 0x0805E120
void efxFimbulvetr_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxFimbulvetrBGTR(anim);
        StartSubSpell_efxFimbulvetrOBJ2(anim);
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 16, 0, 16, 0);
        PlaySFX(0x122, 0x100, anim->xPosition, 1);
    }

    if (proc->timer == duration + 82)
    {
        NewEfxFlashBgWhite(proc->anim, 4);
    }
    else if (proc->timer == duration + 85)
    {
        StartSubSpell_efxFimbulvetrBG(anim);
        StartSubSpell_efxFimbulvetrOBJ(anim);
        NewEfxALPHA(anim, 24, 16, 16, 0, 0);
        PlaySFX(0x123, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 88)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if ((proc->timer != duration + 136) && (proc->timer == duration + 161))
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
