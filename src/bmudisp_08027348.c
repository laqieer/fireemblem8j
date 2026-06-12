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



extern int EWRAM_DATA gSMS16xGfxIndexCounter;
extern int EWRAM_DATA gSMS32xGfxIndexCounter;

extern struct SMSHandle EWRAM_DATA gSMSHandleArray[100];
extern struct SMSHandle * EWRAM_DATA gSMSHandleIt;

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

/* prototypes for same-file helpers called by this run */
void PutUnitSpriteIconsOam(void);

void PutUnitSpritesOam(void)
{
    struct SMSHandle * it = gSMSHandleArray->pNext;

    PutUnitSpriteIconsOam();

    if (it == NULL)
        return;

    for (; it != NULL; it = it->pNext)
    {
        int r3 = 0;

        int x = it->xDisplay - gBmSt.camera.x;
        int y = it->yDisplay - gBmSt.camera.y;

        if (x < -16 || x > DISPLAY_WIDTH)
            continue;

        if (y < -32 || y > DISPLAY_HEIGHT)
            continue;

        if (it->config & 0x80)
            continue;

        if (it->config & 0x40)
            r3 = GetGameClock() & 2;

        switch ((it->config & 0xf)) {
        case 0:
            CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y), gObject_16x16, it->oam2Base + OAM2_LAYER(2));
            break;

        case 1:
            CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(2));
            break;

        case 2:
            CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(2));
            break;

        case 3:
            CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y), gObject_16x16, it->oam2Base + OAM2_LAYER(3));;
            break;

        case 4:
            CallARM_PushToSecondaryOAM(OAM1_X(x+r3+0x200), OAM0_Y(0x100+y - 16), gObject_16x32, it->oam2Base + OAM2_LAYER(3));
            break;

        case 5:
            CallARM_PushToSecondaryOAM(OAM1_X((x-8)+r3+0x200), OAM0_Y(0x100+y - 16), gObject_32x32, it->oam2Base + OAM2_LAYER(3));
            break;
        }
    }
}
