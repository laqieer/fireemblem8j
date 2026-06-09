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
const struct MapChange* GetMapChange(int id);

void ApplyMapChangesById(int id)
{
    int ix = 0, iy = 0;

    const struct MapChange* mapChange = GetMapChange(id);
    const u16* tileDataIt = mapChange->data;

    for (iy = 0; iy < mapChange->ySize; ++iy)
    {
        for (ix = 0; ix < mapChange->xSize; ++ix)
        {
            if (*tileDataIt != 0)
            {
                gBmMapBaseTiles[mapChange->yOrigin + iy][mapChange->xOrigin + ix] = *tileDataIt++;
            }
            else
            {
                ++tileDataIt;
            }
        }
    }
}
