#include "global.h"

#include "ap.h"
#include "bm.h"
#include "bmbattle.h"
#include "bmcontainer.h"
#include "bmudisp.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "cgtext.h"
#include "chapterdata.h"
#include "classchg.h"
#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "prepscreen.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "sysutil.h"
#include "uiutils.h"
#include "worldmap.h"

#include "constants/chapters.h"
#include "constants/songs.h"

s8 CheckInLinkArena(void);

void NullExpForChar100AndResetScreen()
{
    struct Unit * unit = GetUnitFromCharId(0x100);
    if (unit)
        unit->exp = -1;

    SetBlendDarken(16);
    SetDispEnable(0, 0, 0, 0, 0);
    ChangeBgm(SONG_COMBAT_PREPARATION, 0x100, 0x100, 0x20, NULL);
}
