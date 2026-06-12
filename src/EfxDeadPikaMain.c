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

void EfxDeadPikaMain(struct ProcEfxDead *proc)
{
    struct Anim *anim1 = proc->anim1;
    struct Anim *anim2 = proc->anim2;

    if (++proc->timer > 0x6) {
        anim1->state &= ~0x2;
        anim2->state &= ~0x2;

        proc->timer = 0;
        proc->terminator++;
    } else {
        anim1->state |= 0x2;
        anim2->state |= 0x2;
    }

    if (proc->terminator > 0x5) {
        proc->timer = 0;
        proc->terminator = 0;
        Proc_Break(proc);
    }
}
