#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */



void NewEfxPierceNormalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxPierceNormalEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void efxPierceNormalEffectMain(struct ProcEfx * proc)
{
    int time;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        return;
    }

    if (time == 0x4) {
        NewEfxPierceNormalEffectBG(anim1);
        return;
    }

    if (time == 0x18) {
        Proc_Break(proc);
        return;
    }
}

void NewEfxPierceNormalEffectBG(struct Anim * anim)
{
    static const u16 frames[] = {
        0, 2,
        1, 2,
        2, 2,
        3, 2,
        4, 2,
        5, 2,
        6, 1,
        7, 1,
        8, 1,
        9, 1,
        -1
    };

    struct ProcEfxBG * proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxPierceNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TSAs_EfxPierceNormalEffectBG;
    proc->tsar = TSAs_EfxPierceNormalEffectBG;
    
    SpellFx_RegisterBgPal(Pal_EfxPierceNormalEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxPierceNormalEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}

void efxPierceNormalEffectBGMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 **buf1 = proc->tsal;
        u16 **buf2 = proc->tsar;
        SpellFx_WriteBgMap(proc->anim, buf1[ret], buf2[ret]);
        return;
    }

    if (ret == -1) {
        SpellFx_ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}
