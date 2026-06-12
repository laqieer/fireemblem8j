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

void efxDamageMojiEffectOBJMain(struct ProcEfxDamageMojiEffectOBJ * proc)
{
    proc->sub_proc->x1 = proc->anim->xPosition;

    if (++proc->timer > proc->terminator) {
        Proc_End(proc->sub_proc);
        Proc_Break(proc);
    }
}
