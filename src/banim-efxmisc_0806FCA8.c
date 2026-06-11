#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

/**
 * Misc banim effects
 */



/* prototypes for same-file helpers called by this run */
void NewEfxSRankWeaponEffectSCR(void);

void NewEfxSRankWeaponEffect(struct Anim *anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxSRankWeaponEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
}

void EfxSRankWeaponEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 1) {
        NewEfxSRankWeaponEffectBG(proc->anim);
        return;
    }

    if (time == 0x15) {
        NewEfxRestWINH_(proc->anim, 0x2D, 0x1);
        NewEfxSRankWeaponEffectSCR();
        return;
    }

    if (time == 0x46) {
        struct Anim *anim1, *anim2;

        anim1 = gAnims[GetAnimPosition(proc->anim) * 2];
        anim2 = gAnims[GetAnimPosition(proc->anim) * 2 + 1];
        
        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

void NewEfxSRankWeaponEffectBG(struct Anim *anim)
{
    struct ProcEfxBG * proc;
    proc = Proc_Start(ProcScr_efxSRankWeaponEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    SpellFx_RegisterBgGfx(Img_EfxSRankWeaponEffectBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxSRankWeaponEffectBG, 0x20);
    SpellFx_WriteBgMap(proc->anim, Tsa_EfxSRankWeaponEffectBG, Tsa_EfxSRankWeaponEffectBG);
    SpellFx_SetSomeColorEffect();
}
