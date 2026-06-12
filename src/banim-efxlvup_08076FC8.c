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

void NewEkrLvupApfx(int chr, int pal)
{
    int pal_bank;
    const u16 * pal_src;
    struct ProcEkrLvupApfx * proc;

    Decompress(Img_ManimLevelUpStatGain, OBJ_VRAM0 + OAM2_CHR(chr) * CHR_SIZE);

    pal_src = Pal_ManimLevelUp;
    pal_bank = pal + 0x10;
    ApplyPalette(pal_src, pal + 0x10);

    pal_bank = pal + 0x11;
    ApplyPalette(pal_src, pal_bank);

    proc = Proc_Start(ProcScr_EkrLvupApfx, PROC_TREE_3);
    proc->pal = pal;
    gEkrLvupApfxUnexist = false;
}
