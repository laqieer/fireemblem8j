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

void GmapRm_RemoveUnits(struct ProcGmapRm * proc)
{
    int i;

    for (i = WM_MU_2; i < WM_MU_MAX; i++)
    {
        if (gGMData.units[i].id == 0)
            continue;

        if (gGMData.units[WM_MU_0].location != gGMData.units[i].location)
            continue;

        GmMu_RemoveUnit(proc->gm_mu, i);
    }

    if (gGMData.units[WM_MU_0].state & GM_UNIT_STATE_B0)
        proc->flag |= GMAPRM_FLAG_3;
    else
        proc->flag &= ~GMAPRM_FLAG_3;

    GmHideMuUnit(GM_MU, WM_MU_0);
}

void GmapRm_DisplayLeaderUnit(struct ProcGmapRm * proc)
{
    if (proc->flag & GMAPRM_FLAG_3)
        GmShowMuUnit(GM_MU, WM_MU_0);
}

void GmapRm_1(struct ProcGmapRm * proc)
{
    UnskipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(0, 0x10, 0x10, 0);
    GmapRm_RemoveUnits(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 3;
    gLCDControlBuffer.bg2cnt.priority = 1;
    gLCDControlBuffer.bg3cnt.priority = 3;

    BG_Fill(BG_GetMapBuffer(BG_2), 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    gGMData.state.bits.state_3 = true;
}

void GmapRm_2(struct ProcGmapRm * proc)
{
    SkipGmNodeIconDisplay(GM_ICON);
    SetBlendConfig(0, 0x10, 0x10, 0);
    GmapRm_DisplayLeaderUnit(proc);

    gLCDControlBuffer.bg0cnt.priority = 0;
    gLCDControlBuffer.bg1cnt.priority = 1;
    gLCDControlBuffer.bg2cnt.priority = 3;
    gLCDControlBuffer.bg3cnt.priority = 3;

    SetDispEnable(1, 1, 1, 1, 1);
    gGMData.state.bits.state_3 = 0;
    Proc_EndEach(ProcScr_GmapRmUpdateDirect);
}

ProcPtr StartGmapRm(int x, int y, u32 mask, ProcPtr parent)
{
    struct ProcGmapRm * proc;
    if (parent)
        proc = Proc_StartBlocking(ProcScr_GmapRM, parent);
    else
        proc = Proc_Start(ProcScr_GmapRM, PROC_TREE_3);

    proc->flag = (~GMAPRM_FLAG_UNBLOCK);
    proc->flag &= mask;

    proc->x = x;
    proc->y = y;

    return proc;
}

void EndGmapRM(void)
{
    Proc_EndEach(ProcScr_GmapRM);
}

int GmapRMExists(void)
{
    return (Proc_Find(ProcScr_GmapRM) != NULL) ? true : false;
}
