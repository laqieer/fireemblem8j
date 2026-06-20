#include "global.h"

#include "bmunit.h"
#include "prepscreen.h"
#include "ctc.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"
#include "statscreen.h"
#include "mu.h"
#include "uiutils.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "bmreliance.h"
#include "hardware.h"
#include "bm.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "sio.h"

#include "unitlistscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct SortedUnitEnt gSortedUnitsBuf[0x40];
extern EWRAM_OVERLAY(0) struct SortedUnitEnt * gSortedUnits[0x40];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_0[0x20][0x20];
extern EWRAM_OVERLAY(0) u16 gUnitlistscreen_1[2][0x20];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_8;
extern EWRAM_OVERLAY(0) u32 gUnitlistscreen_9[8]; // equipped item icons

// clang-format off











/* prototypes for same-file helpers called by this run */
void UnitList_DrawSortLabel(u8 key);
void UnitList_DrawColumnNames(u16 * tm, u8 page);
void UnitList_DrawPageHeader(u8 maxPages, u8 page, int drawColumnNames);
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);

//! FE8U = 0x08091D54
void UnitList_PageChangeOut_Loop(struct UnitListScreenProc * proc)
{
    int i;
    int r4;
    u8 r1;

    proc->unk_38 += gUnitlistscreen_10[proc->unk_3c];

    if (proc->unk_38 > 20)
    {
        proc->unk_38 = 20;
    }

    proc->unk_3c++;

    for (i = 0; i < 20; i++)
    {
        if (proc->pageTarget > proc->page)
        {
            if (i + proc->unk_38 > 20)
            {
                r1 = 0;
            }
            else
            {
                r1 = i + proc->unk_38 + 8;
            }
        }
        else
        {
            if (i < proc->unk_38)
            {
                r1 = 0;
            }
            else
            {
                r1 = i - proc->unk_38 + 8;
            }
        }

        for (r4 = proc->unk_3e / 8; r4 < 12 + proc->unk_3e / 8; r4++)
        {
            int off = 8 + (r4 & 0x1F) * 0x20;
            gBG0TilemapBuffer[off + i] = gUnitlistscreen_0[r4 & 0x1F][r1];
        }

        for (r4 = 0; r4 < 2; r4++)
        {
            int off = 0xA8 + r4 * 0x20;
            gBG2TilemapBuffer[off + i] = gUnitlistscreen_1[r4][r1];
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG2_SYNC_BIT);

    if (proc->unk_38 < 20)
    {
        return;
    }

    proc->page = proc->pageTarget;

    TileMap_FillRect(gBG2TilemapBuffer + 0x150 / 2, 0x16, 1, 0);
    TileMap_FillRect(gBG0TilemapBuffer + 0x10 / 2, 0x16, 0x1F, 0);

    for (r4 = 0; r4 < 20; r4++)
    {
        gUnitlistscreen_9[r4] = UINT8_MAX;
    }

    ResetIconGraphics();
    UnitList_DrawSortLabel(proc->unk_32);

    for (r4 = proc->unk_3e / 16; r4 < proc->unk_3e / 16 + 6 && r4 < gUnitlistscreen_8; r4++)
    {
        UnitList_PutRow(proc, r4, gUnitlistscreen_0[0], proc->page, 0);
    }

    UnitList_DrawColumnNames(gUnitlistscreen_1[0], proc->page);
    UnitList_DrawPageHeader(proc->unk_2e, proc->page, 0);

    proc->unk_38 = 0;
    proc->unk_3c = 0;

    Proc_Break(proc);

    return;
}
