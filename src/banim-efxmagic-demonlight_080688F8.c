#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"
#include "ctc.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxMaohFlashBG1(struct Anim * anim);
void StartSubSpell_efxMaohFlashBG2(struct Anim * anim);
void StartSubSpell_efxMaohFlashBG3(struct Anim * anim);
void StartSubSpell_efxMaohFlashBG4(struct Anim * anim);
void StartSubSpell_efxMaohFlashBGCOL(struct Anim * anim);
void efxMaohFlash_RegisterSpritesGfx(void);
void StartSubSpell_efxMaohFlashEyeROBJ2(struct Anim * anim, int terminator, s16 x, s16 y);
void StartSubSpell_efxMaohFlashEyeLOBJ2(struct Anim * anim, int terminator, s16 x, s16 y);
void StartSubSpell_efxMaohFlashThunderOBJ(struct Anim * anim, int terminator);

//! FE8U = 0x08066550
void efxMaohFlash_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    switch (proc->timer)
    {
        case 11:
        {
            SetBlendAlpha(0, 16);
            NewEfxALPHA(anim, 0, 32, 0, 16, 0);

            NewEfxRestWINH_(anim, 166, 1);
            NewEfxTwobaiRST(anim, 166);

            StartSubSpell_efxMaohFlashBG1(anim);
            PlaySFX(0x3B2, 0x100, anim->xPosition, 1);
            break;
        }

        case 177:
        {
            StartSubSpell_efxMaohFlashBG3(anim);
            break;
        }

        case 255:
        {
            efxMaohFlash_RegisterSpritesGfx();
            StartSubSpell_efxMaohFlashEyeROBJ2(anim, 10, 173, 44);
            StartSubSpell_efxMaohFlashEyeLOBJ2(anim, 10, 159, 48);
            break;
        }

        case 265:
        {
            NewEfxRestWINH_(anim, 34, 1);
            NewEfxTwobaiRST(anim, 34);
            StartSubSpell_efxMaohFlashBG4(anim);
            break;
        }

        case 301:
        {
            NewEfxFlashBgWhite(anim, 4);
            NewEfxFarAttackWithDistance(proc->anim, -1);
            break;
        }
    }

    if (proc->timer == duration + 307)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
            StartSpellThing_MagicQuake(anim, 120, 10);
            StartSubSpell_efxMaohFlashBG2(anim);
            StartSubSpell_efxMaohFlashBGCOL(anim);
            StartSubSpell_efxMaohFlashThunderOBJ(anim, 74);
            PlaySFX(0x3B3, 0x100, anim->xPosition, 1);
        }
        else
        {
            proc->timer = duration + 452;
        }
    }
    else if (proc->timer == duration + 457)
    {
        anim->state3 |= 2;

        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
