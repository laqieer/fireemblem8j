#include "global.h"
#include "bmunit.h"
#include "hardware.h"
#include "fontgrp.h"
#include "scene.h"
#include "uiutils.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "chapterdata.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "bmio.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "worldmap.h"
#include "uichapterstatus.h"
#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"

extern u8 data_081F5548[];

extern struct StatusScreenSt gStatusScreenSt;

//! FE8U = 0x0808E19C
void DrawChapterStatusTextForUnit(struct Unit * unit)
{
    struct StatusScreenSt * ptr = &gStatusScreenSt;

    TileMap_FillRect(TILEMAP_LOCATED(gBG0TilemapBuffer, 25, 9), 3, 3, 0);

    SetTextFont(&ptr->font);
    SetTextFontGlyphs(TEXT_GLYPHS_SYSTEM);

    SpriteText_DrawBackgroundExt(&ptr->th, 0);

    if (unit != NULL)
    {
        if (unit->state & (US_UNDER_A_ROOF | US_BIT9))
        {
            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 130);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            Text_SetCursor(&ptr->th, 162);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            Text_SetCursor(&ptr->th, 186);
            Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

            UpdateUnitSpritePal(true);
        }
        else
        {
            char * str;

            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);

            str = GetStringFromIndex(unit->pCharacterData->nameTextId);
            Text_SetCursor(&ptr->th, GetStringTextCenteredPos(48, str));
            Text_DrawString(&ptr->th, str);

            Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

            Text_SetCursor(&ptr->th, 138);
            Text_DrawNumberOrBlank(&ptr->th, unit->level);

            if (GetUnitCurrentHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 162);
                Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
            }
            else
            {
                Text_SetCursor(&ptr->th, 170);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitCurrentHp(unit));
            }

            if (GetUnitMaxHp(unit) >= 100)
            {
                Text_SetCursor(&ptr->th, 186);
                Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
            }
            else
            {
                Text_SetCursor(&ptr->th, 194);
                Text_DrawNumberOrBlank(&ptr->th, GetUnitMaxHp(unit));
            }

            PutFaceChibi(GetUnitMiniPortraitId(unit), TILEMAP_LOCATED(gBG0TilemapBuffer, 25, 9), 0x280, 4, 0);

            UpdateUnitSpritePal(false);
        }
    }
    else
    {
        Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_BLUE);

        Text_SetCursor(&ptr->th, 130);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

        Text_SetCursor(&ptr->th, 162);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));

        Text_SetCursor(&ptr->th, 186);
        Text_DrawString(&ptr->th, GetStringFromIndex(MSG_535));
    }

    Text_SetColor(&ptr->th, TEXT_COLOR_SYSTEM_WHITE);

    Text_SetCursor(&ptr->th, 177);
    Text_DrawString(&ptr->th, (char *)data_081F5548); /* JP hardcodes the string ptr */

    SetTextFont(NULL);

    BG_EnableSyncByMask(BG0_SYNC_BIT);

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 0);
    SetBlendAlpha(13, 3);
    SetBlendBackdropA(0);
    SetBlendBackdropB(0);

    return;
}
