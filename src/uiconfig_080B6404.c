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





//! FE8U = 0x080B17E4
void DrawGameOptionText(int selectedIdx, int textIdx, int y)
{
    const char * str;

    ClearText(&gConfigUiState->optionTexts[textIdx]);

    str = GetStringFromIndex(gGameOptions[gGameOptionsUiOrder[selectedIdx]].msgId);
    PutDrawText(
        &gConfigUiState->optionTexts[textIdx], TILEMAP_LOCATED(gBG1TilemapBuffer, 4, y), TEXT_COLOR_SYSTEM_WHITE, 0, 9, str);

    return;
}
