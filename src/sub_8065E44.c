#include "global.h"
#include "proc.h"
#include "anime.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "ekrbattle.h"
#include "hardware.h"

/* JP-only efx-magic spell timeline handler (gespenst/darkgrado-family sibling).
 * Frame state-machine on proc->timer relative to EfxGetCamMovDuration(): a JP
 * spell whose cast/hit/finish helpers (sub_8065FF0..sub_8066444) live in the
 * JP address band immediately after this function. */

void sub_8065FF0(void *anim);
void sub_8066128(struct Anim *anim, int a2);
void sub_80663A8(void *anim, int param);
void sub_8066444(struct Anim *anim);

void sub_8065E44(struct ProcEfx *proc)
{
    struct Anim *anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }

    if (proc->timer == duration + 1)
    {
        sub_8065FF0(anim);
        sub_8066444(anim);
        SetBlendConfig(1, 0, 0x10, 0);
        NewEfxALPHA(anim, 0, 0x14, 0, 0x10, 0);
        NewEfxALPHA(anim, 0x32, 0xa, 0x10, 0, 0);
        PlaySFX(0x2C7, 0x100, anim->xPosition, 1);
    }
    else if (proc->timer == duration + 0x45)
    {
        StartSpellThing_MagicQuake(proc->anim, 0x5a, 0xa);
        sub_8066128(anim, 0x54);
        SetBlendConfig(1, 0, 0x10, 0);
        NewEfxALPHA(anim, 0, 0x14, 0, 0x10, 0);
        PlaySFX(0xb2 << 2, 0x100, 0x78, 1);
    }
    else if (proc->timer == duration + 0x58)
    {
        sub_80663A8(anim, 0x32);
    }
    else if (proc->timer == duration + 0x5d)
    {
        NewEfxFlashBgWhite(anim, 5);
    }
    else if (proc->timer == duration + 0x6c)
    {
        NewEfxFlashBgWhite(anim, 5);
    }
    else if (proc->timer == duration + 0x99)
    {
        NewEfxFlashBgWhite(anim, 0xa);
        anim->state3 |= 9;
        StartBattleAnimHitEffectsDefault(anim, proc->hitted);
        if (!proc->hitted)
            EfxPlayHittedSFX(anim);
    }
    else if (proc->timer == duration + 0x9f)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 0xa3)
    {
        StartSpellThing_MagicQuake(proc->anim, 0xf, 9);
        StartSubSpell_efxGespenstBG4(anim, 0x1e);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x2C9, 0x100, 0x78, 1);
    }
    else if (proc->timer == duration + 0xb3)
    {
        StartSpellThing_MagicQuake(proc->anim, 0xf, 8);
    }
    else if (proc->timer == duration + 0xcc)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
