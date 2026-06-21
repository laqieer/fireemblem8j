#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "menu_def.h"
#include "bmdebug.h"
#include "variables.h"

extern const char Str_DebugFogState[];

// JP debug menu: the On/Off msgId table lives at a fixed ROM address (0x085C2EFC),
// aliased as an extern array so array-subscript lowers to JP's branchless index.
extern const int gTextIds_OnOff[];

//! FE8U = (region-different) JP 0x0801C064
int DebugMenu_FogDraw(struct MenuProc* menuProc, struct MenuItemProc* menuItemProc) {
    ClearText(&menuItemProc->text);
    Text_InsertDrawString(&menuItemProc->text, 8, TEXT_COLOR_SYSTEM_WHITE, (char *)Str_DebugFogState);
    Text_InsertDrawString(&menuItemProc->text, 64, TEXT_COLOR_SYSTEM_BLUE, GetStringFromIndex(gTextIds_OnOff[(gPlaySt.chapterVisionRange != 0)]));
    PutText(&menuItemProc->text, gBG0TilemapBuffer + TILEMAP_INDEX(menuItemProc->xTile, menuItemProc->yTile));

    return 0;
}
