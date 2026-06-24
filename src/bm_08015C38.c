#include "global.h"

#include "bm.h"

extern s8 EWRAM_DATA sCameraAnimTable[0x100];

//! FE8U = 0x08015C1C
void CamMove_OnInit(struct CamMoveProc* proc) {
    int i;
    int dist;

    s8 speed = 1;

    int xDiff = ABS(proc->to.x - proc->from.x);
    int yDiff = ABS(proc->to.y - proc->from.y);

    if (xDiff > yDiff) {
        proc->xCalibrated = 1;
        proc->calibration = xDiff;
    } else {
        proc->xCalibrated = 0;
        proc->calibration = (short)yDiff;
    }


    dist = proc->calibration;
    i = 0;

    while (1) {
        if (dist - (speed >> 1) < 0) {
            sCameraAnimTable[i] = dist;
            break;
        }

        dist -= (speed >> 1);
        sCameraAnimTable[i] = (speed >> 1);

        if (speed < 16) {
            speed++;
        }

        i++;
    }

    proc->frame = i;
    proc->distance = proc->calibration;

    return;
}
