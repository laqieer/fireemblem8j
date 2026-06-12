#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"



extern EWRAM_OVERLAY(0) struct Text gPrepMainMenuTexts[10];
extern EWRAM_OVERLAY(0) u8 gPrepUnitPool[0x1000];
extern EWRAM_OVERLAY(0) struct PrepUnitList gPrepUnitList;
extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenItemList[400];
extern EWRAM_OVERLAY(0) u16 gPrepscreen_2;
extern EWRAM_OVERLAY(0) struct Win1H gPrepscreen_3[2][160];
extern EWRAM_OVERLAY(0) struct Win1H * gPrepscreen_4[2];
extern EWRAM_OVERLAY(0) u16 gPrepscreen_5[0x1C]; // maybe there is 0xC*sizeof(u16) free space

extern u16 CONST_DATA gBgConfig_ItemUseScreen[];



/* prototypes for same-file helpers called by this run */
s8 IsCharacterForceDeployed(int char_id);

int CalcForceDeployedUnitCounts()
{
    int i, ret = 0;
    for (i = 1; i < 0x40; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if ((US_DEAD | US_BIT16) & unit->state)
            continue;

        if (IsCharacterForceDeployed(UNIT_CHAR_ID(unit)))
            ret++;
    }
    return ret;
}
