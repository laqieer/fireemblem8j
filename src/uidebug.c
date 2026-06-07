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





int Uidebug_ScanUnitsRetZero()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}

int Uidebug_ConstTrue() {return 1;}

int Uidebug_ConstFalse03() {return 0;}

int Uidebug_ConstFalse04() {return 0;}

int Uidebug_ConstFalse05() {return 0;}

int Uidebug_ConstFalse06() {return 0;}

int Uidebug_ConstFalse07() {return 0;}

int Uidebug_ConstFalse08() {return 0;}

int Uidebug_ConstFalse09() {return 0;}

int Uidebug_ConstFalse10() {return 0;}

int Uidebug_ConstFalse11() {return 0;}

int Uidebug_ConstFalse12() {return 0;}

int Uidebug_ConstFalse13() {return 0;}

int Uidebug_ConstFalse14() {return 0;}

int Uidebug_ConstFalse_03() {return 0;}

int Uidebug_ConstFalse_04() {return 0;}

int Uidebug_ConstFalse_05() {return 0;}

int Uidebug_ConstFalse_06() {return 0;}

int Uidebug_ConstFalse_07() {return 0;}

int Uidebug_ConstFalse_08() {return 0;}

int Uidebug_ConstFalse_09() {return 0;}

int Uidebug_ConstFalse_10() {return 0;}

int Uidebug_ConstFalse_11() {return 0;}

int Uidebug_ConstFalse_12() {return 0;}

void Debug_PromoteUnit0x100()
{
    EndPlayerPhaseSideWindows();
    ExecUnitDefaultPromotionAndHide(GetUnitFromCharId(0x100), 0);
}

int Uidebug_ScanAllUnitsRetZero()
{
    int i;
    for (i = 1; i < 0x40; i++)
        GetUnit(i);
    
    return 0;
}
