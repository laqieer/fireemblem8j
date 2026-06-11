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


extern struct BmSt EWRAM_DATA gBmSt;
extern struct PlaySt EWRAM_DATA gPlaySt;
extern struct Vec2 EWRAM_DATA sLastCoordMapCursorDrawn;
extern u32 EWRAM_DATA sLastTimeMapCursorDrawn;



extern s8 CONST_DATA sDirKeysToOffsetLut[][2];

extern u16 CONST_DATA sSprite_MapCursorA[];

extern u16 CONST_DATA sSprite_MapCursorB[];

extern u16 CONST_DATA sSprite_MapCursorC[];

extern u16 CONST_DATA sSprite_MapCursorStretched[];

extern u16* CONST_DATA sMapCursorSpriteLut[];

















extern struct ProcCmd CONST_DATA ProcScr_CamMove[];







/* prototypes for same-file helpers called by this run */
int GetCurrentMapMusicIndex(void);

//! FE8U = 0x080160D0
void StartMapSongBgm(void) {
    StartBgm(GetCurrentMapMusicIndex(), NULL);
    return;
}

//! FE8U = 0x080160E0
void CamMoveLinear_OnLoop(struct CamMoveProc* proc) {
    int x = Interpolate(0, proc->from.x, proc->to.x, proc->frame, proc->distance);
    int y = Interpolate(0, proc->from.y, proc->to.y, proc->frame, proc->distance);

    gBmSt.camera.x = x;
    gBmSt.camera.y = y;

    proc->frame++;

    if (proc->frame >= proc->distance) {
        Proc_End(proc);
    }

    return;
}
