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

int ProcessMenuSelectInput(struct MenuProc* proc)
{
    int result = 0;

    struct MenuItemProc* item = proc->menuItems[proc->itemCurrent];
    const struct MenuItemDef* itemDef = item->def;

    if (itemDef->onIdle)
        result = itemDef->onIdle(proc, item);

    if (gKeyStatusPtr->newKeys & A_BUTTON)
    {
        // A Button press

        result = OverriddenMenuSelected(proc, item);

        if ((result == 0xFF) && itemDef->onSelected)
            result = itemDef->onSelected(proc, item);
    }
    else if (gKeyStatusPtr->newKeys & B_BUTTON)
    {
        // B Button press

        if (proc->def->onBPress)
            result = proc->def->onBPress(proc, item);
    }
    else if (gKeyStatusPtr->newKeys & R_BUTTON)
    {
        // R Button press

        if (proc->def->onRPress)
            proc->def->onRPress(proc);
    }

    return result;
}
