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

void NewEfxCriricalEffectBGCOL(struct Anim * anim)
{
    static const u16 frams[] = {
        0x0, 1,
        0x1, 1,
        0x2, 1,
        0x3, 1,
        0x4, 1,
        0x5, 1,
        0x6, 1,
        0x7, 1,
        0x8, 1,
        0x9, 1,
        0xA, 1,
        0xB, 1,
        0xC, 1,
        0xD, 1,
        0xE, 1,
        0xF, 1,
        -1
    };

    struct ProcEfxBGCOL * proc;
    proc = Proc_Start(ProcScr_efxCriricalEffectBGCOL, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;
    proc->frame_config = frams;
    proc->pal = Pal_EfxCriricalEffectBG;
}
