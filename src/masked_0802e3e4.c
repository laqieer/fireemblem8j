#include "global.h"

#include "constants/terrains.h"
#include "constants/event-flags.h"

#include "bmunit.h"
#include "bmmap.h"
#include "chapterdata.h"
#include "proc.h"
#include "event.h"
#include "uiselecttarget.h"
#include "bmtarget.h"
#include "bmudisp.h"
#include "bmusailment.h"
#include "bmtrick.h"



 void GenerateFireTileTrapTargets(int x, int y, int damage);
 void GenerateArrowTrapTargets(int x, int y, int damage);
 void GenerateGasTrapTargets(int x, int y, int damage, int facing);
 s8 ShouldSkipGasTrapDisplay(int x, int y, int facing);




/* prototypes for same-file helpers called by this run */
struct Trap* GetTrapAt(int x, int y);

int GetObstacleHpAt(int x, int y)
{
    struct Trap* trap;

    if ((trap = GetTrapAt(x, y)) != NULL)
    {
        return trap->extra;
    }

    if ((gBmMapTerrain[y][x] == TERRAIN_WALL_DAMAGED) && (gBmMapTerrain[y-1][x] == TERRAIN_WALL_DAMAGED))
    {
        if ((trap = GetTrapAt(x, y-1)) != NULL)
        {
            return trap->extra;
        }
    }

    return 0;
}
