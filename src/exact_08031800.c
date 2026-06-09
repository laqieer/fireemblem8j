#include "global.h"

#include "bmunit.h"
#include "rng.h"
#include "bmitem.h"
#include "bmbattle.h"
#include "bmsave.h"
#include "bmarena.h"
#include "bmmind.h"

#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/items.h"




void ArenaSetResult(int);
void ArenaSetFallbackWeaponsMaybe(void);




int GetUnitBestWRankType(struct Unit* unit) {
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++) {

        if (i == ITYPE_STAFF) {
            continue;
        }

        if (wexp < unit->ranks[i]) {
            wexp = unit->ranks[i];
            type = i;
        }
    }

    return type;
}

int GetClassBestWRankType(const struct ClassData* class) {
    int i;

    int wexp = 0;
    int type = -1;

    for (i = 0; i < 8; i++) {

        if (i == ITYPE_STAFF) {
            continue;
        }

        if (wexp < class->baseRanks[i]) {
            wexp = class->baseRanks[i];
            type = i;
        }
    }

    return type;
}
