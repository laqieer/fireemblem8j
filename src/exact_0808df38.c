#include "global.h"

#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"

#include "player_interface.h"

#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

// clang-format off







































//! FE8U = 0x0808BC2C
void GetHpBarMidTiles(u16 * buffer, s16 hp, int tileBase)
{
    int i;

    int hpEighth = hp >> 3;
    int eighthTileIdx = hp & 7;

    for (i = 0; i < 5; i++)
    {
        int fullTileIdx = tileBase + 14;
        int emptyTileIdx = tileBase + 6;

        if (i < hpEighth) // full
            *buffer = fullTileIdx;
        else if (i == hpEighth) // partial
            *buffer = emptyTileIdx + eighthTileIdx;
        else // empty
            *buffer = emptyTileIdx;

        buffer++;
    }

    return;
}
