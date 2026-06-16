#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "bmlib.h"

extern struct ProcCmd gProcScr_efxThunderstormDARK[];

void StartSubSpell_efxThunderstormDARK(struct Anim * anim, int timer, int terminator)
{
    struct ProcEfxBGCOL * proc;
    gEfxBgSemaphore++;
    CpuFastCopy(gPaletteBuffer, gEfxPal, PLTT_SIZE);
    proc = Proc_Start(gProcScr_efxThunderstormDARK, 0);
    proc->anim = anim;
    proc->timer = 0;
    proc->timer2 = timer;
    proc->terminator = terminator;
    return;
}
