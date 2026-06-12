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

//! FE8U = 0x0808A8E4
void BoxDialogue_DrawBoxInterpolated(struct HelpBoxProc * proc, int interpolateMethod) {
    int xBox = proc->xBoxFinal;
    int yBox = proc->yBoxFinal;

    int wBox = Interpolate(interpolateMethod, proc->wBoxInit, proc->wBoxFinal, proc->timer, proc->timerMax);

    int hBox = Interpolate(interpolateMethod, proc->hBoxInit, proc->hBoxFinal, proc->timer, proc->timerMax);

    proc->xBox = xBox;
    proc->yBox = yBox;

    PutBoxDialogueBoxSprites(xBox, yBox, wBox, hBox);

    return;
}
