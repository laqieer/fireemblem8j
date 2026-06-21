#include "global.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "hardware.h"
#include "menu_def.h"
#include "bmdebug.h"

extern const char Str_DebugPlaythroughCount[];
extern const char Str_DebugPlaythroughTh[];

//! FE8U = (region-different) JP 0x0801BB98
int DebugMenu_ClearDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, (char *)Str_DebugPlaythroughCount);
    Text_InsertDrawString(&menuItemProc->text, 72, TEXT_COLOR_SYSTEM_BLUE, (char *)Str_DebugPlaythroughTh);
    Text_InsertDrawNumberOrBlank(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetGlobalCompletionCount() + 1);
    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}
