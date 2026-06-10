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

//! FE8U = 0x08083C0C
void ClearChapterFlag(int flag) {
    u8 mask;

    if (flag == 0) {
        return;
    }

    flag = flag - 1;

    mask = ~gFlagBitMaskLut[flag % 8];
    gChapterFlagBits[flag / 8] = mask & gChapterFlagBits[flag / 8];

    return;
}
