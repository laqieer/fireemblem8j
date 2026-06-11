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

void Menu_OnInit(struct MenuProc* proc)
{
    if (proc->def->onInit)
        proc->def->onInit(proc);

    if (proc->menuItems[proc->itemCurrent]->def->onSwitchIn)
        proc->menuItems[proc->itemCurrent]->def->onSwitchIn(proc, proc->menuItems[proc->itemCurrent]);
}
