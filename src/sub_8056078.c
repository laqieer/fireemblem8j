#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"

// JP-divergent ekrBattleEnding fade phase (sibling of sub_805601C).
void sub_8056078(struct ProcEkrBattleEnding * proc)
{
    int ret;

    if (gBanimBG == 0)
    {
        ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 4, proc->timer, proc->terminator);
        EfxChapterMapFadeOUT(ret);
    }
    else
    {
        ret = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator);
        PutBanimBgPAL(gBanimBG - 1);
        EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, ret);
        EnablePaletteSync();
    }

    if (++proc->timer == proc->terminator + 1)
    {
        gpProcEfxSpellCast = NULL;
        Proc_Break(proc);
    }
}
