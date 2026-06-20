#include "global.h"
#include "bmlib.h"
#include "fontgrp.h"
#include "hardware.h"
#include "uiutils.h"
#include "functions.h"
#include "sio.h"
void XMapTransfer_4(void) {
    UnpackUiBarPalette(6);
    DrawUiFrame2(0xd, 0xb, 0x10, 6, 0);
    SetTextFont(&Font_0);
    InitSystemTextFont();
    PutXMapProgressPercent(&gUnk_Sio_7[0], GetStringFromIndex(0x59), 0);
    DrawStatBarGfx(0x100, 0xd, TILEMAP_LOCATED(gBG0TilemapBuffer, 14, 15), 0x6000, 100, 0, 100);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}
