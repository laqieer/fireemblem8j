#include "global.h"

#include "ctc.h"
#include "bmlib.h"
#include "hardware.h"
#include "ap.h"
#include "uiutils.h"
#include "rng.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmsave.h"

#include "savemenu.h"

//! FE8U = 0x080B04B4
bool SaveMenuTryMoveSaveSlotCursor(struct SaveMenuProc * proc, s8 position)
{
    int pos = position;
    s8 flag = 0;

    u8 previous = proc->sus_slot;

    switch (proc->main_sel_bitfile) {
    case MAIN_MENU_OPTION_7:
        flag = 1;
        break;

    case MAIN_MENU_OPTION_COPY:
        if (proc->cursor_slot == (u8)-1)
            flag = 1;

        break;

    case MAIN_MENU_OPTION_RESTART:
    case MAIN_MENU_OPTION_ERASE:
        flag = 1;
        break;

    case MAIN_MENU_OPTION_NEW_GAME:
        break;

    case MAIN_MENU_OPTION_RESUME:
        return 0;
    }

    if (pos >= 1)
    {
        /* up */
        if (proc->sus_slot == 2)
            proc->sus_slot = 0;
        else
            proc->sus_slot++;
    }
    else
    {
        /* down */
        if (proc->sus_slot == 0)
            proc->sus_slot = 2;
        else
            proc->sus_slot--;
    }

    if (proc->main_sel_bitfile == MAIN_MENU_OPTION_INVALID)
        return true;

    proc->sus_slot = SaveMenuModifySaveSlot(proc->sus_slot, flag, pos);
    if (previous == proc->sus_slot)
        return false;

    return true;
}
