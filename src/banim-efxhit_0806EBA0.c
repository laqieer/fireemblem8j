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
void NewEfxPierceNormalEffect(struct Anim * anim);

void NewEfxNormalEffect(struct Anim * anim)
{
    struct ProcEfx * proc;
    int is_pierce;

    SpellFx_ClearBG1Position();
    is_pierce = GetRoundFlagByAnim(anim) & ANIM_ROUND_PIERCE;
    if (is_pierce != 0) {
        NewEfxPierceNormalEffect(anim);
    } else {
        proc = Proc_Start(ProcScr_efxNormalEffect, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
    }
}
