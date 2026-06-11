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

void InitMapObstacles(void)
{
    int ix, iy;

    for (iy = gBmMapSize.y - 1; iy >= 0; --iy)
    {
        for (ix = gBmMapSize.x - 1; ix >= 0; --ix)
        {
            switch (gBmMapTerrain[iy][ix])
            {

            case TERRAIN_WALL_DAMAGED:
                if (gBmMapTerrain[iy-1][ix] == TERRAIN_WALL_DAMAGED)
                    continue; // walls are stacked, only the topmost tile gets a trap

                AddTrap(
                    ix, iy, TRAP_OBSTACLE,
                    GetROMChapterStruct(gPlaySt.chapterIndex)->mapCrackedWallHeath);

                break;

            case TERRAIN_SNAG:
                AddTrap(ix, iy, TRAP_OBSTACLE, 20);
                break;

            } // switch (gBmMapTerrain[iy][ix])
        }
    }
}
