extern int GetEnemyStartCursorPosition();
extern int GetPlayerStartCursorPosition();
#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bm.h"
#include "prepscreen.h"
#include "variables.h"
#include "functions.h"

void ProcFun_ResetCursorPosition(ProcPtr proc)
{
    int x, y;
    
    x = -1;
    y = -1;

    if (0 == GetPhaseAbleUnitCount(gPlaySt.faction)) {
        Proc_End(proc);
        return;
    }

    switch (gPlaySt.faction) {
    case FACTION_BLUE:
        GetPlayerStartCursorPosition(&x, &y);
        break;
    
    case FACTION_GREEN:
    case FACTION_RED:
        GetEnemyStartCursorPosition(&x, &y);
        break;
    
    default:
        break;
    }

    if ((x >= 0) && (y >= 0)) {
        EnsureCameraOntoPosition(proc, x, y);
        SetCursorMapPosition(x, y);
    }
}
