#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxCrimsonEyeBGFinish1(struct Anim * anim);
void StartSubSpell_efxCrimsonEyeOBJFinish(struct Anim * anim);
void StartSubSpell_efxGorgonBGFinish_(struct Anim * anim);
void StartSubSpell_efxCrimsonEyeBG(struct Anim * anim);
void StartSubSpell_efxCrimsonEyeOBJ(struct Anim * anim);

//! FE8U = 0x08069F00
void efxCrimsonEye_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 11)
    {
        StartSubSpell_efxCrimsonEyeOBJ(anim);
        PlaySFX(0x3C7, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 145)
    {
        StartSubSpell_efxCrimsonEyeBG(anim);
    }
    else if (proc->timer == duration + 209)
    {
        NewEfxFlashBgWhite(anim, 10);
    }
    else if (proc->timer == duration + 217)
    {
        StartSubSpell_efxCrimsonEyeBGFinish1(anim);
        StartSubSpell_efxCrimsonEyeOBJFinish(anim);
        StartSpellThing_MagicQuake(proc->anim, 74, 2);
    }
    else if (proc->timer == duration + 257)
    {
        StartEfxmagicDemonsurgeFlashBlack();
    }
    else if (proc->timer == duration + 265)
    {
        StartSubSpell_efxGorgonBGFinish_(anim);
    }
    else if (proc->timer == duration + 291)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 311)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
