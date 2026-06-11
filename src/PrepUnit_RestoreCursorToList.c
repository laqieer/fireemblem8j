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

void PrepUnit_RestoreCursorToList(struct ProcPrepUnit *proc)
{
    ShowSysHandCursor(
        (proc->list_num_cur % 2) * 56 + 0x70,
        (proc->list_num_cur / 2) * 16 + 0x18 - proc->yDiff_cur,
        0x7, 0x800);
}
