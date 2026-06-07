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













int EWRAM_DATA gMapSpriteSwitchHoverTimer = 0;























































































#define GetInfo(id) (unit_icon_wait_table[(id) & ((1<<7)-1)])

/* prototypes for same-file helpers called by this run */
void HideUnitSprite(struct Unit * unit);
void ShowUnitSprite(struct Unit * unit);

void ResetUnitSpriteHoverCursor(void)
{
    gBmSt.cursorPrevious.x = -1;
    return;
}

void ResetUnitSpriteHover(void)
{
    gMapSpriteSwitchHoverTimer = 0;
    return;
}

void UnitSpriteHoverUpdate(void)
{
    struct Unit * unit;

    unit = GetUnit(gBmMapUnit[gBmSt.playerCursor.y][gBmSt.playerCursor.x]);
    if (unit)
    {
        if (!(unit->state & US_UNSELECTABLE)
            && (UNIT_FACTION(unit) == FACTION_BLUE)
            && unit->statusIndex != UNIT_STATUS_BERSERK
            && unit->statusIndex != UNIT_STATUS_SLEEP)
            {
            gMapSpriteSwitchHoverTimer++;

            if (gMapSpriteSwitchHoverTimer == 5)
            {
                StartMu(unit);
                HideUnitSprite(unit);
                return;
            }
        }
    }

    if (gBmSt.cursorPrevious.x != gBmSt.playerCursor.x || gBmSt.cursorPrevious.y != gBmSt.playerCursor.y)
    {
        gMapSpriteSwitchHoverTimer = 0;
        unit = GetUnit(gBmMapUnit[gBmSt.cursorPrevious.y][gBmSt.cursorPrevious.x]);
        if (unit)
        {
            EndAllMus();
            ShowUnitSprite(unit);
        }
    }
}
