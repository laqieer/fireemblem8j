#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"




void efxPierceCriticalEffectMain(struct ProcEfxBG * proc)
{
    int time = ++proc->timer;
    if (time == 1) {
        NewEfxPierceCriticalEffectBG(proc->anim);
        NewEfxPierceCriticalEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x11)
        Proc_Break(proc);
}
