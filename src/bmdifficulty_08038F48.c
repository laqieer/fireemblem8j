#include "global.h"

#include "constants/characters.h"

#include "bmunit.h"
#include "fontgrp.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "hardware.h"
#include "uiutils.h"
#include "ctc.h"
#include "bmio.h"
#include "mu.h"
#include "bm.h"
#include "bmsave.h"
#include "popup.h"
#include "bmlib.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "savemenu.h"
#include "spline.h"
#include "sysutil.h"
#include "bmdifficulty.h"
#include "constants/event-flags.h"
#include "constants/songs.h"

extern EWRAM_OVERLAY(0) u16 gBmdifficulty_0[0x3D0];
extern EWRAM_OVERLAY(0) struct Font gBmdifficulty_1;
extern EWRAM_OVERLAY(0) int gBmdifficulty_2;
extern EWRAM_OVERLAY(0) struct Struct020038C8 gBmdifficulty_3[2];
extern EWRAM_OVERLAY(0) struct Text gBmdifficulty_4[8];

extern const struct Outer080D7FD0 gBmdifficulty_6;

/* file-scope type definitions used by this run */


struct PostgameUnitLutEntry {
    u16 eid;
    struct UnitDefinition* uDef;
};

struct DungeonUiTextLutEntry {
    /* 00 */ u16 msgId;
    /* 02 */ s8 x;
    /* 03 */ s8 y;
};

void DungeonRecordUi_KeyListener(ProcPtr proc) {
    if (gKeyStatusPtr->newKeys & (A_BUTTON | B_BUTTON)) {
        Proc_Break(proc);
    }

    return;
}
