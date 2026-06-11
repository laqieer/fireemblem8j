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



CONST_DATA struct Struct089ED67C gUidebug_2[] = {
    {0},
    {0},
    {0},
    {0},
};

u8 Uidebug_GetClockCyclingIndex()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return (GetGameClock() % 0x10) % val;
}

u8 Uidebug_GetClockCyclingIndexHalf()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return ((GetGameClock() / 2) % 0x10) % val;
}

u8 Uidebug_GetClockCyclingIndexQuarter()
{
    int i, val = 0;
    for (i = 0; gUidebug_2[i].func; i++, val++);

    return ((GetGameClock() / 4) % 0x10) % val;
}
