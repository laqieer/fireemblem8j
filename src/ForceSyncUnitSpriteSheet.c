#include "global.h"
#include "hardware.h"
#include "bmunit.h"
#include "bmudisp.h"

extern int gSMSSyncFlag;
extern u8 gSMSGfxBuffer[3][8 * 0x20 * 0x20];

void ForceSyncUnitSpriteSheet(void)
{
    int frame;
    gSMSSyncFlag = 0;

    frame = GetGameClock() % 72;

    if (frame >= 68)
    {
        RegisterDataMove(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 36)
    {
        RegisterDataMove(gSMSGfxBuffer[2], (void*)0x06011000, sizeof(gSMSGfxBuffer[2]));
        return;
    }

    if (frame >= 32)
    {
        RegisterDataMove(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
        return;
    }

    if (frame >= 0)
    {
        RegisterDataMove(gSMSGfxBuffer[0], (void*)0x06011000, sizeof(gSMSGfxBuffer[0]));
        return;
    }
}
