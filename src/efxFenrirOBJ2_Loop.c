#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

void efxFenrirOBJ2_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 2)
    {
        proc->timer = 0;

        StartSubSpell_efxFenrirOBJ2Chiri(proc->anim, proc->unk44++);

        proc->terminator++;

        if (proc->terminator == 8)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}
