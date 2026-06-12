#include "global.h"
#include "constants/characters.h"
#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

void DungeonRecordUi_StopTallySound(struct BMDifficultyProc* proc) {
    if (proc->unk_3c < 1) {
        m4aSongNumStop(SONG_74);
        Proc_Break(proc);
    } else {
        proc->unk_3c--;
    }

    return;
}
