#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "icon.h"
#include "bmshop.h"
#include "uiutils.h"
#include "ctc.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmio.h"
#include "statscreen.h"
#include "bmudisp.h"
#include "bm.h"
#include "prepscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "unitlistscreen.h"
#include "uiconfig.h"
#include "sysutil.h"

#include "constants/msg.h"
#include "constants/songs.h"

extern struct ConfigScreen * CONST_DATA gConfigUiState;

extern u8 CONST_DATA gGameOptionsUiOrder[];

// clang-format off



extern struct GameOption CONST_DATA gGameOptions[];





/* prototypes for same-file helpers called by this run */
u8 GetGameOption(u8 index);

//! FE8U: 0x080B1850
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y)
{
    int i;

    int optionIdx = gGameOptionsUiOrder[selectedIdx];

    int x = gGameOptions[optionIdx].selectors[0].xPos / 8;

    ClearText(&gConfigUiState->valueTexts[textIdx]);

    for (i = 0; i < 4; i++)
    {
        if (gGameOptions[optionIdx].selectors[i].optionTextId == MSG_000)
        {
            break;
        }

        Text_InsertDrawString(
            &gConfigUiState->valueTexts[textIdx], gGameOptions[optionIdx].selectors[i].xPos - 112,
            (i == GetGameOption(optionIdx)) ? TEXT_COLOR_SYSTEM_BLUE : TEXT_COLOR_SYSTEM_GRAY,
            GetStringFromIndex(gGameOptions[optionIdx].selectors[i].optionTextId));
    }

    PutText(&gConfigUiState->valueTexts[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, x, y));

    return;
}
