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
void UnitList_ClearUnusedEquipIcons(u16 arg_0);
void UnitList_HandleListInput(struct UnitListScreenProc * proc);
void UnitList_HandleSortInput(struct UnitListScreenProc * proc);

//! FE8U = 0x08091AEC
void UnitList_Loop(struct UnitListScreenProc * proc)
{
    int prev = proc->unk_2d;

    if (((gKeyStatusPtr->newKeys & B_BUTTON) != 0) && (proc->helpActive == 0))
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        SetLastStatScreenUid(0);
        Proc_Break(proc);
        return;
    }

    switch (proc->unk_29)
    {
        case 0:
            UnitList_HandleListInput(proc);
            break;

        case 3:
            UnitList_HandleSortInput(proc);
            break;

        case 1:
            proc->unk_3e += 4 * proc->unk_31;
            BG_SetPosition(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                UnitList_ClearUnusedEquipIcons(proc->unk_3e);
            }

            break;

        case 2:
            proc->unk_3e += -(4 * proc->unk_31);
            BG_SetPosition(0, 0, (proc->unk_3e - 56) & 0xFF);

            if ((proc->unk_3e % 0x10) == 0)
            {
                proc->unk_29 = 0;
                UnitList_ClearUnusedEquipIcons(proc->unk_3e);
            }

            break;
    }

    if ((proc->helpActive != 0) && (prev != proc->unk_2d))
    {
        StartHelpBox(
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].xColumn, 40,
            gUnitListScreenFields[proc->pageTarget][proc->unk_2d].helpTextId);
    }

    return;
}
