#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "unitlistscreen.h"
#include "uiconfig.h"
#include "sysutil.h"
#include "constants/msg.h"
#include "constants/songs.h"

static inline int GetGameOptionIconChr(int icon)
{
    return 0x200
        + (icon & 0x1f)
        + ((icon << 1) & 0xFFC0);
}

//! FE8U: 0x080B1700
void DrawGameOptionIcon(int selectedIdx, int yBase)
{
    int y = 0x20 * ((selectedIdx * 2 + yBase) & 0x1f);

    int icon = gGameOptions[gGameOptionsUiOrder[selectedIdx]].icon;
    int chr = GetGameOptionIconChr(icon);

    // Variable reuse seems to be required to match
    icon = TILEREF(chr, 4);

    gBG1TilemapBuffer[TILEMAP_INDEX(2, 0) + y] = icon + 0;
    gBG1TilemapBuffer[TILEMAP_INDEX(3, 0) + y] = icon + 1;
    gBG1TilemapBuffer[TILEMAP_INDEX(2, 1) + y] = icon + 0x20;
    gBG1TilemapBuffer[TILEMAP_INDEX(3, 1) + y] = icon + 0x21;

    return;
}
