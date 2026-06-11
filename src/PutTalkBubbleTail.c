#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

#define TILEMAP_INDEX_UNK(x, y) ((x) + ((y) << 5))

//! FE8U = 0x080084E0
void PutTalkBubbleTail(int bg, int x, int y, int kind) {

    u16* buf = BG_GetMapBuffer(bg);

    switch (kind) {
        case 0:
            // _0800851C
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 6, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 5, 3) + 0x400;

            break;

        case 1:
            // _08008550
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 4, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 4, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 5, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 6, 3);

            break;

        case 2:
            // _08008588
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 8, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 9, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 3:
            // _080085BC
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 8, 3);
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 9, 3);

            break;

        case 4:
            // _080085F4
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 9, 3) + 0x400 + 0x800;
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 8, 3) + 0x400 + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 7, 3) + 0x400;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 7, 3) + 0x400 + 0x800;

            break;

        case 5:
            // _0800862C
            buf[TILEMAP_INDEX_UNK(x    , y    )] = TILEREF(0x10 + 7, 3);
            buf[TILEMAP_INDEX_UNK(x    , y + 1)] = TILEREF(0x10 + 7, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y    )] = TILEREF(0x10 + 9, 3) + 0x800;
            buf[TILEMAP_INDEX_UNK(x + 1, y + 1)] = TILEREF(0x10 + 8, 3) + 0x800;

            break;
    }

    return;
}
