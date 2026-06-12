#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"

void efxCriricalEffectBGMain(struct ProcEfxBG * proc)
{
    if (++proc->timer == 0x11) {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}
