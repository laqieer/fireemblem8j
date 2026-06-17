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

void SetStandingMuFacingWM(int frameId, u8 * dst)
{
    int a;
    int i;
    int frame = GetGameClock() % 72;
    u8* src = NULL;

    do {
        if (frame >= 68)
            src = gSMSGfxBuffer[1];
        else if (frame >= 36)
            src = gSMSGfxBuffer[2];
        else if (frame >= 32)
            src = gSMSGfxBuffer[1];
        else if (frame >= 0)
            src = gSMSGfxBuffer[0];
    } while (0);

    if (src == NULL)
        return;

    for (a = frameId * CHR_SIZE, i = 0; i <= 3; a += CHR_SIZE * CHR_LINE, i++)
    {
        RegisterDataMove(
            src + (a),
            dst + (a),
            4 * CHR_SIZE);
    }
}
