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

void EobjLvup_RedrawGainLabel(struct ProcEobjLvup * proc)
{
    int oam2;
    if (proc->diff < 0)
    {
        Proc_Break(proc);
        return;
    }

    if (++proc->timer == 0xF)
    {
        proc->timer = 0;
        PutEkrLvupStatGainLabelGfx2(proc->diff, proc->chr2);
        Proc_Break(proc);
    }
}
