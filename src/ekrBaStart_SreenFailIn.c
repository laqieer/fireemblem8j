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

void ekrBaStart_SreenFailIn(struct ProcEkrBattleStarting *proc)
{
    int left, top, right, bottom;
    
    if (proc->timer != proc->terminator)
        proc->timer++;

    left   = Interpolate(INTERPOLATE_LINEAR, 0,    proc->x1, proc->timer, proc->terminator);
    top    = Interpolate(INTERPOLATE_LINEAR, 0,    proc->y1, proc->timer, proc->terminator);
    right  = Interpolate(INTERPOLATE_LINEAR, 0xF0, proc->x2, proc->timer, proc->terminator);
    bottom = Interpolate(INTERPOLATE_LINEAR, 0xA0, proc->y2, proc->timer, proc->terminator);

    SetWin0Box(left, top, right, bottom);

    if (proc->timer == proc->terminator) {
        SetWOutLayers(1, 1, 1, 1, 1);
        InitOam(0);
        BMapDispSuspend();
        SetWin0Box(0, 0, 0xF0, 0xA0);
        EfxPalBlackInOut(gPaletteBuffer, 0x6, 0xA, 0x4);
        EnablePaletteSync();
        EndAllMus();
        Proc_Break(proc);
    }
}
