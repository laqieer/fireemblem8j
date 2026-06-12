extern int PutGuideCategoryName();
#include "global.h"
#include "eventinfo.h"
#include "bmshop.h"
#include "fontgrp.h"
#include "ctc.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmlib.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "bm.h"
#include "bmguide.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct GuideSt * gGuideSt;
extern struct ProcCmd gProcScr_GuideEntryListRedraw_Down[];

//! FE8U = 0x080CE858
void GuideList_ScrollDown(ProcPtr proc, int b)
{
    struct GuideProc * child;
    int ix;
    int iy;
    register int hm asm("r9") = b;

    int off = 0xa0;

    switch (gGuideSt->state)
    {
        case GUIDE_STATE_0:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 8; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x02] = gBG1TilemapBuffer[ix + off + 0x42];
                    gBG1TilemapBuffer[ix + off + 0x22] = gBG1TilemapBuffer[ix + off + 0x62];
                }
                off = off + 0x40;
            }

            PutGuideCategoryName(hm, hm % 6, 15);

            break;

        case GUIDE_STATE_1:
            for (iy = 0; iy < 5; iy++)
            {
                for (ix = 0; ix < 19; ix++)
                {
                    gBG1TilemapBuffer[ix + off + 0x0a] = gBG1TilemapBuffer[ix + off + 0x4a];
                    gBG1TilemapBuffer[ix + off + 0x2a] = gBG1TilemapBuffer[ix + off + 0x6a];
                }
                off = off + 0x40;
            }

            child = Proc_Start(gProcScr_GuideEntryListRedraw_Down, proc);
            child->unk_34 = hm;
    }

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    return;
}
