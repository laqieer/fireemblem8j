#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern s16 gEclipseAnimSpriteCoordinates[];

void efxHazymoonOBJ3_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == 8)
    {
        s16 x;
        s16 y;

        proc->timer = 0;

        x = gEclipseAnimSpriteCoordinates[proc->terminator * 2];
        y = gEclipseAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxHazymoonOBJ3RND(proc->anim, x, y);

        proc->terminator++;

        if (proc->terminator == 6)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}
