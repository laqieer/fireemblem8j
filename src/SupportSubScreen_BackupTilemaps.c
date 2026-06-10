#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"



//! FE8U = 0x080A1AE4
void SupportSubScreen_BackupTilemaps(void) {
    int ix;
    int iy;

    for (ix = 0; ix < 30; ix++) {
        for (iy = 0; iy < 20; iy++) {
            *(gUisupport_0 + TILEMAP_INDEX(ix, iy+0x00)) = gBG0TilemapBuffer[TILEMAP_INDEX(ix, iy)];
            *(gUisupport_0 + TILEMAP_INDEX(ix, iy+0x20)) = gBG1TilemapBuffer[TILEMAP_INDEX(ix, iy)];
            *(gUisupport_0 + TILEMAP_INDEX(ix, iy+0x40)) = gBG2TilemapBuffer[TILEMAP_INDEX(ix, iy)];
        }
    }

    return;
}
