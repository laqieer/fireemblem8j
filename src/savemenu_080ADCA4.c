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

extern u16 gEndingTmScratchA[];



// TODO: Implicit declaration
int LoadBonusContentData(void *);

/* prototypes for same-file helpers called by this run */
void SaveMenu_NewGame(ProcPtr proc);
void SaveMenuHandleHelpBox(struct SaveMenuProc * proc);
void SaveMenuWriteNewGame(struct SaveMenuProc * proc);

//! FE8U = 0x080A9290
void ExecSaveMenuMiscOption(struct SaveMenuProc * proc)
{
    if (proc->cursor_config == 0)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

        switch (proc->main_sel_bitfile) {
        case MAIN_MENU_OPTION_COPY:
            if (proc->cursor_slot == (u8)-1)
            {
                proc->cursor_slot = proc->sus_slot;
                SaveMenuTryMoveSaveSlotCursor(proc, 1);
                return;
            }

            CopyGameSave(proc->cursor_slot, proc->sus_slot);
            Proc_Goto(proc, PL_SAVEMENU_SLOT_SELECTED);
            return;

        case MAIN_MENU_OPTION_ERASE:
            proc->cursor_config = 2;
            SaveMenuDrawSubSelBox(proc, 1);
            break;

        case MAIN_MENU_OPTION_INVALID:
            proc->cursor_config = 1;
            SaveMenuDrawSubSelBox(proc, 1);
            break;

        case MAIN_MENU_OPTION_RESTART:
        case MAIN_MENU_OPTION_EXTRAS:
        case MAIN_MENU_OPTION_NEW_GAME:
            proc->cursor_config = 2;
            SaveMenuDrawSubSelBox(proc, 1);
            break;
        }

        SaveMenuHandleHelpBox(proc);
        return;
    }

    switch (proc->main_sel_bitfile) {
    case MAIN_MENU_OPTION_EXTRAS:
        if (proc->cursor_config == 1)
        {
            proc->unk_44 = 0xf0;

            ReadGameSave(proc->sus_slot);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

            if (proc->extra_sel_bitfile != EXTRA_MENU_OPTION_MAP)
            {
                if (proc->extra_sel_bitfile == EXTRA_MENU_OPTION_BONUS_CLAIM)
                    Proc_Goto(proc, PL_SAVEMENU_EXEC_EXTRA_MISC_OPTION);

                break;
            }
            SaveMenu_NewGame(proc);
        }
        else
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }

        break;

    case MAIN_MENU_OPTION_RESTART:
        if (proc->cursor_config == 1)
        {
            proc->unk_44 = 0xf0;
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
            SaveMenu_NewGame(proc);
        }
        else
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
        break;

    case MAIN_MENU_OPTION_NEW_GAME:
        if (proc->cursor_config == 1)
        {
            SaveMenuWriteNewGame(proc);
            Proc_Goto(proc, PL_SAVEMENU_SLOT_SELECTED);
            PlaySoundEffect(SONG_60);
        }
        else
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
        break;

    case MAIN_MENU_OPTION_ERASE:
        if (proc->cursor_config == 1)
        {
            InvalidateGameSave(proc->sus_slot);
            Proc_Goto(proc, PL_SAVEMENU_SLOT_SELECTED);
            PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        }
        else
        {
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }

        break;

    case MAIN_MENU_OPTION_INVALID:
        if (proc->cursor_config == 1)
        {
            WriteGameSave(proc->sus_slot);
            Proc_Goto(proc, PL_SAVEMENU_SLOT_SELECTED);
            PlaySoundEffect(SONG_60);
        }
        else
        {
            Proc_Goto(proc, PL_SAVEMENU_EXIT_FADE);
            proc->main_sel_bitfile |= MAIN_MENU_OPTION_EXIT;
            PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        }
        break;
    }

    SaveMenuDrawSubSelBox(proc, 0);
    SaveMenuHandleHelpBox(proc);
}
