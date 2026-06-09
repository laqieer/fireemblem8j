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







/* prototypes for same-file helpers called by this run */
void BoxDialogue_DrawBoxInterpolated(struct HelpBoxProc * proc, int interpolateMethod);

//! FE8U = 0x0808A974
void MergeBoxDialogue1(struct HelpBoxProc * proc) {

    BoxDialogue_DrawBoxInterpolated(proc, INTERPOLATE_RCUBIC);

    if (proc->timer < proc->timerMax) {
        proc->timer++;
    }

    return;
}
