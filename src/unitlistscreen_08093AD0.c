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
void UnitList_DrawSortLabel(u8 key);
void UnitList_ClearUnusedEquipIcons(u16 arg_0);
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);
bool SortUnitList(u8 key, u8 order);

//! FE8U = 0x080917D8
void UnitList_HandleSortInput(struct UnitListScreenProc * proc)
{
    int i;
    u8 unk_32;

    if (proc->helpActive != 0 && (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON)) != 0)
    {
        CloseHelpBox();
        proc->helpActive = 0;
        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0 && proc->helpActive == 0)
    {
        unk_32 = proc->unk_32;

        proc->unk_2a = 1;
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        proc->unk_32 = gUnitListScreenFields[proc->page][proc->unk_2d].sortKey;
        proc->unk_33 = (proc->unk_33 + 1) & 1;

        if (SortUnitList(proc->unk_32, proc->unk_33))
        {
            for (i = 0; i < 6 && i < gUnitlistscreen_8; i++)
            {
                UnitList_PutRow(proc, i, gBG0TilemapBuffer, proc->page, 1);
            }

            UnitList_ClearUnusedEquipIcons(proc->unk_3e);
            BG_EnableSyncByMask(1);
        }

        proc->unk_34 = proc->unk_33;
        proc->unk_35 = proc->unk_2d;

        if (proc->unk_32 != unk_32)
            UnitList_DrawSortLabel(proc->unk_32);

        return;
    }

    if (((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0) && proc->helpActive == 0)
    {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        proc->unk_33 = 1;
        proc->unk_29 = 0;
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 0)
        {
            if (proc->page < 2)
                return;

            if (proc->mode == UNITLIST_MODE_SOLOANIM)
                return;

            PlaySoundEffect(SONG_6F);
            proc->pageTarget--;

            for (i = 8; i > 0 && gUnitListScreenFields[proc->pageTarget][i].xColumn == 0; i--)
            {
            }

            proc->unk_2d = i;
            Proc_Goto(proc, 2);
            return;
        }

        proc->unk_2d--;
        PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        proc->unk_33 = 1;

        if (proc->unk_2d == 8 || gUnitListScreenFields[proc->page][proc->unk_2d + 1].xColumn == 0)
        {
            if (proc->page < proc->unk_2e)
            {
                if (proc->mode == UNITLIST_MODE_SOLOANIM)
                    return;

                proc->unk_2d = 0;
                PlaySoundEffect(SONG_6F);

                proc->pageTarget++;
                Proc_Goto(proc, 2);
            }
            return;
        }
        else
        {
            proc->unk_2d++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        }

        return;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0 && proc->helpActive == 0)
    {
        proc->helpActive = 1;

        StartHelpBox(
            gUnitListScreenFields[proc->page][proc->unk_2d].xColumn, 0x28,
            gUnitListScreenFields[proc->page][proc->unk_2d].helpTextId);
    }

    return;
}
