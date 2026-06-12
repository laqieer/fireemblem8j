#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

/**
 * Hit effect for normal atk, pierce and ctr atk
 */

extern CONST_DATA struct ProcCmd ProcScr_efxDamageMojiEffect[];

void NewEfxNormalEffectBG(struct Anim * anim)
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
    proc = Proc_Start(ProcScr_efxNormalEffectBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frames;
    proc->tsal = TSAs_EfxNormalEffectBG;
    proc->tsar = TSAs_EfxNormalEffectBG;

    SpellFx_RegisterBgPal(Pal_EfxNormalEffectBG, 0x20);
    SpellFx_RegisterBgGfx(Img_EfxNormalEffectBG, 0x2000);
    SpellFx_SetSomeColorEffect();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAnimPosition(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0);
        else
            BG_SetPosition(BG_1, 0xE8, 0);
    }
}
