#include "global.h"

#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"

//! FE8J = 0x080A4DD0
void DrawSupportScreenText(void)
{
    struct Text* th;
    int perc;

    th = &gPrepItemTexts[30];

    perc = GetTotalSupportCollection();

    InitText(th - 1, 15);
    InitText(th + 0, 9);
    ClearText(th - 1);

    Text_InsertDrawString(th - 1, 0, 0, GetStringFromIndex(0x538));

    PutText(th - 1, TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 18));

    ClearText(th + 0);
    Text_InsertDrawString(th + 0, 0, perc == 100 ? 4 : 0, GetStringFromIndex(0x535));

    Text_SetCursor(th + 0, 48);
    Text_SetColor(th + 0, perc == 100 ? 4 : 2);
    Text_DrawNumberOrBlank(th + 0, perc);

    Text_InsertDrawString(th + 0, 56, perc == 100 ? 4 : 0, GetStringFromIndex(0x748));

    PutText(th + 0, TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 18) - 501);

    BG_EnableSyncByMask(1);

    return;
}
