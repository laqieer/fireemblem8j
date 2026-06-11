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

s8 ShouldPrepUnitMenuScroll(struct ProcPrepUnit *proc)
{
    int val1, val2, val3;

    val1 = proc->yDiff_cur / 16;
    if (val1 > 0 && proc->list_num_cur / 2 <= val1)
        return 1;

    val2 = val1 + 5;
    val3 = (PrepGetUnitAmount() - 1) >> 1;
    if (val2 < val3 && proc->list_num_cur / 2 >= val2)
        return 1;

    return 0;
}
