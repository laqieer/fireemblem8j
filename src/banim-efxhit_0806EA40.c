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
void NewEfxPierceCriticalEffect(struct Anim * anim);

void NewEfxPierceCritical(struct Anim * anim)
{
    struct ProcEfx * proc;
    struct Anim * anim1 = GetAnimAnotherSide(anim);
    int is_pierce;

    is_pierce = GetRoundFlagByAnim(anim1) & ANIM_ROUND_PIERCE;
    if (is_pierce != 0) {
        NewEfxPierceCriticalEffect(anim);
    } else {
        SpellFx_ClearBG1Position();
        proc = Proc_Start(ProcScr_efxCriricalEffect, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
    }
}
