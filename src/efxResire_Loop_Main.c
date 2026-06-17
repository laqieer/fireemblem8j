#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"




void efxResire_Loop_Main(struct ProcEfx * proc)
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
        SetBlendAlpha(0, 16);
        NewEfxALPHA(anim, 0, 10, 0, 16, 0);
        NewEfxALPHA(anim, 35, 20, 16, 0, 0);
        StartSubSpell_efxResireBG2(anim);
        PlaySFX(0x124, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 15)
    {
        StartSubSpell_efxResireRST(anim, NewefxRestRST(anim, 42, 15, 0, 2), 30);
        NewEfxRestWINH(anim, 43, gLCDControlBuffer.bgoffset[BG_1].x, 0);
        return;
    }

    if (proc->timer == duration + 60)
    {
        StartSubSpell_efxResireBG(anim, proc->hitted);
        PlaySFX(0x125, 0x100, anim->xPosition, 1);
        return;
    }

    if (proc->timer == duration + 65)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimResireHitEffects(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            return;
        }
    }
    else if ((proc->timer != duration + 110) && (proc->timer == duration + 130))
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
