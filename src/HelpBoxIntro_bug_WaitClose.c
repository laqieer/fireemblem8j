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

//! FE8U = 0x0808A1B8
void HelpBoxIntro_bug_WaitClose(struct HelpBoxProc * proc) {

    UpdateHelpBoxDisplay(proc, 0);

    proc->timer--;

    if (proc->timer < 0) {
        Proc_Break(proc);
    }

    return;
}
