#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"
#include "ekrdragon.h"

//! FE8U = 0x0806B664
void efxGorgonOBJ_Loop(struct ProcEfxOBJ * proc)
{
    struct Anim * anim = proc->anim2;

    anim->pScrStart = AnimScr_Banim_6;
    anim->pScrCurrent = AnimScr_Banim_6;

    anim->timer = 0;

    Proc_Break(proc);

    return;
}
