#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

// clang-format off



/* file-scope type definitions used by this run */


struct Proc085D8C24
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

struct Proc085D8CE4
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

struct Proc085D8D14
{
    /* 00 */ PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x4C);
    /* 4C */ s16 unk4C;
};

/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxGorgon_0(struct Anim * anim);
void StartSubSpell_efxGorgonBGDirt(struct Anim * anim);
void StartSubSpell_efxGorgonBGTwister(struct Anim * anim);
void StartEfxmagicDemonsurgeFadeBlack(void);
void StartSubSpell_efxGorgonOBJTwister(struct Anim * anim);
void StartSubSpell_efxGorgonBGFinish(struct Anim * anim);
void StartEfxmagicDemonsurgeFlashWhite(void);

//! FE8U = 0x0806B534
void efxGorgon_Loop_Main(struct ProcEfx * proc)
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
        StartSubSpell_efxGorgon_0(anim);
        PlaySFX(0x3B6, 0x100, 192, 1);
    }
    else if (proc->timer == duration + 37)
    {
        StartSubSpell_efxGorgonBGDirt(anim);
    }
    else if (proc->timer == duration + 84)
    {
        StartEfxmagicDemonsurgeFadeBlack();
    }
    else if (proc->timer == duration + 96)
    {
        StartSubSpell_efxSuperdruidOBJ2(anim);
    }
    else if (proc->timer == duration + 111)
    {
        StartSpellThing_MagicQuake(proc->anim, 12, 4);
        StartSubSpell_efxGorgonBGTwister(anim);
    }
    else if (proc->timer == duration + 112)
    {
        StartSubSpell_efxGorgonOBJTwister(anim);
    }
    else if (proc->timer == duration + 122)
    {
        StartEfxmagicDemonsurgeFlashWhite();
    }
    else if (proc->timer == duration + 123)
    {
        StartSubSpell_efxGorgonBGFinish(anim);
        StartSpellThing_MagicQuake(proc->anim, 26, 2);
    }
    else if (proc->timer == duration + 149)
    {
        anim->state3 |= 9;

        StartBattleAnimHitEffectsDefault(anim, proc->hitted);

        if (!proc->hitted)
        {
            EfxPlayHittedSFX(anim);
        }
    }
    else if (proc->timer == duration + 169)
    {
        SpellFx_Finish();
        RegisterEfxSpellCastEnd();
        Proc_Break(proc);
    }

    return;
}
