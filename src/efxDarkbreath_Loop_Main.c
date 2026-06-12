#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0805D508
void efxDarkbreath_Loop_Main(struct ProcEfx * proc)
{
    int timer;
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);

        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxDarkbreathBG(proc->anim);
        StartSubSpell_efxDarkbreathBGCOL(proc->anim);
        StartSubSpell_efxDarkbreathOBJ(proc->anim);

        PlaySFX(0x11F, 0x100, anim->xPosition, 1);
    }

    timer = proc->timer;

    if (timer == 4)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (timer == 32)
    {
        return;
    }
    else if (timer == 48)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
