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

//! FE8U = 0x0808CE9C
void BurstDisplay_Init(struct PlayerInterfaceProc * proc)
{
    InitTextDb(proc->texts, 7);
    proc->burstUnitId = 0;
    proc->hideContents = false;
    proc->showHideClock = 0;
    proc->wBurst = 0;
    proc->hBurst = 0;
    proc->isRetracting = false;

    return;
}
