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

extern EWRAM_OVERLAY(0) struct Text gPrepUnitTexts[0x16];

/* prototypes for same-file helpers called by this run */
void PrepUnit_DrawUnitListNames(struct ProcPrepUnit *proc, int line);

s8 PrepCheckCanUnselectUnit(struct ProcPrepUnit *proc, struct Unit *unit)
{
    if (!IsCharacterForceDeployed(unit->pCharacterData->number)) {
        proc->cur_counter--;
        unit->state |= US_UNSELECTABLE | US_NOT_DEPLOYED;
        RemoveSioPid(unit->pCharacterData->number);
        PlaySoundEffect(SONG_SE_SYS_WINDOW_CANSEL1);
        PrepUnit_DrawUnitListNames(proc, proc->list_num_cur / 2);
        return 1;
    } else {
        PlaySoundEffect(SONG_6C);
        return 0;
    }
}
