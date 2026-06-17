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



extern u8  gSMSGfxBuffer[3][8*0x20*0x20];
extern int  gSomeSMSLookupTable_0[];

void SetStandingMuFacingFast(int frameId, u8* dst) {
    int i;
    int off;

    int frame = GetGameClock() % 72;

    u8 * src = NULL;

    if (frame == 0)
        src = gSMSGfxBuffer[0];

    if (frame == 32)
        src = gSMSGfxBuffer[1];

    if (frame == 36)
        src = gSMSGfxBuffer[2];

    if (frame == 68)
        src = gSMSGfxBuffer[1];

    if (src == NULL)
        return;

    off = gSomeSMSLookupTable_0[frameId] * CHR_SIZE;

    for (i = 0; i <= 3; i++)
    {
        u32 a = off + 0 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        u32 b = off + 1 * CHR_SIZE + i * CHR_SIZE * CHR_LINE;
        CpuFastCopy(
            src + a,
            dst + b,
            2 * CHR_SIZE
        );
    }
}
