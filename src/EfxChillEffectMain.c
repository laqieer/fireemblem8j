#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmlib.h"
#include "constants/songs.h"

void EfxChillEffectMain(struct ProcEfx * proc)
{
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxChillEffectBG(proc->anim);
        NewEfxChillEffectBGCOL(proc->anim);
        return;
    }

    if (time == 0x3) {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x11) {
        NewEfxFlashBgBlack(proc->anim, 0x5);
        return;
    }

    if (time == 0x24) {
        Proc_Break(proc);
        return;
    }
}
