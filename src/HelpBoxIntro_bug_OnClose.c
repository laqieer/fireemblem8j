#include "global.h"
#include "hardware.h"
#include "fontgrp.h"
#include "ctc.h"
#include "bmitem.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "face.h"
#include "scene.h"
#include "bmio.h"
#include "bmlib.h"
#include "savemenu.h"
#include "cgtext.h"
#include "helpbox.h"
#include "constants/songs.h"

//! FE8U = 0x0808A188
void HelpBoxIntro_bug_OnClose(struct HelpBoxProc * proc) {
    int time;

    SetHelpBoxDefaultRect(proc);

    SetHelpBoxInitPosition_bug(proc, proc->info->xDisplay, proc->info->yDisplay);

    time = proc->timerMax;
    time = time / 3;

    proc->timerMax = time;
    proc->timer = time;

    return;
}
