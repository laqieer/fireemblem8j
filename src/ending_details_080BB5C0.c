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



/* prototypes for same-file helpers called by this run */
int GetUnitASupporterPid(struct Unit * unit);

//! FE8U = 0x080B6A80
bool DoesUnitHavePairedEnding(struct CharacterEndingEnt * pairingEnt, struct Unit * unit)
{
    int pidA = unit->pCharacterData->number;
    int pidB = GetUnitASupporterPid(unit);

    if (pidB == 0)
    {
        return false;
    }

    if (GetUnitFromCharId(pidA)->state & US_DEAD)
    {
        return false;
    }

    if (GetUnitFromCharId(pidB)->state & US_DEAD)
    {
        return false;
    }

    for (; pairingEnt->pidA != 0; pairingEnt++)
    {
        if (pairingEnt->pidA == pidA && pairingEnt->pidB == pidB)
        {
            return true;
        }

        if (pairingEnt->pidA == pidB && pairingEnt->pidB == pidA)
        {
            return true;
        }
    }

    return false;
}
