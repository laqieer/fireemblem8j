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





































































































#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

//! FE8U = 0x08028130
void ShowUnitSprite(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return;

    unit->pMapSpriteHandle->config &= ~(0x80);
}

u8 GetUnitSpriteHideFlag(struct Unit * unit)
{
    if (!unit->pMapSpriteHandle)
        return 0x80;

    return unit->pMapSpriteHandle->config & 0x80;
}
