#include "global.h"

#include "chapterdata.h"
#include "bmsave.h"
#include "hardware.h"
#include "face.h"
#include "bmreliance.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmsave.h"
#include "ctc.h"
#include "bmlib.h"
#include "bmtrade.h"
#include "worldmap.h"
#include "savemenu.h"
#include "sysutil.h"
#include "scene.h"

#include "ending_details.h"

#include "constants/chapters.h"
#include "constants/characters.h"
#include "constants/msg.h"
#include "constants/songs.h"


extern EWRAM_OVERLAY(gameending) u16 gEndingTmScratchA[0x800 / 2];













extern u16 * CONST_DATA gSoloEndingBattleDispConf[];



//! FE8U = 0x080B6A4C
int GetUnitASupporterPid(struct Unit * unit)
{
    int i;

    if (unit == NULL)
    {
        return 0;
    }

    for (i = 0; i < UNIT_SUPPORT_MAX_COUNT; i++)
    {
        if (GetUnitSupportLevel(unit, i) == SUPPORT_LEVEL_A)
        {
            return GetUnitSupporterCharacter(unit, i);
        }
    }

    return 0;
}
