#include "global.h"
#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809EBF0
void PrepItemList_DrawOwnerHeaderText(void)
{
    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 0xc, 1, 0);

    PutDrawText(PrepItemSuppyTexts.th + 15, gBG0TilemapBuffer + 0x34, 0, 0, 0, GetStringFromIndex(0x534)); // TODO: msgid "Owner"

    BG_EnableSyncByMask(1);
    return;
}
