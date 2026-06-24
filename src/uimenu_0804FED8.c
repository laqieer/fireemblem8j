#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "proc.h"
#include "bm.h"
#include "bmio.h"
#include "uiutils.h"
#include "statscreen.h"
#include "face.h"
#include "helpbox.h"
#include "uimenu.h"
#include "constants/songs.h"

//! FE8U = 0x0804EAB8
//
// JP DELTA: the MENU_ACT_CLEAR branch INLINES ClearMenuBgs here (fe8u CALLs it),
// and the inlined version uses BG_EnableSyncByMask directly where fe8u's
// ClearMenuBgs delegates to SyncMenuBgs.
void Menu_OnIdle(struct MenuProc* proc)
{
    int x, y, actions;

    if (proc->state & MENU_STATE_FROZEN)
    {
        GetMenuCursorPosition(proc, &x, &y);
        DisplayFrozenUiHand(x, y);

        return;
    }

    if (proc->state & MENU_STATE_DOOMED)
    {
        EndMenu(proc);
        return;
    }

    ProcessMenuDpadInput(proc);
    actions = ProcessMenuSelectInput(proc);

    if (actions & MENU_ACT_END)
        EndMenu(proc);

    if (actions & MENU_ACT_SND6A)
        PlaySoundEffect(SONG_SE_SYS_WINDOW_SELECT1);

    if (actions & MENU_ACT_SND6B)
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);

    if (actions & MENU_ACT_CLEAR)
    {
        BG_Fill(BG_GetMapBuffer(proc->frontBg), 0);
        BG_Fill(BG_GetMapBuffer(proc->backBg), 0);

        BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
    }

    if (actions & MENU_ACT_ENDFACE)
        EndFaceById(0);

    if (actions & MENU_ACT_DOOM)
        proc->state |= MENU_STATE_DOOMED;

    if (actions & MENU_ACT_SKIPCURSOR)
        return;

    if (proc->state & MENU_STATE_NOCURSOR)
        return;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);
}
