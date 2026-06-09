#include "global.h"
#include "functions.h"
#include "variables.h"
#include "bmunit.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "statscreen.h"
#include "bmitem.h"
#include "hardware.h"
#include "chapterdata.h"
#include "bmudisp.h"
#include "worldmap.h"
#include "helpbox.h"
#include "bmlib.h"
#include "sio.h"
#include "prepscreen.h"

#include "constants/chapters.h"
#include "constants/items.h"
#include "constants/songs.h"












 // maybe there is 0xC*sizeof(u16) free space





// clang-format on

//! FE8U = 0x08094FF4
u8 CanPrepScreenSave(void)
{
    u32 chapterIndex = gPlaySt.chapterIndex;

    if ((!gGMData.state.bits.state_0) && CHAPTER_IS_DUNGEON(chapterIndex))
    {
        return 0;
    }

    return 1;
}
