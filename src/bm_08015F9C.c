#include "global.h"
#include "hardware.h"
#include "m4a.h"
#include "ctc.h"
#include "bmreliance.h"
#include "event.h"
#include "chapterdata.h"
#include "bmunit.h"
#include "bmudisp.h"
#include "playerphase.h"
#include "cp_common.h"
#include "bmmind.h"
#include "bmtrick.h"
#include "bmio.h"
#include "fontgrp.h"
#include "face.h"
#include "icon.h"
#include "uiutils.h"
#include "bmlib.h"
#include "soundwrapper.h"
#include "bmmap.h"
#include "bmphase.h"
#include "bmusailment.h"
#include "bmsave.h"
#include "worldmap.h"
#include "eventcall.h"
#include "bm.h"
#include "constants/event-flags.h"
#include "constants/songs.h"
/* TU-private data externs bound at their JP addresses */
extern struct ProcCmd ProcScr_UnkMapCursor[];

//! FE8U = 0x08015F90
void StartMapCursorSlide(int x, int y, int duration) {
    struct UnkMapCursorProc* proc;

    proc = Proc_Start(ProcScr_UnkMapCursor, PROC_TREE_3);

    proc->to.x = gBmSt.playerCursor.x << 4;
    proc->to.y = gBmSt.playerCursor.y << 4;

    proc->from.x = x << 4;
    proc->from.y = y << 4;

    proc->duration = duration;
    proc->clock = duration;

    return;
}
