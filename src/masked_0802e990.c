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
struct Trap* AddTrap(int x, int y, int trapType, int meta);

struct Trap* AddLightRune(int x, int y)
{
    struct Trap* trap = AddTrap(x, y, TRAP_LIGHT_RUNE, gBmMapTerrain[y][x]);

    trap->data[TRAP_EXTDATA_RUNE_TURNSLEFT] = 3;
    gBmMapTerrain[y][x] = TERRAIN_NONE;

    // return trap; // BUG
}
