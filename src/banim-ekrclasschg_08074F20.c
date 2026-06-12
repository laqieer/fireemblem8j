#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

extern EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg;

/* prototypes for same-file helpers called by this run */
void NewEkrClasschgBG1(struct Anim * anim);
void NewEkrClasschgBG2(struct Anim * anim);
void NewEfxClasschgBGSE00(struct Anim * anim);
void NewEfxClasschgOBJGain(struct Anim * anim);
void NewEfxClasschgOBJDrop(struct Anim * anim);
void NewEfxClasschgOBJDiffusion(struct Anim * anim, u8 pos);
void NewEfxClasschgFIN(struct Anim * anim, int duration);
void NewEfxClasschgCLONE(struct Anim * anim, int duration);
void NewEfxWhiteInOutUnit(struct Anim * anim, int duration, int arg);

void EkrClasschgMain(struct ProcEkrClasschg * proc)
{
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);
    proc->timer = proc->timer + 1;

    if (0x01 == proc->timer)
    {
        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_3, 0, 0);

        DisableEfxStatusUnits(proc->anim);
        DisableEfxStatusUnits(anim1);

        SetWinEnable(0, 0, 0);

        NewEfxClasschgOBJGain(proc->anim);
        NewEfxClasschgBGSE00(anim1);
    }
    else if (0x28 == proc->timer)
        NewEkrClasschgBG1(anim1);
    else if (0x87 == proc->timer)
        NewEfxALPHA(proc->anim, 0, 0x38, 0x10, 0, 0);
    else if (0x88 == proc->timer)
        NewEfxWhiteInOutUnit(proc->anim, 0xC, 0x0);
    else if (0x94 == proc->timer)
        SetAnimStateHidden(EKR_POS_R);
    else if (0x8C == proc->timer)
    {
        NewEfxFlashBgWhite(proc->anim, 0xA);
        BG_SetPosition(BG_1, 0, 8);
    }
    else if (0x92 == proc->timer)
        NewEfxClasschgOBJDiffusion(proc->anim, 0);
    else if (0xBA == proc->timer)
    {
        proc->anim->oam2Base &= 0xF3FF;
        proc->anim->oam2Base |= 0x400;
    }
    else if (0xD8 == proc->timer)
        NewEfxClasschgOBJDrop(anim1);
    else if (0x100 == proc->timer)
    {
        NewEkrClasschgBG2(proc->anim);
        SetWinEnable(0, 0, 0);
        SetBlendConfig(0x1, 0x0, 0x10, 0x0);
        NewEfxALPHA(proc->anim, 0, 0x38, 0x0, 0x10, 0x0);

        BG_SetPosition(BG_0, 0, 0);
        BG_SetPosition(BG_1, 0, 0);
        BG_SetPosition(BG_2, 0, 0);
        BG_SetPosition(BG_3, 0, 0);
    }
    else if (0x11E == proc->timer)
    {
        SetAnimStateUnHidden(EKR_POS_L);
        NewEfxFlashBgWhite(proc->anim, 0x8);
        NewEfxFlashUnit(anim1, 0x0, 0x20, 0x0);
    }
    else if (0x13A == proc->timer)
    {
        anim1->oam2Base &= 0xF3FF;
        anim1->oam2Base |= 0x400;
        RegisterEfxSpellCastEnd();
        NewEfxWhiteIN(anim1, 0xA, 0x46);
    }
    else if (0x144 == proc->timer)
    {
        NewEfxClasschgFIN(anim1, 0x82);
        NewEfxClasschgCLONE(anim1, 0x82);
        NewEfxALPHA(anim1, 0x5A, 0x28, 0xE, 0x0, 0x2);
        NewefxRestRST(anim1, 0x82, 0xA, 0x100, 0x1);
        NewEfxRestWINH_(anim1, 0x82, 0x0);
        PlaySFX(0x13D, 0x100, anim1->xPosition, 0x1);
    } else if (0x14C == proc->timer)
        NewEfxClasschgOBJDiffusion(proc->anim, 1);
    else if (0x23C == proc->timer)
        Proc_Break(proc);

    if (0x28 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x52 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x68 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x72 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x74 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x76 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x78 == proc->timer)
        PlaySFX(0x13B, 0x100, proc->anim->xPosition, 0x1);
    else if (0x100 == proc->timer)
        PlaySFX(0x3E5, 0x100, proc->anim->xPosition, 0x1);
    else if (0x11E == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x120 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x122 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x126 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x12A == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x12E == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x132 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x134 == proc->timer)
        PlaySFX(0x3E6, 0x100, proc->anim->xPosition, 0x1);
}
