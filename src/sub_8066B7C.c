#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"

void sub_805C7CC(struct Anim * anim, int b, int c, int d, int e, int f);
void StartSpellThing_MagicQuake(struct Anim * anim, int b, int c);
void sub_8066CC0(struct Anim * anim);
void sub_8066D7C(struct Anim * anim, int b);
void sub_8066E88(struct Anim * anim, int b);
void sub_8066F04(struct Anim * anim, int b);
void sub_8066F9C(struct Anim * anim, int b, int c);
void sub_8067040(struct Anim * anim, int b);
void EfxPlayHittedSFX(struct Anim * anim);

void sub_8066B7C(struct ProcEfx * proc)
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
        sub_8066CC0(anim);
        PlaySFX(0x2C4, 0x100, 120, 0);
    }
    else if (proc->timer == duration + 26)
    {
        sub_8067040(anim, 0x72);
        SetBlendConfig(1, 0, 16, 0);
        sub_805C7CC(anim, 10, 10, 0, 16, 0);
        PlaySFX(0x2C5, 0x100, 120, 0);
    }
    else if (proc->timer == duration + 76)
    {
        sub_8066E88(anim, 0x3C);
        sub_8066F04(anim, 0x3C);
    }
    else if (proc->timer == duration + 86)
    {
        sub_8066F9C(anim, 0x37, 0x2D);
    }
    else if (proc->timer == duration + 141)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (proc->hitted == 0)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 142)
    {
        StartSpellThing_MagicQuake(anim, 0x64, 10);
        sub_8066D7C(anim, 0x64);
        sub_805C7CC(anim, 0x50, 0x14, 0x10, 0, 0);
        PlaySFX(0x2C6, 0x100, 120, 0);
    }
    else if (proc->timer == duration + 245)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
