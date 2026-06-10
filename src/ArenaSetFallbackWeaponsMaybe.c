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

void ArenaSetFallbackWeaponsMaybe(void) {
    ArenaSetFallbackWeaponForUnit(gArenaState.playerUnit, &gArenaState.playerWeapon);
    ArenaSetFallbackWeaponForUnit(gArenaState.opponentUnit, &gArenaState.opponentWeapon);

    return;
}
