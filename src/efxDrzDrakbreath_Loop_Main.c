#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0806881C
void efxDrzDrakbreath_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    if (++proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == 1)
    {
        StartSpellThing_MagicQuake(proc->anim, 90, 10);
        StartSubSpell_efxDrzDrakbreathOBJ(anim);
        NewEfxALPHA(anim, 40, 15, 16, 0, 0);
        PlaySFX(0x11D, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == 15)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == 130)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
