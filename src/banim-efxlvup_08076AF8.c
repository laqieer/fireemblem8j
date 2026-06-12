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

ProcPtr NewEfxleveluphb(void)
{
    u32 i;
    struct ProcEfx * proc;
    u16 * buf;
    struct ProcCmd * v;

    gEfxBgSemaphore++;

    buf = gpBg2ScrollOffsetTable1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg2ScrollOffsetTable2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg1ScrollOffsetList1;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    buf = gpBg1ScrollOffsetList2;
    for (i = 0; i < 0xA0; i++)
        *buf++ = 0;

    gEkrBg2ScrollFlip = 0;
    v = ProcScr_Efxleveluphb; // by permuter

    gEkrBg1ScrollFlip = 0;
#ifndef NONMATCHING
    asm("":::"v7"); // by me
#endif
    buf = gpBg2ScrollOffsetTable1;
    gpBg2ScrollOffsetStart = buf;
    buf = gpBg1ScrollOffsetList1;
    gpBg1ScrollOffsetStart = buf;
    buf = gpBg2ScrollOffsetStart;
    gpBg2ScrollOffset = buf;
    buf = gpBg1ScrollOffsetStart;
    gpBg1ScrollOffset = buf;

    proc = Proc_Start(v, PROC_TREE_VSYNC);
    proc->timer = 0;
    return proc;
}
