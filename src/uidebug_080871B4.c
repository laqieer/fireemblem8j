/**
 * Some unused functions and seems cropped.
 * maybe for debug and the source code is not compiled after test.
 */

#include "global.h"
#include "variables.h"
#include "functions.h"

#include "hardware.h"
#include "proc.h"
#include "event.h"
#include "bmunit.h"
#include "bmusemind.h"
#include "player_interface.h"
#include "bmtrick.h"
#include "bmreliance.h"
#include "scene.h"

struct Struct089ED67C {
    /* 00 */ u8 _pad00[0x0C];
    /* 0C */ s8 (*func)();
    /* 10 */ u8 _pad10[0x18 - 0x10];
};





int AreAnyEnemyUnitDead(void)
{
    int i;
    struct Unit *unit;
    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                return 1;
        }
    }
    return 0;
}

u16 GetDeadEnemyAmount()
{
    int i;
    u16 ret = 0;
    struct Unit *unit;
    for (i = FACTION_RED + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                ret++;
        }
    }
    return ret;
}
