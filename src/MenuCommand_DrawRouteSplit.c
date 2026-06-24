#include "global.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "hardware.h"
#include "functions.h"

int MenuCommand_DrawRouteSplit(struct MenuProc * menu, struct MenuItemProc * item)
{
    char * str = GetStringFromIndex(item->def->nameMsgId);
    int new_var;

    Text_SetParams(&item->text, 0, 0);
    Text_DrawString(&item->text, str);
    new_var = 1;
    PutText(&item->text, &gBG0TilemapBuffer[(item->yTile * 0x20 + new_var) + item->xTile]);
    ResetText();

    return 0;
}
