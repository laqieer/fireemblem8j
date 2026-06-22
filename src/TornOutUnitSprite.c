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
#include "constants/video-global.h"

/* TU-private data externs bound at their JP addresses */
extern u8 gUnitSpriteSlots[];
extern u8 gSMSGfxBuffer[3][8 * 0x20 * 0x20];
extern u16 gBmudisp_0[];
extern UnitIconWait unit_icon_wait_table[];

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1 << 7) - 1)])

//! FE8U = 0x08026BC0
void TornOutUnitSprite(struct Unit * unit, int timer)
{
    u8 r4;
    u16 r6;
    int r7;
    int i, j;
    int slot;

    slot = GetUnitSMSId(unit);
    r7 = UseUnitSprite(slot) * 0x20;
    r6 = gBmudisp_0[timer];

    r4 = 0;
    i = GetGameClock() % 0x48;

    if (i >= 0x44) r4 = 1;
    if (i >= 0x24) r4 = 2;
    if (i >= 0x20) r4 = 1;
    if (i >= 0) r4 = 0;

    switch (GetInfo(slot).size) {
    case 0:
        for (i = 0; i < 3; i++)
        {
            for (j = 0; j < 2; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2); }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011000), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011400), 2 * CHR_SIZE);
        break;

    case 1:
        for (i = 0; i < 3; i++)
        {
            int var = 2; // for reordering the unrolled expressions
            for (j = 0; j < 2; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011000), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011400), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011800), 2 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011C00), 2 * CHR_SIZE);
        break;

    case 2:
        for (i = 0; i < 3; i++)
        {
            int var = 2;
            for (j = 0; j < 4; j++)
            {
                { int offset = 0 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << var); }
                { int offset = 1 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 2 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
                { int offset = 3 * CHR_SIZE * CHR_LINE + j * CHR_SIZE; gSMSGfxBuffer[i][r7 + offset + (r6 >> 1)] &= 0xf << (!(r6 & 1) << 2);   }
            }
        }

        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 0 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011000), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 1 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011400), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 2 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011800), 4 * CHR_SIZE);
        CpuFastCopy(&gSMSGfxBuffer[r4][r7 + 3 * CHR_SIZE * CHR_LINE], (u8*)(r7 + 0x06011C00), 4 * CHR_SIZE);
        break;
    }

    if (timer == 0x3f)
        gUnitSpriteSlots[slot] |= 0xff;
}
