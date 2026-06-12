#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0806B24C
void efxDarkLongMonsOBJ_Loop(struct ProcEfxOBJ * proc)
{
    int timer;

    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
        return;
    }

    if (proc->timer < 16)
    {
        timer = proc->timer;
    }
    else
    {
        if (proc->timer >= proc->terminator - 16)
        {
            timer = proc->terminator - proc->timer;
        }
        else
        {
            timer = 0;
        }
    }

    if ((timer & 1) == 0)
    {
        if (((timer >> 1) & 1) != 0)
        {
            proc->anim2->yPosition = 224;
        }
        else
        {
            proc->anim2->yPosition = 32;
        }
    }

    return;
}
