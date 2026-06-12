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
void PutEkrLvupStatGainLabelGfx1(int stat_num, int stat_gain);

void EobjLvup_SpawnArrowAndLabel(struct ProcEobjLvup * proc)
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

        {
            int _pal = proc->pal << 12;
            int _chr = proc->chr2;
            int _lay = 0x400;
            oam2 = _pal | (_chr | _lay);
        }

        proc->child1 = NewEkrsubAnimeEmulator(
            proc->x - 3,
            proc->y,
            AnimScr_LvupStatupObj,
            2,
            oam2,
            0,
            PROC_TREE_3
        );
        PutEkrLvupStatGainLabelGfx1(proc->diff, proc->chr2);
        Proc_Break(proc);
    }
}
