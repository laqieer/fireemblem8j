#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

void sub_8067984(struct Anim * anim);
void sub_8067634(struct Anim * anim);
void sub_8067450(struct Anim * anim);
void sub_806759C(struct Anim * anim);
void sub_8055E64(void);
void sub_8067834(struct Anim * anim, int a, int b);
void EfxPlayHittedSFX(struct Anim * anim);
void sub_8055E80(void);
void StartSpellThing_MagicQuake(struct Anim * anim, int a, int b);
void StartSubSpell_efxGespenstBG4(struct Anim * anim, int a);
void StartSubSpell_efxGespenstBGCOL2(struct Anim * anim);
void PlaySFX(int snd, int a, int b, int c);
void NewEfxFlashBgWhite(struct Anim * anim, int a);
void sub_805C28C(struct Anim * anim, int a);
void StartSubSpell_efxSuperdruidBG3(struct Anim * anim);
void sub_805C7CC(struct Anim * anim, int a, int b, int c, int d, int e);
void StartSubSpell_efxSuperdruidOBJ2(struct Anim * anim);

//! FE8U = 0x080672D0
void efxEreshkigal_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 0x14)
    {
        sub_8067984(anim);
        PlaySFX(0x2FD, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 0x28)
    {
        sub_8067634(anim);
        sub_8067450(anim);
        sub_806759C(anim);
        sub_8055E64();
    }
    else if (proc->timer == duration + 0x91)
    {
        sub_8067834(anim, 0x1e, 0x14);
    }
    else if (proc->timer == duration + 0xaf)
    {
        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 0xb0)
    {
        if (proc->hitted != 0)
        {
            SpellFx_Finish();
            sub_8055E80();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 0xb1)
    {
        StartSpellThing_MagicQuake(proc->anim, 0x50, 9);
        StartSubSpell_efxGespenstBG4(anim, 0x1e);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x2FE, 0x100, 0x78, 0);
    }
    else if (proc->timer == duration + 0xcd)
    {
        NewEfxFlashBgWhite(proc->anim, 0xa);
    }
    else if (proc->timer == duration + 0xd7)
    {
        NewEfxRestWINH_(proc->anim, 0x46, 1);
        sub_805C28C(proc->anim, 0x32);
        StartSubSpell_efxSuperdruidBG3(proc->anim);
        sub_805C7CC(anim, 0x10, 0xa, 0x10, 0, 0);
    }
    else if (proc->timer == duration + 0xe1)
    {
        StartSubSpell_efxSuperdruidOBJ2(anim);
    }
    else if (proc->timer == duration + 0xf0)
    {
        sub_8055E80();
    }
    else if (proc->timer == duration + 0x10b)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
