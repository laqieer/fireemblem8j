#include "global.h"
#include "proc.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "ekrlevelup.h"
#include "hardware.h"
#include "mapanim.h"
#include "ctc.h"
#include "bmlib.h"

extern EWRAM_OVERLAY(banim) int gEkrBg2ScrollFlip;
extern EWRAM_OVERLAY(banim) u16 * gpBg2ScrollOffsetStart;
extern EWRAM_OVERLAY(banim) u16 * gpBg2ScrollOffset;
extern EWRAM_OVERLAY(banim) u16 gpBg2ScrollOffsetTable1[160];
extern EWRAM_OVERLAY(banim) u16 gpBg2ScrollOffsetTable2[160];

extern EWRAM_OVERLAY(banim) int gEkrBg1ScrollFlip;
extern EWRAM_OVERLAY(banim) u16 * gpBg1ScrollOffsetStart;
extern EWRAM_OVERLAY(banim) u16 * gpBg1ScrollOffset;
extern EWRAM_OVERLAY(banim) u16 gpBg1ScrollOffsetList1[160];
extern EWRAM_OVERLAY(banim) u16 gpBg1ScrollOffsetList2[160];



extern CONST_DATA struct ProcCmd ProcScr_EfxPartsofScroll[];

void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain)
{
    u8 * img = Img_EkrLvupNumBig;
    register int chr asm("r4");
    int chr_this_stat;

    chr = (stat_num - 1) * 2;

    chr_this_stat = chr;
    if (chr < 0)
        chr_this_stat = -chr;

    VramCopy(img + OAM2_CHR(chr_this_stat) * CHR_SIZE,
        OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);

    chr_this_stat = chr >= 0 ? chr : -chr;
    VramCopy(img + OAM2_CHR((chr_this_stat) + 0x20) * CHR_SIZE,
        OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
}
