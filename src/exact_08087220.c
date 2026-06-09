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
int AreAnyEnemyUnitDead(void);

int AreAllEnemyUnitsDead()
{
    int dead = AreAnyEnemyUnitDead();
    int ret = 0;
    u8 _dead = dead;
    ret = 0 == _dead ? 1 : 0;
    return ret;
}
