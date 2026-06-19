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
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

//! FE8U = 0x08098A74
void PutWmItemScreenPromptText(u16 * tilemap)
{
    int textId;

    TileMap_FillRect(tilemap, 10, 8, 0);

    ClearText(&gPrepItemTexts[25]);
    ClearText(&gPrepItemTexts[26]);
    ClearText(&gPrepItemTexts[27]);

    switch (GetGMapBaseMenuKind())
    {
    case SHOP_TYPE_ARMORY:
        textId = 0x604; // "Enter Armory"
        break;

    case SHOP_TYPE_VENDOR:
        textId = 0x605; // "Enter Shop"
        break;

    case SHOP_TYPE_SECRET_SHOP:
        textId = 0x606; // "Enter ? Shop"
        break;

    case SHOP_TYPE_MANAGE_ITEMS:
        textId = 0x607; // "Manage Items"
        break;
    }

    PutDrawText(
        &gPrepItemTexts[25], TILEMAP_LOCATED(tilemap, 1, 2), TEXT_COLOR_SYSTEM_WHITE, 0, 0, GetStringFromIndex(textId));
    PutDrawText(
        &gPrepItemTexts[26], TILEMAP_LOCATED(tilemap, 1, 4), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x50E)); // "Choose unit"
    PutDrawText(
        &gPrepItemTexts[27], TILEMAP_LOCATED(tilemap, 1, 6), TEXT_COLOR_SYSTEM_WHITE, 0, 0,
        GetStringFromIndex(0x50F)); // " [.]"

    return;
}
