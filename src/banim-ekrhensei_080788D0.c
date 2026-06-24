#include "global.h"
#include "bmbattle.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "hardware.h"
#include "proc.h"
#include "uiutils.h"
#include "bmlib.h"
#include "bm.h"

void EkrHenseiEnd_FadeOutLoop(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}
