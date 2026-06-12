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







//! FE8U = 0x080152A4
void OnVBlank(void)
{
    INTR_CHECK = INTR_FLAG_VBLANK;

    IncrementGameClock();
    m4aSoundVSync();

    Proc_Run(gProcTreeRootArray[0]);

    SyncLoOam();

    if (gBmSt.main_loop_ended)
    {
        gBmSt.main_loop_ended = 0;

        FlushLCDControl();
        FlushBackgrounds();
        FlushTiles();
        SyncHiOam();
    }
    m4aSoundMain();
}
