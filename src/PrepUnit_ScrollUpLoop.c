extern int PrepUnit_DrawUnitListNames();
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

void PrepUnit_ScrollUpLoop(struct ProcPrepUnit *proc)
{
    if (0 == proc->yDiff_cur % 0x10)
        PrepUnit_DrawUnitListNames(proc, proc->yDiff_cur / 0x10 - 1);

    proc->unk34 -= 4;
    proc->yDiff_cur -= 4;

    if (proc->unk34 <= 0)
        Proc_Break(proc);

    BG_SetPosition(BG_2, 0, proc->yDiff_cur - 0x18);
}
