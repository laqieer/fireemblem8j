#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x0808E43C
void DrawChapterStatusStatValues(void)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 14), 15, 6, 0);

    // Draw turn number
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 14), TEXT_COLOR_SYSTEM_BLUE, gPlaySt.chapterTurnNumber);

    // Draw gold
    PutNumber(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 16), TEXT_COLOR_SYSTEM_BLUE, GetPartyGoldAmount());
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 12, 16), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    // Draw LV
    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 9), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);

    // Draw HP
    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 17, 11), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    return;
}
