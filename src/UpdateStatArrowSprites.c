#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"
#include "bm.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

extern u16 * gSysUpArrowSpriteLut[];
extern u16 * gSysDownArrowSpriteLut[];


//! FE8U = 0x08015BD4
void UpdateStatArrowSprites(int x, int y, u8 isDown) {
    int d = (s8)isDown;
    int frame =  GetGameClock() / 8 % 3;

    PutSprite(4, x, y, d ? gSysDownArrowSpriteLut[frame] : gSysUpArrowSpriteLut[frame], 0);

    return;
}
