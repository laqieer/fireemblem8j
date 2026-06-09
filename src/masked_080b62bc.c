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

struct ConfigScreen * CONST_DATA gConfigUiState = (struct ConfigScreen *)gGenericBuffer;



// clang-format off









// clang-format on

//! FE8U: 0x080B169C
// Unused in FE8; appears to be leftover from FE7
s16 GetConfigUnk32DifficultyAdjusted(void)
{
    int unk = gConfigUiState->unk_32;

    if (!(gPlaySt.chapterStateBits & PLAY_FLAG_HARD))
        return unk;

    return unk + 3;
}
