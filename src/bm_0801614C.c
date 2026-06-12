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
extern struct ProcCmd gProcScr_Bm_0[];

//! FE8U = 0x08016140
void StartCamMoveLinear(ProcPtr parent, int x, int y, int distance) {
    struct CamMoveProc* proc;

    if (parent != 0) {
        proc = Proc_StartBlocking(gProcScr_Bm_0, parent);
    } else {
        proc = Proc_Start(gProcScr_Bm_0, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = x * 16;
    proc->to.y = y * 16;

    proc->distance = distance;
    proc->frame = 0;

    return;
}
