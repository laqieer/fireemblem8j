#include "global.h"

#include "hardware.h"
#include "ctc.h"
#include "fontgrp.h"
#include "mu.h"
#include "bmunit.h"
#include "bmmap.h"
#include "statscreen.h"
#include "proc.h"
#include "playerphase.h"
#include "player_interface.h"
#include "helpbox.h"
#include "prepscreen.h"

#include "constants/msg.h"

//! FE8U = 0x08033558
void PrepScreenProc_StartMapMenu(struct ProcPrepSallyCursor * proc)
{
    LoadHelpBoxGfx(0, -1);
    ResetText();
    EndPlayerPhaseSideWindows();
    HideMoveRangeGraphics();

    StartPrepScreenMenu(proc);

    SetPrepScreenMenuItem(PREP_MAPMENU_VIEW_MAP, PrepMapMenu_OnViewMap, TEXT_COLOR_SYSTEM_WHITE, 0x51B, 0x54D);

    SetPrepScreenMenuItem(
        PREP_MAPMENU_FORMATION, PrepMapMenu_OnFormation,
        (PrepGetDeployedUnitAmt() != 0 ? TEXT_COLOR_SYSTEM_WHITE : TEXT_COLOR_SYSTEM_GRAY), 0x51C, 0x54E);

    SetPrepScreenMenuItem(PREP_MAPMENU_OPTIONS, PrepMapMenu_OnOptions, TEXT_COLOR_SYSTEM_WHITE, 0x51D, 0x54F);

    if (CanPrepScreenSave())
    {
        SetPrepScreenMenuItem(PREP_MAPMENU_SAVE, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_WHITE, 0x50D, 0x550);
    }
    else
    {
        SetPrepScreenMenuItem(PREP_MAPMENU_SAVE, PrepMapMenu_OnSave, TEXT_COLOR_SYSTEM_GRAY, 0x50D, 0x550);
    }

    StartPrepHelpPrompt(proc);

    SetPrepScreenMenuOnBPress(PrepMapMenu_OnBPress);
    SetPrepScreenMenuOnStartPress(PrepMapMenu_OnStartPress);
    SetPrepScreenMenuOnEnd(PrepMapMenu_OnEnd);

    DrawPrepScreenMenuFrameAt(10, 2);

    SetPrepScreenMenuSelectedItem(proc->lastCmd);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}
