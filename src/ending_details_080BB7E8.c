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



//! FE8U = 0x080B6CA8
void CharacterEnding_LoadUnitBattleStats(struct EndingBattleDisplayProc * proc)
{
    int i;

    for (i = 0; i < 2; i++)
    {
        struct UnitUsageStats * bwl;

        struct Unit * unit = proc->units[i];

        if (unit == NULL)
        {
            continue;
        }

        bwl = GetPidStats(unit->pCharacterData->number);

        proc->battleAmounts[i] = bwl->battleAmt < 999 ? bwl->battleAmt : 999;
        proc->winAmounts[i] = bwl->winAmt < 999 ? bwl->winAmt : 999;
        proc->lossAmounts[i] = bwl->lossAmt;
    }

    return;
}
