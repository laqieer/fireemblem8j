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

void AtMenu_UpdateDescLoop(struct ProcAtMenu * proc)
{
    int val = GetActivePrepMenuItemIndex();

    if (proc->unk_35 != val) {
        StartPrepMenuDesc(Prep_GetActiveMenuItemTextId(), proc);
        proc->unk_35 = val;
    }
}
