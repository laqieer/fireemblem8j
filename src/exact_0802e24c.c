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
struct Trap* AddDamagingTrap(int x, int y, int trapType, int meta, int turnCountdown, int turnInterval, int damage);

void AddFireTile(int x, int y, int turnCountdown, int turnInterval)
{
    AddDamagingTrap(x, y, TRAP_FIRETILE, 0, turnCountdown, turnInterval, 10);
}
