#include "global.h"
#include "gbafe.h"



void ModDec(s16 val, u16 buf[]);

void NewEkrGauge(void)
{
    u32 i, j;

    gpProcEkrGauge = Proc_Start(ProcScr_ekrGauge, PROC_TREE_1);

    EkrGauge_Setup44(0);
    EkrGauge_Clr4C50();
    DisableEkrGauge();
    EkrGauge_ClrInitFlag();
    EkrGauge_Clr323A(gEkrBg0QuakeVec.x, gEkrBg0QuakeVec.y);

    if (gEkrGaugeHp[0] > 0x50)
        CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(0xB), 0x10 * sizeof(u16));
    else
        CpuCopy16(gBanimmisc_10 + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0xB), 0x10 * sizeof(u16));

    if (gEkrGaugeHp[1] > 0x50)
        CpuCopy16(gPalEfxHpBarPurple, PAL_OBJ(0xC), 0x10 * sizeof(u16));
    else
        CpuCopy16(gBanimmisc_10 + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0xC), 0x10 * sizeof(u16));

    gEkrGaugeHpBak[0] = -1;
    gEkrGaugeHpBak[1] = -1;

    LZ77UnCompVram(Img_EfxSideHitDmgCrit, (void *)0x6013800);
    LZ77UnCompVram(Img_EfxWTAArrow1, (void *)0x6013940);
    LZ77UnCompVram(Img_EfxWTAArrow2, (void *)0x6013D40);

    CpuFastCopy(gBanimmisc_8 + gBanimFactionPal[POS_L] * 0x10, PAL_OBJ(0x5), 0x10 * sizeof(u16));
    CpuFastCopy(gBanimmisc_8 + gBanimFactionPal[POS_R] * 0x10, PAL_OBJ(0x6), 0x10 * sizeof(u16));

    EnablePaletteSync();

    /* decode value to number for display: 998 --> 9 9 8 */
    ModDec(gEkrGaugeHit[0], &gEkrGaugeDecoder[0x0]);
    ModDec(gEkrGaugeDmg[0], &gEkrGaugeDecoder[0x3]);
    ModDec(gEkrGaugeCrt[0], &gEkrGaugeDecoder[0x6]);

    ModDec(gEkrGaugeHit[1], &gEkrGaugeDecoder[0x9]);
    ModDec(gEkrGaugeDmg[1], &gEkrGaugeDecoder[0xC]);
    ModDec(gEkrGaugeCrt[1], &gEkrGaugeDecoder[0xF]);

    CpuFastFill(0, gObjBuf_EkrSideHitDmgCrit, 0x400);

    /* value of hit & dmg & crit */
    for (i = 0; i < 6; i++) {
        for (j = 0; j < 3; j++) {
            int r4 = i * 0x40 + j * 0x10;

            CpuCopy16(
                gBanimmisc_7 + gEkrGaugeDecoder[i * 3 + j] * 0x10,
                gObjBuf_EkrSideHitDmgCrit + r4,
                0x10 * sizeof(u16));
        }
    }

    /* left side of hit & dmg & crit */
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit, (void *)0x6013A00, 0xC0 * sizeof(u16));

    /* right side of hit & dmg & crit */
    RegisterDataMove(gObjBuf_EkrSideHitDmgCrit + 0xC0, (void *)0x6013E00, 0xC0 * sizeof(u16));

    ResetIconGraphics_();
    LoadIconPalette(0, 0x1D);
    LoadIconPalette(0, 0x1E);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitLeft->weaponBefore), 0x1DC);
    LoadIconObjectGraphics(GetItemIconId(gpEkrBattleUnitRight->weaponBefore), 0x1DE);
    ApplyPalette(gPal_MiscUiGraphics, 0x10);
}
