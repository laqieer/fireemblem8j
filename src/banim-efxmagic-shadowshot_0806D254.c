#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* file-scope type definitions used by this run */


struct Proc085D8AEC
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxDarkLongMonsBG01(struct Anim * anim);
void StartSubSpell_efxDarkLongMonsBG02(struct Anim * anim);
void StartSubSpell_efxDarkLongMonsOBJ(struct Anim * anim);
void StartSubSpell_efxDarkLongMonsFadeToBlack(void);

//! FE8U = 0x0806AF30
void efxDarkLongMons_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxDarkLongMonsOBJ(anim);
        PlaySFX(0x3D5, 0x100, 16, 1);
    }
    else if (proc->timer == duration + 43)
    {
        StartSubSpell_efxDarkLongMonsBG02(anim);
    }
    else if (proc->timer == duration + 151)
    {
        StartSubSpell_efxDarkLongMonsFadeToBlack();
    }
    else if (proc->timer == duration + 167)
    {
        StartSubSpell_efxDarkLongMonsBG01(anim);
    }
    else if (proc->timer == duration + 235)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 236)
    {
        if (proc->hitted)
        {
            SpellFx_Finish();
            RegisterEfxSpellCastEnd();
            Proc_Break(proc);
        }
    }
    else if (proc->timer == duration + 237)
    {
        StartSpellThing_MagicQuake(proc->anim, 62, 9);
        NewEfxFlashBgWhite(proc->anim, 10);
    }
    else if (proc->timer == duration + 247)
    {
        NewEfxRestWINH_(proc->anim, 70, 1);
        NewEfxTwobaiRST(proc->anim, 50);
        StartSubSpell_efxSuperdruidBG3(proc->anim);
        NewEfxALPHA(anim, 16, 10, 16, 0, 0);
        PlaySFX(0x3D6, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 272)
    {
        RegisterEfxSpellCastEnd();
    }
    else if (proc->timer == duration + 299)
    {
        SpellFx_Finish();
        Proc_Break(proc);
    }

    return;
}
