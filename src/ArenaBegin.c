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

void ArenaBeginInternal(struct Unit* unit);

void ArenaBegin(struct Unit* unit) {
    StoreRNState(&gActionData.item);
    ArenaBeginInternal(unit);

    return;
}
