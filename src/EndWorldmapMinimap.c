#include "global.h"
#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "worldmap.h"

extern struct ProcCmd ProcScr_GmapRader[];
extern struct ProcCmd ProcScr_WorldmapMinimapWrapper[];

void EndWorldmapMinimap(void)
{
    Proc_EndEach(ProcScr_GmapRader);
    Proc_EndEach(ProcScr_WorldmapMinimapWrapper);

    SetDefaultColorEffects();

    BG_Fill(gBG1TilemapBuffer, 0);
    BG_EnableSyncByMask(BG1_SYNC_BIT);
}
