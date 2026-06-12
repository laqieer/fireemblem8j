#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "icon.h"
#include "face.h"
#include "statscreen.h"
#include "bm.h"
#include "uiutils.h"
#include "helpbox.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/songs.h"

//! FE8U = 0x0809ECFC
void List_PutHighlightedCategorySprites(struct PrepItemListProc* proc) {
    int x = proc->currentPage * 12 + 124;

    gPaletteBuffer[0x14D] = *(gUnkData_76 + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 24, gPrepWmSell_1[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gPrepWmSell_0, 0x4280);

    UpdateMenuScrollBarConfig(0xc, proc->yOffsetPerPage[proc->currentPage], gPrepscreen_2, 7);

    return;
}
