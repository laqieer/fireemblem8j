#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

/* prototypes for same-file helpers called by this run */
void CleanupPrepMenuScreen(ProcPtr proc);

void AtMenu_CtrlLoop(struct ProcAtMenu * proc)
{
    const int msg_list[] = {
        0x5B8,
        0x5B9,
        0x5BA,
        0x57F,
    };

    int line_old = proc->hand_pos;

    int xPos = 0x1C;
    int yPos = proc->hand_pos * 16 + 0x30;

    if (proc->do_help) {
        if ((R_BUTTON | B_BUTTON) & gKeyStatusPtr->newKeys) {
            CloseHelpBox();
            proc->do_help = 0;
            return;
        }
    } else {
        if (A_BUTTON & gKeyStatusPtr->newKeys) {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            if (2 == Prep_GetSupportItemBitIndex(proc->hand_pos, proc->unk_2F))
                ChangeBgm(SONG_BONDS, 0x100, 0x100, 0x20, NULL);

            proc->state = 4;
            Proc_Goto(proc, 8);
            return;
        }

        if (R_BUTTON & gKeyStatusPtr->newKeys) {
            proc->do_help = 1;
           StartHelpBox(xPos, yPos, msg_list[Prep_GetSupportItemBitIndex(proc->hand_pos, proc->unk_2F)]);
            return;
        }

        if (B_BUTTON & gKeyStatusPtr->newKeys) {
            CleanupPrepMenuScreen(proc);
            Decompress(gUnkData_67, gGenericBuffer);
            CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 0x10, 2), gGenericBuffer, 0x1000);
            Decompress(gUnkData_68, gGenericBuffer);
            CallARM_FillTileRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 1, 6), gGenericBuffer, 0x1000);

            SetPrepScreenMenuPosition(1, 6);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
            Proc_Break(proc);
            return;
        }
    }

    if (DPAD_UP & gKeyStatusPtr->repeatedKeys) {
        if (proc->hand_pos)
            proc->hand_pos = proc->hand_pos - 1;
        else if (DPAD_UP & gKeyStatusPtr->newKeys) {
            proc->hand_pos = Prep_CountSupportMenuItems(proc->unk_2F) - 1;
        }
    }

    if (DPAD_DOWN & gKeyStatusPtr->repeatedKeys) {
        if (proc->hand_pos < (Prep_CountSupportMenuItems(proc->unk_2F) - 1))
            proc->hand_pos = proc->hand_pos + 1;
        else if (DPAD_DOWN & gKeyStatusPtr->newKeys)
            proc->hand_pos = 0;
    }

    if (line_old != proc->hand_pos) {
        yPos = proc->hand_pos * 16 + 0x30;

        if (proc->do_help)
            StartHelpBox(xPos, yPos, msg_list[Prep_GetSupportItemBitIndex(proc->hand_pos, proc->unk_2F)]);

        ShowSysHandCursor(xPos, yPos, 7, 0x400);
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
    }
}
