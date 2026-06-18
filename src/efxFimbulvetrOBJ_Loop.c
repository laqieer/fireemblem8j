#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"

void efxFimbulvetrOBJ_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer > 51)
    {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }

    return;
}
