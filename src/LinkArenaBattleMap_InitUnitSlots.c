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
extern const u8 gSioBattlemap_0[];

// clang-format on

//! FE8U = 0x080494F0
void LinkArenaBattleMap_InitUnitSlots(void)
{
    int faction;
    int i;
    int j;

    for (i = 0; i < 4; i++)
    {
        int playerId = gSioPoints_0[gSioSt->selfId][i];

        if (!Sio_IsPlayerConnected(playerId))
        {
            continue;
        }

        faction = playerId * 0x40 + 1;

        for (j = 0; j < 5; j++)
        {
            int idx = i * 5 + j;
            int unitId = faction + gSioBattlemap_0[j];

            struct Unit * unit = GetUnit(unitId);

            if (unit->pCharacterData != NULL)
            {
                gUnk_42[idx] = unitId;

                unit->xPos = gSioPoints_2[idx].x;
                unit->yPos = gSioPoints_2[idx].y;
            }
        }
    }

    return;
}
