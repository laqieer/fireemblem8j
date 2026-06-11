#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "bmunit.h"
#include "statscreen.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "uichapterstatus.h"
#include "bmio.h"
#include "mu.h"
#include "bmudisp.h"
#include "bm.h"
#include "helpbox.h"
#include "bmlib.h"
#include "prepscreen.h"
#include "eventcall.h"
#include "sysutil.h"
#include "sio.h"
#include "constants/songs.h"

void AtMenu_OnSubmenuEnd(struct ProcAtMenu * proc)
{
    if (3 == proc->state)
        StartBgmVolumeChange(0x80, 0x100, 0x20, NULL);

    switch (proc->state) {
    case 4:
        Proc_Goto(proc, 9);
        break;

    case 3:
        Proc_Goto(proc, 7);
        break;

    case 1:
    case 2:
    case 5:
        Proc_Goto(proc, 9);
        break;
    }

    proc->state = 0;
}
