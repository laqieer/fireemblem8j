#include "global.h"

#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "bmitem.h"

void DrawPrepScreenItemUseStatLabels(struct Unit *unit)
{
    int i;
    char *str;
    struct Text *text = gPrepItemTexts;

    for (i = 0; i < 8; i++)
        ClearText(&text[i]);

    /* HP */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 3),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x478)
    );

    if (UnitHasMagicRank(unit)) {
        /* Mag[.] */
        PutDrawText(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_SYSTEM_GOLD,
            0, 0,
            GetStringFromIndex(0x48E)
        );
    } else {
        /* Str[.] */
        PutDrawText(
            text++,
            TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 5),
            TEXT_COLOR_SYSTEM_GOLD,
            0, 0,
            GetStringFromIndex(0x48D)
        );
    }

    /* Skill[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 7),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x47B)
    );

    /* Spd[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 16, 9),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x47C)
    );

    /* Luck */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 3),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x47D)
    );

    /* Def[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 5),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x47E)
    );

    /* Res[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 7),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x47F)
    );

    /* Con[.] */
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 23, 9),
        TEXT_COLOR_SYSTEM_GOLD,
        0, 0,
        GetStringFromIndex(0x486)
    );

    str = GetStringFromIndex(unit->pClassData->nameTextId);
    PutDrawText(
        text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 21, 1),
        TEXT_COLOR_SYSTEM_WHITE,
        GetStringTextCenteredPos(0x40, str),
        0, str
    );

    /* LV */
    PutTwoSpecialChar(TILEMAP_LOCATED(gBG2TilemapBuffer, 17, 1), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
}