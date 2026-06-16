#include "global.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmshop.h"
#include "prepscreen.h"
#include "hardware.h"

void PrepItemScreen_DrawFunds(void)
{
    PutText(&gPrepItemTexts[29], // JP: 29 (US 30) -- region-different text slot
            TILEMAP_LOCATED(gBG0TilemapBuffer, 19, 17));
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 27, 17), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 28, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    ShowPrepFundsSpriteAt(168, 133);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
