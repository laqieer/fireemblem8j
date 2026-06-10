#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void DisplayLeftPanel(void)
{
    const char* namestr = GetStringFromIndex(UNIT_NAME_ID(gStatScreen.unit));
    unsigned namexoff = GetStringTextCenteredPos(0x30, namestr);

    BG_Fill(gBG0TilemapBuffer, 0);

    // Generate battle stats for unit for display later
    BattleGenerateUiStats(
        gStatScreen.unit,
        GetUnitEquippedWeaponSlot(gStatScreen.unit));

    // Display character name
    PutDrawText(
        &gStatScreen.text[STATSCREEN_TEXT_CHARANAME],
        gBG0TilemapBuffer + TILEMAP_INDEX(3, 10),
        TEXT_COLOR_SYSTEM_WHITE, namexoff, 0, namestr);

    // Display class name
    PutDrawText(
        &gStatScreen.text[STATSCREEN_TEXT_CLASSNAME],
        gBG0TilemapBuffer + TILEMAP_INDEX(1, 13),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(gStatScreen.unit->pClassData->nameTextId));

    // Display Lv/E labels
    PutTwoSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(1, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(5, 15), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_E);

    // Display Hp/'/' labels
    PutTwoSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(1, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_HP_A, TEXT_SPECIAL_HP_B);
    PutSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(5, 17), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_SLASH);

    // Display level
    PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(4, 15), TEXT_COLOR_SYSTEM_BLUE,
        gStatScreen.unit->level);

    // Display exp
    PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(7, 15), TEXT_COLOR_SYSTEM_BLUE,
        gStatScreen.unit->exp);

    // Display current hp

    if (GetUnitCurrentHp(gStatScreen.unit) > 99)
    {
        // Display '--' if current hp > 99
        PutTwoSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(3, 17), TEXT_COLOR_SYSTEM_BLUE,
            TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        // Display current hp
        PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(4, 17), TEXT_COLOR_SYSTEM_BLUE,
            GetUnitCurrentHp(gStatScreen.unit));
    }

    // Display max hp

    if (GetUnitMaxHp(gStatScreen.unit) > 99)
    {
        // Display '--' if max hp > 99
        PutTwoSpecialChar(gBG0TilemapBuffer + TILEMAP_INDEX(6, 17), TEXT_COLOR_SYSTEM_BLUE,
            TEXT_SPECIAL_DASH, TEXT_SPECIAL_DASH);
    }
    else
    {
        // Display max hp
        PutNumberOrBlank(gBG0TilemapBuffer + TILEMAP_INDEX(7, 17), TEXT_COLOR_SYSTEM_BLUE,
            GetUnitMaxHp(gStatScreen.unit));
    }
}
