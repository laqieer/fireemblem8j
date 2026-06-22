#include "global.h"
#include "bmidoten.h"
#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "bmunit.h"
#include "ctc.h"
#include "hardware.h"
#include "mu.h"
#include "bmlib.h"
#include "bmmind.h"
#include "variables.h"

#define TERRAIN_AT(x, y) gBmMapTerrain[y][x]

static inline s8 GetBmMapPointAtCursor() {
    return gWorkingBmMap[gBmSt.playerCursor.y][gBmSt.playerCursor.x];
}

static inline u8 GetTerrainAtCursor() {
    return TERRAIN_AT(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
}

#define LAST_X_POINT gpPathArrowProc->pathX[gpPathArrowProc->pathLen]
#define LAST_Y_POINT gpPathArrowProc->pathY[gpPathArrowProc->pathLen]

#define abs(n) (((n) >= 0) ? (n) : -(n))

void UpdatePathArrowWithCursor(void) {
    s8 point;
    s32 pointAlias;

    if (gpPathArrowProc->lastX == gBmSt.playerCursor.x &&
        gpPathArrowProc->lastY == gBmSt.playerCursor.y)
    {
        return;
    }
    SetLastCoords(gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    SetWorkingBmMap(gBmMapMovement);
    if (GetBmMapPointAtCursor() == -1)
        return;
    point = GetPointAlongPath(
        gBmSt.playerCursor.x, gBmSt.playerCursor.y);
    pointAlias = point;
    if (pointAlias != -1) {
        ++point;
        CutOffPathLength(point);
        return;
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] >=
        GetWorkingMoveCosts()[GetTerrainAtCursor()])
    {
        if (abs(LAST_X_POINT - gBmSt.playerCursor.x) +
            abs(LAST_Y_POINT - gBmSt.playerCursor.y) == 1)
        {
            AddPointToPathArrowProc(
                gBmSt.playerCursor.x, gBmSt.playerCursor.y);
            return;
        }
    }
    if (gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen] == 0)
        CutOffPathLength(1);
    SetWorkingBmMap(gBmMapOther);
    GenerateMovementMapForActiveUnit();
    if (GetBmMapPointAtCursor() == -1) {
        ResetPathArrow();
        return;
    }
    GenerateBestMovementScript(
        gBmSt.playerCursor.x,
        gBmSt.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
    if (!PathContainsNoCycle())
        ResetPathArrow();
}
