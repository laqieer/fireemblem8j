#include "global.h"
#include "classchg.h"
#include "uimenu.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "proc.h"
#include "hardware.h"
#include "bmarch.h"
#include "scene.h"
#include "constants/classes.h"

void ClassChgMenuOnDrawCore(struct MenuProc *pmenu, struct MenuItemProc *pmitem, char *str)
{
    u8 unused_stack[32];
    u16 *mapbuf;
    if (pmitem->def->color)
        Text_SetColor(&pmitem->text, pmitem->def->color);

    if (pmitem->availability == MENU_DISABLED)
        Text_SetColor(&pmitem->text, TEXT_COLOR_SYSTEM_GRAY);

    ClearTextPart(&pmitem->text, 0, 20);
    Text_SetCursor(&pmitem->text, 0);
    Text_DrawString(&pmitem->text, (char *)0x081F6D7C);
    Text_DrawString(&pmitem->text, str);
    mapbuf = BG_GetMapBuffer(pmenu->frontBg);

    PutText(&pmitem->text, &mapbuf[pmitem->yTile * 32 + pmitem->xTile]);
}
