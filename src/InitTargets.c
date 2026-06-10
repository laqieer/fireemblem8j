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

void InitTargets(int xRoot, int yRoot) {
    sSelectTargetRoot.x = xRoot;
    sSelectTargetRoot.y = yRoot;
    sSelectTargetCount = 0;
}
