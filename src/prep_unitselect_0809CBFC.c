#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

void PrepUnit_DrawLeftUnitName(struct Unit *unit)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 3), 6, 1, 0);
    PutFaceChibi(GetUnitPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 1), 0x270, 2, 0);
    ClearText(&gPrepUnitTexts[0x13]);
    PutDrawText(
        &gPrepUnitTexts[0x13],
        TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 1),
        TEXT_COLOR_SYSTEM_WHITE,
        GetStringTextCenteredPos(0x38, GetStringFromIndex(unit->pCharacterData->nameTextId)),
        0,
        GetStringFromIndex(unit->pCharacterData->nameTextId)
    );

    PutTwoSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 5, 3), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 9, 3), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_E);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 3), 2, unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 3), 2, unit->exp);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
