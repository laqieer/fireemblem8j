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

void CleanupPrepMenuScreen(ProcPtr proc)
{
    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 3, 5), 8, 9, 0);
    TileMap_FillRect(TILEMAP_LOCATED(gBG1TilemapBuffer, 3, 5), 8, 9, 0);
    BG_EnableSyncByMask(0x3);
}
