#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"

// JP-divergent ekrBattle fade-in phase keyed on gBanimBG (sibling of sub_8056078).
void sub_8055EB8(struct ProcEkrBattleEnding * proc)
{
    int ret;

    if (gBanimBG == 0)
    {
        ret = Interpolate(INTERPOLATE_LINEAR, 4, 0x10, proc->timer, proc->terminator);
        EfxChapterMapFadeOUT(ret);
    }
    else
    {
        ret = Interpolate(INTERPOLATE_LINEAR, 0, 0x10, proc->timer, proc->terminator);
        PutBanimBgPAL(gBanimBG - 1);
        EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, ret);
        EnablePaletteSync();
    }

    if (++proc->timer == proc->terminator + 1)
    {
        Proc_Break(proc);
    }
}
