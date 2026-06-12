#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bm.h"
#include "event.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "face.h"
#include "bmunit.h"
#include "uiutils.h"
#include "ekrbattle.h"
#include "bmlib.h"
#include "bmshop.h"
#include "scene.h"
#include "constants/songs.h"

//! FE8U = 0x080080D0
void TalkSpriteShiftClear_OnInit(ProcPtr proc) {
    if (CheckTalkFlag(TALK_FLAG_7)) {
        StartSpriteTextScroll(0x200, 0x1A, 0, proc);
    } else {
        StartSpriteTextScroll(0x200, 0x19, 0x44444444, proc);
    }

    return;
}
