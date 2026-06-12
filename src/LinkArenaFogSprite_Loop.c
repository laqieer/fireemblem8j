#include "global.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "mu.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "bmtrick.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bm.h"
#include "bmio.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmitem.h"
#include "icon.h"
#include "uimenu.h"
#include "bksel.h"
#include "bmbattle.h"
#include "uiutils.h"
#include "bmmind.h"
#include "popup.h"
#include "cp_common.h"
#include "cp_perform.h"
#include "ctc.h"
#include "scene.h"
#include "helpbox.h"
#include "mapanim.h"
#include "ekrbattle.h"
#include "event.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "sio_core.h"
#include "sio.h"
#include "constants/msg.h"
#include "constants/songs.h"
#include "constants/terrains.h"
/* TU-private data externs bound at their JP addresses */
extern u8 gLut_LinkArenaFogPlaceholder_YOffset[];

// clang-format on

//! FE8U = 0x0804B278
void LinkArenaFogSprite_Loop(void)
{
    int i;
    int j;

    int yOffset = (gLut_LinkArenaFogPlaceholder_YOffset[GetGameClock() & 0x1f] + 4) >> 1;

    for (i = 0; i < 4; i++)
    {
        if (!Sio_IsPlayerConnected(gSioPoints_0[gSioSt->selfId][i]))
        {
            continue;
        }

        for (j = 0; j < 5; j++)
        {
            struct Unit * unit = GetUnit(gUnk_42[i * 5 + j]);

            if (!UNIT_IS_VALID(unit))
            {
                continue;
            }

            if (!(unit->state & US_BIT9))
            {
                continue;
            }

            CallARM_PushToSecondaryOAM(
                unit->xPos * 16, unit->yPos * 16 - yOffset, gObject_16x8,
                OAM2_PAL(GetUnitDisplayedSpritePalette(unit)) + OAM2_CHR(0x1F0) + OAM2_LAYER(2));
            CallARM_PushToSecondaryOAM(
                unit->xPos * 16, (unit->yPos * 16 - yOffset) + 8, gObject_16x8,
                OAM2_PAL(GetUnitDisplayedSpritePalette(unit)) + OAM2_CHR(0x1F2) + OAM2_LAYER(2));
        }
    }

    return;
}
