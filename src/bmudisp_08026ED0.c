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

/**
* Display standing map sprites and various tile/unit markers
*/

extern UnitIconWait unit_icon_wait_table[];

extern u8 EWRAM_DATA gUnitSpriteSlots[0xD0];

u8 EWRAM_DATA gSMSGfxBuffer[3][8*0x20*0x20] = {};

extern int EWRAM_DATA gSMS16xGfxIndexCounter;
extern int EWRAM_DATA gSMS32xGfxIndexCounter;

extern struct SMSHandle EWRAM_DATA gSMSHandleArray[100];

extern int EWRAM_DATA gSMSSyncFlag;

extern int EWRAM_DATA gMapSpriteSwitchHoverTimer;

extern u8* CONST_DATA UnitSpriteUnpackBuf;

extern int CONST_DATA gSomeSMSLookupTable_0[];







































































extern u16 CONST_DATA sSprite_16x16_Blend[];

extern u16 CONST_DATA sSprite_16x32_Blend[];

extern u16 CONST_DATA sSprite_32x32_Blend[];

extern u16 CONST_DATA sSprite_16x16_Window[];

extern u16 CONST_DATA sSprite_16x32_Window[];

extern u16 CONST_DATA sSprite_32x32_Window[];

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

void SyncUnitSpriteSheet(void)
{
    int frame = GetGameClock() % 72;

    if (frame == 0)
        CpuFastCopy(gSMSGfxBuffer[0], (void*)0x06011000, sizeof(gSMSGfxBuffer[0]));

    if (frame == 32)
        CpuFastCopy(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));

    if (frame == 36)
        CpuFastCopy(gSMSGfxBuffer[2], (void*)0x06011000, sizeof(gSMSGfxBuffer[2]));

    if (frame == 68)
        CpuFastCopy(gSMSGfxBuffer[1], (void*)0x06011000, sizeof(gSMSGfxBuffer[1]));
}
