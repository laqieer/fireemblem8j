#include "global.h"

#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

// clang-format off



/* prototypes for same-file helpers called by this run */
void StartSubSpell_efxNaglfarOBJ(struct Anim * anim, int terminator, s16 x, s16 y, u8 pos, u8 index);

//! FE8U = 0x08068348
void efxNaglfarOBJRockGyre_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 0);
    }
    else if (proc->timer == 5)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 1);
    }
    else if (proc->timer == 7)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 2);
    }
    else if (proc->timer == 9)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 3);
    }
    else if (proc->timer == 11)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 0, 4);
    }
    else if (proc->timer == 13)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 0);
    }
    else if (proc->timer == 15)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 1);
    }
    else if (proc->timer == 17)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 2);
    }
    else if (proc->timer == 19)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 3);
    }
    else if (proc->timer == 21)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 0, 0, 1, 4);
    }
    else if (proc->timer == 23)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 0);
    }
    else if (proc->timer == 25)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 1);
    }
    else if (proc->timer == 27)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 2);
    }
    else if (proc->timer == 29)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 3);
    }
    else if (proc->timer == 31)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 8, 8, 0, 4);
    }
    else if (proc->timer == 33)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 0);
    }
    else if (proc->timer == 35)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 1);
    }
    else if (proc->timer == 37)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 2);
    }
    else if (proc->timer == 39)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 3);
    }
    else if (proc->timer == 41)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -16, -8, 1, 4);
    }
    else if (proc->timer == 43)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 0);
    }
    else if (proc->timer == 45)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 1);
    }
    else if (proc->timer == 47)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 2);
    }
    else if (proc->timer == 49)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 3);
    }
    else if (proc->timer == 51)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 18, 18, 0, 4);
    }
    else if (proc->timer == 53)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 0);
    }
    else if (proc->timer == 55)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 1);
    }
    else if (proc->timer == 57)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 2);
    }
    else if (proc->timer == 59)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 3);
    }
    else if (proc->timer == 61)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, -24, 0, 1, 4);
    }
    else if (proc->timer == 63)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 0);
    }
    else if (proc->timer == 65)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 1);
    }
    else if (proc->timer == 67)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 2);
    }
    else if (proc->timer == 69)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 3);
    }
    else if (proc->timer == 71)
    {
        StartSubSpell_efxNaglfarOBJ(proc->anim, 2, 12, 12, 0, 4);
    }
    else if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        Proc_Break(proc);
        return;
    }

    return;
}
