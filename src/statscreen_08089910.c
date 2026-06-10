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

void DisplaySupportList(void)
{
    int yTile = 6, lineNum = 0;

    int textColor = GetUnitTotalSupportLevel(gStatScreen.unit) == MAX_SIMULTANEOUS_SUPPORT_COUNT
        ? TEXT_COLOR_SYSTEM_GREEN
        : TEXT_COLOR_SYSTEM_WHITE;

    int supportAmt = GetUnitSupporterCount(gStatScreen.unit);
    int supportId  = 0;

    while (supportId < supportAmt)
    {
        int level = GetUnitSupportLevel(gStatScreen.unit, supportId);

        if (level != 0)
        {
            int rankColor;

            u8 pid = GetUnitSupporterCharacter(gStatScreen.unit, supportId);

            DrawIcon(
                gUiTmScratchA + TILEMAP_INDEX(4, yTile),
                GetCharacterAffinityIcon(pid),
                TILEREF(0, STATSCREEN_BGPAL_EXTICONS));

            PutDrawText(&gStatScreen.text[STATSCREEN_TEXT_SUPPORT0 + lineNum],
                gUiTmScratchA + TILEMAP_INDEX(7, yTile),
                textColor, 0, 0,
                GetStringFromIndex(GetCharacterData(pid)->nameTextId));

            rankColor = TEXT_COLOR_SYSTEM_BLUE;

            if (level == 3)
                rankColor = TEXT_COLOR_SYSTEM_GREEN;

            if (textColor == TEXT_COLOR_SYSTEM_GREEN)
                rankColor = TEXT_COLOR_SYSTEM_GREEN;

            PutSpecialChar(gUiTmScratchA + TILEMAP_INDEX(13, yTile),
                rankColor, GetSupportLevelUiChar(level));

            yTile += 2;
            lineNum++;
        }

        supportId++;
    }
}
