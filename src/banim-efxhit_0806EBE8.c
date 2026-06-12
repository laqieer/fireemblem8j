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

/* prototypes for same-file helpers called by this run */
void NewEfxNormalEffectBG(struct Anim * anim);

void efxNormalEffectMain(struct ProcEfx * proc)
{
    int time;
    struct Anim * anim1 = GetAnimAnotherSide(proc->anim);

    time = ++proc->timer;

    if (time == 1) {
        NewEfxFlashBgWhite(proc->anim, 0x4);
        return;
    }

    if (time == 0x4) {
        NewEfxNormalEffectBG(anim1);
        return;
    }

    if (time == 0x18) {
        Proc_Break(proc);
        return;
    }
}
