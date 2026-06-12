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

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

void PrepUnit_InitGfx()
{
    ResetIconGraphics_();
    LoadUiFrameGraphics();
    LoadObjUIGfx();
    LoadIconPalettes(BGPAL_ICONS);

    Prep_DrawChapterGoal(0x6000, 8);
    Prep_LoadWindowGfx(0x6000, 0xF);

    Decompress(gUnkData_69, (void*)0x06000440);
    Decompress(gUnkData_70, gGenericBuffer);
    CallARM_FillTileRect(gBG1TilemapBuffer, gGenericBuffer, 0x1000);

    Decompress(gUnkData_79, (void*)0x6010800);
    ApplyPalette(Pal_MapBattleInfoNum, 0x19);
    EnablePaletteSync();
}
