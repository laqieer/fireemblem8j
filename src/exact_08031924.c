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




s8 IsWeaponMagic(int weaponType) {

    switch (weaponType) {
        case ITYPE_SWORD:
        case ITYPE_LANCE:
        case ITYPE_AXE:
        case ITYPE_BOW:
            return 0;

        case ITYPE_ANIMA:
        case ITYPE_LIGHT:
        case ITYPE_DARK:
            return 1;
    }

}
