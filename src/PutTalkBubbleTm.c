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

//! FE8U = 0x08008668
void PutTalkBubbleTm(int bg, int x, int y, int width, int height) {
    int i;
    int j;

    u16* buf = BG_GetMapBuffer(bg);

    width = width - 1;
    height = height - 1;

    for (i = x; i < x + width; i++) {
        buf[TILEMAP_INDEX_UNK(i, y         )] = TILEREF(0x10 + 1, 3);
        buf[TILEMAP_INDEX_UNK(i, y + height)] = TILEREF(0x10 + 1, 3) + 0x800;
    }

    for (i = y; i < y + height; i++) {
        buf[TILEMAP_INDEX_UNK(x        , i)] = TILEREF(0x10 + 2, 3);
        buf[TILEMAP_INDEX_UNK(x + width, i)] = TILEREF(0x10 + 2, 3) + 0x400;
    }

    for (i = x + 1; i < x + width; i++) {
        for (j = y + 1; j < y + height; j++) {
            buf[TILEMAP_INDEX_UNK(i, j)] = TILEREF(0x10 + 3, 3);
        }
    }

    buf[TILEMAP_INDEX_UNK(x        , y         )] = TILEREF(0x10 + 0, 3);
    buf[TILEMAP_INDEX_UNK(x + width, y         )] = TILEREF(0x10 + 0, 3) + 0x400;
    buf[TILEMAP_INDEX_UNK(x        , y + height)] = TILEREF(0x10 + 0, 3) + 0x800;
    buf[TILEMAP_INDEX_UNK(x + width, y + height)] = TILEREF(0x10 + 0, 3) + 0x400 + 0x800;

    return;
}
