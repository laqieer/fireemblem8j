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

// data







 void Menu_AutoHelpBox_OnInit(struct MenuProc* proc);
 void Menu_AutoHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_FrozenHelpBox_OnLoop(struct MenuProc* proc);



 void Menu_Frozen_OnLoop(struct MenuProc* proc);



void GetMenuCursorPosition(struct MenuProc* proc, int* xResult, int* yResult)
{
    *xResult = proc->menuItems[proc->itemCurrent]->xTile*8;
    *yResult = proc->menuItems[proc->itemCurrent]->yTile*8;

    if (proc->def->style != 0)
        *xResult -= 4;
}
