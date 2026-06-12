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

void PrepUpdateMenuTsaScroll(int val)
{
    u32 _val = val * 2;
    TileMap_FillRect(TILEMAP_LOCATED(gBG2TilemapBuffer, 0x10, _val % 0x20), 0xD, 1, 0);
    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
