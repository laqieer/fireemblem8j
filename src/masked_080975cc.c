#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"

EWRAM_DATA struct SioPidPool gSioPidPool = { 0 }; // maybe there is 0xC*sizeof(u16) free space





void RegisterSioPid(u8 pid)
{
    int i;
    for (i = 0; i < 5; i++)
        if (0 == gSioPidPool.pids[i]) {
            gSioPidPool.pids[i] = pid;
            return;
        }
}

void RemoveSioPid(u8 pid)
{
    int i, j;
    for (i = 0; i < 5; i++) {
        if (gSioPidPool.pids[i] != pid)
            continue;

        j = i;
        if (i <= 3) {
            while (j <= 3) {
                gSioPidPool.pids[j] = gSioPidPool.pids[j + 1];
                j++;
            }
        }

        gSioPidPool.pids[4] = 0;
        break;
    }
}
