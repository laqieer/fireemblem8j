#include "global.h"

#include "hardware.h"
#include "uimenu.h"
#include "uiutils.h"

void DrawMenuItemHover(struct MenuProc * proc, int item, s8 boolHover)
{
    int x, y, w;
    int bh = boolHover;

    if (proc->state & MENU_STATE_FLAT)
        return;

    x = proc->rect.x + 1;
    w = proc->menuItems[item]->yTile;
    y = w;
    w = proc->rect.w - 2;

    switch (bh)
    {
    case TRUE:
        DrawUiItemHoverExt(proc->backBg, proc->tileref, x, y, w);
        break;
    case FALSE:
        ClearUiItemHoverExt(proc->backBg, proc->tileref, x, y, w);
        break;
    }
}
