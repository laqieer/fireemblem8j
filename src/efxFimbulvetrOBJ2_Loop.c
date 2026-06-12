#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "ctc.h"

//! FE8U = 0x0805E510
void efxFimbulvetrOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    int i;

    for (i = 0; i < 32; i++)
    {
        StartSubSpell_efxFimbulvetrOBJ2Fall(proc->anim, i);
    }

    gEfxBgSemaphore--;

    Proc_Break(proc);

    return;
}
