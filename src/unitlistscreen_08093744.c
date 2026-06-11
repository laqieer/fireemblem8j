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
void UnitList_TogglePrepDeployState(struct UnitListScreenProc * proc);
void UnitList_ToggleSoloAnimState(struct Unit * unit, int step);
void UnitList_PutRow(struct UnitListScreenProc * proc, u8 unitNum, u16 * tm, u8 page, s8 putName);

//! FE8U = 0x0809144C
void UnitList_HandleListInput(struct UnitListScreenProc * proc)
{
    if ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0)
    {
        proc->unk_31 = 2;
    }
    else
    {
        proc->unk_31 = 1;
    }

    if ((gKeyStatusPtr->newKeys & R_BUTTON) != 0)
    {
        Proc_Goto(proc, 3);
        return;
    }

    if ((gKeyStatusPtr->newKeys & A_BUTTON) != 0)
    {
        switch (proc->mode)
        {
            case UNITLIST_MODE_PREPMENU:
                UnitList_TogglePrepDeployState(proc);

                break;

            case UNITLIST_MODE_SOLOANIM:
                UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, 1);
                UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

                break;

            case UNITLIST_MODE_FIELD:
                SetLastStatScreenUid(gSortedUnits[proc->unk_30]->unit->index);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                Proc_Break(proc);

                break;

            default:
                break;
        }

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_LEFT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_LEFT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, -1);
            UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

            return;
        }

        if (proc->page < 2)
            return;

        proc->pageTarget--;
        Proc_Goto(proc, 2);
        proc->unk_2d = 0;
        PlaySoundEffect(SONG_6F);

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_RIGHT) != 0)
    {
        if (proc->mode == UNITLIST_MODE_SOLOANIM)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_RIGHT) == 0)
                return;

            UnitList_ToggleSoloAnimState(gSortedUnits[proc->unk_30]->unit, +1);
            UnitList_PutRow(proc, proc->unk_30, gBG0TilemapBuffer, proc->page, 0);

            return;
        }

        if (proc->page < proc->unk_2e)
        {
            proc->pageTarget++;
            proc->unk_2d = 0;
            PlaySoundEffect(SONG_6F);
            Proc_Goto(proc, 2);
        }

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_UP) != 0 ||
        ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0 && (gKeyStatusPtr->newKeys2 & DPAD_UP) != 0))
    {
        if (proc->unk_30 == 0)
        {
            if ((gKeyStatusPtr->newKeys & DPAD_UP) == 0)
                return;

            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            proc->unk_29 = 3;
            return;
        }

        proc->unk_30--;
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

        if (proc->unk_2c < 2)
        {
            if (proc->unk_3e / 16 != 0)
            {
                if (proc->unk_2c == 0)
                {
                    proc->unk_30++;
                    proc->unk_2c = 1;
                }

                UnitList_PutRow(proc, proc->unk_3e / 16 - 1, gBG0TilemapBuffer, proc->page, 1);
                proc->unk_29 = 2;
                proc->unk_3e = -(proc->unk_31 * 4) + proc->unk_3e;
                BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);

                if (proc->unk_2c == 0)
                {
                    proc->unk_2c++;
                }

                return;
            }
        }

        proc->unk_2c--;

        return;
    }

    if ((gKeyStatusPtr->repeatedKeys & DPAD_DOWN) != 0 ||
        ((gKeyStatusPtr->heldKeys & L_BUTTON) != 0 && (gKeyStatusPtr->newKeys2 & DPAD_DOWN) != 0))
    {
        if (proc->unk_30 < gUnitlistscreen_8 - 1)
        {
            proc->unk_30++;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);

            if (proc->unk_2c == 4 && proc->unk_30 != gUnitlistscreen_8 - 1)
            {
                UnitList_PutRow(proc, 6 + proc->unk_3e / 16, gBG0TilemapBuffer, proc->page, 1);
                proc->unk_29 = 1;
                proc->unk_3e = proc->unk_3e + proc->unk_31 * 4;
                BG_SetPosition(0, 0, (proc->unk_3e - 0x38) & 0xFF);
                return;
            }

            proc->unk_2c++;
        }
    }

    return;
}
