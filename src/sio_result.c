

#include "global.h"

#include "hardware.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmlib.h"
#include "bmsave.h"

#include "constants/msg.h"

#include "sio.h"

//! FE8U = 0x08046E5C
void DrawLinkArenaRankIcon(u16 * tm, u32 base)
{
    u16 ref = base * 3 + 0x6078;

    tm[TILEMAP_INDEX(0, 0)] = ref + 8;
    tm[TILEMAP_INDEX(1, 0)] = ref + 9;
    tm[TILEMAP_INDEX(2, 0)] = ref + 10;
    tm[TILEMAP_INDEX(0, 1)] = ref + 0x28;
    tm[TILEMAP_INDEX(1, 1)] = ref + 0x29;
    tm[TILEMAP_INDEX(2, 1)] = ref + 0x2a;

    return;
}

//! FE8U = 0x08046E94
void DrawLinkArenaModeIcon(u16 * tm, u32 base)
{
    u16 ref = base * 4 + 0x6078;

    tm[TILEMAP_INDEX(0, 0)] = ref;
    tm[TILEMAP_INDEX(1, 0)] = ref + 1;
    tm[TILEMAP_INDEX(0, 1)] = ref + 2;
    tm[TILEMAP_INDEX(1, 1)] = ref + 3;

    return;
}
