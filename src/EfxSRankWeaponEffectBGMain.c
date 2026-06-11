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

void EfxSRankWeaponEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x3C) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}
