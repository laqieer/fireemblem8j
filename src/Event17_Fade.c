#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

u8 Event17_Fade(struct EventEngineProc * proc)
{
    u8 subcode;
    u16 evArgument;

    if (EVENT_IS_SKIPPING(proc))
        return EVC_ADVANCE_CONTINUE;

    subcode = EVT_SUB_CMD(proc->pEventCurrent);
    evArgument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    switch (subcode) {
    case 0: // FADU
        StartLockingFadeFromBlack(evArgument, proc);
        proc->evStateBits &= ~EV_STATE_FADEDIN;
        SetDispEnable(TRUE, TRUE, TRUE, TRUE, TRUE);
        return EVC_ADVANCE_YIELD;

    case 1: // FADI
        StartLockingFadeToBlack(evArgument, proc);
        proc->evStateBits |= EV_STATE_FADEDIN;
        return EVC_ADVANCE_YIELD;

    case 2: // FAWU
        StartLockingFadeFromWhite(evArgument, proc);
        proc->evStateBits &= ~EV_STATE_FADEDIN;
        SetDispEnable(TRUE, TRUE, TRUE, TRUE, TRUE);
        return EVC_ADVANCE_YIELD;

    case 3: // FAWI
        StartLockingFadeToWhite(evArgument, proc);
        proc->evStateBits |= EV_STATE_FADEDIN;
        return EVC_ADVANCE_YIELD;

    default:
        return EVC_ERROR;
    } // switch (subcode)
}
