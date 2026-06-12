#include "global.h"

#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmsave.h"
#include "bmunit.h"
#include "hardware.h"
#include "uiutils.h"
#include "bm.h"
#include "ap.h"
#include "gamecontrol.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "soundroom.h"
#include "bonusclaim.h"
#include "worldmap.h"
#include "bonusclaim.h"
#include "sysutil.h"
#include "helpbox.h"
#include "savemenu.h"
#include "uisupport.h"
#include "gba_sprites.h"

#include "constants/event-flags.h"
#include "constants/characters.h"
#include "constants/chapters.h"
#include "constants/songs.h"

extern u16 gEndingTmScratchA[];

extern EWRAM_DATA struct SaveMenuRTextData gSaveMenuRTextData;

// TODO: Implicit declaration
int LoadBonusContentData(void *);

void SaveMenuUpdateCursorPalette(int a, int b)
{
    int offset = (a & 0x3F) >> 2;
    u16 * _src, * src = gPaletteBuffer;
    u16 * dst = Pal_MenuSaveMainBg_0 + offset;
    int val;

    val = *dst;
    src[0x111] = val;

    _src = src + (b * 0x20 + 0x1A1);
    _src[0] = *dst;

    EnablePaletteSync();
}
