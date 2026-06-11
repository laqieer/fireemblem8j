#include "gbafe.h"

void InitBanimTerrain(void *);
void EndBanimTerrain(void *);
void SetBanimTerrainPos(void *, s16, s16, s16, s16);





/* prototypes for same-file helpers called by this run */
int CheckEkrWpnDemonLight(struct Anim * anim);

void EkrDK_CustomBgFadeIn(struct ProcEkrDragon * proc)
{
    EfxChapterMapFadeOUT(Interpolate(INTERPOLATE_SQUARE, 4, 0x10, proc->timer, 8));
    if (++proc->timer == 0x9) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void Fill16_EkrTsaBuffer_(u32 val)
{
    int i;
    u32 tmp, *buf;

    val = (val << 0x10);
    buf = (u32 *)gEkrTsaBuffer;
    tmp = val | val >> 0x10;

    for (i = 0; i < 0x400; i++)
        *buf++ = tmp;
}

void EkrDK_BgMovement(struct ProcEkrDragon * proc)
{
    int val1 = Interpolate(INTERPOLATE_RCUBIC, -0x20, 0, proc->tcounter, 0x78);
    int val2 = Interpolate(INTERPOLATE_RCUBIC, -0x50, 0, proc->tcounter, 0x78);

    EkrDragonTmCpyExt(gEkrBgPosition + val1, val2);
    
    if (proc->tcounter == 0x78) {
        Proc_Break(proc);
    } else
        proc->tcounter++;
}

void EkrDK_PrepareBanimfx(struct ProcEkrDragon * proc)
{
    if (CheckEkrWpnDemonLight(proc->anim) != false)
        EkrPrepareBanimfx(proc->anim, 0xC2);    /* index for DK Ravager in banim table */
    else
        EkrPrepareBanimfx(proc->anim, 0xC1);    /* index for DK Demon Light in banim table */
    
    SetAnimStateUnHidden(GetAnimPosition(proc->anim));
    gEkrSpellAnimIndex[0] = 0x40;
    AddEkrDragonStatusAttr(proc->anim, EKRDRGON_ATTR_BANIMFX_PREPARED);
    Proc_Break(proc);
}

void PrepareDemonKingBGFx(struct ProcEkrDragon * proc)
{
    Fill16_EkrTsaBuffer_(1);
    EfxTmFill(0x60016001);
    BG_Fill(gBG3TilemapBuffer, 1);
    BG_EnableSyncByMask(BG3_SYNC_BIT);
    Decompress(Img_DemonKingBG, (void *)0x06008000);
    Decompress(Tsa_DemonKingBG1, gEkrTsaBuffer);
    EkrDragonTmCpyWithDistance();
    EkrDragonTmCpyExt(gEkrBgPosition - 0x20, -0x50);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 2;
    gLCDControlBuffer.bg2cnt.priority = 3;

    SetBlackPal(0x6);

    /* Setup palette fade in process */
    StartPalFade(Pal_DemonKingBG, 6, 0x78, proc);

    SetEkrDragonStatusUnk1(1);
    proc->tcounter = 0;
}
