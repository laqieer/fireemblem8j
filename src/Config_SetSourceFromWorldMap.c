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

static inline s8 * GetConfigSource(void)
{
    return &gConfigUiState->source;
}

//! FE8U: 0x080B24C0
void Config_SetSourceFromWorldMap(void)
{
    s8 * source = GetConfigSource();
    *source |= CONFIG_UI_SOURCE_FROMWM;
    ResetUnitSprites();

    return;
}
