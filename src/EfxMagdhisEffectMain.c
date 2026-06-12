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

void EfxMagdhisEffectMain(struct ProcEfx * proc)
{
    if (++proc->timer == 0x11) {
        NewEfxMagdhisEffectBG(proc->anim, 0x49);
        EfxPlaySE(SONG_140, 0x100);
        M4aPlayWithPostionCtrl(SONG_140, proc->anim->xPosition, 1);
    }

    if (proc->timer == 0x64)
        Proc_Break(proc);
}
