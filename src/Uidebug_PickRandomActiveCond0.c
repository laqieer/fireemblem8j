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
/* TU-private aggregate type defs (file-local) */
struct Struct089ED67C {
    /* 00 */ u8 _pad00[0x0C];
    /* 0C */ s8 (*func)();
    /* 10 */ u8 _pad10[0x18 - 0x10];
};
/* TU-private data externs bound at their JP addresses */
extern struct Struct089ED67C gUidebug_0[];

u8 Uidebug_PickRandomActiveCond0()
{
    u8 buf[0x20];
    int i;
    int val = 0;
    int loc = 0;

    for (i = 0; gUidebug_0[i].func; i++, val++) {
        if (1 == gUidebug_0[i].func())
            buf[loc++] = val;
    }

    if (0 == loc)
        return -1;
    
    return buf[(GetGameClock() % 0x40) % loc];
}
