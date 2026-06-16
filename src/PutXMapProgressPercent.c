#include "global.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "hardware.h"
#include "bmlib.h"
#include "sio_core.h"
#include "sio.h"
#include "functions.h"

// JP region-different msgid 0x5AE->0x748
void PutXMapProgressPercent(struct Text * th, const char * str, int number)
{
    ClearText(th);

    Text_InsertDrawString(th, 0, 0, str);
    SioDrawNumber(th, 54, 2, number);
    Text_InsertDrawString(th, 62, 0, GetStringFromIndex(0x748));

    PutText(th, TILEMAP_LOCATED(gBG0TilemapBuffer, 15, 12));

    return;
}
