#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
/* TU-private data externs bound at their JP addresses */
extern s16 gShineSpriteCoords[];

// clang-format on

//! FE8U = 0x08063840
void efxShineOBJRND_Loop(struct ProcEfxOBJ * proc)
{
    proc->timer++;

    if (proc->timer == proc->terminator)
    {
        int x;
        int y;
        if (GetAnimPosition(proc->anim) == 0)
        {
            x = proc->anim->xPosition + gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
        }
        else
        {
            x = proc->anim->xPosition - gShineSpriteCoords[(s16)proc->unk30];
            y = proc->anim->yPosition + gShineSpriteCoords[(s16)proc->unk30 + 1];
            StartSubSpell_efxShineOBJ(proc->anim, x, y);
        }

        proc->timer = 0;

        (s16) proc->unk30 += 2;

        if ((s16)proc->unk30 > 7)
        {
            gEfxBgSemaphore--;
            Proc_Break(proc);
        }
    }

    return;
}
