#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

void PrepItemUseDrawSubBox(void)
{
    struct Text *text = &gPrepItemTexts[27];
    ClearText(text);

    /* Are you sure?[.] */
    PutDrawText(
       text++,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 18, 13) /* JP x18 (US 17) */,
        TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x4CB) /* JP 0x4CB (US 0x585) */
    );

    ClearText(text);

    /* Yes[.] */
    PutDrawText(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x7BB) /* JP 0x7BB (US 0x843) */
    );

    /* No */
    PutDrawText(
        text,
        TILEMAP_LOCATED(gBG2TilemapBuffer, 19, 15),
        TEXT_COLOR_SYSTEM_WHITE, 0x20, 0,
        GetStringFromIndex(0x7BC) /* JP 0x7BC (US 0x844) */
    );

    BG_EnableSyncByMask(4);
}
