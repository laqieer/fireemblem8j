#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809F968
void PrepItemSupply_DrawConvoyHeader(void)
{
    SetTextFont(NULL);
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 12, 1, 0);

    PutDrawText(&PrepItemSuppyTexts.th[0], gBG0TilemapBuffer + 0x34 + 0x6d, 0, 2, 0, GetStringFromIndex(0x523));
    PutFaceChibi(0xAD, gBG0TilemapBuffer + 0x34 - 0x13, 0x270, 2, 1);
    PutDrawText(&PrepItemSuppyTexts.th[0] + 1, gBG0TilemapBuffer + 0x34 - 1, 0, 4, 0, GetStringFromIndex(0x52b));

    PutNumber(
        gBG0TilemapBuffer + 0x34 + 5,
        (GetConvoyItemCount_() == CONVOY_ITEM_COUNT) ? 4 : 2,
        GetConvoyItemCount_()
    );
    PutSpecialChar(gBG0TilemapBuffer + 0x34 + 6, TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_SLASH);
    PutNumber(gBG0TilemapBuffer + 0x34 + 9, 2, CONVOY_ITEM_COUNT);

    BG_EnableSyncByMask(1);

    return;
}
