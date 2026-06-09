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

int GetUnitSpritePalette(const struct Unit * unit)
{
    switch (UNIT_FACTION(unit)) {
    case FACTION_BLUE:
        return 0xC;

    case FACTION_RED:
        return 0xD;

    case FACTION_GREEN:
        return 0xE;

    case FACTION_PURPLE:
        return 0xB;
    }
}
