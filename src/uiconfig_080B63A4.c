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

//! FE8U: 0x080B1784
void DrawGameOptionHelpText(void)
{
    const char * str;

    ClearText(&gConfigUiState->optionHelpText);

    str = GetStringFromIndex(
        gGameOptions[gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]].selectors[GetSelectedOptionValue()].helpTextId);
    PutDrawText(
        &gConfigUiState->optionHelpText, TILEMAP_LOCATED(gBG0TilemapBuffer, 4, 18), TEXT_COLOR_SYSTEM_WHITE, 0, 22, str);

    return;
}
