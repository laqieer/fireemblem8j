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





void Debug_RefreshMapFog()
{
    UpdateMapViewWithFog(0);
}

void Debug_AddGold()
{
    SetPartyGoldAmount(GetPartyGoldAmount() + 5000);
}

void Debug_SubtractPartyGold(int sub_val)
{
    if ((int)GetPartyGoldAmount() < sub_val)
        return;

    SetPartyGoldAmount(GetPartyGoldAmount() - sub_val);
}
