#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

//! FE8U = 0x0806067C
void efxHazymoonOBJ2_Loop_A(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    proc->timer++;

    if (proc->timer == 1)
    {
        anim->pScrStart = AnimScr_EfxHazymoonOBJ2_1;
        anim->pScrCurrent = AnimScr_EfxHazymoonOBJ2_1;
        anim->timer = 0;

        proc->terminator = 10;

        SpellFx_RegisterObjPal(Pal_EclipseSprites, PLTT_SIZE_4BPP);
        SpellFx_RegisterObjGfx(Img_EclipseSprites_Swirl, 32 * 4 * CHR_SIZE);
    }
    else if (proc->timer == proc->terminator)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }

    return;
}
