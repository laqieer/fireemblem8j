#include "global.h"

#include "ctc.h"
#include "fontgrp.h"
#include "hardware.h"
#include "face.h"
#include "prepscreen.h"
#include "constants/faces.h"

//! FE8U = 0x080A2318
void WmSell_PutSupplyFaceAndText(void) {
    SetTextFont(0);

    TileMap_FillRect(gBG0TilemapBuffer + 0x34, 12, 1, 0);

    PutDrawText(&_PrepItemSuppyTexts->textA, gBG0TilemapBuffer + 0x34 + 0x6d, 0, 2, 0, GetStringFromIndex(0x523)); // TODO msgid "Supply"
    PutFaceChibi(0xAD, gBG0TilemapBuffer + 0x34 - 0x13, 0x270, 2, 1);

    BG_EnableSyncByMask(1);

    return;
}
