#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmitem.h"
#include "bmshop.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "bmunit.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "constants/faces.h"
#include "constants/songs.h"

//! FE8U = 0x080A0034
void WmSell_DrawPartyFunds(void) {
    TileMap_FillRect(gBG0TilemapBuffer + 0xF4, 10, 1, 0);

    PutNumber(gBG0TilemapBuffer + 0xF4 + 0x146, 2, GetPartyGoldAmount());
    PutSpecialChar(gBG0TilemapBuffer + 0xF4 + 0x147, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);

    BG_EnableSyncByMask(1);

    return;
}
