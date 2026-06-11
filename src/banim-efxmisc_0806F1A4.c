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



void NewEfxHurtmutEff00OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_0(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_1(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff00OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff00OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_2(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxHurtmutEff01OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxCreateFrontAnim(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_0(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ1_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ1_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ1, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_1(struct ProcEfxOBJ * proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAnimPosition(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Right;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Right;
    } else {
        anim2->pScrStart = AnimScr_HurtmutEff01OBJ2_Left;
        anim2->pScrCurrent = AnimScr_HurtmutEff01OBJ2_Left;
    }

    anim2->timer = 0;

    SpellFx_RegisterObjPal(Pal_EfxHurtmutEff00OBJ, 0x20);
    SpellFx_RegisterObjGfx(Img_EfxHurtmutEff00OBJ2, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_2(struct ProcEfxOBJ * proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxMagfcast(struct Anim *anim, int type)
{
    s16 id2;    /* maybe not the class index */
    struct ProcEfx * proc;

    if (gEfxBgSemaphore != 0)
        return;

    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    id2 = gBanimIdx[GetAnimPosition(anim)] - 0x6A;
    switch (id2) {
    case 0x0:
    case 0x1:
    case 0x2A:
        NewEfxMagfcastBG(proc->anim, type);
        break;

    /* Just for switch case align */
    case 2:
    case 3:
    case 4:
    case 5:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
}

void EfxMagfcastMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

void NewEfxMagfcastBG(struct Anim *anim, u32 type)
{
    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type) {
    case 0:
        proc->frame_config = FrameConfig_EfxMagFcastBg1;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 1:
        proc->frame_config = FrameConfig_EfxMagFcastBg2;
        proc->tsal = TsaLut1_EfxMagfcastBG;
        proc->tsar = TsaLut1_EfxMagfcastBG;
        break;

    case 2:
        proc->frame_config = FrameConfig_EfxMagFcastBg3;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        break;

    case 3:
        proc->frame_config = FrameConfig_EfxMagFcastBg4;
        proc->tsal = TsaLut2_EfxMagfcastBG;
        proc->tsar = TsaLut2_EfxMagfcastBG;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SpellFx_RegisterBgGfx(Img_EfxMagfcastBG, 0x2000);
    SpellFx_RegisterBgPal(Pal_EfxMagfcastBG, 0x20);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}
