extern int AddExtraMenuOption();
extern int AddMainMenuOption();
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

//! FE8U = 0x080AB89C
void InitSaveMenuChoice(struct SaveMenuProc * proc)
{
    int i;

    int count = 0;

    proc->unk_31 = 0;
    proc->main_options = 0;

    if (proc->unk_44 == 0x100)
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESUME);

    for (i = 0; i < 3; i++)
        if (proc->chapter_idx[i] != (u8)-1)
            count++;

    if (count > 0)
    {
        AddMainMenuOption(proc, MAIN_MENU_OPTION_RESTART);

        if (count < 3)
            AddMainMenuOption(proc, MAIN_MENU_OPTION_COPY);
        AddMainMenuOption(proc, MAIN_MENU_OPTION_ERASE);
    }

    if (count < 3)
        AddMainMenuOption(proc, MAIN_MENU_OPTION_NEW_GAME);

    proc->extra_options = 0;
    proc->max_choice = 0;

    if (IsExtraLinkArenaEnabled(0) != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_LINK_ARENA);

    if (IsExtraSoundRoomEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SOUND_ROOM);

    if (IsExtraSupportViewerEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_SUPPORT);

    if (IsExtraFreeMapEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_MAP);

    if (IsExtraBonusClaimEnabled() != 0)
        AddExtraMenuOption(proc, EXTRA_MENU_OPTION_BONUS_CLAIM);

    if (proc->extra_options != 0)
    {
        proc->main_options |= MAIN_MENU_OPTION_EXTRAS;
        proc->unk_31++;
    }
}
