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





// clang-format off









/* prototypes for same-file helpers called by this run */
void DrawGameOptionIcon(int selectedIdx, int yBase);
void DrawGameOptionText(int selectedIdx, int textIdx, int y);
void DrawOptionValueTexts(int selectedIdx, int textIdx, int y);

//! FE8U: 0x080B1DE8
u8 GetGameOption(u8 index)
{
    int value = 0;

    switch (index)
    {
    case GAME_OPTION_ANIMATION:
        switch (gPlaySt.config.animationType)
        {
        case PLAY_ANIMCONF_ON:
            return 0;
        case PLAY_ANIMCONF_ON_UNIQUE_BG:
            return 1;
        case PLAY_ANIMCONF_OFF:
            return 2;
        case PLAY_ANIMCONF_SOLO_ANIM:
            return 3;
        }

        // fallthrough

    case GAME_OPTION_TERRAIN:
        value = gPlaySt.config.disableTerrainDisplay;

        break;

    case GAME_OPTION_UNIT:
        value = gPlaySt.config.unitDisplayType;

        break;

    case GAME_OPTION_AUTOCURSOR:
        value = gPlaySt.config.autoCursor;

        break;

    case GAME_OPTION_TEXT_SPEED:
        value = gPlaySt.config.textSpeed;

        break;

    case GAME_OPTION_GAME_SPEED:
        value = gPlaySt.config.gameSpeed;

        break;

    case GAME_OPTION_MUSIC:
        value = gPlaySt.config.disableBgm;

        break;

    case GAME_OPTION_SOUND_EFFECTS:
        value = gPlaySt.config.disableSoundEffects;

        break;

    case GAME_OPTION_WINDOW_COLOR:
        value = gPlaySt.config.windowColor;

        break;

    case GAME_OPTION_COMBAT:
        value = gPlaySt.config.battleForecastType;

        break;

    case GAME_OPTION_SUBTITLE_HELP:
        value = gPlaySt.config.noSubtitleHelp;

        break;

    case GAME_OPTION_AUTOEND_TURNS:
        value = gPlaySt.config.disableAutoEndTurns;

        break;

    case GAME_OPTION_UNIT_COLOR:
        value = gPlaySt.config.unitColor;

        break;

    case GAME_OPTION_OBJECTIVE:
        value = gPlaySt.config.disableGoalDisplay;

        break;

    case GAME_OPTION_CONTROLLER:
        value = gPlaySt.config.controller;

        break;

    case GAME_OPTION_RANK_DISPLAY:
        value = gPlaySt.config.rankDisplay;

        break;
    }

    return value;
}

//! FE8U: 0x080B1F64
void SetGameOption(u8 index, u8 newValue)
{
    switch (index)
    {
    case GAME_OPTION_ANIMATION:
        switch (newValue)
        {
        case 0:
            gPlaySt.config.animationType = PLAY_ANIMCONF_ON;
            return;

        case 1:
            gPlaySt.config.animationType = PLAY_ANIMCONF_ON_UNIQUE_BG;
            return;

        case 2:
            gPlaySt.config.animationType = PLAY_ANIMCONF_OFF;
            return;

        case 3:
            gPlaySt.config.animationType = PLAY_ANIMCONF_SOLO_ANIM;
            return;
        }

        // fallthrough

    case GAME_OPTION_TERRAIN:
        gPlaySt.config.disableTerrainDisplay = newValue;

        break;

    case GAME_OPTION_UNIT:
        gPlaySt.config.unitDisplayType = newValue;

        break;

    case GAME_OPTION_AUTOCURSOR:
        gPlaySt.config.autoCursor = newValue;

        break;

    case GAME_OPTION_TEXT_SPEED:
        gPlaySt.config.textSpeed = newValue;

        break;

    case GAME_OPTION_GAME_SPEED:
        gPlaySt.config.gameSpeed = newValue;

        break;

    case GAME_OPTION_MUSIC:
        gPlaySt.config.disableBgm = newValue;

        break;

    case GAME_OPTION_SOUND_EFFECTS:
        gPlaySt.config.disableSoundEffects = newValue;

        break;

    case GAME_OPTION_WINDOW_COLOR:
        gPlaySt.config.windowColor = newValue;

        break;

    case GAME_OPTION_COMBAT:
        gPlaySt.config.battleForecastType = newValue;

        break;

    case GAME_OPTION_SUBTITLE_HELP:
        gPlaySt.config.noSubtitleHelp = newValue;

        break;

    case GAME_OPTION_AUTOEND_TURNS:
        gPlaySt.config.disableAutoEndTurns = newValue;

        break;

    case GAME_OPTION_UNIT_COLOR:
        gPlaySt.config.unitColor = newValue;

        break;

    case GAME_OPTION_OBJECTIVE:
        gPlaySt.config.disableGoalDisplay = newValue;

        break;

    case GAME_OPTION_CONTROLLER:
        gPlaySt.config.controller = newValue;

        break;

    case GAME_OPTION_RANK_DISPLAY:
        gPlaySt.config.rankDisplay = newValue;

        break;
    }

    return;
}

//! FE8U: 0x080B2188
void PutGameOptionRow(ProcPtr proc, int selectedIdx, int c)
{
    int i;
    int textIdx;

    int y = ((selectedIdx * 2) + 5) & 0x1f;

    int yTmp = 0x20 * y;

    for (i = 0; i <= 26; i++)
    {
        gBG1TilemapBuffer[yTmp + 0x02 + i] = 0;
        gBG1TilemapBuffer[yTmp + 0x22 + i] = 0;
    }

    textIdx = selectedIdx % 7;

    DrawGameOptionIcon(selectedIdx, 5);
    DrawGameOptionText(selectedIdx, textIdx, y);
    DrawOptionValueTexts(selectedIdx, textIdx, y);

    for (i = 0; i <= 26; i++)
    {
        gBG0TilemapBuffer[c + 0x62 + i] = 0;
    }

    BG_EnableSyncByMask(BG0_SYNC_BIT | BG1_SYNC_BIT);

    return;
}
