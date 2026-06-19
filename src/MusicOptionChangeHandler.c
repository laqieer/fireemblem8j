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

bool MusicOptionChangeHandler(ProcPtr proc)
{
    if (GenericOptionChangeHandler(proc) == 0)
        return false;

    if (GetGameOption(gGameOptionsUiOrder[gConfigUiState->selectedOptionIdx]) != 0)
    {
        Sound_FadeOutBGM(1);
        return false;
    }

    if (gConfigUiState->source & CONFIG_UI_SOURCE_FROMPREP)
    {
        StartBgm(SONG_COMBAT_PREPARATION, NULL);
        return false;
    }

    if (gConfigUiState->source & CONFIG_UI_SOURCE_FROMWM)
        UpdateWorldMapBgm();
    else
        StartMapSongBgm();

    return false;
}
