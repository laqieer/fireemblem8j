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

void GmapRm_InitNop(void)
{
    return;
}

void GmapRm_StartUpdateDirect(struct ProcGmapRm * proc)
{
    GM_SCREEN->gmroute->flags &= ~GM_ROUTE_FLAG_2;

    BG_SetPosition(BG_1, 0, 0);
    Decompress(Img_EventGmap, (void *)BG_VRAM);
    ApplyPalettes(Pal_EventGmap, 5, 4);
    Decompress(Tsa_EventGmap, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x5000);
    BG_EnableSyncByMask(BG1_SYNC_BIT);

    Proc_Start(ProcScr_GmapRmUpdateDirect, proc);
}

void GmapRm_Goto0IfFlag0(struct ProcGmapRm * proc)
{
    if (!(proc->flag & GMAPRM_FLAG_0))
        Proc_Goto(proc, GMAPRM_LABEL_0);
}

void GmapRm_Goto1IfFlag1(struct ProcGmapRm * proc)
{
    if (!(proc->flag & GMAPRM_FLAG_1))
        Proc_Goto(proc, GMAPRM_LABEL_1);
}
