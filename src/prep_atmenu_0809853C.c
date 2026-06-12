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

void AtMenuSetUnitStateAndEndFlag(struct ProcAtMenu * proc)
{
    int i;
    struct Unit *unit;
    for (i = 1; i < 64; i++) {
        unit = GetUnit(i);

        if (!(UNIT_IS_VALID(unit)))
            continue;

        unit->state &= ~US_BIT25;
    }

    proc->end_prep = 1;
}
