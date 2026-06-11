#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "bmlib.h"
#include "banim_data.h"
#include "ctc.h"
#include "efxmagic.h"

extern EWRAM_DATA ProcPtr gpActiveClassReelSpellProc;
extern EWRAM_DATA ProcPtr gpActiveCRSpellBgColorProc;

//! FE8U = 0x0806F9D8
void efxopStoneOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 200)
    {
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }

    return;
}
