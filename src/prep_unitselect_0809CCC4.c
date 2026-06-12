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

void PrepUnit_DrawUnitItems(struct Unit *unit)
{
    int i, cnt;

    ResetIconGraphics_();
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 5), 0xB, 0xA, 0);

    cnt = GetUnitItemCount(unit);
    for (i = 0; i < cnt; i++) {
        int item = unit->items[i];

        DrawIcon(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 1, 5 + 2 * i),
            GetItemIconId(item),
            TILEREF(0, BGPAL_ICONS)
        );

        ClearText(&gPrepUnitTexts[i + 0xE]);

        PutDrawText(
            &gPrepUnitTexts[i + 0xE],
            TILEMAP_LOCATED( gBG0TilemapBuffer, 3, 5 + 2 * i),
            IsItemDisplayUsable(unit, item)
                ? TEXT_COLOR_SYSTEM_WHITE
                : TEXT_COLOR_SYSTEM_GRAY,
            0, 0, GetItemName(item)
        );

        PutNumberOrBlank(
            TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 5 + 2 * i),
            IsItemDisplayUsable(unit, item)
                ? TEXT_COLOR_SYSTEM_BLUE
                : TEXT_COLOR_SYSTEM_GRAY,
            GetItemUses(item)
        );

    }

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
