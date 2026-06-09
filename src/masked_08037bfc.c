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

s8 CanUnitSeize(struct Unit* unit) {
    int leaderId;

    switch (gPlaySt.chapterModeIndex) {
        case 2: // Eirika
            leaderId = CHARACTER_EIRIKA;
            break;
        case 1: // tutorial (chapter 0-8)
            leaderId = CHARACTER_EIRIKA;
            break;
        case 3: // Ephraim
            leaderId = CHARACTER_EPHRAIM;
            break;
    }

    if (gPlaySt.chapterIndex == 5) {
        leaderId = CHARACTER_EPHRAIM;
    }

    return unit->pCharacterData->number == leaderId;
}
