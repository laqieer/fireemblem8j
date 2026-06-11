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

//! FE8U = 0x08008840
void TalkOpen_OnIdle(struct Proc* proc) {
    int var;

    proc->unk58++;

    var = Interpolate(INTERPOLATE_RSQUARE, -30, 0, proc->unk58, 12);

    BG_SetPosition(BG_1, 0, var / 2);

    if (!CheckTalkFlag(TALK_FLAG_8)) {
        SetBlendAlpha(var / 2 + 16, 1 - var / 2);
    }

    if (proc->unk58 == 12) {
        Proc_Break(proc);
    }

    return;
}
