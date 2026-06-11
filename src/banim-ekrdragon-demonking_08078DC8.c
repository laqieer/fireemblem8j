extern int InitBanimTerrain();
#include "global.h"
#include "gbafe.h"

ProcPtr NewEkrDragonBaseAppear(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBaseAppear, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer = 0;
    FillBGRect(gBG2TilemapBuffer, 0x20, 0x20, 0, 0);
    InitBanimTerrain(&gEkrbattle_9);
    CpuFastCopy(PAL_BG(4), gEkrBgPaletteBackup, 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, 0x10);
    return proc;
}

/* Gradullay reload the terrain palette */
void EkrDragonBaseAppearMain(struct ProcEfxDKfx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0x10, 0, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->finished = true;
        Proc_Break(proc);
    }
}
