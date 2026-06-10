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

//! FE8U = 0x080087A4
void TalkOpen_OnEnd(void) {
    return;
}

//! FE8U = 0x080087A8
void TalkOpen_InitBlend(struct Proc* proc) {

    proc->unk58 = 0;

    if (!CheckTalkFlag(TALK_FLAG_8)) {
        SetBlendTargetA(0, 1, 0, 0, 0);
        SetBlendTargetB(0, 0, 1, 1, 1);

        SetBlendBackdropB(1);

        gLCDControlBuffer.wincnt.win0_enableBlend = 1;
        gLCDControlBuffer.wincnt.wout_enableBlend = 1;

        SetBlendAlpha(0, 16);
    }

    return;
}
