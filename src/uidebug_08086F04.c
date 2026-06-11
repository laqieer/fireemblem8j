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





/* prototypes for same-file helpers called by this run */
void Debug_DecrementUnitStats(struct Unit *unit);

void Debug_DecrementCharStatsByPid(u8 pid)
{
    Debug_DecrementUnitStats(GetUnitFromCharId(pid));
}

s8 IsCharDeployedPlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    const struct CharacterData *chara;

    for (i = 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (NULL == unit)
            continue;
        
        chara = unit->pCharacterData;
        if (NULL == chara)
            continue;

        if (0 == ((US_BIT16 | US_NOT_DEPLOYED | US_DEAD) & unit->state))
            if (chara->number == pid)
                return 1;
    }

    return 0;
}

s8 IsChar0DeployedPlayerUnit() {return IsCharDeployedPlayerUnit(0);}

s8 IsChar0DeployedPlayerUnit_Alt() {return IsCharDeployedPlayerUnit(0);}

s8 IsCharAlivePlayerUnit(u8 pid)
{
    int i;
    struct Unit *unit;
    const struct CharacterData *chara;

    for (i = 1; i < FACTION_GREEN; i++) {
        unit = GetUnit(i);
        if (NULL == unit)
            continue;
        
        chara = unit->pCharacterData;
        if (NULL == chara)
            continue;

        if (0 == ((US_DEAD) & unit->state))
            if (chara->number == pid)
                return 1;
    }

    return 0;
}
