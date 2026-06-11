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



void EfxMantBatabata_Loop2(struct ProcEfxOBJ * proc)
{
    proc->anim2->xPosition = proc->anim->xPosition;

    if (CheckEkrHitDone() == 0x1) {
        SetAnimStateUnHidden(GetAnimPosition(proc->anim));
        AnimDelete(proc->anim2);
        gEkrbattle_0[GetAnimPosition(proc->anim)] = NULL;
        Proc_Break(proc);
    }
}

/**
 * Some critical atk effect?
 */
void NewEfxChillEffect(struct Anim *anim)
{
    struct ProcEfx * proc;
    SpellFx_ClearBG1Position();
    proc = Proc_Start(ProcScr_efxChillEffect, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}
