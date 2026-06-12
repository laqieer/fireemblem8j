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

extern struct PalFadeSt EWRAM_DATA sPalFadeSt[0x20];
extern struct BmSt EWRAM_DATA gBmSt;
extern struct PlaySt EWRAM_DATA gPlaySt;
extern struct Vec2 EWRAM_DATA sLastCoordMapCursorDrawn;
extern u32 EWRAM_DATA sLastTimeMapCursorDrawn;
s8 EWRAM_DATA sCameraAnimTable[0x100] = { 0 };

extern struct ProcCmd CONST_DATA gProc_BMapMain[];

extern s8 CONST_DATA sDirKeysToOffsetLut[][2];

extern u16 CONST_DATA sSprite_MapCursorA[];

extern u16 CONST_DATA sSprite_MapCursorB[];

extern u16 CONST_DATA sSprite_MapCursorC[];

extern u16 CONST_DATA sSprite_MapCursorStretched[];

extern u16* CONST_DATA sMapCursorSpriteLut[];

















extern struct ProcCmd CONST_DATA ProcScr_CamMove[];







//! FE8U = 0x08015CB0
void CamMove_OnLoop(struct CamMoveProc* proc) {

    if (proc->frame == 0) {
        proc->to.x = gBmSt.camera.x;
        proc->to.y = gBmSt.camera.y;

        Proc_End(proc);

        return;
    }

    proc->distance -= sCameraAnimTable[proc->frame--];

    gBmSt.camera.x = proc->to.x + (proc->from.x - proc->to.x) * proc->distance / proc->calibration;


    gBmSt.camera.y = proc->to.y + (proc->from.y - proc->to.y) * proc->distance / proc->calibration;

    return;
}
