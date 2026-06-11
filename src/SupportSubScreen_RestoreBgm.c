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

//! FE8U = 0x080A2BD0
void SupportSubScreen_RestoreBgm(struct SubScreenProc* proc) {

    if (proc->songId == 0) {
        ChangeBgm(SONG_DISTANT_ROADS, 0x80, 0x100, 0x10, 0);
    } else {
        ChangeBgm(SONG_DISTANT_ROADS, 0x100, 0x100, 0x10, 0);
    }

    return;
}
