#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void EkrDZ_ReloadCustomBg(struct ProcEkrDragon * proc)
{
    int val;

    if (CheckEkrDragonSkipTransfer(proc->anim) == true) {
        BG_Fill(gBG3TilemapBuffer, 0x6000);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        EfxPalBlackInOut(PAL_BG(0), 6, 1, 0x10);
        EnablePaletteSync();
        SetEkrDragonStatusUnk1(0);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        Proc_Break(proc);
        return;
    }

    val = Interpolate(INTERPOLATE_RSQUARE, 0, 0x10, proc->timer, 8);
    CpuFastCopy(Pal_EfxDracoZombie, PAL_BG(6), 0x20);
    EfxPalBlackInOut(PAL_BG(0), 6, 1, val);

    switch (gEkrDistanceType) {
    case EKR_DISTANCE_CLOSE:
        CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x40);
        EfxPalBlackInOut(PAL_BG(0), 4, 2, val);
        break;

    case EKR_DISTANCE_FAR:
        CpuFastCopy(gEkrDragonPalBackup, PAL_BG(4), 0x20);
        EfxPalBlackInOut(PAL_BG(0), 4, 1, val);
        break;

    default:
        break;
    }

    EnablePaletteSync();
    
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        gBanimValid[GetAnimPosition(proc->anim)] = false;
        BG_Fill(gBG3TilemapBuffer, 0x6000);
        BG_EnableSyncByMask(BG3_SYNC_BIT);
        SetEkrDragonStatusUnk1(0);

        gLCDControlBuffer.bg0cnt.priority = 0;
        gLCDControlBuffer.bg1cnt.priority = 1;
        gLCDControlBuffer.bg2cnt.priority = 2;
        gLCDControlBuffer.bg3cnt.priority = 3;

        Proc_Break(proc);
    }
}
