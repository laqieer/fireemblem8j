#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"

#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

bool CheckInLinkArena(void);

// TODO: Implicit declaration?
int CanUnitUseItemPrepScreen(struct Unit* unit, int item);

void DrawPrepScreenItemUseStatBars(struct Unit* unit, int mask)
{
    s32 i;
    int stat_pack[8];
    UnpackUiBarPalette(2);

    stat_pack[0] = GetUnitCurrentHp(unit) * 24 / UNIT_MHP_MAX(unit);
    stat_pack[1] = GetUnitPower(unit) * 24 / UNIT_POW_MAX(unit);
    stat_pack[2] = GetUnitSkill(unit) * 24 / UNIT_SKL_MAX(unit);
    stat_pack[3] = GetUnitSpeed(unit) * 24 / UNIT_SPD_MAX(unit);
    stat_pack[4] = GetUnitLuck(unit) * 24 / UNIT_LCK_MAX(unit);
	stat_pack[5] = GetUnitDefense(unit) * 24 / UNIT_DEF_MAX(unit);
	stat_pack[6] = GetUnitResistance(unit) * 24 / UNIT_RES_MAX(unit);
	stat_pack[7] = UNIT_CON(unit) * 24 / UNIT_CON_MAX(unit);

    for (i = 0; i < 8; i++) {
        u32 var = 0x100 * i + 0x7000;

        if ((mask >> i) & 1) {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            DrawStatBarGfx(
                x >> 20,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x3000, 0x18, stat_pack[i], 0);
        } else {
            u32 x = var << 15;
            if (x) { ++x; --x; }
            DrawStatBarGfx(
                x >> 20,
                4,
                TILEMAP_LOCATED(gBG0TilemapBuffer, (i >> 2) * 7 + 0x12, (i & 3) * 2 + 4),
                0x2000, 0x18, stat_pack[i], 0);
        }
    }

    BG_EnableSyncByMask(1);
}

void DrawPrepScreenItemUseStatValues(struct Unit* unit)
{
    // HP
    PutNumberOrBlank( 
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 3),
        (GetUnitCurrentHp(unit) == UNIT_MHP_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitCurrentHp(unit)
    );

    // POW
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 5),
        (GetUnitPower(unit) == UNIT_POW_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitPower(unit)
    );

    // SKL
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 7),
        (GetUnitSkill(unit) == UNIT_SKL_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSkill(unit)
    );

    // SPD
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 9),
        (GetUnitSpeed(unit) == UNIT_SPD_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitSpeed(unit)
    );

    // LCK
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 3),
        (GetUnitLuck(unit) == UNIT_LCK_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitLuck(unit)
    );

    // DEF
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 5),
        (GetUnitDefense(unit) == UNIT_DEF_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitDefense(unit)
    );

    // RES
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 7),
        (GetUnitResistance(unit) == UNIT_RES_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        GetUnitResistance(unit)
    );

    // CON
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 27, 9),
        (UNIT_CON(unit) == UNIT_CON_MAX(unit)) 
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        UNIT_CON(unit)
    );

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 1),
        1, 1, 0
    );

    // LV
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 20, 1),
        TEXT_COLOR_SYSTEM_BLUE,
        unit->level
    );

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
