#include "global.h"
#include "proc.h"
#include "hardware.h"
#include "hardware.h"
#include "bm.h"
#include "gba_sprites.h"
#include "bmlib.h"
#include "uiutils.h"
#include "ctc.h"

#include "worldmap.h"
#include "constants/worldmap.h"



/* prototypes for same-file helpers called by this run */
ProcPtr StartGmapRmBaPalAnim1(ProcPtr parent);
void EndGmapRmBaPalAnim1(void);
void GmapRmBorder1_PutSprite2(struct ProcGmapRmBorder1 * proc, int x, int y, bool transparency);

void GmapRmBorder1_NationMergeIn(struct ProcGmapRmBorder1 * proc)
{
    int offset, x, y;

    if (++proc->timer < 22)
    {
        u32 coeff = _DivArm1(proc->timer, 22, 2);
        int ret = DivArm(0x1000, coeff * 0x10);

        SetBlendConfig(0, ret, 0x10 - ret, 0);
        offset = DivArm(0x1000, (0x1000 - coeff) * 18);

        x = GfxSet_WmNationMap[proc->index].x + offset;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 1);
    }
    else
    {
        SetBlendConfig(0, 0x10, 0x10, 0);
        proc->timer = 0;

        x = GfxSet_WmNationMap[proc->index].x;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 0);
        Proc_Break(proc);
    }
}

void GmapRmBorder1_1(struct ProcGmapRmBorder1 * proc)
{
    if (CountProcs(ProcScr_GmapRmBorder1) == 1)
        EndGmapRmBaPalAnim1();
}

void GmapRmBorder1_NationMergeOut(struct ProcGmapRmBorder1 * proc)
{
    int offset, x, y;

    if (++proc->timer < 22)
    {
        u32 coeff = _DivArm1(proc->timer, 22, 2);
        int ret = DivArm(0x1000, coeff * 0x10);

        SetBlendConfig(0, 0x10 - ret, ret, 0);
        offset = DivArm(0x1000, coeff * 18);

        x = GfxSet_WmNationMap[proc->index].x - offset;
        y = GfxSet_WmNationMap[proc->index].y;

        GmapRmBorder1_PutSprite2(proc, x, y, 1);
    }
    else
    {
        SetDefaultColorEffects();
        Proc_Break(proc);
    }
}

void GmapRmBorder1_2(struct ProcGmapRmBorder1 * proc)
{
    if (CountProcs(ProcScr_GmapRmBorder1) <= 1)
    {
        StartGmapRmBaPalAnim1(NULL);
        Proc_Goto(proc, 1);
    }
}
