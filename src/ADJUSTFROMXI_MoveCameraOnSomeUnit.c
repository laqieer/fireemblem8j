#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bm.h"
#include "prepscreen.h"
#include "variables.h"
#include "functions.h"



int GetLastStatScreenUid(void);

void ADJUSTFROMXI_MoveCameraOnSomeUnit(ProcPtr proc)
{
    int x, y;
    struct Unit *unit = GetUnit(GetLastStatScreenUid());

    if (NULL == unit)
        return;

    x = unit->xPos;
    y = unit->yPos;
    EnsureCameraOntoPosition(proc, x, y);
    SetCursorMapPosition(x, y);
}
