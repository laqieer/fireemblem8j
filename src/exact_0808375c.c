#include "global.h"
#include "bmunit.h"
#include "ap.h"
#include "mu.h"
#include "bm.h"
#include "bmbattle.h"
#include "mapanim.h"
#include "bmmap.h"
#include "bmio.h"
#include "bmudisp.h"
#include "spellassoc.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "constants/classes.h"
#include "constants/terrains.h"
#include "constants/songs.h"

void MapAnimMoveUnitTowardsTargetExt(struct MuProc * mu1, struct MuProc * mu2)
{
    int x1, x2, y1, y2, distance;

    x1 = mu1->x_q4;
    x2 = mu2->x_q4;

    distance = x2 - x1;
    if (distance <= 0)
    {
        int tmp = x1;
        if (distance < 0)
            tmp = tmp - 0x10;

        x1 = tmp;
    }
    else
        x1 = x1 + 0x10;

    mu1->x_q4 = x1;

    y1 = mu1->y_q4;
    y2 = mu2->y_q4;

    distance = y2 - y1;
    if (distance <= 0)
    {
        int tmp = y1;
        if (distance < 0)
            tmp = tmp - 0x10;

        y1 = tmp;
    }
    else
        y1 = y1 + 0x10;

    mu1->y_q4 = y1;
}
