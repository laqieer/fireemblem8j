#include "global.h"
#include "bmunit.h"
#include "bmitemuse.h"
#include "hardware.h"
#include "bmlib.h"
#include "ctc.h"
#include "face.h"
#include "icon.h"
#include "bmudisp.h"
#include "fontgrp.h"
#include "bm.h"
#include "uiutils.h"
#include "statscreen.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "bmshop.h"
#include "bmitem.h"
#include "bmitemuse.h"
#include "bmcontainer.h"
#include "worldmap.h"
#include "helpbox.h"
#include "sysutil.h"
#include "prepscreen.h"
#include "constants/characters.h"
#include "constants/items.h"
#include "constants/msg.h"
#include "constants/songs.h"

void PrepItemScreen_OnEnd(struct PrepItemScreenProc * proc);

//! FE8U = 0x080990D4
void PrepItemScreen_StartStatScreen(struct PrepItemScreenProc * proc)
{
    PrepItemScreen_OnEnd(proc);
    SetStatScreenConfig(STATSCREEN_CONFIG_NONDEAD | STATSCREEN_CONFIG_NONUNK16 | STATSCREEN_CONFIG_NONSUPPLY);
    StartStatScreen(GetUnitFromPrepList(proc->hoverUnitIdx), proc);
    Proc_Break(proc);
    return;
}
