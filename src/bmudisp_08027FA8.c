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
extern struct SMSHandle gSMSHandleArray[];
extern u16 sSprite_16x16_Blend[];
extern u16 sSprite_16x16_Window[];
extern u16 sSprite_16x32_Blend[];
extern u16 sSprite_16x32_Window[];
extern u16 sSprite_32x32_Blend[];
extern u16 sSprite_32x32_Window[];
extern UnitIconWait unit_icon_wait_table[];

#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

int UseUnitSprite(u32 id);

void PutBlendWindowUnitSprite(int layer, int x, int y, int oam2, struct Unit * unit)
{
    u32 id = GetUnitSMSId(unit);
    int chr = UseUnitSprite(id) + 0x80;

    if (x < -16 || x > DISPLAY_WIDTH)
        return;

    if (y < -32 || y > DISPLAY_HEIGHT)
        return;

    switch (GetInfo(id).size) {
    case UNIT_ICON_SIZE_16x16:
        PutSprite(layer, x, y, sSprite_16x16_Blend, oam2 + chr);
        PutSprite(layer, x, y, sSprite_16x16_Window, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_16x32:
        PutSprite(layer, x, y - 16, sSprite_16x32_Blend, oam2 + chr);
        PutSprite(layer, x, y - 16, sSprite_16x32_Window, oam2 + chr);
        break;

    case UNIT_ICON_SIZE_32x32:
        PutSprite(layer, x - 8, y - 16, sSprite_32x32_Blend, oam2 + chr);
        PutSprite(layer, x - 8, y - 16, sSprite_32x32_Window, oam2 + chr);
        break;
    }
}

void ClearUnitSpriteList(void)
{
    gSMSHandleArray[0].pNext = NULL;
}

void HideUnitSprite(struct Unit * unit)
{
    if (!unit)
        RefreshUnitSprites();

    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config |= 0x80;
}
