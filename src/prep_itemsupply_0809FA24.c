#include "global.h"

#include "ctc.h"
#include "hardware.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "bmitem.h"
#include "icon.h"
#include "face.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmcontainer.h"
#include "mu.h"
#include "bmudisp.h"
#include "bmmind.h"
#include "bmio.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "constants/faces.h"

#include "prepscreen.h"
#include "constants/songs.h"



//! FE8U = 0x0809D784
void PutGiveTakeBoxSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x21, 5, 4, 0xA840);
    PutSpriteExt(4, 72, 0x25, gObject_32x16, 0xB080);
    PutSpriteExt(4, 72, 0x35, gObject_32x16, 0xB088);
    return;
}

//! FE8U = 0x0809D7D4
void PutGiveSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x21, 5, 2, 0xA840);
    PutSpriteExt(4, 72, 0x25, gObject_32x16, 0xB080);
    return;
}

//! FE8U = 0x0809D80C
void PutTakeSprites(void)
{
    PrepItemDrawPopupBox(0x40, 0x31, 5, 2, 0xA840);
    PutSpriteExt(4, 72, 0x35, gObject_32x16, 0xB088);
    return;
}

//! FE8U = 0x0809D844
void Supply_PutHighlightedCategorySprites(struct PrepItemSupplyProc * proc)
{
    int x = proc->currentPage * 12 + 124;

    gPaletteBuffer[0x14D] = *(gUnkData_76 + (GetGameClock() >> 2 & 0xf));
    EnablePaletteSync();

    PutSprite(4, x, 24, gPrepWmSell_1[proc->currentPage], 0x4280);
    PutSprite(4, x, 24, gPrepWmSell_0, 0x4280);

    UpdateMenuScrollBarConfig(0xc, proc->yOffsetPerPage[proc->currentPage], gPrepscreen_2, 7);

    return;
}
