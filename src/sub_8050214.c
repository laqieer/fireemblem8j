#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "uimenu.h"

extern struct ProcCmd sProc_MenuMain[];

void ProcessMenuDpadInput(struct MenuProc * proc);

void Menu_AutoHelpBox_OnLoop(struct MenuProc * proc)
{
    int x, y;

    ProcessMenuDpadInput(proc);

    GetMenuCursorPosition(proc, &x, &y);
    ApplyMenuCursorVScroll(proc, &x, &y);

    DisplayUiHand(x, y);

    if (gKeyStatusPtr->newKeys & (B_BUTTON | R_BUTTON))
    {
        CloseHelpBox();
        Proc_GotoScript(proc, sProc_MenuMain);

        return;
    }

    if (proc->itemCurrent != proc->itemPrevious)
    {
        proc->def->onHelpBox(proc, proc->menuItems[proc->itemCurrent]);
    }
}
