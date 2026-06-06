#include "gbafe.h"

void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

/* prototypes for same-file helpers called by this run */
void Fill16_EkrTsaBuffer(u32 val);
void EkrDZ_PrepareBanimfx(struct ProcEkrDragon * proc);

void EfxDracoZombiePrepareTSA(int x, int y, s8 pos)
{
    if (pos == EKR_POS_R)
        LZ77UnCompVram(Tsa_EfxDracoZombieBaseRight, gEkrTsaBuffer);
    else
        LZ77UnCompVram(Tsa_EfxDracoZombieBaseLeft, gEkrTsaBuffer);
    
    EkrDragonTmCpyWithDistance();

    x += gEkrBgPosition;
    EkrDragonTmCpyExt(x, y);
}

void EfxDracoZombiePrepareImg(struct ProcEkrDragon * proc)
{
    Fill16_EkrTsaBuffer(0);
    EfxTmFill(0);
    BG_Fill(gBG3TilemapBuffer, 0);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    LZ77UnCompVram(Img_EfxDracoZombie, (void *)0x06008000);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    CpuFastCopy(Pal_EfxDracoZombie, PAL_BG(6), 0x20);
    EnablePaletteSync();

    CpuFastCopy(PAL_BG(4), gEkrDragonPalBackup, 0x40);
    SetEkrDragonStatusUnk1(1);
    proc->tcounter = 0;
}

void EkrDZ_MonsterFlyIntoScreen(struct ProcEkrDragon * proc)
{
    int x, y;

    if (gEkrDistanceType == EKR_DISTANCE_FARFAR) {
        EkrDZ_PrepareBanimfx(proc);
        Proc_Goto(proc, 0);
        Proc_Break(proc);
        return;
    }

    if (proc->timer == 0) {

        /* Something related to monster's bark */
        switch (gEkrDracoZombiTsaSetLut[proc->tcounter].type) {
        case 1:
            PlaySFX(0xE6, 0x100, 0x78, 0);
            break;

        case 2:
            PlaySFX(0x2E0, 0x100, 0x78, 0);
            break;

        default:
            break;
        }

        if (gEkrDracoZombiTsaSetLut[proc->tcounter].tsa == NULL) {
            proc->timer = 0;
            NewEfxFlashBgWhite(proc->anim, 0x10);
            NewEkrDragonQuakeTree3(NULL, 0x2D, 0xB);
            Proc_Break(proc);
            return;
        }

        LZ77UnCompVram(gEkrDracoZombiTsaSetLut[proc->tcounter].tsa, gEkrTsaBuffer);
        EkrDragonTmCpyWithDistance();
    }

    x = Interpolate(INTERPOLATE_LINEAR, gEkrDracoZombiTsaSetLut[proc->tcounter].lox, gEkrDracoZombiTsaSetLut[proc->tcounter + 1].lox, proc->timer, gEkrDracoZombiTsaSetLut[proc->tcounter].time);
    y = Interpolate(INTERPOLATE_LINEAR, gEkrDracoZombiTsaSetLut[proc->tcounter].loy, gEkrDracoZombiTsaSetLut[proc->tcounter + 1].loy, proc->timer, gEkrDracoZombiTsaSetLut[proc->tcounter].time);

    EkrDragonTmCpyExt(x + gEkrBgPosition, y);

    proc->timer++;
    if (proc->timer == gEkrDracoZombiTsaSetLut[proc->tcounter].time) {
        proc->timer = 0;
        proc->tcounter++;
    }
}
