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

//! FE8U = 0x08007DA4
void TalkShiftClearAll_OnIdle(struct Proc* proc) {
    proc->unk64++;

    BG_SetPosition(0, 0, proc->unk64);

    if (proc->unk64 >= proc->unk66) {
        BG_SetPosition(0, 0, 0);
        ClearPutTalkText();

        Proc_Break(proc);
    }

    return;
}
