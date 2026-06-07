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





CONST_DATA struct PathArrowProc * gpPathArrowProc = &gPathArrowProc;

/* prototypes for same-file helpers called by this run */
void CutOffPathLength(s8 newIndex);
void GetPathFromMovementScript(void);

void GenerateMovementMapForActiveUnit(void) {
    GenerateMovementMapOnWorkingMap(
		gActiveUnit,
		gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathY[gpPathArrowProc->pathLen],
		gpPathArrowProc->pathCosts[gpPathArrowProc->pathLen]);
}

void ResetPathArrow(void) {
    CutOffPathLength(1);
    GenerateMovementMapForActiveUnit();
    GenerateBestMovementScript(
        gBmSt.playerCursor.x,
        gBmSt.playerCursor.y,
        gWorkingMovementScript);
    GetPathFromMovementScript();
}
