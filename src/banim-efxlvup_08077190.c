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

/* prototypes for same-file helpers called by this run */
void PutEkrLvupStatGainLabelGfx2(int chr, int stat_gain);

void BanimDrawStatupAp(int chr, int pal, int x, int y, int index, int gain)
{
    s32 sp14 = chr;
    int chr2 = chr + 2 * (index - 1);
#ifndef NONMATCHING
    register int _pal asm("r6") = pal << 12;
    register struct ProcEobjLvup * proc asm("r4");
#else
    int _pal = pal << 12;
    struct ProcEobjLvup * proc;
#endif
    int _chr = chr | 0x400;
    int __oam = _pal;

    if (__oam) { __oam++; __oam--; } // serialize code
    __oam |= _chr;

    NewEkrsubAnimeEmulator(x - 0x12, y - 0x04, AnimScr_LvupStatupfx1, 0, __oam, 0, PROC_TREE_5);
    if (index == 0)
        return;

    proc = Proc_Start(ProcScr_eobjLvup, PROC_TREE_3);

    if (gain >= 0)
    {
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx2, 2, __oam, 0, PROC_TREE_5);
    }
    else
    {
        int _oam = 0x400 | _pal | chr2;
        proc->child1 = NewEkrsubAnimeEmulator(x - 3, y, AnimScr_LvupStatupfx5, 2, _oam, 0, PROC_TREE_5);

        _pal |= _chr;
        proc->child2 = NewEkrsubAnimeEmulator(x, y, AnimScr_LvupStatupfx3, 2, _pal, 0, PROC_TREE_5);
        PutEkrLvupStatGainLabelGfx2(gain, chr2);
    }
    proc->x = x;
    proc->y = y;
    proc->timer = 0;
    proc->chr1 = sp14;
    proc->chr2 = chr2;
    proc->chr = chr;
    proc->pal = pal;
    proc->index = index;
    proc->diff = gain;
}
