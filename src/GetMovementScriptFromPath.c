#include "global.h"

#include "bmpatharrowdisp.h"
#include "mu.h"
#include "variables.h"

void GetMovementScriptFromPath(void) {
    s8 i;
    for (i = 1; i <= gpPathArrowProc->pathLen; i++)
    {
        if (gpPathArrowProc->pathX[i] < gpPathArrowProc->pathX[i - 1]) {
            gWorkingMovementScript[i - 1] = MOVE_CMD_MOVE_LEFT;
        }
        else if (gpPathArrowProc->pathX[i] > gpPathArrowProc->pathX[i - 1]) {
            gWorkingMovementScript[i - 1] = MOVE_CMD_MOVE_RIGHT;
        }
        else if (gpPathArrowProc->pathY[i] < gpPathArrowProc->pathY[i - 1]) {
            gWorkingMovementScript[i - 1] = MOVE_CMD_MOVE_UP;
        }
        else {
            gWorkingMovementScript[i - 1] = MOVE_CMD_MOVE_DOWN;
        }
    }
    gWorkingMovementScript[i - 1] = MOVE_CMD_HALT;
}
