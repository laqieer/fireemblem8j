#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"

extern struct ProcCmd efxSRankWeaponEffectSCR[];

void NewEfxSRankWeaponEffectSCR(void)
{
    struct ProcEfx * proc;
    proc = Proc_Start(efxSRankWeaponEffectSCR, PROC_TREE_3);
    proc->timer = 0;
    proc->step = 0;
    proc->unk44 = 0;
    NewEfxSRankWeaponEffectSCR2(proc);
}
