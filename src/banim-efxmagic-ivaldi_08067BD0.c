#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSpellBG_IvaldiBG1(struct Anim * anim);
void StartSpellBG_IvaldiBG2(struct Anim * anim);
void StartSpellBG_IvaldiBG3(struct Anim * anim);
void StartSpellBG_IvaldiBG4(struct Anim * anim);
void PrepareSomeIvaldiParticleGraphics(void);
void StartSpellOBJ_IvaldiFall(struct Anim * anim, int terminator);
void StartSpellOBJ_IvaldiSideWash(struct Anim * anim, int terminator);
void StartSubSpell_efxIvaldiOBJUprise(struct Anim * anim, int terminator);
void StartSubSpell_efxIvaldiWOUT(struct Anim * anim, int duration, int terminator);

/* https://decomp.me/scratch/4bKK3 */
//! FE8U = 0x08065810
void efxIvaldi_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);

    int duration = EfxGetCamMovDuration();
    int r7 = 0x3e;
    int chaos = 0xc4;

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        PrepareSomeIvaldiParticleGraphics();
    }
    else if (proc->timer == duration + 0xb)
    {
        StartSpellOBJ_IvaldiSideWash(anim, 0x1a);
    }
    else if (proc->timer == duration + 0x14)
    {
        PlaySFX(0x000003D3, 0x100, proc->anim->xPosition, 1);
        StartSpellBG_IvaldiBG1(anim);
    }
    else if (proc->timer == duration + 0x49)
    {
        PlaySFX(0x3d4, 0x100, proc->anim->xPosition, 1);
        StartSpellBG_IvaldiBG2(anim);
    }
    else if (proc->timer == duration + 0x76)
    {
        StartSpellBG_IvaldiBG3(anim);
    }
    else if (proc->timer == duration + 0x7c)
    {
        StartSpellOBJ_IvaldiFall(anim, 0x46);
    }
    else if (proc->timer == duration + 0xc6)
    {
        SetBlendTargetA(1, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);
        StartSubSpell_efxIvaldiWOUT(anim, 0x3c, 0x1e);
    }
    else if (proc->timer == r7 + chaos + duration)
    {
        StartSpellThing_MagicQuake(anim, 0x78, 10);
        SetBlendConfig(1, 0, 0x10, 0);
        StartSpellBG_IvaldiBG4(anim);
    }
    else if (proc->timer == duration + 0x107)
    {
        StartSubSpell_efxIvaldiOBJUprise(anim, 0x5c);
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else
    {
#ifdef NONMATCHING
        int r2 = r7 + chaos;
#else
        register int r0 asm("r0") = chaos, r2;
        asm(""::"r"(r0));
        r2 = r7 + r0;
#endif
        if (proc->timer == r2 + ({ duration + 0x14; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x52; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x5e; }))
        {
            NewEfxFlashBgWhite(anim, 2);
        }
        else if (proc->timer == r2 + ({ duration + 0x64; }))
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }

    return;
}
