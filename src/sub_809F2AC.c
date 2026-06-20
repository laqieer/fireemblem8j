#include "global.h"
#include "bmlib.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "functions.h"
#include "prepscreen.h"
void PrepItemUseJuna_OnDraw(struct ProcPrepItemUseJunaFruit * proc, int x, int y, int msg, int item) {
    const char * str = GetStringFromIndex(0x81E);
    int icon = GetItemIconId(item);
    int width = GetStringTextLen(str);
    if (icon != 0)
        DrawIcon(TILEMAP_LOCATED(gBG2TilemapBuffer, x, y), GetItemIconId(item), 0x4000);
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_POPUP]);
    PutDrawText(
        &gPrepItemTexts[TEXT_PREPITEM_POPUP],
        TILEMAP_LOCATED(gBG2TilemapBuffer, icon == 0 ? x : x + 2, y),
        TEXT_COLOR_SYSTEM_WHITE,
        0, 0, str);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
    proc->xpos = x * 8 - 4;
    proc->ypos = y * 8 - 4;
    proc->width = width / 8 + 1;
    if (icon != 0)
        proc->width += 2;
    proc->height = 2;
}
