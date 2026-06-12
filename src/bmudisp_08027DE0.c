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
int UseUnitSprite(u32 id);
int GetUnitSpritePalette(const struct Unit * unit);

void PutUiUnitSprite(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size) {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, gObject_16x16, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, gObject_16x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, gObject_32x32, oam2 + (GetUnitSpritePalette(unit) & 0xf) * 0x1000 + chr);
        break;

    }
}
