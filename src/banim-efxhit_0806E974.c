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
void NewEfxDamageMojiEffectOBJ(struct Anim * anim, int hitted);

void efxDamageMojiEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxDamageMojiEffectOBJ(proc->anim, proc->hitted);
        return;
    }

    if (time == 0xA) {
        Proc_Break(proc);
        return;
    }
}
