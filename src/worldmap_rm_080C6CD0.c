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



ProcPtr StartGmapRmUpdateExt(int x0, int y0, int x1, int y1, int speed, int delay, ProcPtr parent)
{
    struct ProcGmapRmUpdate * proc;

    if (parent)
        proc = Proc_StartBlocking(ProcScr_GmapRmUpdateExt, parent);
    else
        proc = Proc_Start(ProcScr_GmapRmUpdateExt, PROC_TREE_3);

    proc->x0 = x0;
    proc->y0 = y0;
    proc->x1 = x1;
    proc->y1 = y1;
    proc->speed = speed;
    proc->delay = delay;
    return proc;
}

void EndGmapRmUpdateExt(void)
{
    Proc_EndEach(ProcScr_GmapRmUpdateExt);
}

void GmapRm_OnEnd(struct ProcGmapRm * proc)
{
    GM_SCREEN->gmroute->flags |= 4;
    GM_SCREEN->gmroute->flags |= 3;

    SkipGmNodeIconDisplay(GM_ICON);
    SetupGmapNodeGfx();

    LoadObjUIGfx();
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
    LoadLegacyUiFrameGraphics();

    gGMData.state.bits.state_3 = 0;
}
