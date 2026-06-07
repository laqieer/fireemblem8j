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

//! FE8U = 0x08065DF8
void efxIvaldiOBJFall_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 7)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 152, 84, 3);
    }
    else if (proc->timer == 13)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 48, 84, 3);
    }
    else if (proc->timer == 19)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 188, 106, 3);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 104, 103, 2);
    }
    else if (proc->timer == 31)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 36, 102, 2);
    }
    else if (proc->timer == 37)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 176, 97, 3);
    }
    else if (proc->timer == 43)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 56, 100, 3);
    }
    else if (proc->timer == 49)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 158, 103, 2);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 66, 92, 3);
    }
    else if (proc->timer == 61)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 230, 92, 3);
    }
    else if (proc->timer == 67)
    {
        StartSubSpell_efxIvaldiOBJ1(proc->anim, 64, 104, 108, 3);
    }

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
