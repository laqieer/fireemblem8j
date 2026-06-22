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

u8 Event2B_ConfigLoadUnit(struct EventEngineProc * proc)
{
    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);
    int argument = EVT_CMD_ARGV(proc->pEventCurrent)[0];

    if (argument < 0)
        argument = (s16)gEventSlots[2];

    switch (subcode) {
    case EVSUBCMD_LOAD_SETCOUNT:
        proc->unitLoadCount = argument;
        break;

    case EVSUBCMD_LOAD_SETCHANCE:
        if (argument < 0)
            argument = 0;

        if (argument > 100)
            argument = 100;

        proc->chance = argument;

        break;

    case 2:
        proc->diable_REDA = TRUE;
        break;
    }

    return EVC_ADVANCE_CONTINUE;
}
