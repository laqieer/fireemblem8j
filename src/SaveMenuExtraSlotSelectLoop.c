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

//! FE8U = 0x080A9E1C
void SaveMenuExtraSlotSelectLoop(struct SaveMenuProc * proc)
{

    proc->jump_label = PL_SAVEMENU_SAVE_SLOT_SEL;

    if (proc->cursor_config == 0)
    {
        if (gKeyStatusPtr->newKeys & DPAD_UP)
            SaveMenuTryMoveExtraSlotCursor(proc, -1);
        else if (gKeyStatusPtr->newKeys & DPAD_DOWN)
            SaveMenuTryMoveExtraSlotCursor(proc, 1);
    }
    else if (gKeyStatusPtr->newKeys & DPAD_LEFT)
    {
        if (proc->cursor_config != 1)
        {
            proc->cursor_config = 1;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        }
    }
    else if (gKeyStatusPtr->newKeys & DPAD_RIGHT)
    {
        if (proc->cursor_config != 2) {
            proc->cursor_config = 2;
            PlaySoundEffect(SONG_SE_SYS_CURSOR_LR1);
        }
    }

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        switch (proc->extra_sel_bitfile) {
        case EXTRA_MENU_OPTION_6:
            if (((proc->unk_3a[proc->sus_slot]) & 1) != 0)
            {
                if (proc->sus_slot_cur != (u8)-1)
                {
                    ExecSaveMenuMiscOption(proc);
                    return;
                }

                ReadGameSave(proc->sus_slot);
                Proc_Goto(proc, PL_SAVEMENU_EXEC_EXTRA_MISC_OPTION);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }

            StartSaveMenuPopupHelpBox(0x40, 0x30, 0x82F, proc); // TODO: msgid "This data[.][NL]can't be used[.][NL]on a trial map.[.]"

            return;

        case EXTRA_MENU_OPTION_BONUS_CLAIM:
            if (((proc->unk_3a[proc->sus_slot]) & 2) != 0)
            {
                if (proc->sus_slot_cur != (u8)-1)
                {
                    ExecSaveMenuMiscOption(proc);
                    return;
                }

                ReadGameSave(proc->sus_slot);
                Proc_Goto(proc, PL_SAVEMENU_EXEC_EXTRA_MISC_OPTION);
                PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                return;
            }

            StartSaveMenuPopupHelpBox(0x2e, 0x38, 0x82E, proc); // TODO: msgid "Send data from[NL]Chapter 2+"

            return;

        case EXTRA_MENU_OPTION_MAP:
            if (((proc->unk_3a[proc->sus_slot]) & 4) != 0)
            {
                if (proc->sus_slot_cur == (u8)-1) {
                    ReadGameSave(proc->sus_slot);
                    SaveMenu_NewGame(proc);
                    PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
                    return;
                }

                ExecSaveMenuMiscOption(proc);
                return;
            }

            StartSaveMenuPopupHelpBox(0x2e, 0x38, 0x835, proc); // TODO: msgid "Select cleared save data.[.]"
            return;

        default:
            return;
        }

    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

        if (proc->cursor_config != 0)
        {
            SaveMenuDrawSubSelBox(proc, 0);
            SaveMenuHandleHelpBox(proc);
            return;
        }

        Decompress(Img_GameMainMenuObjs, OBJ_VRAM0 + OBJCHR_SAVEMENU_MAINCHOICE_STR * TILE_SIZE_4BPP);
        proc->scroll_cnt = 0;
        Proc_Goto(proc, PL_SAVEMENU_13);
        return;
    }
}
