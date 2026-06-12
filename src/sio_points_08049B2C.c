#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "uiutils.h"
#include "bmunit.h"
#include "m4a.h"
#include "soundwrapper.h"

#include "sio_core.h"
#include "sio.h"
#include "constants/songs.h"

// clang-format off

extern const u8 gSioPoints_0[][4];





extern const u8 gSioPoints_3[];

// clang-format off

extern u16 CONST_DATA Sprite_SioPoints_0[];

//! FE8U = 0x08048D1C
void DrawLinkArenaScoreNumber(struct Text * th, int x, int y, int number)
{
    ClearText(th);
    SioDrawNumber(th, 24, TEXT_COLOR_SYSTEM_BLUE, number);
    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, x + 1, y + 1));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
    return;
}
