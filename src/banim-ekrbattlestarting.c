#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "ctc.h"
#include "bm.h"
#include "bmlib.h"
#include "bmio.h"
#include "mu.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrdragon.h"

void ekrBaStart_0(struct ProcEkrBattleStarting *proc)
{
    EfxChapterMapFadeOUT(Interpolate(0, 4, 0x10, proc->timer, 8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void ekrBaStart_1(struct ProcEkrBattleStarting *proc)
{
    if (gEkrSnowWeather == 0)
        gEkrbattle_8 = 0x6;
    else
        gEkrbattle_8 = 0xA;

    PutBanimBG(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, 0x10);
    Proc_Break(proc);
}

void ekrBaStart_2(struct ProcEkrBattleStarting *proc)
{
    int val = Interpolate(0, 0x10, 0, proc->timer, 8);

    PutBanimBgPAL(gBanimBG - 1);
    EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}
