#include "global.h"
#include "event.h"
#include "bmunit.h"
#include "chapterdata.h"
#include "soundwrapper.h"
#include "bmsave.h"
#include "bmitem.h"
#include "bmcontainer.h"
#include "bmmap.h"
#include "rng.h"
#include "event.h"
#include "bmshop.h"
#include "bmbattle.h"
#include "worldmap.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

//! FE8U = 0x08083CA0
void SetPermanentFlag(int flag) {
    if (flag < 100) {
        return;
    }

    if (flag == 100) {
        return;
    }

    flag = flag - 100 - 1;

    gPermanentFlagBits[flag / 8] |=  gFlagBitMaskLut[flag % 8];

    return;
}
