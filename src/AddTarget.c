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

void AddTarget(int x, int y, int unitId, int tId) {
    sSelectTargetList[sSelectTargetCount].x = x;
    sSelectTargetList[sSelectTargetCount].y = y;
    sSelectTargetList[sSelectTargetCount].uid = unitId;
    sSelectTargetList[sSelectTargetCount].extra = tId;

    sSelectTargetCount++;
}
