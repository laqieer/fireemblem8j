#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"

void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line)
{
    int i, color, itext, ilist, _line;
    u32 val;
    struct Unit * unit;

    /**
     * It use 14 Texts to store 6 line of 12 Units;
     */

    i = 0;
    val = line * 2;
    _line = line % 7;

    for (; i < 2; i++) {
        itext = val + i;

        if (itext >= PrepGetUnitAmount())
            continue;

        unit = GetUnitFromPrepList(itext);

        color = TEXT_COLOR_SYSTEM_WHITE;
        if (!CheckInLinkArena() && IsCharacterForceDeployed(unit->pCharacterData->number))
            color = TEXT_COLOR_SYSTEM_GREEN;
        else if (unit->state & US_NOT_DEPLOYED)
            color = TEXT_COLOR_SYSTEM_GRAY;

        ilist = _line * 2 + i;

        ClearText(&gPrepUnitTexts[ilist]);

        PutDrawText(
            &gPrepUnitTexts[ilist],
            TILEMAP_LOCATED( gBG2TilemapBuffer, 0x10 + i * 7, val % 0x20),
            color,
            0, 0,
            GetStringFromIndex(unit->pCharacterData->nameTextId) );
    }

    BG_EnableSyncByMask(BG2_SYNC_BIT);
}
