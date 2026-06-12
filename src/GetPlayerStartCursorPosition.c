#include "global.h"
#include "types.h"
#include "bmunit.h"
#include "bmphase.h"
#include "bm.h"
#include "prepscreen.h"
#include "variables.h"
#include "functions.h"

void GetPlayerStartCursorPosition(int *px, int *py)
{
    struct Unit *unit;
    if (1 == gPlaySt.chapterTurnNumber) {
        unit = GetUnitFromCharId(GetPlayerLeaderPid());
        gPlaySt.xCursor = unit->xPos;
        gPlaySt.yCursor = unit->yPos;
    }

    if (1 != gPlaySt.config.autoCursor) {
        unit = GetUnitFromCharId(GetPlayerLeaderPid());
        *px = unit->xPos;
        *py = unit->yPos;
    } else {
        *px = gPlaySt.xCursor;
        *py = gPlaySt.yCursor;
    }
}
