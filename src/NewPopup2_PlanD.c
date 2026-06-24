#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "uiutils.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmitem.h"

/**
 * 2-item trade popup variant of the popup2 family.
 */

extern struct ProcCmd CONST_DATA ProcScr_Popup2[];

void NewPopup2_PlanD(ProcPtr parent, int item1, int item2)
{
    int len, len2, x, y, x_tile, y_tile;

    struct Text th1;
    struct Text th2;

    ResetTextFont();
    InitText(&th1, 0x14);
    InitText(&th2, 0x14);

    Text_SetColor(&th1, TEXT_COLOR_SYSTEM_BLUE);
    Text_SetColor(&th2, TEXT_COLOR_SYSTEM_BLUE);

    Text_DrawString(&th1, GetItemName(item1));
    Text_DrawString(&th2, GetItemName(item2));

    Text_Skip(&th1, 2);
    Text_Skip(&th2, 2);

    Text_SetColor(&th1, TEXT_COLOR_SYSTEM_WHITE);
    Text_SetColor(&th2, TEXT_COLOR_SYSTEM_WHITE);

    Text_DrawString(&th1, GetStringFromIndex(0x80C));
    Text_DrawString(&th2, GetStringFromIndex(0x80D));

    len = Text_GetCursor(&th1);
    len2 = Text_GetCursor(&th2);

    if (len > len2)
        len2 = len;

    len2 += 0x30;

    x_tile = 0xF0 - len2;

    if (x_tile < 0)
        x_tile += 0xF;
    x = x_tile >> 4;

    y_tile = len2 < 0 ? len2 + 7 : len2;
    y = y_tile >> 3;

    DrawUiFrame2(x, 7, y, 6, 0);

    DrawIcon(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 8),
        GetItemIconId(item1),
        TILEREF(0, 0x4));

    DrawIcon(
        TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, 10),
        GetItemIconId(item2),
        TILEREF(0, 0x4));

    PutText(&th1, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 3, 8));
    PutText(&th2, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 3, 10));

    Proc_StartBlocking(ProcScr_Popup2, parent);
}
