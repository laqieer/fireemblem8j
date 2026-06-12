#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxIvaldiOBJ2(struct Anim * anim, int terminator, s16 x, s16 y, u8 kind);

//! FE8U = 0x080660B4
void efxIvaldiOBJUprise_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 5)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 200, 112, 1);
    }
    else if (proc->timer == 10)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 67, 91, 1);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 13, 89, 1);
    }
    else if (proc->timer == 20)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 203, 76, 1);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 223, 2, 1);
    }
    else if (proc->timer == 30)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 14, 111, 1);
    }
    else if (proc->timer == 35)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 224, 108, 1);
    }
    else if (proc->timer == 40)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 368, 112, 1);
    }
    else if (proc->timer == 45)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 58, 45, 0);
    }
    else if (proc->timer == 50)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 127, 66, 0);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 163, 20, 0);
    }
    else if (proc->timer == 60)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 167, 62, 0);
    }
    else if (proc->timer == 65)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 56, 96, 0);
    }
    else if (proc->timer == 70)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 128, 66, 0);
    }
    else if (proc->timer == 75)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 56, 112, 0);
    }
    else if (proc->timer == 80)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 168, 112, 0);
    }
    else if (proc->timer == 85)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 164, 112, 0);
    }
    else if (proc->timer == 90)
    {
        StartSubSpell_efxIvaldiOBJ2(proc->anim, 64, 65, 120, 0);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
