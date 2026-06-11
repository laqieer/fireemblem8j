#include "global.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"
#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

//! FE8U = 0x080A9494
void SaveMenu_SaveSlotSelectLoop(struct SaveMenuProc * proc)
{
    proc->jump_label = PL_SAVEMENU_SAVE_SLOT_SEL;

    if (SaveMenuWaitHelpBoxAnim(proc))
        return;

    if (proc->cursor_config == 0)
    {
        if (gKeyStatusPtr->newKeys & DPAD_UP)
        {
            if (SaveMenuTryMoveSaveSlotCursor(proc, -1) != 0)
            {
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            }
        }
        else if (gKeyStatusPtr->newKeys & DPAD_DOWN)
        {
            if (SaveMenuTryMoveSaveSlotCursor(proc, 1) != 0)
            {
                PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
            }
        }
    }
    else if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        if (proc->cursor_config != 1)
        {
            proc->cursor_config = 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            SaveMenuHandleHelpBox(proc);
        }
    }
    else if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        if (proc->cursor_config != 2)
        {
            proc->cursor_config = 2;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
            SaveMenuHandleHelpBox(proc);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        proc->scroll_cnt = 0;

        switch (proc->main_sel_bitfile) {
        case MAIN_MENU_OPTION_RESTART:
            if (proc->sus_slot_cur != (u8)-1)
            {
                ExecSaveMenuMiscOption(proc);
                return;
            }

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            SaveMenu_NewGame(proc);
            return;

        case MAIN_MENU_OPTION_7:
            if (proc->sus_slot_cur != (u8)-1)
                proc->unk_44 = 0xf0;

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            SaveMenu_NewGame(proc);
            return;

        case MAIN_MENU_OPTION_RESUME:
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            SaveMenu_NewGame(proc);
            return;

        case MAIN_MENU_OPTION_NEW_GAME:
            if (proc->sus_slot_cur == (u8)-1)
                break;

            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            ExecSaveMenuMiscOption(proc);
            return;

        case MAIN_MENU_OPTION_COPY:
        case MAIN_MENU_OPTION_ERASE:
        case MAIN_MENU_OPTION_INVALID:
            ExecSaveMenuMiscOption(proc);
            return;

        default:
            return;
        }

        SaveMenuWriteNewGame(proc);
        Proc_Goto(proc, PL_SAVEMENU_SLOT_SELECTED);
        PlaySoundEffect(SONG_60);
        return;

    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        proc->scroll_cnt = 0;
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        if (proc->cursor_config != 0)
        {
            SaveMenuDrawSubSelBox(proc, 0);
            SaveMenuHandleHelpBox(proc);
            return;
        }

        if (proc->cursor_slot != (u8)-1)
        {
            proc->sus_slot = proc->cursor_slot;
            proc->cursor_slot = -1;
            return;
        }

        if (proc->main_sel_bitfile & (MAIN_MENU_OPTION_7 | MAIN_MENU_OPTION_INVALID))
        {
            Proc_Goto(proc, PL_SAVEMENU_EXIT_FADE);
            proc->main_sel_bitfile |= MAIN_MENU_OPTION_EXIT;
            return;
        }

        Proc_Goto(proc, PL_SAVEMENU_BACK_TO_MAIN);
    }
}
