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

void EkrHenseiInit_Init(struct ProcEkrHensei *proc)
{
    InitOam(0);
    EfxClearScreenFx();
    UpdateBanimFrame();

    NewEkrGauge();
    NewEkrDispUP();
    NewEkrBattle();

    PutBanimBG(gBanimBG - 1);
    CpuFastCopy(PAL_BG(0), gEfxPal, 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, 0x10);
    EnablePaletteSync();
    Proc_Break(proc);
}

void EkrHenseiInit_SetupFade(struct ProcEkrHensei *proc)
{
    EkrGauge_Set4C();
    EkrDispUpSet4C();

    proc->timer = 0;
    proc->terminator = 0x10;
    Proc_Break(proc);
}

void EkrHenseiInit_FadeInLoop(struct ProcEkrHensei *proc)
{
    int color = Interpolate(INTERPOLATE_LINEAR, 0x10, 0, proc->timer, proc->terminator);

    CpuFastCopy(gEfxPal, PAL_BG(0), 0x400);
    EfxPalBlackInOut(PAL_BG(0), 0, 0x20, color);
    EnablePaletteSync();

    if (++proc->timer == (proc->terminator + 1))
        Proc_Break(proc);
}
