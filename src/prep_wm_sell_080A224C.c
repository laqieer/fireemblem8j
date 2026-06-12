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

//! FE8U = 0x0809FFB0
void WmSell_DrawItemGoldValue(int item) {
    TileMap_FillRect(gBG0TilemapBuffer + 0x134, 10, 1, 0);

    if (item != 0) {
        u16 sellPrice = GetItemSellPrice(item);

        if ((sellPrice == 0) || (GetItemAttributes(item) & IA_UNSELLABLE)) {
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 5, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 6, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
            PutSpecialChar(gBG0TilemapBuffer + 0x134 + 7, TEXT_COLOR_SYSTEM_GRAY, TEXT_SPECIAL_DASH);
        } else {
            PutNumber(gBG0TilemapBuffer + 0x134 + 6, 2, sellPrice);
        }

        PutSpecialChar(gBG0TilemapBuffer + 0x13B, TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_G);
    }

    BG_EnableSyncByMask(1);

    return;
}
