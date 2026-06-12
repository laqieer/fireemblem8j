#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern int gPurgeAnimSpriteCoordinates[];

// clang-format on

//! FE8U = 0x0805FD90
void efxPurgeOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    if (++proc->timer > proc->unk44)
    {
        int x;
        int y;

        proc->timer = 0;

        x = gPurgeAnimSpriteCoordinates[proc->terminator * 2];
        y = gPurgeAnimSpriteCoordinates[proc->terminator * 2 + 1];

        StartSubSpell_efxPurgeOBJ(proc->anim2, x, y);
        efxPurge_PlayAlternatingSFX(x, 1);

        if (++proc->terminator > proc->unk48)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}
