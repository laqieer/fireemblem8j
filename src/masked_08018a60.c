#include "global.h"

#include <string.h>

#include "constants/items.h"
#include "constants/classes.h"
#include "constants/characters.h"
#include "constants/terrains.h"

#include "bmitem.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmbattle.h"
#include "bmreliance.h"
#include "bmtrick.h"
#include "monstergen.h"
#include "prepscreen.h"
#include "uiselecttarget.h"
#include "bmdifficulty.h"
#include "cp_utility.h"
#include "bmudisp.h"
#include "bmsave.h"
#include "muctrl.h"
#include "bmmind.h"
#include "eventcall.h"




 // Purple units





const s8* GetUnitMovementCost(struct Unit* unit) {
    if (unit->state & US_IN_BALLISTA)
        return Unk_TerrainTable_0;

    switch (gPlaySt.chapterWeatherId) {

    case WEATHER_RAIN:
        return unit->pClassData->pMovCostTable[1];

    case WEATHER_SNOW:
    case WEATHER_SNOWSTORM:
        return unit->pClassData->pMovCostTable[2];

    default:
        return unit->pClassData->pMovCostTable[0];

    } // switch (gPlaySt.chapterWeatherId)
}
