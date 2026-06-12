#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxIvaldiOBJ1(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind);

//! FE8U = 0x08065F64
void efxIvaldiOBJSideWash_Loop(struct ProcEfxOBJ * proc)
{
    GetAnimPosition(proc->anim);

    proc->timer++;

    if (proc->timer == 0)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 12, 0);
    }
    else if (proc->timer == 3)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 95, 1);
    }
    else if (proc->timer == 6)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 120, 36, 1);
    }
    else if (proc->timer == 9)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 100, 10, 1);
    }
    else if (proc->timer == 12)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 94, 54, 0);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 100, 48, 1);
    }
    else if (proc->timer == 18)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 104, 102, 0);
    }
    else if (proc->timer == 21)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 96, 16, 1);
    }
    else if (proc->timer == 24)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 26, 128, 80, 1);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
