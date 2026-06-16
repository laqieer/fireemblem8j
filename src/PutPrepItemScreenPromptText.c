#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

void PutPrepItemScreenPromptText(u16 * tilemap)
{
    TileMap_FillRect(tilemap, 10, 6, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);

    PutDrawText(
        &gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 1, 1), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x50E) /* JP: 0x50E (US MSG_583=0x583) */ // "Choose unit[.]"
    );
    PutDrawText(
        &gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 1, 3), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x50F) /* JP: 0x50F (US MSG_584=0x584) */ // " [.]"
    );

    return;
}
