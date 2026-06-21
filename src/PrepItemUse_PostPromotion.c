#include "global.h"
#include "bmunit.h"
#include "bmitem.h"
#include "bmusemind.h"
#include "bmbattle.h"
#include "bmudisp.h"
#include "bm.h"
#include "statscreen.h"
#include "scene.h"
#include "face.h"
#include "icon.h"
#include "hardware.h"
#include "fontgrp.h"
#include "uiutils.h"
#include "soundwrapper.h"
#include "classchg.h"
#include "bmlib.h"
#include "helpbox.h"
#include "sysutil.h"
#include "worldmap.h"
#include "prepscreen.h"
#include "constants/classes.h"
#include "constants/items.h"
#include "constants/songs.h"

void PrepItemUse_PostPromotion(struct ProcPrepItemUse * proc)
{
    int max = GetUnitItemCount(proc->unit);

    if (max == 0) {
        Proc_Goto(proc, PROC_LABEL_PREPITEMUSE_END);
        return;
    }

    if (proc->slot >= max)
        proc->slot--;
    
    Proc_Break(proc);
}
