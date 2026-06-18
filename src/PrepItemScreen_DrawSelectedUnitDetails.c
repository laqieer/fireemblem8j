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

void PrepItemScreen_DrawSelectedUnitDetails(struct PrepItemScreenProc * proc)
{
    const char * str;
    int x;

    struct Unit * unit = GetUnitFromPrepList(proc->selectedUnitIdx);

    proc->unitSelected = true;
    BG_Fill(BG_GetMapBuffer(BG_0), 0);

    PrepItemScreen_DrawUnitItems(
        &gPrepItemTexts[15], TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 9), GetUnitFromPrepList(proc->selectedUnitIdx), 0);

    Decompress(Tsa_PrepItemScreen, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, TILEREF(0x0, 1));

    ShowUnitInfoBgSpritesAt(0, 31);

    PutFaceChibi(GetUnitPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 2, 4), 0x270, 3, false);

    ClearText(&gPrepItemTexts[30]);

    str = GetStringFromIndex(unit->pCharacterData->nameTextId);
    x = GetStringTextCenteredPos(40, str);

    PutDrawText(&gPrepItemTexts[30], TILEMAP_LOCATED(gBG0TilemapBuffer, 8, 4), TEXT_COLOR_SYSTEM_WHITE, x, 0, str);

    PutTwoSpecialChar(
        TILEMAP_LOCATED(gBG0TilemapBuffer, 7, 6), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_LV_A, TEXT_SPECIAL_LV_B);
    PutSpecialChar(TILEMAP_LOCATED(gBG0TilemapBuffer, 11, 6), TEXT_COLOR_SYSTEM_GOLD, TEXT_SPECIAL_E);

    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 10, 6), TEXT_COLOR_SYSTEM_BLUE, unit->level);
    PutNumberOrBlank(TILEMAP_LOCATED(gBG0TilemapBuffer, 13, 6), TEXT_COLOR_SYSTEM_BLUE, unit->exp);

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT | BG2_SYNC_BIT);

    return;
}
