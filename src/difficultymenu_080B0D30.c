#include "global.h"

#include "bmsave.h"
#include "hardware.h"
#include "worldmap.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "spline.h"
#include "sysutil.h"
#include "savemenu.h"
#include "constants/songs.h"

extern struct Unknown_08A209FC gDifficultymenu_0[];

//! FE8U = 0x080AC288
void DifficultySelect_Loop_KeyHandler(struct DifficultyMenuProc * proc)
{
    s8 hasChanged = 0;

    if (gKeyStatusPtr->repeatedKeys & DPAD_UP)
    {
        if (proc->current_selection == 0)
        {
            proc->current_selection = 2;
        }
        else
        {
            proc->current_selection--;
        }

        goto changed;
    }
    else if (gKeyStatusPtr->repeatedKeys & DPAD_DOWN)
    {
        if (proc->current_selection == 2)
        {
            proc->current_selection = 0;
        }
        else
        {
            proc->current_selection++;
        }

        hasChanged = 1;
    }

    if (hasChanged != 0)
    {
    changed:
        PlaySoundEffect(SONG_SE_SYS_CURSOR_UD1);
        proc->sprites_proc->current_selection = proc->current_selection;
        DifficultyMenu_StartCursorMove(proc->sprites_proc, gDifficultymenu_0[proc->current_selection].a, gDifficultymenu_0[proc->current_selection].b);
        DrawDifficultyModeText(proc);
        DifficultySelect_PutModeText(proc);
        return;
    }

    if (proc->sprites_proc->flags_1)
        return;

    if (gKeyStatusPtr->newKeys & (A_BUTTON | START_BUTTON))
    {
        proc->unk_2c = 0;
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);
        switch (proc->current_selection) {
        case 0:
            SaveMenu_SetDifficultyChoice(0, 0);
            break;

        case 1:
            SaveMenu_SetDifficultyChoice(1, 0);
            break;

        case 2:
            SaveMenu_SetDifficultyChoice(2, 0);
            break;
        }

        Proc_Goto(proc, 1);
    }

    if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        proc->unk_2c = 0;
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        SaveMenu_SetDifficultyChoice(3, 0);
        Proc_Goto(proc, 2);
    }

    return;
}
