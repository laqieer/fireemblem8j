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





int Uidebug_IsTurnNumberOver20()
{
    return gPlaySt.chapterTurnNumber > 20;
}

int Uidebug_IsTurnNumberOver25()
{
    return gPlaySt.chapterTurnNumber > 25;
}

int Uidebug_IsTurnNumberOver30()
{
    return gPlaySt.chapterTurnNumber > 30;
}

int Uidebug_IsPlayerPhase()
{
    return FACTION_BLUE == gPlaySt.faction;
}

int Uidebug_IsEnemyPhase()
{
    return FACTION_RED == gPlaySt.faction;
}

int Uidebug_IsActiveUnitMale()
{
    return 0 == (CA_FEMALE & UNIT_CATTRIBUTES(gActiveUnit));
}
