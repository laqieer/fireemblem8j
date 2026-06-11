#include "global.h"
#include "gbafe.h"

void EkrDK_ReloadTerrainEtc(struct ProcEkrDragon * proc)
{
    SetEkrDragonStatusUnk1(0);
    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 2;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetAnimStateHidden(GetAnimPosition(proc->anim));
    gBanimValid[GetAnimPosition(proc->anim)] = false;

    /* Reload the terrain palette */
    NewEkrDragonBaseAppear(proc->anim);
    BG_Fill(gBG3TilemapBuffer, 0x601F);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    EfxChapterMapFadeOUT(0x10);
    Proc_Break(proc);
}

void EkrDK_ReloadCustomBgAndFadeOut(struct ProcEkrDragon * proc)
{
    if (proc->timer == 0) {
        UnpackChapterMapGraphics(gPlaySt.chapterIndex);
        RenderBmMap();
    }

    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_RSQUARE, 0x10, 4, proc->timer, 8));

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void EkrDK_SetDragonStatusBit3(struct ProcEkrDragon * proc)
{
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_END);
    Proc_Break(proc);
}

ProcPtr NewEkrDragonBaseHide(struct Anim * anim)
{
    struct ProcEfxDKfx * proc = Proc_Start(ProcScr_ekrDragonBaseHide, PROC_TREE_3);
    proc->anim = anim;
    proc->finished = false;
    proc->timer = 0;
    return proc;
}

/* Gradullay fade the terrain palette into darkness */
void EkrDragonBaseHideMain(struct ProcEfxDKfx * proc)
{
    int val = Interpolate(INTERPOLATE_SQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(gEkrBgPaletteBackup, PAL_BG(4), 0x40);
    EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
    EnablePaletteSync();

    if (++proc->timer == 0x9) {
        proc->timer = 0;
        proc->finished = true;
        Proc_Break(proc);
    }
}
