#include "global.h"

#include "cp_common.h"

#include "bmunit.h"
#include "bmmap.h"
#include "bmidoten.h"
#include "bmarch.h"
#include "bmitem.h"
#include "bmphase.h"
#include "cp_common.h"
#include "cp_utility.h"
#include "bmbattle.h"
#include "cp_data.h"

#include "constants/items.h"



/* file-scope type definitions used by this run */


struct RangeScore {
    /* 00 */ s8 x;
    /* 01 */ s8 y;
    /* 02 */ s8 score;
};

//! FE8U = 0x0803E23C
int AiGetTerrainCombatPositionScoreComponent(int x, int y) {
    int terrainId = gBmMapTerrain[y][x];

    return gActiveUnit->pClassData->pTerrainAvoidLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainDefenseLookup[terrainId]
         + gActiveUnit->pClassData->pTerrainResistanceLookup[terrainId];
}
