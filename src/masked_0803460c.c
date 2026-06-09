#include "global.h"
#include "chapterdata.h"
#include "agb_sram.h"
#include "bmsave.h"


u8 IsDifficultMode(void) {
    u8 difficultState = gPlaySt.chapterStateBits & PLAY_FLAG_HARD;
    return difficultState ? TRUE : FALSE;
}
