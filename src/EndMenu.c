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

struct Proc* EndMenu(struct MenuProc* proc)
{
    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];

    proc->state |= MENU_STATE_ENDING;

    if (item->def->onSwitchOut)
        item->def->onSwitchOut(proc, item);

    if (proc->def->onEnd)
        proc->def->onEnd(proc);

    if (proc->state & MENU_STATE_GAMELOCKING)
        UnlockGame();

    Proc_End(proc);

    BG_SetPosition(proc->frontBg, 0, 0);
    BG_SetPosition(proc->backBg, 0, 0);

    return proc->proc_parent;
}
