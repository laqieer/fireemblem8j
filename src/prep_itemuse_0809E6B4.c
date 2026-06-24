#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "fontgrp.h"
#include "hardware.h"
#include "scene.h"
#include "prepscreen.h"

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

// The {&gPrepItemTexts[25], &gPrepItemTexts[26]} initializer is pooled at this
// fixed rodata address in the JP ROM (inside the prep_itemuse data gap); alias
// it as an extern const table so no duplicate rodata is emitted.
extern struct Text* const sPrepItemUseDescTexts[2];

void DrawPrepScreenItemUseDesc(struct Unit *unit, int slot)
{
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_DESC1]);
    ClearText(&gPrepItemTexts[TEXT_PREPITEM_DESC2]);

    if (slot != -1) {
        u16 item = unit->items[slot];
        int msg = GetItemUseDescId(item);

        struct Text* thlut[2];
        struct Text* t1 = sPrepItemUseDescTexts[1];
        struct Text* t0 = sPrepItemUseDescTexts[0];

        thlut[0] = t0;
        thlut[1] = t1;

        if (msg != 0) {
            if (CanUnitUseItemPrepScreen(unit, item)) {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_WHITE);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_WHITE);

                PrintStringToTexts(thlut, GetStringFromIndex(msg), TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 13), 2);
            } else {
                Text_SetColor(thlut[0], TEXT_COLOR_SYSTEM_GRAY);
                Text_SetColor(thlut[1], TEXT_COLOR_SYSTEM_GRAY);

                PrintStringToTexts(thlut, GetStringFromIndex(msg), TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 13), 2);
            }
        }
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
