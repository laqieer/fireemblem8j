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

extern struct ProcCmd CONST_DATA gProc_BMapMain[];

extern s8 CONST_DATA sDirKeysToOffsetLut[][2];

extern u16 CONST_DATA sSprite_MapCursorA[];

extern u16 CONST_DATA sSprite_MapCursorB[];

extern u16 CONST_DATA sSprite_MapCursorC[];

extern u16 CONST_DATA sSprite_MapCursorStretched[];

extern u16* CONST_DATA sMapCursorSpriteLut[];

















extern struct ProcCmd CONST_DATA ProcScr_CamMove[];







/* prototypes for same-file helpers called by this run */
u16 GetCameraAdjustedX(int x);
u16 GetCameraAdjustedY(int y);

//! FE8U = 0x08015E0C
s8 EnsureCameraOntoPosition(ProcPtr parent, int x, int y) {
    struct CamMoveProc* proc;

    int xTarget = GetCameraAdjustedX(x * 16);
    int yTarget = GetCameraAdjustedY(y * 16);

    if ((xTarget == gBmSt.camera.x) && (yTarget == gBmSt.camera.y)) {
        return 0;
    }

    if (Proc_Find(ProcScr_CamMove)) {
        return 0;
    }

    if (parent) {
        proc = Proc_StartBlocking(ProcScr_CamMove, parent);
    } else {
        proc = Proc_Start(ProcScr_CamMove, PROC_TREE_3);
    }

    proc->from.x = gBmSt.camera.x;
    proc->from.y = gBmSt.camera.y;

    proc->to.x = xTarget;
    proc->to.y = yTarget;

    proc->watchedCoordinate.x = x;
    proc->watchedCoordinate.y = y;

    return 1;
}
