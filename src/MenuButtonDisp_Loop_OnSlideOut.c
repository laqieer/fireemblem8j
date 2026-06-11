#include "global.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmmap.h"
#include "ctc.h"
#include "bmtrick.h"
#include "icon.h"
#include "uiutils.h"
#include "uichapterstatus.h"
#include "chapterdata.h"
#include "face.h"
#include "bm.h"
#include "prepscreen.h"
#include "statscreen.h"
#include "bmlib.h"
#include "worldmap.h"
#include "player_interface.h"
#include "constants/event-flags.h"
#include "constants/msg.h"
#include "constants/terrains.h"

//! FE8U = 0x0808DAA0
void MenuButtonDisp_Loop_OnSlideOut(struct PlayerInterfaceProc * proc)
{
    proc->showHideClock -= 4;

    UpdateMenuButtonPos(proc, proc->cursorQuadrant, proc->showHideClock);
    DrawMenuButtonAt(proc->xHp, proc->yHp);

    if (proc->showHideClock == 0)
    {
        proc->isRetracting = false;
        Proc_Break(proc);
    }

    return;
}
