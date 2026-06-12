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

void PutChapterMarkedTileIconOam(void)
{
    int x;
    int y;
    int xTile;
    int yTile;
    int shouldDisplay;

    xTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosX;
    yTile = GetROMChapterStruct(gPlaySt.chapterIndex)->destPosY;

    shouldDisplay = (GetGameClock() & 0x1f) < 0x14 ? 1 : 0;

    if (xTile == 0xFF)
        return;

    if (shouldDisplay == 0)
        return;

    if (gBmMapFog[yTile][xTile] == 0)
        return;

    if (gBmMapTerrain[yTile][xTile] == TERRAIN_ROOF)
        return;

    x = xTile * 16 - gBmSt.camera.x;
    y = yTile * 16 - gBmSt.camera.y;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -16 || y > DISPLAY_HEIGHT)
        return;

    CallARM_PushToSecondaryOAM(OAM1_X(0x200+x + 4), OAM0_Y(0x100+y + 7), gObject_8x8, 0xC51);
}
