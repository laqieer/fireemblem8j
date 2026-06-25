#include "global.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "bmlib.h"
#include "hardware.h"
#include "proc.h"
#include "bmmap.h"
#include "bm.h"

// JP-divergent ekrBattleEnding phase (one-shot map-restore + palette black-in-out).
void sub_805601C(struct ProcEkrBattleEnding * proc)
{
    if (gBanimBG == 0)
    {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }
    else
    {
        PutBanimBG(gBanimBG - 1);
    }

    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, 0x10);
    EnablePaletteSync();

    proc->timer = 0;
    proc->terminator = 4;
    Proc_Break(proc);
}
