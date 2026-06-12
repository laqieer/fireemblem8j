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

void EfxlvupbgMain(struct ProcEfxBG * proc)
{
    int ret;
    ret = EfxAdvanceFrameLut((s16 *)&proc->timer, (s16 *)&proc->frame, proc->frame_config);
    if (ret >= 0) {
        u16 ** tsa1 = proc->tsal;
        u16 ** tsa2 = proc->tsar;
        u16 ** img = proc->img;

        SpellFx_WriteBgMap(proc->anim, tsa1[ret], tsa2[ret]);
        SpellFx_RegisterBgGfx(img[ret], 0x2000);
        return;
    }

    if (ret == -1)
    {
        SpellFx_ClearBG1();
        SetDefaultColorEffects_();
        Proc_Break(proc);
    }
}
