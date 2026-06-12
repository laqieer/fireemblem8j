#include "global.h"
#include "constants/terrains.h"
#include "bmmap.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bm.h"
#include "bmlib.h"
#include "bmunit.h"
#include "ctc.h"
#include "minimap.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern u16 * gMinimapObjectFlashPal;

//! FE8U = 0x080A849C
void Minimap_ApplyFlashPalette() {
    u8 gUnknown_08205D87[] = {
        0, 4, 7, 6,
        5, 4, 3, 2,
        2, 1, 1, 1,
        0, 0, 0, 0,
    };

    u8 idx = gUnknown_08205D87[(GetGameClock() >> 2) % sizeof(gUnknown_08205D87)];

    ApplyPalette(gMinimapObjectFlashPal + idx * 0x10, 4);

    return;
}
