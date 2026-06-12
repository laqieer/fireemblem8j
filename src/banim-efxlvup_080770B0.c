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

void PutEkrLvupStatGainLabelGfx2(int chr, int stat_gain)
{
    int chr_this_stat;
    int chr_this_stat_2;
    u8 * img1;
    u8 * img2;

    img1 = Img_ManimLevelUpStatGainDigits;
    img2 = Img_EkrLvupNumBig;

    if (chr >= 0)
    {
        VramCopy(img2 + 0x18 * CHR_SIZE,
            OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);

        VramCopy(img2 + 0x38 * CHR_SIZE,
            OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
    }
    else
    {
        VramCopy(img2 + 0x1A * CHR_SIZE,
            OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2C) << 5), 2 * CHR_SIZE);

        VramCopy(img2 + 0x3A * CHR_SIZE,
            OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4C) << 5), 2 * CHR_SIZE);
    }

    chr_this_stat = chr >= 0 ? chr : -chr;
    VramCopy(img1 + OAM2_CHR(chr_this_stat) * CHR_SIZE,
        OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x2D) << 5), CHR_SIZE);

    chr_this_stat_2 = chr >= 0 ? chr : -chr;
    VramCopy(img1 + OAM2_CHR((chr_this_stat_2) + 0x20) * CHR_SIZE,
        OBJ_VRAM0 + (OAM2_CHR(stat_gain + 0x4D) << 5), CHR_SIZE);
}
