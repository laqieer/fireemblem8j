#include "global.h"
#include "functions.h"
#include "m4a.h"
#include "hardware.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmio.h"
#include "face.h"
#include "bm.h"
#include "uiselecttarget.h"
#include "constants/songs.h"

extern struct Vec2 sSelectTargetRoot;
extern struct SelectTarget sSelectTargetList[];
extern int sSelectTargetCount;
extern inline int GetSelectTargetCount(void) { return sSelectTargetCount; }

int GetFurthestTargetDistance(void)
{
    int i, result = 0;
    struct SelectTarget * it = sSelectTargetList;

    for (i = 0; i < GetSelectTargetCount(); i++, it++)
    {
        // RECT_DISTANCE
        int distance = ABS(sSelectTargetRoot.x - it->x) + ABS(sSelectTargetRoot.y - it->y);

        if (result < distance)
            result = distance;
    }

    return result;
}
