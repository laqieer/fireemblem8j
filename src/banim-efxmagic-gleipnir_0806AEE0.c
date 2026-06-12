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



/* file-scope type definitions used by this run */


struct Proc085D84B4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxDarkGradoMapFadeOut(void);
void efxDarkGradoRestoreMapBg(void);
void StartSubSpell_efxDarkGradoBG01(struct Anim * anim);
void StartSubSpell_efxDarkGradoBG02(struct Anim * anim);
void StartSubSpell_efxDarkGradoOBJ01(struct Anim * anim);
void StartSubSpell_efxDarkGradoOBJ02(struct Anim * anim);

//! FE8U = 0x08068BB8
void efxDarkGrado_Loop_Main(struct ProcEfx * proc)
{
    struct Anim * anim = GetAnimAnotherSide(proc->anim);
    int duration = EfxGetCamMovDuration();

    proc->timer++;

    if (proc->timer == 1)
    {
        NewEfxFarAttackWithDistance(proc->anim, -1);
    }
    else if (proc->timer == duration + 2)
    {
        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            StartSubSpell_efxDarkGradoMapFadeOut();
        }
    }
    else if (proc->timer == duration + 34)
    {
        StartSubSpell_efxDarkGradoBG01(anim);
        PlaySFX(0x3ac, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 96)
    {
        StartSubSpell_efxDarkGradoBG02(anim);
        StartSubSpell_efxDarkGradoOBJ01(anim);
    }
    else if (proc->timer == duration + 206)
    {
        StartSubSpell_efxDarkGradoOBJ02(anim);
    }
    else if (proc->timer == duration + 302)
    {
        NewEfxFlashBgWhite(anim, 10);

        if ((GetBanimDragonStatusType() != EKRDRGON_TYPE_DRACO_ZOMBIE) &&
            (GetBanimDragonStatusType() != EKRDRGON_TYPE_DEMON_KING))
        {
            efxDarkGradoRestoreMapBg();
        }

        NewEfxSpellCast();

        anim->state3 |= (ANIM_BIT3_TAKE_BACK_ENABLE | ANIM_BIT3_HIT_EFFECT_APPLIED);

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 308)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 312)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 9);
        StartSubSpell_efxGespenstBG4(anim, 30);
        StartSubSpell_efxGespenstBGCOL2(anim);
        PlaySFX(0x3AD, 0x100, 120, 1);
    }
    else if (proc->timer == duration + 328)
    {
        StartSpellThing_MagicQuake(proc->anim, 15, 8);
    }
    else if (proc->timer == duration + 353)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
