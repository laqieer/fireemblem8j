#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

s8 CheckInLinkArena();

void ResetPrepMenuDescTexts()
{
    int i = 0;
    for (i = 0; i < 5; i++)
        ClearText(&gPrepMainMenuTexts[i + 5]);

    TileMap_FillRect(
        TILEMAP_LOCATED(gBG2TilemapBuffer, 0xD, 0x6),
        0xF, 0xA, 0);

    BG_EnableSyncByMask(0x4);
}
