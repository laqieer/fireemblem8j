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

extern struct Struct089ED67C gUidebug_2_08A5F7B8[];

u8 Uidebug_PickRandomActiveCond2()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUidebug_2_08A5F7B8[i].func; i++, val++) {
        if (1 == gUidebug_2_08A5F7B8[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;

    return buf[(GetGameClock() % 0x40) % loc];
}
