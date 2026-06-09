#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "uiutils.h"
#include "bmio.h"
#include "soundwrapper.h"
#include "bmunit.h"
#include "prepscreen.h"
#include "mapanim.h"
#include "bmlib.h"
#include "constants/songs.h"

u16* GetBattleInfoPalByFaction(struct Unit* unit)
{
    switch (UNIT_FACTION(unit)) {
    case FACTION_BLUE:
        return Pal_MapBattleInfoBlue;

    case FACTION_RED:
        return Pal_MapBattleInfoRed;

    case FACTION_GREEN:
        return Pal_MapBattleInfoGreen;

    case FACTION_PURPLE:
        return Pal_MapBattleInfoPurple;
    } // switch (UNIT_FACTION(unit))

    return NULL;
}
