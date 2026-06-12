#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "event.h"
#include "bmlib.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"
#include "eventinfo.h"
#include "constants/songs.h"

void EfxDeadAlphaMain(struct ProcEfxDead *proc)
{
    struct Anim *anim1 = proc->anim1;
    struct Anim *anim2 = proc->anim2;

    anim1->oamBase |= 0x400;
    anim2->oamBase |= 0x400;

    if (++proc->timer > 0x3C) {
        anim1->state |= 0x2;
        anim2->state |= 0x2;

        anim1->oamBase &= ~0x400;
        anim2->oamBase &= ~0x400;

        SetDefaultColorEffects();
        Proc_Break(proc);
        return;
    }

    SetBlendConfig(
        0,
        Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, 0x3C),
        0x10, 0
    );
}
