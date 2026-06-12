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
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd sProc_MenuMain[];

void Menu_Frozen_OnLoop(struct MenuProc* proc)
{
    int x, y;

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayFrozenUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON))
        Proc_GotoScript(proc, sProc_MenuMain);
}
