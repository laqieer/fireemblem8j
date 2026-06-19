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



extern struct ProcCmd sProc_Menu[];
extern struct ProcCmd sProc_MenuItem[];

struct MenuProc* StartMenuCore(
    const struct MenuDef* def,
    struct MenuRect rect,
    int backBg,
    int tileref,
    int frontBg,
    int unk,
    ProcPtr parent)
{
    struct MenuProc* proc;
    int i, itemCount;

    int xTileInner = rect.x + 1;
    int yTileInner = rect.y + 1;

    BG_SetPosition(frontBg, 0, 0);
    BG_SetPosition(backBg, 0, 0);

    PlaySoundEffect(SONG_68);

    if (parent)
    {
        proc = Proc_StartBlocking(sProc_Menu, parent);
        proc->state = 0;
    }
    else
    {
        LockGame();

        proc = Proc_Start(sProc_Menu, PROC_TREE_3);
        proc->state = MENU_STATE_GAMELOCKING;
    }

    if (rect.h < 0)
        proc->state |= MENU_STATE_NOTSHOWN;

    for (i = 0, itemCount = 0; def->menuItems[i].isAvailable; ++i)
    {
        int availability = OverriddenMenuAvailability(&def->menuItems[i], i);

        if (!availability)
            availability = def->menuItems[i].isAvailable(&def->menuItems[i], i);

        if (availability != MENU_NOTSHOWN)
        {
            struct MenuItemProc* item = Proc_Start(sProc_MenuItem, proc);
            proc->menuItems[itemCount++] = item;

            item->def = &def->menuItems[i];
            item->itemNumber = i;
            item->availability = availability;

            item->xTile = xTileInner;
            item->yTile = yTileInner;

            if (!(proc->state & MENU_STATE_NOTSHOWN))
                InitText(&item->text, rect.w - 2);

            yTileInner += 2;
        }
    }

    proc->def = def;
    proc->rect = rect;
    proc->itemCount = itemCount;
    proc->itemCurrent = 0;
    proc->itemPrevious = -1;

    if (rect.y + rect.h < yTileInner)
        proc->rect.h = yTileInner + 1 - rect.y;

    proc->backBg  = backBg & 3;
    proc->tileref = tileref;
    proc->frontBg = frontBg & 3;
    proc->unk68   = unk;

    gKeyStatusPtr->newKeys = 0;

    return proc;
}
