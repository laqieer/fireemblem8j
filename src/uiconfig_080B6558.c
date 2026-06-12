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

u16 CONST_DATA gSprite_ConfigurationUiHeader[] =
{
    3,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16, 0,
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(32), OAM2_CHR(0x4),
    OAM0_SHAPE_32x16, OAM1_SIZE_32x16 + OAM1_X(64), OAM2_CHR(0x8),
};

extern struct GameOption CONST_DATA gGameOptions[];





/* prototypes for same-file helpers called by this run */
u8 GetSelectedGameOption(void);
u8 GetSelectedOptionValue(void);
u8 GetGameOption(u8 index);

//! FE8U = 0x080B1938
void DrawConfigUiSprites(void)
{
    int y;

    int optionIdx = gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx];

    u8 time = (GetGameClock() % 16) & 8;

    CallARM_PushToSecondaryOAM(18, 8, gSprite_ConfigurationUiHeader, OAM2_CHR(0xC0) + OAM2_PAL(2));

    // current option position on screen (cur index - top index)
    y = (gConfigUiState->selectedOptionIdx - gConfigUiState->headOptionIdx) * 16 + 40;

    DisplayFrozenUiHand(16, y);

    DisplayUiHand(gGameOptions[optionIdx].selectors[GetGameOption(optionIdx)].xPos - 2, y);

    if (!(gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP) || (PrepGetDeployedUnitAmt() != 0))
    {
        if ((GetSelectedGameOption() == GAME_OPTION_ANIMATION) && (GetSelectedOptionValue() == 3))
        {
            // Draw sprite for blinking "A Press" prompt
            CallARM_PushToSecondaryOAM(192, 40, gObject_16x16, (time != 0) ? OAM2_CHR(0xCE) + OAM2_PAL(2) : OAM2_CHR(0xCC) + OAM2_PAL(2));
        }
    }

    UpdateMenuScrollBarConfig(10, gConfigUiState->bg1YOffset, gConfigUiState->maxOption, 6);

    return;
}
