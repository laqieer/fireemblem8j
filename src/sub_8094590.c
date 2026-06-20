#include "global.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "unitlistscreen.h"
void UnitList_DrawPageHeader(u8 maxPages, u8 page, int drawColumnNames) {
    int dc = (s8)drawColumnNames;
    if (page != UNITLIST_PAGE_SOLOANIM) {
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 26, 3), TEXT_COLOR_SYSTEM_BLUE, page);
        PutSpecialChar(TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3), TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
        PutNumber(TILEMAP_LOCATED(gBG2TilemapBuffer, 28, 3), TEXT_COLOR_SYSTEM_BLUE, maxPages);
    }
    if (dc) {
        UnitList_DrawColumnNames(TILEMAP_LOCATED(gBG2TilemapBuffer, 0, 5), page);
    }
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
