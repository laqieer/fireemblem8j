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

//! FE8U = 0x0804FCFC
void RedrawMenu(struct MenuProc* proc)
{
    int i;

    if (proc->state & MENU_STATE_NOTSHOWN)
        return;

    DrawUiFrame(
        BG_GetMapBuffer(proc->backBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h,
        proc->tileref, proc->def->style);

    ClearUiFrame(
        BG_GetMapBuffer(proc->frontBg),
        proc->rect.x, proc->rect.y, proc->rect.w, proc->rect.h);

    for (i = 0; i < proc->itemCount; ++i)
    {
        struct MenuItemProc* item = proc->menuItems[i];

        if (item->def->onDraw)
        {
            item->def->onDraw(proc, item);
            continue;
        }

        if (item->def->color)
            Text_SetColor(&item->text, item->def->color);

        if (item->availability == MENU_DISABLED)
            Text_SetColor(&item->text, TEXT_COLOR_SYSTEM_GRAY);

        Text_DrawString(&item->text, item->def->name);

        PutText(
            &item->text,
            TILEMAP_LOCATED(BG_GetMapBuffer(proc->frontBg), item->xTile, item->yTile));
    }

    DrawMenuItemHover(proc, proc->itemCurrent, TRUE);
    BG_EnableSyncByMask(BG_SYNC_BIT(proc->backBg) + BG_SYNC_BIT(proc->frontBg));
}
