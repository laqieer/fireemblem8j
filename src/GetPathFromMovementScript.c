#include "global.h"

#include "mu.h"
#include "bmpatharrowdisp.h"
#include "variables.h"

void GetPathFromMovementScript(void) {
    s8 i = 0;
    while (TRUE) {
        // I do not know what these +1s are about. but they are necessary to
        // the match as far as I can tell.  maybe I'm supposed to use another
        // enum or something.
        u32 cmd = gWorkingMovementScript[i++] + 1;

        if (cmd <= 0xa) {
            switch (cmd) {

            case MOVE_CMD_END + 1:
            case MOVE_CMD_HALT + 1:
                return;
            case MOVE_CMD_FACE_LEFT + 1:
            case MOVE_CMD_FACE_RIGHT + 1:
            case MOVE_CMD_FACE_DOWN + 1:
            case MOVE_CMD_FACE_UP + 1:
            case MOVE_CMD_SLEEP + 1:
                continue;
            case MOVE_CMD_MOVE_LEFT + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] - 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MOVE_CMD_MOVE_RIGHT + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen] + 1,
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen]);
                break;
            case MOVE_CMD_MOVE_UP + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] - 1);
                break;
            case MOVE_CMD_MOVE_DOWN + 1:
                AddPointToPathArrowProc(
                    gpPathArrowProc->pathX[gpPathArrowProc->pathLen],
                    gpPathArrowProc->pathY[gpPathArrowProc->pathLen] + 1);
                break;
            }
        }
    }
}
