#include "global.h"
#include "bmunit.h"
#include "bmreliance.h"
#include "bmsave.h"
#include "fontgrp.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "event.h"
#include "bmsave.h"
#include "bmlib.h"
#include "helpbox.h"
#include "prepscreen.h"
#include "eventinfo.h"
#include "cgtext.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "uisupport.h"
#include "constants/songs.h"

//! FE8U = 0x080A1930
void SupportScreen_RestartSourceScreenMusic(struct SupportScreenProc* proc) {
    if (!proc->fromPrepScreen) {
        ChangeBgm(SONG_MAIN_THEME, 0x100, 0xc0, 0x18, 0);
    } else {
        ChangeBgm(SONG_COMBAT_PREPARATION, 0x100, 0x100, 0x18, 0);
    }

    return;
}
