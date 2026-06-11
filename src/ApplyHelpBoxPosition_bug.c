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

//! FE8U = 0x0808A3C4
void ApplyHelpBoxPosition_bug(struct HelpBoxProc * proc, int x, int y) {
    int xSpan = proc->wBoxFinal + 0x10;
    int ySpan = proc->hBoxFinal + 0x10;

    proc->xBoxFinal = x - 0x10 - xSpan / 6;

    if (proc->xBoxFinal < 0) {
        proc->xBoxFinal = 0;
    }

    if (proc->xBoxFinal + xSpan > 0xF0) {
        proc->xBoxFinal = 0xf0 - xSpan;
    }

    proc->yBoxFinal = y + 0x10;
    if (proc->yBoxFinal + ySpan > 0xA0) {
        proc->yBoxFinal = y - ySpan;
    }

    proc->xBoxFinal += 8;
    proc->yBoxFinal += 8;

    return;
}
