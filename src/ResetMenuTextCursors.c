#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "hardware.h"
#include "sysutil.h"

void ResetMenuTextCursors(struct MenuProc *proc)
{
    int i;
    for (i = 0; i < proc->itemCount; i++)
        if (proc->menuItems[i]->def->onDraw == 0)
            Text_SetCursor(&proc->menuItems[i]->text, 0);
}
