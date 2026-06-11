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
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);

//! FE8U = 0x080911E4
void UnitList_DeployUnit(struct Unit * unit, struct UnitListScreenProc * proc)
{
    int i;

    if (proc->allyCount > proc->deployedCount)
    {
        unit->state &= ~(US_UNSELECTABLE | US_NOT_DEPLOYED);

        RegisterSioPid(unit->pCharacterData->number);

        for (i = proc->unk_3e / 16; i < (proc->unk_3e / 16) + 6 && i < gUnitlistscreen_8; i++)
        {
            UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
        }

        proc->deployedCount++;
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
    }
    else
    {
        PlaySoundEffect(SONG_6C);
    }

    return;
}
