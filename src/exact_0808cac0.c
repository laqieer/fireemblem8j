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
u16 GetDialogueBoxConfig(void);

//! FE8U = 0x0808A7B0
void ApplyBoxDialoguePosition(struct HelpBoxProc * proc, int x, int y) {
    int xSpan;
    int ySpan;

    ySpan = proc->hBoxFinal + 0x10;

    if (proc->wBoxFinal >= 0xc0) {
        proc->wBoxFinal = 0xc0;
    }

    xSpan = proc->wBoxFinal + 0x10;

    if (!(GetDialogueBoxConfig() & 1)) {
        proc->xBoxFinal = x;
        proc->yBoxFinal = y + 8;

        if (!(GetDialogueBoxConfig() & 0x40)) {
            if (proc->xBoxFinal + xSpan > 0xf0) {
                proc->xBoxFinal = 0xf0 - xSpan;
            }

            if (proc->yBoxFinal + ySpan > 0xa0) {
                proc->yBoxFinal = 0xa0 - 8 - ySpan;
            }
        }

        proc->xBoxFinal += 8;

        return;
    }

    proc->xBoxFinal = x;
    proc->yBoxFinal = y;

    return;
}
