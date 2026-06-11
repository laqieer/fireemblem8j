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

//! FE8U = 0x0808B804
void BoxDialogueDrawText_AfterScroll(struct ProcBoxDialogueDrawTextExt* proc) {
    if (proc->current_line == 0) {
        Proc_Break(proc);
    } else {
        Proc_Goto(proc, 5);
    }

    if (proc->current_line != 0) {
        proc->current_line--;
    }

    proc->timer = 0;

    return;
}
