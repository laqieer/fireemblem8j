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
extern EWRAM_OVERLAY(0) struct PrepScreenItemListEnt gPrepScreenItemList[400];
extern EWRAM_OVERLAY(0) u16 gPrepscreen_2;
extern EWRAM_OVERLAY(0) struct Win1H gPrepscreen_3[2][160];
extern EWRAM_OVERLAY(0) struct Win1H * gPrepscreen_4[2];
extern EWRAM_OVERLAY(0) u16 gPrepscreen_5[0x1C]; // maybe there is 0xC*sizeof(u16) free space

extern u16 CONST_DATA gBgConfig_ItemUseScreen[];



//! FE8U = 0x08095138
void Prep_DrawWindowFrame(u16 * tm, int b, u32 c, int d)
{
    int i;

    CallARM_FillTileRect(tm, Tsa_UnkData_1, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));

    for (i = 0; i < b; i++)
    {
        CallARM_FillTileRect(
            (i * 0x40) + tm + 0x20, Tsa_UnkData_2, (u16)TILEREF((c / 2 & 0xffff) / 0x10, 1));
    }

    CallARM_FillTileRect(
        i * 0x40 + tm + 0x20, Tsa_UnkData_3, (u16)(d * 0x1000 + ((c / 2) & 0xffff) / 0x10));

    return;
}
