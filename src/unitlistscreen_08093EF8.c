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
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_7[0x1000];
extern EWRAM_OVERLAY(0) u8 gUnitlistscreen_8;
extern EWRAM_OVERLAY(0) u32 gUnitlistscreen_9[8]; // equipped item icons

// clang-format off











/* prototypes for same-file helpers called by this run */
void UnitList_ReorderPlayerUnits(void);

//! FE8U = 0x08091C00
void UnitList_OnEnd(struct UnitListScreenProc * proc)
{
    int page;

    if (proc->mode == UNITLIST_MODE_PREPMENU)
    {
        PrepSetLatestCharId(gSortedUnits[proc->unk_30]->unit->pCharacterData->number);
        UnitList_ReorderPlayerUnits();
    }

    gPlaySt.lastUnitSortType = (proc->unk_34 << 7) + proc->unk_32;

    page = proc->page;
    if (page != 0)
    {
        page = (proc->page << 4);
        gPlaySt.unk19 &= 0xf;
        gPlaySt.unk19 |= page;
    }

    Proc_End(proc->pSpriteProc);

    if (proc->pMuralProc != NULL)
    {
        Proc_End(proc->pMuralProc);
    }

    EndGreenText();

    BG_Fill(gBG0TilemapBuffer, 0);
    BG_Fill(gBG1TilemapBuffer, 0);
    BG_Fill(gBG2TilemapBuffer, 0);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT | BG3_SYNC_BIT);

    SetWinEnable(0, 0, 0);

    ResetTextFont();
    ResetIconGraphics();

    return;
}
