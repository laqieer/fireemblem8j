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

s8 CheckInLinkArena();

/* prototypes for same-file helpers called by this run */
void AtMenu_EndScreenElements(struct ProcAtMenu * proc);

void AtMenu_StartSubmenu(struct ProcAtMenu * proc)
{
    AtMenu_EndScreenElements(proc);

    switch (proc->state) {
    case 5:
        StartChapterStatusScreen_FromPrep(proc);
        break;

    case 2: /* Items */
        StartPrepItemScreen(proc);
        break;

    case 1: /* Pick Units */
        Proc_StartBlocking(ProcScr_PrepUnitScreen, proc);
        break;

    case 4: /* Support */
        StartFortuneSubMenu(2, proc);
        break;

    case 3: /* Save */
        StartPrepSaveScreen(proc);
        break;

    default:
        break;
    }

    Proc_Break(proc);
}
