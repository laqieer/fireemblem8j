#include "global.h"
#include <stdlib.h>
#include "proc.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "ctc.h"
#include "icon.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmitem.h"
#include "bmunit.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "uiutils.h"
#include "mu.h"
#include "face.h"
#include "bmudisp.h"
#include "bm.h"
#include "bmsave.h"
#include "prepscreen.h"
#include "helpbox.h"
#include "bmlib.h"
#include "constants/classes.h"
#include "statscreen.h"
#include "constants/songs.h"

void DisplayBwl(void)
{
    struct UnitUsageStats* stats = GetPidStats(gStatScreen.unit->pCharacterData->number);

    if (!stats)
        return;

    if (gBmSt.gameStateBits & 0x40)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_TUTORIAL)
        return;

    if (gPlaySt.chapterStateBits & PLAY_FLAG_EXTRA_MAP)
        return;

    if (IsFirstPlaythrough() == TRUE)
        return;

    if (UNIT_FACTION(gStatScreen.unit) != FACTION_BLUE)
        return;

    ClearText(&gStatScreen.text[STATSCREEN_TEXT_BWL]);

    Text_InsertDrawString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        24, TEXT_COLOR_SYSTEM_GOLD, GetStringFromIndex(0x4CC));

    Text_InsertDrawString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        56, TEXT_COLOR_SYSTEM_GOLD, GetStringFromIndex(0x4CD));

    Text_InsertDrawString(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        88, TEXT_COLOR_SYSTEM_GOLD, GetStringFromIndex(0x4CE));

    PutText(&gStatScreen.text[STATSCREEN_TEXT_BWL],
        gUiTmScratchA + TILEMAP_INDEX(3, 14));

    PutNumber(gUiTmScratchA + TILEMAP_INDEX(5, 14),
        TEXT_COLOR_SYSTEM_BLUE, stats->battleAmt);

    PutNumber(gUiTmScratchA + TILEMAP_INDEX(9, 14),
        TEXT_COLOR_SYSTEM_BLUE, stats->winAmt);

    PutNumber(gUiTmScratchA + TILEMAP_INDEX(13, 14),
        TEXT_COLOR_SYSTEM_BLUE, stats->lossAmt);
}
