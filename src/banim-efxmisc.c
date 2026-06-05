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



void NewEfxLokmsunaOBJ(struct Anim *anim)
{
    u32 *scr1, *scr2;
    struct Anim *anim2;
    struct ProcEfxOBJ * proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = AnimScr_EfxLokmsunaObjLeft;
    scr2 = AnimScr_EfxLokmsunaObjRight;
    anim2 = EfxCreateFrontAnim(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /* oam2_data::pal = 0 */
    anim2->oam2Base &= 0xFFF;

    if (GetAnimPosition(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;
    
    SpellFx_RegisterObjGfx(Img_EfxLokmsunaObj, 0x1000);
}

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0xF) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C39: banim_code_hit_fake
 */
void NewEfxKingPika(struct Anim *anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxKingPikaMain(struct ProcEfx * proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA) {
        NewEfxFlashBgWhite(anim, 0x14);
        return;
    }

    if (time == 0x2D) {
        struct Anim *anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim *anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim *anim)
{
    struct ProcEfx * proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxFlashFXMain(struct ProcEfx * proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashBgWhite(anim, 0x5);
        return;
    }

    if (time == 0x6) {
        struct Anim *anim1 = gAnims[GetAnimPosition(anim) * 2];
        struct Anim *anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        Proc_Break(proc);
    }
}

/**
 * Maybe unused banim commands?
 */
void NewEfxSongOBJ2(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x28;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2, AnimScr_EfxSongObj2);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

void EfxSongOBJ2Main(struct ProcEfxOBJ * proc)
{
    if (++proc->timer == 0x18)
        PlaySFX(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->terminator) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->terminator = 0x19;
    proc->anim2 = EfxCreateFrontAnim(anim, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj, AnimScr_EfxDanceObj);
    SpellFx_RegisterObjPal(Pal_EfxDanceObj, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxDanceObj, 0x1000);
    PlaySFX(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

void EfxDanceOBJMain(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->terminator) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

/**
 * Shinning effect for legend weapon
 */
void NewEfxSpecalEffect(struct Anim *anim)
{
    struct BattleUnit *bu;
    struct ProcEfx * proc;
    struct Anim *anim1, *anim2;

    if (gEfxSpecalEffectExist[GetAnimPosition(anim)] == false) {
        gEfxSpecalEffectExist[GetAnimPosition(anim)] = true;

        if (GetAnimPosition(anim) == EKR_POS_L)
            bu = gpEkrBattleUnitLeft;
        else
            bu = gpEkrBattleUnitRight;

        if (IsWeaponLegency(bu->weaponBefore) == false) {
            anim1 = gAnims[GetAnimPosition(anim) * 2];
            anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

            anim1->state3 |= ANIM_BIT3_BLOCKEND;
            anim2->state3 |= ANIM_BIT3_BLOCKEND;
            return;
        }
    } else {
        anim1 = gAnims[GetAnimPosition(anim) * 2];
        anim2 = gAnims[GetAnimPosition(anim) * 2 + 1];

        anim1->state3 |= ANIM_BIT3_BLOCKEND;
        anim2->state3 |= ANIM_BIT3_BLOCKEND;
        return;
    }

    proc = Proc_Start(ProcScr_efxSpecalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0x0;
    PlaySFX(0xF0, 0x100, 0x78, 0x0);
    NewEfxSRankWeaponEffect(anim);
}
