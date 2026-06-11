#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "banim_data.h"
#include "hardware.h"
#include "bmlib.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "chapterdata.h"
#include "spellassoc.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/terrains.h"

void EkrBaseKaitenMain(struct ProcEkrBaseKaiten * proc)
{
    struct Anim * anim = proc->anim;

    if (proc->timer >= proc->terminator)
    {
        AnimDelete(anim);
        Proc_Break(proc);
        return;
    }

    if (proc->type == 0)
    {
        anim->xPosition =
            Interpolate(0, proc->x1, proc->x2, proc->timer, proc->terminator);

        anim->yPosition =
            Interpolate(0, proc->y1, proc->y2, proc->timer, proc->terminator);
    }
    else
    {
        anim->xPosition =
            Interpolate(0, proc->x2, proc->x1, proc->timer, proc->terminator);

        anim->yPosition =
            Interpolate(0, proc->y2, proc->y1, proc->timer, proc->terminator);
    }

    if (proc->timer <= proc->terminator)
        proc->timer++;
}
