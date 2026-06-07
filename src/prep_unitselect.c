#include "global.h"
#include "functions.h"
#include "variables.h"
#include "hardware.h"
#include "fontgrp.h"
#include "bmunit.h"
#include "hardware.h"
#include "bmudisp.h"
#include "ctc.h"
#include "icon.h"
#include "uiutils.h"
#include "bm.h"
#include "helpbox.h"
#include "face.h"
#include "bmitem.h"
#include "soundwrapper.h"
#include "statscreen.h"
#include "constants/video-global.h"
#include "bmlib.h"
#include "sysutil.h"
#include "sio.h"
#include "unitlistscreen.h"
#include "prepscreen.h"
#include "constants/songs.h"



void PrepUnit_RecountSelectedUnits(struct ProcPrepUnit *proc)
{
    int i, list_index = PrepGetLatestUnitIndex();
    proc->list_num_pre = list_index;
    proc->list_num_cur = list_index;
    proc->cur_counter = 0;

    for (i = 1; i < FACTION_GREEN; i++) {
        struct Unit *unit = GetUnit(i);

        if (!UNIT_IS_VALID(unit))
            continue;

        if (!(unit->state & (US_DEAD | US_NOT_DEPLOYED | US_BIT16)))
            proc->cur_counter++;
    }
}

void PrepUnitDisableDisp()
{
    SetDispEnable(0, 0, 0, 0, 0);
}

void PrepUnitEnableDisp()
{
    SetDispEnable(1, 1, 1, 1, 1);
}

void PrepUnit_StartStatScreen(struct ProcPrepUnit *proc)
{
    SetStatScreenConfig(0x11);
    StartStatScreen(GetUnitFromPrepList(proc->list_num_cur), proc);
}
