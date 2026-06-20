#include "global.h"
#include "proc.h"
#include "bmlib.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
void EfxSRankWeaponEffectSCR2Main(struct ProcEfxSRankSCR2 * proc) {
    struct ProcEfx * seff_scr = proc->seff_scr1;
    seff_scr->unk44 = Interpolate(INTERPOLATE_LINEAR, 0, 0x4000, proc->timer, proc->terminator);
    if (++proc->timer > proc->terminator) {
        Proc_End(seff_scr);
        Proc_Break(proc);
    }
}
