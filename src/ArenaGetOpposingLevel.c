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

int ArenaGetOpposingLevel(int level) {
    int result = level + NextRN_N(1 + 2 * 4) - 4;

    if (result < 1) {
        result = 1;
    }

    return result;
}
