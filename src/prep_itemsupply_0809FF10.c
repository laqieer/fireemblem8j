#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"



/* prototypes for same-file helpers called by this run */
void PrepItemSupply_StartPromptText(int idx, ProcPtr proc);
void PrepItemSupply_DrawGiveTakeText(struct PrepItemSupplyProc * proc);

//! FE8U = 0x0809DC70
void PrepItemSupply_EnterGiveTakeMenu(struct PrepItemSupplyProc * proc)
{
    PrepItemSupply_StartPromptText(0, proc);
    ClearUiCursorHandConfig(0);
    PrepItemSupply_DrawGiveTakeText(proc);
    ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
    Proc_End(GetParallelWorker(PutGiveSprites));
    Proc_End(GetParallelWorker(PutTakeSprites));
    StartParallelWorker(PutGiveTakeBoxSprites, proc);
    BG_EnableSyncByMask(7);
    return;
}

//! FE8U = 0x0809DCD4
void PrepItemSupply_Loop_GiveTakeKeyHandler(struct PrepItemSupplyProc * proc)
{
    int idx = proc->unk_33;

    if (proc->unk_38 == 0) {
        if (gKeyStatusPtr->newKeys & A_BUTTON) {
            switch (idx) {
                case 0:
                    if ((GetConvoyItemCount_() < CONVOY_ITEM_COUNT) && (GetUnitItemCount(proc->unit) > 0)) {
                        SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                        Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                        StartParallelWorker(PutGiveSprites, proc);
                        PrepItemSupply_StartPromptText(1, proc);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 3);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);
                    break;
                case 1:
                    if (GetUnitItemCount(proc->unit) < UNIT_ITEM_COUNT) {
                        SetUiCursorHandConfig(0, 68, proc->unk_33 * 16 + 36, 2);
                        Proc_End(GetParallelWorker(PutGiveTakeBoxSprites));
                        StartParallelWorker(PutTakeSprites, proc);
                        PrepItemSupply_StartPromptText(2, proc);
                        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                        Proc_Goto(proc, 4);
                        return;
                    }

                    PlaySoundEffect(SONG_6C);
                    break;
            }
            return;
        }

        if (gKeyStatusPtr->newKeys & B_BUTTON) {
            Proc_Goto(proc, 8);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            return;
        }

        if (gKeyStatusPtr->newKeys & R_BUTTON) {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[idx]);
            proc->unk_38 = 1;
            return;
        }
    } else {
        if (gKeyStatusPtr->newKeys & (R_BUTTON | B_BUTTON)) {
            CloseHelpBox();
            proc->unk_38 = 0;
            return;
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP) {
        if (proc->unk_33 != 0) {
            proc->unk_33--;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_UP) {
                proc->unk_33 = 1;
            }
        }
    }

    if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN) {
        if (proc->unk_33 == 0) {
            proc->unk_33++;
        } else {
            if (gKeyStatusPtr->newKeys & DPAD_DOWN) {
                proc->unk_33 = 0;
            }
        }
    }

    if (idx != proc->unk_33) {
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        ShowSysHandCursor(68, proc->unk_33 * 16 + 36, 4, 0x400);
        if (proc->unk_38 != 0) {
            StartHelpBox(68, proc->unk_33 * 16 + 36, gSupplyHelpTextIndexLookup[proc->unk_33]);
        }
    }
    return;
}
