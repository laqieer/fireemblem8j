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

extern EWRAM_DATA u8 gActiveUnitId;

extern EWRAM_DATA struct Unit gUnitArrayBlue[62]; // Player units
extern EWRAM_DATA struct Unit gUnitArrayRed[50]; // Red units
extern EWRAM_DATA struct Unit gUnitArrayGreen[20]; // Purple units





/* prototypes for same-file helpers called by this run */
const s8* GetUnitMovementCost(struct Unit* unit);

inline s8 CanUnitCrossTerrain(struct Unit* unit, int terrain) {
    const s8* lookup = GetUnitMovementCost(unit);
    return (lookup[terrain] > 0) ? TRUE : FALSE;
}
