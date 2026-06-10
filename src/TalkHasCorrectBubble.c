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

extern struct TalkState* sTalkState;

//! FE8U = 0x0800890C
s8 TalkHasCorrectBubble(void) {

    if ((sTalkState->speakingFaceSlot == sTalkState->activeFaceSlot) && (sTalkState->speakingWidth == sTalkState->activeWidth)) {
        return 1;
    }

    return 0;
}
