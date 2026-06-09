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





void Debug_DecrementUnitStats(struct Unit *unit)
{
    if (unit->maxHP > 0)
        unit->maxHP -= 1;
    
    if (unit->pow > 0)
        unit->pow -= 1;
    
    if (unit->skl > 0)
        unit->skl -= 1;

    if (unit->spd > 0)
        unit->spd -= 1;

    if (unit->def > 0)
        unit->def -= 1;

    if (unit->res > 0)
        unit->res -= 1;

    if (unit->lck > 0)
        unit->lck -= 1;
}
