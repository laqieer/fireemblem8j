#include "global.h"
#include "hardware.h"
#include "unit_icon_data.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmtrick.h"
#include "chapterdata.h"
#include "ctc.h"
#include "mu.h"
#include "worldmap.h"
#include "bmudisp.h"
#include "bmlib.h"
#include "constants/terrains.h"
#include "constants/event-flags.h"

extern u16 gBmudisp_0[];

//! FE8U = 0x08028160
// attempt with 1D array gets very close
// https://decomp.me/scratch/wkkkM
void TornOutChr(u32 (*r8)[1][1], int r5, int r9, int d)
{
    int i, j;
    int r6 = gBmudisp_0[d];

    for (i = 0; i < r9; i++) {
        for (j = 0; j < r5; j++) {
            u32 ip = ~(0xf << ((r6 & 7) << 2));
            r8[8 * j][0x100 * i][r6 >> 3] &= ip;
        }
    }

    return;
}
