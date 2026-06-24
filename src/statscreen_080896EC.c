#include "global.h"

#include <stdlib.h>

#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"

#include "statscreen.h"
#include "constants/songs.h"

//! FE8U = 0x080896EC
void DisplayPage1(void)
{
    int i, item;

    Decompress(
        Tsa_StatscreenEquipmentBG,
        gGenericBuffer);

    CallARM_FillTileRect(
        gUiTmScratchC + TILEMAP_INDEX(1, 11),
        gGenericBuffer, TILEREF(0x40, STATSCREEN_BGPAL_EQUIPMENT_FRAME_AND_HIGHLIGHT));

    DisplayTexts(sPage1TextInfo);

    if (!UNIT_IS_GORGON_EGG(gStatScreen.unit))
    {
        for (i = 0; (i < UNIT_ITEM_COUNT) && (item = gStatScreen.unit->items[i]); ++i)
        {
            int color;

            if ((gStatScreen.unit->state & US_DROP_ITEM) && (i == GetUnitItemCount(gStatScreen.unit) - 1))
                color = TEXT_COLOR_SYSTEM_GREEN;
            else
                color = IsItemDisplayUsable(gStatScreen.unit, item)
                    ? TEXT_COLOR_SYSTEM_WHITE
                    : TEXT_COLOR_SYSTEM_GRAY;

            DrawItemStatScreenLine(
                &gStatScreen.text[STATSCREEN_TEXT_ITEM0 + i],
                item, color,
                gUiTmScratchA + TILEMAP_INDEX(1, 1 + i*2));
        }
    }

    i = GetUnitEquippedWeaponSlot(gStatScreen.unit);
    item = 0;

    if (gStatScreen.unit->pClassData->number != CLASS_GORGONEGG)
    {
        if ((gStatScreen.unit->pClassData->number != CLASS_GORGONEGG2) && (i >= 0))
        {
            PutSpecialChar(
                gUiTmScratchA + TILEMAP_INDEX(16, 1 + i*2),
                TEXT_COLOR_SYSTEM_WHITE, TEXT_SPECIAL_K); // JP 0x1F (US TEXT_SPECIAL_35)

            CallARM_FillTileRect(
                gUiTmScratchC + TILEMAP_INDEX(1, 2 + i*2),
                Tsa_StatscreenEquipedWeaponHighlight, TILEREF(0x40, STATSCREEN_BGPAL_EQUIPMENT_FRAME_AND_HIGHLIGHT));

            item = gStatScreen.unit->items[i];
        }
    }

    if (!UNIT_IS_GORGON_EGG(gStatScreen.unit))
    {
        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(8,  13),
            TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleAttack);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(8,  15),
            TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleHitRate);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(15, 13),
            TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleCritRate);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(15, 15),
            TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleAvoidRate);

        Text_InsertDrawString(
            &gStatScreen.text[STATSCREEN_TEXT_BSRANGE],
            24, TEXT_COLOR_SYSTEM_BLUE, GetItemDisplayRangeString(item));
    }
    else
    {
        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(8,  13),
            TEXT_COLOR_SYSTEM_BLUE, 0xFF);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(8,  15),
            TEXT_COLOR_SYSTEM_BLUE, 0xFF);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(15, 13),
            TEXT_COLOR_SYSTEM_BLUE, 0xFF);

        PutNumberOrBlank(
            gUiTmScratchA + TILEMAP_INDEX(15, 15),
            TEXT_COLOR_SYSTEM_BLUE, gBattleActor.battleAvoidRate);

        Text_InsertDrawString(
            &gStatScreen.text[STATSCREEN_TEXT_BSRANGE],
            24, TEXT_COLOR_SYSTEM_BLUE, GetItemDisplayRangeString(0));
    }

    for (i = 0; i < 8; ++i)
    {
        gUiTmScratchA[TILEMAP_INDEX(1 + i, 11)] = TILEREF(0x60 + i, STATSCREEN_BGPAL_EQUIPMENT_LABEL);
        gUiTmScratchA[TILEMAP_INDEX(1 + i, 12)] = TILEREF(0x68 + i, STATSCREEN_BGPAL_EQUIPMENT_LABEL);
    }
}
