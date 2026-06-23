#include "global.h"

#include "bmmap.h"
#include "bmpatharrowdisp.h"
#include "ctc.h"

#define PATH_ARROW_OAM_AT(a, b) gPathArrowOAMTable[a][b];

void DrawPathArrow(void) {
    s8 i;
    if (gpPathArrowProc->pathLen == 0)
        return;
    for (i = gpPathArrowProc->pathLen; i >= 0; i--) {
        s16 xp = 16 * gpPathArrowProc->pathX[i];
        s16 yp = 16 * gpPathArrowProc->pathY[i];
        if (PointInCameraBounds(xp, yp, 16, 16)) {
            u16 oam2 = PATH_ARROW_OAM_AT(
                GetDirectionOfPathAfterIndex(i),
                GetDirectionOfPathBeforeIndex(i));
            PutSprite(
                11,
                xp - gBmSt.camera.x,
                yp - gBmSt.camera.y,
                gObject_16x16,
                oam2);
        }
    }
}
