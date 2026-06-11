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

//! FE8U = 0x0800DA78
u8 Event0C_Branch(struct EventEngineProc * proc)
{
    u8 sub_cmd;
    int val1, val2;

    sub_cmd = EVT_SUB_CMD(proc->pEventCurrent);

    val1 = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[1];
    val2 = (u16)EVT_CMD_ARGV(proc->pEventCurrent)[2];

    val1 = gEventSlots[val1];
    val2 = gEventSlots[val2];

    switch (sub_cmd) {
    case EVSUBCMD_BEQ:
        if (val1 == val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BNE:
        if (val1 != val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BGE:
        if (val1 >= val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BGT:
        if (val1 > val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BLE:
        if (val1 <= val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    case EVSUBCMD_BLT:
        if (val1 < val2)
            return Event09_Goto(proc);

        return EVC_ADVANCE_CONTINUE;

    default:
        return EVC_ERROR;
    }
}
