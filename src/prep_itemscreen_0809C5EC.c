#include "global.h"

#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"

#include "prepscreen.h"

#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

int CheckInLinkArena(void);

extern EWRAM_OVERLAY(0) struct Text gPrepItemTexts[32];







//! FE8U = 0x0809A31C
void PrepItemDrawPopupBox(int x, int y, int w, int h, int oam2)
{
    int i;
    int j;

    if ((w <= 0) || (h <= 0))
    {
        return;
    }

    PutSpriteExt(4, x, y, gObject_8x8, oam2 + 0);
    PutSpriteExt(4, x + w * 8, y, gObject_8x8, oam2 + 3);
    PutSpriteExt(4, x + w * 8, y + h * 8, gObject_8x8, oam2 + 13);
    PutSpriteExt(4, x, y + h * 8, gObject_8x8, oam2 + 10);

    for (j = 1; j < (w - 1); j += 2)
    {
        PutSpriteExt(4, x + j * 8, y, gObject_16x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_16x8, oam2 + 11);
    }

    for (; j < w; j++)
    {
        PutSpriteExt(4, x + j * 8, y, gObject_8x8, oam2 + 1);
        PutSpriteExt(4, x + j * 8, y + h * 8, gObject_8x8, oam2 + 11);
    }

    for (i = 1; i < h; i++)
    {
        PutSpriteExt(4, x, y + i * 8, gObject_8x8, oam2 + 4);
        PutSpriteExt(4, x + w * 8, y + i * 8, gObject_8x8, oam2 + 9);
    }

    for (i = 1; i < h; i++)
    {
        for (j = 1; j < w - 3; j += 4)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_32x8, oam2 + 5);
        }

        for (; j < w - 1; j += 2)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_16x8, oam2 + 5);
        }

        for (; j < w; j++)
        {
            PutSpriteExt(4, x + 8 * j, y + i * 8, gObject_8x8, oam2 + 5);
        }
    }

    return;
}
