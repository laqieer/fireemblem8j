#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x08064344
void efxExcalibur_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 1)
    {
        NewEfxALPHA(anim, 0, 20, 0, 16, 0);
        StartSubSpell_efxExcaliburBG0(anim);
        PlaySFX(0x3B5, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 41)
    {
        NewEfxALPHA(anim, 0, 20, 16, 0, 0);
    }
    else if (proc->timer == duration + 63)
    {
        StartSubSpell_efxExcaliburSCR(15);
        NewEfxRestWINH_(anim, 15, 1);
    }
    else if (proc->timer == duration + 64)
    {
        StartSubSpell_efxExcaliburBG(anim);
        StartSubSpell_efxExcaliburBGCOL(anim);
        PlaySFX(0x2BF, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 108)
    {
        PlaySFX(0x2c0, 0x100, proc->anim->xPosition, 1);
    }

    if (!proc->hitted)
    {
        if (proc->timer == duration + 113)
        {
            StartSubSpell_efxExcaliburOBJ(anim);
            StartSubSpell_efxExcaliburBG2(anim);
            StartSubSpell_efxExcaliburBGCOL2(anim);
        }
        if (proc->timer == duration + 146)
        {
            NewEfxFlashBgWhite(anim, 5);
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
            EfxPlayHittedSFX(anim);
        }
        if (proc->timer == duration + 152)
        {
            StartSubSpell_efxExcaliburBG3(anim);
            StartSubSpell_efxExcaliburBGCOL3(anim);
        }
        if (proc->timer == duration + 167)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else
    {
        if (proc->timer == duration + 110)
        {
            anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
            StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        }
        if (proc->timer == duration + 111)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}
