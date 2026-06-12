#include "global.h"
#include "anime.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrclasschg.h"
#include "ekrdragon.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"

extern EWRAM_OVERLAY(banim) struct ProcEkrClasschg * gpProcEkrClasschg;

void EfxClasschgBGSE00Main(struct ProcEfxBG * proc)
{
    proc->timer = proc->timer + 1;
    if (0x28 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x52 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x68 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x72 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x74 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x76 == proc->timer)
        PlaySFX(0x13E, 0x100, proc->anim->xPosition, 0x1);
    else if (0x78 == proc->timer)
        PlaySFX(0x13B, 0x100, proc->anim->xPosition, 0x1);

    /* ? */
    Proc_Break(proc);
}
