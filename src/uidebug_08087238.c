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





s8 IsCharDeadAsNonPlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    for (i = FACTION_GREEN + 1; i < FACTION_PURPLE; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_DEAD & unit->state))
                if (unit->pCharacterData->number == pid)
                    return 1;
        }
    }
    return 0;
}

int CountDeployedSelectablePlayerUnits()
{
    int i;
    int ret = 0;
    struct Unit *unit;
    for (i = FACTION_BLUE + 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == ((US_NOT_DEPLOYED | US_DEAD) & unit->state))
                if (0 == (US_UNSELECTABLE & unit->state))
                    ret++;
        }
    }
    return ret;
}

int AreAllNpcUnitsUnselectable()
{
    int i;
    struct Unit *unit;
    for (i = FACTION_GREEN + 1; i < FACTION_RED; i++) {
        unit = GetUnit(i);
        if (UNIT_IS_VALID(unit)) {
            if (0 == (US_UNSELECTABLE & unit->state))
                return 0;
        }
    }
    return 1;
}

s8 IsChar0AliveAsNonPlayerUnit() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_02() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_03() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_2() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_02_2() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_03_2() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_04() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_05() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_06() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_07() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0AliveAsNonPlayerUnit_08() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_09() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_10() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_11() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_12() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_13() {return IsCharDeadAsNonPlayerUnit(0);}

s8 IsChar0DeadAsNonPlayerUnit_14() {return IsCharDeadAsNonPlayerUnit(0);}

s8 DoChars0And0HaveMaxSupport() {return HaveCharactersMaxSupport(0, 0);}

s8 HaveChars0MaxSupport_02() {return HaveCharactersMaxSupport(0, 0);}

s8 HaveChars0MaxSupport_03() {return HaveCharactersMaxSupport(0, 0);}

s8 HaveChars0MaxSupport_04() {return HaveCharactersMaxSupport(0, 0);}

s8 HaveChars0MaxSupport_05() {return HaveCharactersMaxSupport(0, 0);}

s8 HaveChars0MaxSupport_06() {return HaveCharactersMaxSupport(0, 0);}

int Uidebug_CountLivingUnitsOfCharInFaction(u8 pid, int faction)
{
    int i;
    struct Unit * unit;
    int ret = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (US_DEAD & unit->state)
            continue;

        if (unit->pCharacterData->number == pid)
            ret++;
    }

    return ret;
}

int Uidebug_CountLivingUnitsInFaction(int faction)
{
    int i;
    struct Unit * unit;
    int ret = 0;

    for (i = faction + 1; i < faction + 0x40; i++) {
        unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;

        if (0 == (US_DEAD & unit->state))
            ret++;
    }
    return ret;
}
