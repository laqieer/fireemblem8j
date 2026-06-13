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

void PrepUnit_DrawPickLeftBar(struct ProcPrepUnit *proc, s8 val)
{
    if (0 == val) {
        ClearText(&gPrepUnitTexts[0x15]);
        PutDrawText(
            &gPrepUnitTexts[0x15],
            TILEMAP_LOCATED(gBG0TilemapBuffer, 0xE, 0x1),
            TEXT_COLOR_SYSTEM_WHITE,
            0, 0,
            GetStringFromIndex(0x52C)   /* Pick */
        );

        PutDrawText(
            &gPrepUnitTexts[0x15],
            TILEMAP_LOCATED(gBG0TilemapBuffer, 0xE, 0x1),
            TEXT_COLOR_SYSTEM_WHITE,
            0x20, 0,
            GetStringFromIndex(0x52D)   /* Units Left */
        );
    }

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x10, 0x1), 1, 1, 0);
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x11, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_SYSTEM_GRAY
            : TEXT_COLOR_SYSTEM_BLUE,
        proc->max_counter - proc->cur_counter
    );

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x18, 0x1), 4, 1, 0);
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x19, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        proc->cur_counter
    );

    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1A, 1), TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
    PutNumberOrBlank(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 0x1C, 1),
        proc->cur_counter == proc->max_counter
            ? TEXT_COLOR_SYSTEM_GREEN
            : TEXT_COLOR_SYSTEM_BLUE,
        proc->max_counter
    );

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
