#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bm.h"
#include "prepscreen.h"
#include "variables.h"
#include "functions.h"

int GetLastStatScreenUid(void);
void ProcFun_ResetCursorPosition(ProcPtr proc);
void ADJUSTFROMXI_MoveCameraOnSomeUnit(ProcPtr proc);





void GetEnemyStartCursorPosition(int *px, int *py)
{
    int i;

    for (i = gPlaySt.faction + 1; i < gPlaySt.faction + 0x40; i++) {
        struct Unit *unit = GetUnit(i);
        if (!UNIT_IS_VALID(unit))
            continue;
        
        if (unit->state & (US_HIDDEN | US_BIT9))
            continue;
        
        *px = unit->xPos;
        *py = unit->yPos;

        if (CA_BOSS & UNIT_CATTRIBUTES(unit))
            break;
    }
}
